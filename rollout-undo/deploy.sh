#!/usr/bin/env bash
# Deploy gate from the video. Usage: ./deploy.sh registry.example.com/acme/web:2.5.0
# Uses your current kubectl context: try it on a test cluster first.
set -euo pipefail
image="$1"
kubectl set image deployment/web web="$image"
kubectl annotate deployment/web kubernetes.io/change-cause="$image" --overwrite
if ! kubectl rollout status deployment/web --timeout=180s; then
  echo "rollout of $image failed, rolling back" >&2
  kubectl rollout undo deployment/web
  exit 1
fi
