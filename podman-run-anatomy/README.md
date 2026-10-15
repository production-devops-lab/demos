# Anatomy of a Production-Ready podman run (Every Flag Explained)

Video: https://youtu.be/4ty6wD4AL5s

One podman run command, seven pieces, and the reason each one is there. We dissect a rootless web container flag by flag, run it, and finish with the three gotchas that bite people when they move from Docker to rootless Podman.

## Files

- `html/index.html`

## Commands from the video

Run them from inside this folder, in this order.

```bash
podman run -d --name acme-web --userns=keep-id -v ./html:/usr/share/nginx/html:Z,ro -p 8080:8080 --restart=on-failure docker.io/nginxinc/nginx-unprivileged:stable
podman ps --format 'table {{.Names}}  {{.Status}}  {{.Ports}}'
curl -s localhost:8080 | head -3
podman inspect acme-web --format '{{.HostConfig.RestartPolicy.Name}}'
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
