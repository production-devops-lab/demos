# Kubernetes Requests vs Limits: Why Pods Get OOMKilled (and Throttled)

Video: https://youtu.be/nXlzXlAA7dw

A pod restarts with OOMKilled and exit code 137, another service is slow while the node is idle. Both come from two blocks in your YAML: requests and limits. We see what each one really controls, why memory kills and CPU only slows down, how QoS classes decide who is evicted first, and how to pick starting values from measured usage instead of a guess.

## Files

- `worker.yaml`

## Commands from the video

Run them from inside this folder, in this order.

```bash
kubectl get pods -l app=report-worker
kubectl describe pod report-worker-6d8f7c9b54-x7k2m | grep -A3 'Last State'
kubectl top pod -l app=report-worker
kubectl apply -f worker.yaml
kubectl get pods -l app=report-worker
kubectl top pod -l app=report-worker
kubectl exec deploy/api -- cat /sys/fs/cgroup/cpu.stat
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
