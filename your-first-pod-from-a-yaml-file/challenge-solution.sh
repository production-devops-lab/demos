#!/usr/bin/env bash
# Challenge solution: copy the file, change the name to acme-app-2, apply it. How many Pods?
# capture.py: run (this file also runs during the recording session, to check the answer)
#
# Answer: TWO Pods, acme-app and acme-app-2. A different name is a different Pod: the cluster keeps
# both. (Applying the SAME file twice gave "unchanged": same name, nothing to do.)

# 1. Copy the file with the new name (here with sed; in an editor, change line 4 by hand)
sed 's/^  name: acme-app$/  name: acme-app-2/' acme-app.yaml > acme-app-2.yaml
cat acme-app-2.yaml

# 2. Apply the copy
kubectl apply -f acme-app-2.yaml
kubectl wait --for=condition=Ready pod/acme-app-2 --timeout=180s >/dev/null

# 3. How many Pods?
kubectl get pods

# Clean up the extra Pod (deleting is the topic of lesson 6)
kubectl delete pod acme-app-2
