# CrashLoopBackOff: The 5-Step Routine to Find the Real Cause

Video: https://youtu.be/wk2GcCCF0kw

A pod in CrashLoopBackOff is a symptom, not a diagnosis, and restarting it destroys the evidence. We follow a 5-step routine on a broken Deployment: pod status, last state and exit code, logs of the previous container, configuration, and probes. Then we fix it and verify the rollout.

## Commands from the video

Run them from inside this folder, in this order.

```bash
kubectl get pods -l app=api
kubectl describe pod api-7f9c6d5b8-k2x9p | grep -A4 'Last State'
kubectl logs api-7f9c6d5b8-k2x9p
kubectl logs api-7f9c6d5b8-k2x9p --previous
kubectl get deploy api -o jsonpath='{.spec.template.spec.containers[0].env}'
kubectl set env deployment/api --from=secret/api-db
kubectl rollout status deployment/api --timeout=120s
kubectl get pods -l app=api
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
