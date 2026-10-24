#!/usr/bin/env bash
# Ansible for RHCE - practice lab on ONE Linux machine:
#   control node = this shell, managed nodes = node01 and node02.
# Each managed node is an sshd on 127.0.0.1 (ports 2201, 2202) with its own
# hostname, /etc, /home, /tmp, /opt and /srv (Linux namespaces).
# Run it as root in a throwaway VM or container (podman run --privileged ...).
# Idempotent: run it again at any time, it only adds what is missing.
# 'bash up.sh reset' gives every managed node a fresh /etc, /home, /tmp, /opt, /srv.
set -euo pipefail
LAB=/var/lib/rhce-lab
NODES=${NODES:-"node01:2201 node02:2202"}   # name:port, add more if you like

for cmd in sshd ssh-keygen sudo unshare python3; do
  command -v "$cmd" >/dev/null || PATH=$PATH:/usr/sbin
  command -v "$cmd" >/dev/null || { echo "missing: $cmd (install openssh-server, sudo, util-linux, python3)"; exit 1; }
done

# 1. The automation user: ops, SSH keys only, passwordless sudo
id ops >/dev/null 2>&1 || useradd -m -s /bin/bash ops
usermod -p '*' ops
printf '%s\n' 'Defaults:ops !authenticate' 'ops ALL=(ALL) ALL' > /etc/sudoers.d/ops
chmod 0440 /etc/sudoers.d/ops

# 2. The control node's key pair
mkdir -p "$LAB" /run/sshd
chmod 0700 "$LAB"
[ -f "$LAB/id_ed25519" ] || ssh-keygen -q -t ed25519 -N '' -C ops@lab -f "$LAB/id_ed25519"

# 3. The managed nodes
if [ "${1:-}" = reset ]; then for n in $NODES; do rm -f "$LAB/${n%%:*}/root/.ready"; done; fi
for n in $NODES; do
  name=${n%%:*} port=${n##*:} d=$LAB/$name
  if [ ! -f "$d/root/.ready" ]; then
    [ -f "$d/sshd.pid" ] && kill "$(cat "$d/sshd.pid")" 2>/dev/null && sleep 0.5
    rm -rf "$d/root"
    mkdir -p "$d/root/tmp" "$d/root/opt" "$d/root/srv"
    chmod 1777 "$d/root/tmp"
    cp -a /etc "$d/root/etc"
    mkdir -p "$d/root/home"
    cp -a /etc/skel "$d/root/home/ops"
    chown -R ops:ops "$d/root/home/ops"
    echo "127.0.1.1 $name" >> "$d/root/etc/hosts"
    touch "$d/root/.ready"
  fi
  cp -p /etc/sudoers.d/ops "$d/root/etc/sudoers.d/ops"
  h=$d/root/home/ops
  install -d -m 0700 -o ops -g ops "$h/.ssh"
  install -m 0600 -o ops -g ops "$LAB/id_ed25519.pub" "$h/.ssh/authorized_keys"
  [ -f "$d/ssh_host_ed25519_key" ] || ssh-keygen -q -t ed25519 -N '' -f "$d/ssh_host_ed25519_key"
  cat > "$d/sshd_config" <<CFG
Port $port
ListenAddress 127.0.0.1
HostKey $d/ssh_host_ed25519_key
PidFile $d/sshd.pid
AllowUsers ops
PasswordAuthentication no
KbdInteractiveAuthentication no
PrintMotd no
Subsystem sftp internal-sftp
CFG
  entry="[127.0.0.1]:$port $(cut -d' ' -f1,2 "$d/ssh_host_ed25519_key.pub")"
  touch /etc/ssh/ssh_known_hosts
  grep -qxF "$entry" /etc/ssh/ssh_known_hosts || echo "$entry" >> /etc/ssh/ssh_known_hosts
  if ! { [ -f "$d/sshd.pid" ] && kill -0 "$(cat "$d/sshd.pid")" 2>/dev/null; }; then
    unshare --uts --mount --propagation private sh -c "
      echo $name > /proc/sys/kernel/hostname
      for dir in etc home tmp opt srv; do mount --bind $d/root/\$dir /\$dir; done
      exec $(command -v sshd) -f $d/sshd_config -E $d/sshd.log"
  fi
done

# 4. SSH client config: 'ssh node01' just works
{
  echo "# RHCE lab: the managed nodes"
  for n in $NODES; do
    printf 'Host %s\n    HostName 127.0.0.1\n    Port %s\n    User ops\n' "${n%%:*}" "${n##*:}"
  done
  printf 'Host node* 127.0.0.1\n    IdentityFile %s/id_ed25519\n    IdentitiesOnly yes\n' "$LAB"
} > /etc/ssh/ssh_config.d/rhce-lab.conf

for n in $NODES; do
  for i in $(seq 50); do ss -ltn | grep -q "127.0.0.1:${n##*:} " && break; sleep 0.1; done
done
for n in $NODES; do echo "ready: ${n%%:*} (127.0.0.1 port ${n##*:}, user ops)"; done
