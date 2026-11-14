#!/usr/bin/env bash
# Remove what this lesson created (the Pod acme-app, and acme-app-2 from the challenge).
# Safe to run more than once: --ignore-not-found skips what is already gone.
kubectl delete pod acme-app acme-app-2 --ignore-not-found
