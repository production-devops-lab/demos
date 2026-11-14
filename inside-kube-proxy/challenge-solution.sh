#!/usr/bin/env bash
# Challenge (lesson 8): scale api to 4 replicas. Which probabilities do the KUBE-SVC rules show?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: four jump rules, tried in order. Each one takes an equal share of what is LEFT:
#   rule 1: 1/4 = 0.25   rule 2: 1/3 of the rest   rule 3: 1/2 of the rest   rule 4: no statistic, all the rest
# so every endpoint gets 1/4 of the new connections. (kube-proxy prints the numbers with 10 decimals.)
set -euo pipefail

# Start from the lesson's files (the lesson deletes its namespace at the end)
kubectl create namespace acme --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -f api.yaml
kubectl get service api -n acme >/dev/null 2>&1 || kubectl expose deployment api --port=80 --target-port=http -n acme
kubectl rollout status deployment/api -n acme --timeout=180s

kubectl scale deployment api --replicas=4 -n acme
kubectl rollout status deployment/api -n acme --timeout=180s
sleep 5   # readiness (every 2 s) + EndpointSlice update + kube-proxy sync

# Read the probabilities on any node: grep -o keeps only the matching words
docker exec lab-worker iptables-save -t nat | grep 'acme/api ->' | grep -o -- '--probability [0-9.]*' || true
echo "jump rules: $(docker exec lab-worker iptables-save -t nat | grep -c 'acme/api ->')"

kubectl delete namespace acme
