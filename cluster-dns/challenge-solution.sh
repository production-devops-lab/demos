#!/usr/bin/env bash
# Challenge (lesson 9): from a Pod in billing, reach the Service web (namespace shop) with the shortest
# name that works. Then make the name `web` alone work in that Pod.
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer:
#   1. The shortest name is web.shop. A Pod in billing searches billing.svc.cluster.local first
#      (web.shop.billing.svc.cluster.local: no such name), then svc.cluster.local: web.shop.svc.cluster.local.
#      Plain `web` fails: web.billing.svc.cluster.local does not exist.
#   2. dnsConfig.searches: [shop.svc.cluster.local] appends shop's domain to that Pod's search list,
#      so `web` is found as web.shop.svc.cluster.local. (The trailing-dot form web.shop.svc.cluster.local.
#      always works too: it is absolute, no search.)
set -euo pipefail

# Start from the lesson's lab (the lesson deletes its namespaces at the end)
for ns in shop billing; do kubectl create namespace "$ns" --dry-run=client -o yaml | kubectl apply -f -; done
kubectl get deployment web -n shop >/dev/null 2>&1 || \
  kubectl create deployment web --image=busybox:1.36 --replicas=2 -n shop -- httpd -f -p 8080
kubectl apply -f shop.yaml

# Two client Pods in billing: one with the defaults, one with shop's domain in its search list
kubectl apply -f - <<'YAML'
apiVersion: v1
kind: Pod
metadata: {name: client, namespace: billing}
spec:
  containers:
    - {name: dig, image: "registry.k8s.io/e2e-test-images/jessie-dnsutils:1.3", command: ["sleep", "3600"]}
---
apiVersion: v1
kind: Pod
metadata: {name: client-shop, namespace: billing}
spec:
  dnsConfig:
    searches: [shop.svc.cluster.local]
  containers:
    - {name: dig, image: "registry.k8s.io/e2e-test-images/jessie-dnsutils:1.3", command: ["sleep", "3600"]}
YAML
kubectl wait --for=condition=Ready pod/client pod/client-shop -n billing --timeout=300s

echo "--- 1. default Pod in billing"
echo "web:";      kubectl exec client -n billing -- getent hosts web      || echo "  not found (exit $?)"
echo "web.shop:"; kubectl exec client -n billing -- getent hosts web.shop
echo "--- 2. Pod with searches: [shop.svc.cluster.local]"
echo "web:";      kubectl exec client-shop -n billing -- getent hosts web

kubectl delete namespace shop billing
