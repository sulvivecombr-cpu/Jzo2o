#!/bin/sh
# Initialize Nacos configs via REST API
set -e

NACOS_HOST="${NACOS_HOST:-nacos}"
NACOS_PORT="${NACOS_PORT:-8848}"
CONFIG_DIR="${CONFIG_DIR:-/app/nacos-configs}"
GROUP="DEFAULT_GROUP"
NAMESPACE="public"

echo "Waiting for Nacos to be ready..."
for i in $(seq 1 60); do
    if curl -sf "http://${NACOS_HOST}:${NACOS_PORT}/nacos/v1/console/health/readiness" >/dev/null 2>&1; then
        echo "Nacos is ready."
        break
    fi
    sleep 2
done

# Also try the legacy health endpoint
curl -sf "http://${NACOS_HOST}:${NACOS_PORT}/nacos/v1/ns/operator/metrics" >/dev/null 2>&1 || true

# Authenticate with Nacos to get access token
NACOS_USER="${NACOS_USERNAME:-nacos}"
NACOS_PASS="${NACOS_PASSWORD:-nacos}"
echo "Authenticating to Nacos as ${NACOS_USER}..."
ACCESS_TOKEN=""
for i in $(seq 1 10); do
    ACCESS_TOKEN=$(curl -s -X POST "http://${NACOS_HOST}:${NACOS_PORT}/nacos/v1/auth/users/login" \
        --data-urlencode "username=${NACOS_USER}" \
        --data-urlencode "password=${NACOS_PASS}" \
        | grep -o '"accessToken":"[^"]*"' | cut -d'"' -f4)
    if [ -n "$ACCESS_TOKEN" ]; then
        echo "Authentication successful."
        break
    fi
    echo "Retrying authentication ($i/10)..."
    sleep 3
done

if [ -z "$ACCESS_TOKEN" ]; then
    echo "WARNING: Could not authenticate to Nacos. Attempting config push without token."
fi

echo "Pushing configs to Nacos namespace: ${NAMESPACE}"
for f in "${CONFIG_DIR}"/*.yaml; do
    data_id=$(basename "$f")
    content=$(cat "$f")
    echo "Creating config: ${data_id}"
    # URL-encode the content and push
    if [ -n "$ACCESS_TOKEN" ]; then
        curl -s -X POST "http://${NACOS_HOST}:${NACOS_PORT}/nacos/v1/cs/configs" \
            --data-urlencode "dataId=${data_id}" \
            --data-urlencode "group=${GROUP}" \
            --data-urlencode "type=yaml" \
            --data-urlencode "content=${content}" \
            --data-urlencode "tenant=" \
            --data-urlencode "accessToken=${ACCESS_TOKEN}" \
            | while read -r resp; do echo "  -> ${resp}"; done
    else
        curl -s -X POST "http://${NACOS_HOST}:${NACOS_PORT}/nacos/v1/cs/configs" \
            --data-urlencode "dataId=${data_id}" \
            --data-urlencode "group=${GROUP}" \
            --data-urlencode "type=yaml" \
            --data-urlencode "content=${content}" \
            --data-urlencode "tenant=" \
            | while read -r resp; do echo "  -> ${resp}"; done
    fi
    sleep 0.5
done

echo "All Nacos configs pushed successfully."
