#!/usr/bin/env bash
# Challenge: a quota of 500m CPU requests, a default request of 200m,
# a Deployment of 3 replicas without resources. How many run, and who says why?
# Run against a throwaway lab cluster only.
set -euo pipefail

kubectl create namespace team-b

kubectl apply -f - <<'YAML'
apiVersion: v1
kind: ResourceQuota
metadata: {name: cpu, namespace: team-b}
spec:
  hard:
    requests.cpu: 500m
---
apiVersion: v1
kind: LimitRange
metadata: {name: defaults, namespace: team-b}
spec:
  limits:
    - type: Container
      defaultRequest: {cpu: 200m}
YAML

kubectl create deployment web --image=nginx:1.27 --replicas=3 -n team-b
sleep 10

# Answer 1: two Pods run (2 x 200m = 400m; a third would make 600m > 500m).
kubectl get deployment web -n team-b

# Answer 2: the message is on the ReplicaSet, as a FailedCreate event:
#   exceeded quota: cpu, requested: requests.cpu=200m, used: requests.cpu=400m, limited: requests.cpu=500m
kubectl get events -n team-b --field-selector reason=FailedCreate -o jsonpath='{.items[0].message}{"\n"}'

kubectl describe resourcequota cpu -n team-b

kubectl delete namespace team-b
