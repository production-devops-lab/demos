#!/usr/bin/env bash
# Challenge (Kubernetes Deep Dive, lesson 2): the controller manager's identity and certificate.
# Run in WSL with the kind lab cluster up (context kind-lab).

# 1. Which identity does the controller manager use? Ask the API server with its own kubeconfig.
docker exec lab-control-plane kubectl --kubeconfig /etc/kubernetes/controller-manager.conf auth whoami
#    -> Username: system:kube-controller-manager

# 2. Is its client certificate embedded (…-data) or a path on disk? Print the key names only.
docker exec lab-control-plane cat /etc/kubernetes/controller-manager.conf \
  | awk '/certificate-data/ {sub(/: .*/, ": <embedded data>")} /^- name:|client-certificate/'
#    -> client-certificate-data: <embedded data>   (embedded, renewed by kubeadm, not by itself)

# 3. When does it expire?
docker exec lab-control-plane kubeadm certs check-expiration | grep -E 'RESIDUAL|controller-manager.conf'
#    -> one year after the cluster was created (or last renewed / upgraded)
