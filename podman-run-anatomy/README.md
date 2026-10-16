# Anatomy of a Production-Ready podman run (Every Flag Explained)

Video: https://youtu.be/wJY6khjU9C8

One podman run command, seven pieces, and the reason each one is there. Step by step, we take apart a rootless web container flag by flag, run it and verify it, then look at the three gotchas that bite people when they move from Docker to rootless Podman, each one shown on screen.

## Files

- `html/index.html`

## Commands from the video

Run them from inside this folder, in this order.

```bash
podman run -d --name acme-web --userns=keep-id -v ./html:/usr/share/nginx/html:Z,ro -p 8080:8080 --restart=on-failure docker.io/nginxinc/nginx-unprivileged:stable
podman ps --format 'table {{.Names}}  {{.Status}}  {{.Ports}}'
curl -s localhost:8080 | head -3
podman inspect acme-web --format '{{.HostConfig.RestartPolicy.Name}}'
podman run -d --name web2 -p 80:8080 docker.io/nginxinc/nginx-unprivileged:stable
ls -Z html/index.html
podman pull nginx
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
