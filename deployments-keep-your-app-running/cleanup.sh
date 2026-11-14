#!/usr/bin/env bash
# Remove what this lesson created: the Deployment acme-app (its Pods go with it).
# Safe to run more than once: --ignore-not-found skips what is already gone.
kubectl delete deployment acme-app --ignore-not-found
# wait until its Pods are really gone, so the next lesson starts from an empty list
kubectl wait --for=delete pod -l app=acme-app --timeout=180s >/dev/null 2>&1 || true
