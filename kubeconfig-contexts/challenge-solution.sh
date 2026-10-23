#!/usr/bin/env bash
# Challenge solution - Kubernetes Path part 4: a context "lab-dev" for the lab cluster, namespace dev.
# Work on a copy of your kubeconfig if you want to keep the real one unchanged:
#   kubectl config view --raw --minify --context kind-lab > lab-kubeconfig && export KUBECONFIG=$PWD/lab-kubeconfig

kubectl create namespace dev

# a new context: same cluster and user as kind-lab, default namespace dev
kubectl config set-context lab-dev --cluster=kind-lab --user=kind-lab --namespace=dev
kubectl config use-context lab-dev
kubectl config get-contexts          # the star is on lab-dev, NAMESPACE = dev

kubectl get pods                     # "No resources found in dev namespace."

# clean up
kubectl config use-context kind-lab
kubectl config delete-context lab-dev
kubectl delete namespace dev
