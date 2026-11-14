#!/usr/bin/env bash
# Remove what this lesson created: the namespaces shop and billing and everything in them
# (Deployment web, Pods dns and tuned, Services web, web-pods and pay, and what the challenge added).
# Safe to run more than once: --ignore-not-found skips what is already gone.
kubectl delete namespace shop billing --ignore-not-found --wait=true --timeout=180s
