#!/usr/bin/env bash
# Challenge solution: set replicas to 1 and apply. What does the loop do?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: it STOPS Pods until only one is left. The loop corrects in both directions: too few
# Pods, it creates some; too many, it removes some (lesson 3's challenge, now for real).

# Start from the lesson's file (3 copies)
kubectl apply -f acme-app.yaml
kubectl rollout status deployment/acme-app --timeout=180s >/dev/null

# 1. Change one number in the file: replicas 3 -> 1 (here with sed; in an editor, by hand)
sed 's/replicas: [0-9]*/replicas: 1/' acme-app.yaml > acme-app-1.yaml
grep 'replicas:' acme-app-1.yaml

# 2. Apply it
kubectl apply -f acme-app-1.yaml
kubectl rollout status deployment/acme-app --timeout=180s >/dev/null
# the two extra Pods take a few seconds to stop: wait until only one is listed (at most 90 s)
for i in $(seq 1 45); do
  [ "$(kubectl get pods -l app=acme-app --no-headers 2>/dev/null | wc -l)" -eq 1 ] && break
  sleep 2
done

# 3. How many Pods now? One.
kubectl get pods

# Clean up: delete the Deployment, and its Pod goes with it
kubectl delete deployment acme-app
