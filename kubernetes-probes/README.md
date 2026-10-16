# Liveness vs Readiness vs Startup Probes: Stop Killing Healthy Pods

Video: https://youtu.be/IBvgdNBOyB8

A wrong liveness probe can restart a healthy but slow app forever. We look at what each Kubernetes probe really controls: liveness restarts, readiness removes traffic, startup waits for a slow boot. We reproduce the restart loop, read the timing behind it, fix it with a startupProbe, and cover the two classic mistakes: a liveness probe that checks the database, and the same endpoint for liveness and readiness.

## Files

- `api.yaml`

## Commands from the video

Run them from inside this folder, in this order.

```bash
kubectl get pods -l app=api
kubectl logs api-6b9d4c7f8-q4m2x --previous
kubectl describe pod api-6b9d4c7f8-q4m2x | grep -E 'Unhealthy|Killing'
kubectl apply -f api.yaml
kubectl rollout status deployment/api --timeout=300s
kubectl get pods -l app=api
kubectl describe pod api-5f8c7b9d6-t2w8k | grep -E 'Liveness|Readiness|Startup'
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
