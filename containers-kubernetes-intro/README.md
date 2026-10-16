# Containers and Kubernetes Explained for Sysadmins (No Hype)

Video: https://youtu.be/Z7t-x6k1-VM

What a container really is, what Kubernetes adds on top, and when you do not need it at all. Explained for engineers who already run Linux servers: images, containers and registries, the cluster architecture, a first Deployment, and self-healing in action. This is part 1 of our hands-on Kubernetes series.

## Commands from the video

Run them from inside this folder, in this order.

```bash
podman pull docker.io/library/alpine:3.20
podman images
podman run --rm docker.io/library/alpine:3.20 cat /etc/os-release
kubectl apply -f web.yaml
kubectl get pods
kubectl delete pod web-7c9d8b6f5d-4xk2p
kubectl get pods
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
