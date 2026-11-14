#!/usr/bin/env bash
# Challenge solution: scale the Deployment to 5 copies. Does the Service's address change?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: NO. The Service keeps the same CLUSTER-IP. It simply sends calls to 5 Pods instead of 3,
# because all 5 wear the label app: acme-app that its selector looks for.

# Start from the lesson's files (3 copies, and the Service)
kubectl apply -f acme-app.yaml -f acme-service.yaml
kubectl rollout status deployment/acme-app --timeout=180s >/dev/null

echo "--- before: 3 copies"
kubectl get service acme-app

# Change one number in the Deployment's file: replicas 3 -> 5 (here with sed; in an editor, by hand)
sed 's/replicas: [0-9]*/replicas: 5/' acme-app.yaml > acme-app-5.yaml
kubectl apply -f acme-app-5.yaml
kubectl rollout status deployment/acme-app --timeout=180s >/dev/null

echo "--- after: 5 copies"
kubectl get pods
kubectl get service acme-app
# Compare the CLUSTER-IP column of the two get service commands: it is the same.
