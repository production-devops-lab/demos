#!/usr/bin/env bash
# Remove what this lesson created: the namespace acme and everything in it (the Deployment api, its Pods,
# the Service api and its EndpointSlice). kube-proxy removes the matching iptables rules by itself.
# Safe to run more than once: --ignore-not-found skips what is already gone.
kubectl delete namespace acme --ignore-not-found --wait=true --timeout=180s
