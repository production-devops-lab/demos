# What a Container Really Is: Namespaces and cgroups by Hand

Video: https://youtu.be/i7dqLhTH69c

A container is not a small virtual machine. It is a normal Linux process with its own view of the system (namespaces) and its own limits (cgroups). We build one by hand with unshare and nsenter, join an existing container's namespaces like the containers of a Kubernetes Pod do, and watch the kernel kill a process that goes over its memory limit, with exit code 137. Part 1 of the Kubernetes Path.

## Files

- `alloc.py`

- `challenge-solution.sh`

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
ps -e --no-headers | wc -l
unshare --pid --fork --mount-proc ps -e
unshare --uts bash -c 'hostname node01; hostname'
[ "$(hostname)" = node01 ] && echo changed || echo 'host name unchanged'
ip -brief link | awk '{print $1, $2}'
unshare --net ip -brief link | awk '{print $1, $2}'
unshare --uts --net bash -c 'hostname box1; exec sleep 600' &
nsenter --target $! --uts hostname
nsenter --target $! --net ip -brief link | awk '{print $1, $2}'
kill $!
stat -fc %T /sys/fs/cgroup
mkdir -p /sys/fs/cgroup/memory/demo
echo 50M > /sys/fs/cgroup/memory/demo/memory.limit_in_bytes
cat /sys/fs/cgroup/memory/demo/memory.limit_in_bytes
bash -c 'echo $$ > /sys/fs/cgroup/memory/demo/cgroup.procs; exec python3 alloc.py 100'
echo $?
bash -c 'echo $$ > /sys/fs/cgroup/memory/demo/cgroup.procs; exec python3 alloc.py 30'
rmdir /sys/fs/cgroup/memory/demo
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
