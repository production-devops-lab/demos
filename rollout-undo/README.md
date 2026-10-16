# Safe Kubernetes Rollouts: maxSurge, rollout status and rollout undo

Video: https://youtu.be/I7LGVoCgWUo

A bad image should stop at one pod, not reach every replica. We set up a Deployment that protects itself with maxSurge, maxUnavailable and a readiness probe, ship a broken version, watch the rollout stall safely, and roll back to a known revision with kubectl rollout undo. Plus change-cause annotations, rollout status as a deploy gate, and why undo renumbers your revisions.

## Files

- `deploy.sh`
- `web.yaml`

## Commands from the video

Run them from inside this folder, in this order.

```bash
kubectl rollout history deployment/web
kubectl set image deployment/web web=registry.example.com/acme/web:2.5.0
kubectl annotate deployment/web kubernetes.io/change-cause='2.5.0: new checkout page'
kubectl rollout status deployment/web --timeout=90s
echo $?
kubectl get pods -l app=web
kubectl describe pod web-7f4c8d6b5-j6tnq | grep Unhealthy
kubectl rollout history deployment/web
kubectl rollout history deployment/web --revision=2 | grep -E 'change-cause|Image'
kubectl rollout undo deployment/web --to-revision=2
kubectl rollout status deployment/web --timeout=90s
kubectl rollout history deployment/web
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
