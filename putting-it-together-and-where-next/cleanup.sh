#!/usr/bin/env bash
# Remove what this lesson created: everything in acme-app.yaml (the Deployment and the Service).
# Safe to run more than once: --ignore-not-found skips what is already gone.
kubectl delete -f acme-app.yaml --ignore-not-found
# wait until its Pods are really gone, so the lab is left empty
kubectl wait --for=delete pod -l app=acme-app --timeout=180s >/dev/null 2>&1 || true
