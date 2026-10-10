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

echo "Pushing configs to Nacos namespace: ${NAMESPACE}"
for f in "${CONFIG_DIR}"/*.yaml; do
    data_id=$(basename "$f")
    content=$(cat "$f")
    echo "Creating config: ${data_id}"
    # URL-encode the content and push
    curl -s -X POST "http://${NACOS_HOST}:${NACOS_PORT}/nacos/v1/cs/configs" \
        --data-urlencode "dataId=${data_id}" \
        --data-urlencode "group=${GROUP}" \
        --data-urlencode "type=yaml" \
        --data-urlencode "content=${content}" \
        --data-urlencode "tenant=" \
        | while read -r resp; do echo "  -> ${resp}"; done
    sleep 0.5
done

echo "All Nacos configs pushed successfully."
