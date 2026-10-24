#!/usr/bin/env bash
# Challenge (lesson 4): take one Pod of a Deployment out with a label, then put the label back.
# Run it on a lab cluster only. Everything happens in the namespace "challenge".
set -euo pipefail

kubectl create namespace challenge
kubectl create deployment shop --image=nginx:1.27 --replicas=3 -n challenge
kubectl rollout status deployment/shop -n challenge --timeout=180s

# 1) Take one Pod out: change its app label. Its ReplicaSet releases it and creates a replacement.
pod=$(kubectl get pods -n challenge -l app=shop -o name | head -n 1)
kubectl label "$pod" -n challenge app=debug --overwrite
sleep 10
kubectl get pods -n challenge -L app        # 4 Pods: 3 app=shop + 1 app=debug (no owner)

# 2) Put the label back: the Pod matches the selector again, the ReplicaSet adopts it,
#    now counts 4 for 3 desired, and deletes one of them (its ranking decides which).
kubectl label "$pod" -n challenge app=shop --overwrite
sleep 10
kubectl get pods -n challenge -L app        # back to 3 Pods
kubectl get events -n challenge --field-selector reason=SuccessfulDelete -o custom-columns=REASON:.reason,MESSAGE:.message

# Note: the label app=shop is also in the pod-template-hash ReplicaSet selector, together with
# pod-template-hash; the relabelled Pod still has its pod-template-hash label, so it matches again.

kubectl delete namespace challenge
