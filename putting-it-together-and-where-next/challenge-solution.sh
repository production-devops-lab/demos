#!/usr/bin/env bash
# Challenge solution: delete only the Service. Do the Pods stop?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: NO. The Pods keep running: the Deployment still keeps three of them. Only the fixed name and
# address are gone, so visitors can no longer find the app through the Service.
# The Deployment and the Service are separate things, joined only by the label app: acme-app.

# Start from the lesson's file
kubectl apply -f acme-app.yaml
kubectl rollout status deployment/acme-app --timeout=180s >/dev/null

# 1. Delete only the Service
kubectl delete service acme-app

# 2. The Pods are still running
kubectl get pods

# 3. The Service is gone (this command fails on purpose: NotFound)
kubectl get service acme-app || echo "(no Service: nothing answers at its address any more)"

# 4. Apply the file again: the Service comes back; the Deployment is "unchanged"
kubectl apply -f acme-app.yaml

# Clean up everything in the file
kubectl delete -f acme-app.yaml
