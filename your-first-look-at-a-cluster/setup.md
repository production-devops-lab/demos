# Try it yourself: a practice cluster with kind

You need three things. Follow the official guides, they are kept up to date:

1. **Docker**: see the setup guide of lesson 2 (Docker Desktop on Windows or macOS, Docker Engine on
   Linux). On Windows, use Ubuntu in WSL 2 with Docker Desktop's WSL integration turned on.
2. **kind**: https://kind.sigs.k8s.io/docs/user/quick-start/#installation
3. **kubectl**: https://kubernetes.io/docs/tasks/tools/

Then create the practice cluster of this course: three nodes, called `lab-control-plane`, `lab-worker`
and `lab-worker2`. The file `kind-lab.yaml` is in this folder.

```bash
kind create cluster --name lab --config kind-lab.yaml
```

It takes one to three minutes. Then ask the cluster which computers it has:

```bash
kubectl get nodes
```

All three should say `Ready`. If one says `NotReady`, wait a few seconds and run the command again.

When you do not need the cluster, delete it to free memory (you can always make a new one):

```bash
kind delete cluster --name lab
```

**minikube** (https://minikube.sigs.k8s.io/docs/start/) does the same job, with one node by default.
The commands of the next lessons work there too; only the node names are different.
