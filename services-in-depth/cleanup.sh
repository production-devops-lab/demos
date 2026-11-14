#!/usr/bin/env bash
# Remove what this lesson created: the namespace shop and everything in it (the Deployment web, the client
# Pod, the Services web, web-nodeport, web-lb, billing-db, and what the challenge added).
# Safe to run more than once: --ignore-not-found skips what is already gone.
kubectl delete namespace shop --ignore-not-found --wait=true --timeout=180s
