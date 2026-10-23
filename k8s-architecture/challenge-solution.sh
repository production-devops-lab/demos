#!/usr/bin/env bash
# Kubernetes Deep Dive, lesson 1 - challenge solution (run from WSL, kind cluster "lab")

# 1. The containers on the second worker, straight from the runtime (CRI)
docker exec lab-worker2 crictl ps
#   (crictl ps has no Go template output: use -o json | jq -r '.containers[].metadata.name' for names only)

# 2. Which control plane manifests set the Service IP range?
docker exec lab-control-plane sh -c 'grep -l service-cluster-ip-range /etc/kubernetes/manifests/*.yaml'
#   -> kube-apiserver.yaml (allocates Service IPs)
#   -> kube-controller-manager.yaml (needs the same range for its controllers)

# 3. The value itself
docker exec lab-control-plane grep -h -- --service-cluster-ip-range \
  /etc/kubernetes/manifests/kube-apiserver.yaml
