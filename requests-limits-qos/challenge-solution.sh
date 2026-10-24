#!/usr/bin/env bash
# Kubernetes Deep Dive, lesson 6 - challenge solution.
# A Pod is Guaranteed only if EVERY container sets requests equal to limits, for CPU and memory.
set -euo pipefail

kubectl create namespace challenge
cat > guaranteed-two.yaml <<'YAML'
apiVersion: v1
kind: Pod
metadata:
  name: two
  namespace: challenge
spec:
  containers:
    - name: app
      image: busybox:1.36
      command: ["sleep", "3600"]
      resources:
        requests: {cpu: 100m, memory: 64Mi}
        limits: {cpu: 100m, memory: 64Mi}
    - name: helper
      image: busybox:1.36
      command: ["sleep", "3600"]
      resources:
        limits: {cpu: 50m, memory: 32Mi}   # only limits: requests are copied from them
YAML
kubectl apply -f guaranteed-two.yaml
kubectl get pod two -n challenge -o jsonpath='{.status.qosClass}{"\n"}'     # Guaranteed

# One single value breaks it: the helper's memory request lower than its limit.
# Resources of a running Pod are not changed in place here: delete and recreate.
sed -i 's/limits: {cpu: 50m, memory: 32Mi}.*/requests: {memory: 16Mi}\n        limits: {cpu: 50m, memory: 32Mi}/' guaranteed-two.yaml
kubectl delete pod two -n challenge
kubectl apply -f guaranteed-two.yaml
kubectl get pod two -n challenge -o jsonpath='{.status.qosClass}{"\n"}'     # Burstable

kubectl delete namespace challenge
