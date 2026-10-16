# Stop Scrolling kubectl Output: custom-columns, jsonpath and --sort-by

Video: https://youtu.be/lHxPHbiN8dc

During an incident you need one field, not a wall of YAML. We take kubectl output apart: -o wide, finding the right field path with kubectl explain, readable tables with custom-columns, sorting with --sort-by, and jsonpath for scripts. Plus the awk mistake that breaks the day a pod restarts.

## Commands from the video

Run them from inside this folder, in this order.

```bash
kubectl get pods
kubectl get pods -o wide
kubectl get pods | awk '{print $1, $5}'
kubectl explain pod.status.containerStatuses.restartCount
kubectl get pods -o custom-columns=NAME:.metadata.name,NODE:.spec.nodeName,RESTARTS:.status.containerStatuses[0].restartCount --sort-by=.status.containerStatuses[0].restartCount
kubectl get pods -l app=web -o jsonpath='{.items[*].metadata.name}'
kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.spec.nodeName}{"\n"}{end}'
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
