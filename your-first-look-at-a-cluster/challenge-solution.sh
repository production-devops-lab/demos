#!/usr/bin/env bash
# Challenge solution: try `kubectl get node`, without the s. Same answer?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: YES, the same list. kubectl accepts the plural (nodes), the singular (node) and a short
# name (no). Many kinds of things have a short name: pods is po, for example.

echo "--- kubectl get node"
kubectl get node

echo "--- kubectl get no   (the short name)"
kubectl get no
