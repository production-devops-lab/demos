#!/usr/bin/env bash
# Kubernetes Deep Dive, lesson 3 - challenge solution.
# A running Pod accepts NEW tolerations, but refuses to drop or change existing ones.
set -euo pipefail

kubectl create namespace challenge
kubectl apply -f - <<'YAML'
apiVersion: v1
kind: Pod
metadata:
  name: tolerant
  namespace: challenge
spec:
  tolerations:
    - key: dedicated
      operator: Equal
      value: batch
      effect: NoSchedule
  containers:
    - name: nginx
      image: nginx:1.27
YAML

# 1. Add a second toleration in place: accepted (a JSON patch appends to the list).
kubectl patch pod tolerant -n challenge --type=json \
  -p '[{"op":"add","path":"/spec/tolerations/-","value":{"key":"gpu","operator":"Exists","effect":"NoSchedule"}}]'
kubectl get pod tolerant -n challenge -o jsonpath='{range .spec.tolerations[*]}{.key}{"\n"}{end}'

# 2. Try to remove our first toleration: refused by VALIDATION in the API server (step 2),
#    "Forbidden: pod updates may not change fields other than ... spec.tolerations (only additions
#    to existing tolerations) ...". Removing is not an addition.
kubectl patch pod tolerant -n challenge --type=json -p '[{"op":"remove","path":"/spec/tolerations/0"}]' \
  2>&1 | head -n 1 | tr ',' '\n' || true

kubectl delete namespace challenge
