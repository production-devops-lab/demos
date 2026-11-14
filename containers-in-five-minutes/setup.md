# Try it yourself: Docker

To run the command of this lesson on your own computer you need **Docker**:

- **Windows or macOS:** install Docker Desktop: https://docs.docker.com/get-started/get-docker/
  (on Windows, the lessons use Ubuntu in WSL 2 with Docker Desktop's WSL integration turned on).
- **Linux:** install Docker Engine for your distribution: https://docs.docker.com/engine/install/

Check that it works:

```bash
docker run --rm busybox:1.36 echo Hello from a container
```

The first time you see a few lines about pulling (downloading) the image, then `Hello from a container`.
Run it again: only the last line is left, because the image is already on your computer.

Other tools run the same images too (Podman, for example). For this course Docker is enough: the
practice cluster of lessons 4 to 8 (kind) runs on top of it.
