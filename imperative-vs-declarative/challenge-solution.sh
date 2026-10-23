#!/usr/bin/env bash
# Challenge solution: a Deployment and a Service from generated YAML, then change + diff + apply.
# Run on a test cluster (here the kind "lab"). Nothing is written by hand.
set -euo pipefail

kubectl create namespace challenge --dry-run=client -o yaml | kubectl apply -f -

# 1. Generate the manifests (build them, do not send them)
kubectl create deployment shop --image=nginx:1.27 --replicas=2 -n challenge \
  --dry-run=client -o yaml > shop-deploy.yaml
kubectl create service clusterip shop --tcp=80:80 -n challenge \
  --dry-run=client -o yaml > shop-svc.yaml
# `create service` selects pods with app=shop: the same label `create deployment` puts on them.

# 2. Apply both files (apply accepts several -f)
kubectl apply -f shop-deploy.yaml -f shop-svc.yaml
kubectl rollout status deployment/shop -n challenge

# 3. Change the replicas IN THE FILE, then preview the change
sed -i 's/replicas: 2/replicas: 4/' shop-deploy.yaml
kubectl diff -f shop-deploy.yaml || true      # exit code 1 = there are differences
#   -  replicas: 2
#   +  replicas: 4

# 4. Apply, and check
kubectl apply -f shop-deploy.yaml
kubectl get deployment,service -n challenge

# Clean up
kubectl delete namespace challenge
