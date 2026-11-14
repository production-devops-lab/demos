#!/usr/bin/env bash
# The lab of lesson 9, created before recording (the video shows it on the slide "Our lab, already running").
# Run it on a lab cluster, then follow the lesson from `kubectl apply -f shop.yaml`.
set -euo pipefail

kubectl create namespace shop
kubectl create namespace billing

# Two web Pods with the label app=web (busybox httpd on 8080)
kubectl create deployment web --image=busybox:1.36 --replicas=2 -n shop -- httpd -f -p 8080

# A client Pod with DNS tools: dig (bind) and getent (glibc, resolves like an application does)
kubectl run dns --image=registry.k8s.io/e2e-test-images/jessie-dnsutils:1.3 -n shop -- sleep 3600

# A Service in another namespace (no Pods behind it: DNS does not need them for a ClusterIP Service)
kubectl create service clusterip pay --tcp=80:8080 -n billing

kubectl wait --for=condition=Ready pod --all -n shop --timeout=300s
