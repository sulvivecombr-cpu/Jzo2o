#!/usr/bin/env python3
"""Publish the Base44 sandbox Nacos configuration.

The original project keeps MySQL/Redis/RabbitMQ/ES/seata/xxl-job settings in an
external Nacos server that is not part of the repository. This one-shot helper,
run by the `nacos-config-init` compose service, waits for Nacos, creates the
namespace the services expect and uploads every YAML in this directory as a
DEFAULT_GROUP data-id (named after the file).
"""
import json
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request

NACOS = os.environ.get("NACOS_ADDR", "http://nacos:8848")
NAMESPACE = os.environ.get("NACOS_NAMESPACE", "75a593f5-33e6-4c65-b2a0-18c403d20f63")
GROUP = os.environ.get("NACOS_GROUP", "DEFAULT_GROUP")
CONFIG_DIR = os.environ.get("CONFIG_DIR", "/configs")


def post(path, data):
    body = urllib.parse.urlencode(data).encode()
    req = urllib.request.Request(NACOS + path, data=body, method="POST")
    with urllib.request.urlopen(req, timeout=15) as resp:
        return resp.read().decode()


def get(path):
    with urllib.request.urlopen(NACOS + path, timeout=15) as resp:
        return resp.read().decode()


def wait_for_nacos(timeout=300):
    deadline = time.time() + timeout
    while time.time() < deadline:
        try:
            if get("/nacos/v1/console/health/readiness").strip():
                print("[init-nacos] nacos is up", flush=True)
                return
        except Exception as exc:  # noqa: BLE001 - keep retrying
            print(f"[init-nacos] waiting for nacos: {exc}", flush=True)
        time.sleep(3)
    raise SystemExit("[init-nacos] nacos did not become ready in time")


def ensure_namespace():
    try:
        existing = get("/nacos/v1/console/namespaces")
        namespaces = json.loads(existing).get("data", [])
        if any(ns.get("namespace") == NAMESPACE for ns in namespaces):
            print(f"[init-nacos] namespace {NAMESPACE} already present", flush=True)
            return
    except Exception as exc:  # noqa: BLE001
        print(f"[init-nacos] could not list namespaces ({exc}), creating anyway", flush=True)

    result = post(
        "/nacos/v1/console/namespaces",
        {
            "customNamespaceId": NAMESPACE,
            "namespaceName": "base44",
            "namespaceDesc": "Base44 sandbox namespace",
        },
    )
    print(f"[init-nacos] namespace create -> {result}", flush=True)


def publish_all():
    files = sorted(f for f in os.listdir(CONFIG_DIR) if f.endswith((".yaml", ".yml")))
    if not files:
        raise SystemExit(f"[init-nacos] no config files found in {CONFIG_DIR}")

    for name in files:
        with open(os.path.join(CONFIG_DIR, name), encoding="utf-8") as handle:
            content = handle.read()
        result = post(
            "/nacos/v1/cs/configs",
            {
                "dataId": name,
                "group": GROUP,
                "tenant": NAMESPACE,
                "type": "yaml",
                "content": content,
            },
        )
        print(f"[init-nacos] published {name} -> {result}", flush=True)


def main():
    wait_for_nacos()
    ensure_namespace()
    publish_all()
    print("[init-nacos] all configuration published", flush=True)


if __name__ == "__main__":
    try:
        main()
    except urllib.error.HTTPError as exc:
        print(f"[init-nacos] HTTP error: {exc.code} {exc.read().decode()}", file=sys.stderr)
        raise SystemExit(1)
