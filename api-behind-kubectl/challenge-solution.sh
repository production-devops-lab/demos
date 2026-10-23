#!/usr/bin/env bash
# Challenge solution: scale the web Deployment to 3 replicas with curl only,
# through kubectl proxy, using the "scale" subresource of the Deployment.
#
#   kubectl proxy --port=8001 >/dev/null 2>&1 & echo $! > proxy.pid
#   ./challenge-solution.sh
#   kill $(cat proxy.pid)
set -euo pipefail

API=localhost:8001/apis/apps/v1/namespaces/api-demo/deployments/web/scale

# read the current scale (a small Scale object: spec.replicas and status.replicas)
curl -s "$API" | jq -c '{kind, spec, status: {replicas: .status.replicas}}'

# change only spec.replicas: a JSON merge patch on the scale subresource
curl -s -X PATCH -H 'Content-Type: application/merge-patch+json' \
  --data '{"spec":{"replicas":3}}' "$API" | jq -c '{kind, spec}'

# check: three Pods appear (kubectl reads the same API)
#   kubectl get deployment web -n api-demo
