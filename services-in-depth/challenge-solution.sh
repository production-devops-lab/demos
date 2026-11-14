#!/usr/bin/env bash
# Challenge (lesson 7): expose the admin port (9090) on node port 30090, without a new Service,
# then test it from a node.
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: add a second port to the NodePort Service web-nodeport. With two ports, both need a name.
# Every node then answers on 30090, and the call reaches the container port named admin.
set -euo pipefail

# Start from the lesson's files (the lesson deletes its namespace at the end)
kubectl create namespace shop --dry-run=client -o yaml | kubectl apply -f -
kubectl apply -f web.yaml -f web-nodeport.yaml
kubectl rollout status deployment/web -n shop --timeout=180s

# The new file: web-nodeport.yaml plus a second, named port (in an editor, add the last four lines by hand)
cat > web-nodeport-admin.yaml <<'YAML'
apiVersion: v1
kind: Service
metadata:
  name: web-nodeport
  namespace: shop
spec:
  type: NodePort
  selector: {app: web}
  ports:
    - name: http
      port: 80
      targetPort: http
      nodePort: 30080
    - name: admin
      port: 9090
      targetPort: admin
      nodePort: 30090
YAML
kubectl apply -f web-nodeport-admin.yaml
kubectl get service web-nodeport -n shop        # PORT(S): 80:30080/TCP,9090:30090/TCP

# Test from two nodes: each prints the name of the Pod that answered on its admin port
sleep 2
docker exec lab-control-plane curl -s http://lab-control-plane:30090
docker exec lab-worker curl -s http://lab-worker:30090

kubectl delete namespace shop
