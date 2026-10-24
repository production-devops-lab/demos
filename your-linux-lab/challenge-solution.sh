#!/usr/bin/env bash
# Lesson 2 challenge: key login to your own lab VM, with a short name.
# Run these on YOUR computer (the ssh client), not on the VM.
# Replace 192.0.2.10 with the address of your VM (ip -br addr on the VM shows it),
# and ops with your user on the VM.
set -euo pipefail

# 1. A key pair with a passphrase (ssh-keygen asks for it). Skip if you already have one.
[ -f ~/.ssh/id_ed25519 ] || ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

# 2. Copy the PUBLIC key into ~/.ssh/authorized_keys of ops on the VM.
#    This is the last time the VM asks for the password of ops.
ssh-copy-id -i ~/.ssh/id_ed25519.pub ops@192.0.2.10

# 3. A short name in your ssh client config (only if it is not there yet).
mkdir -p ~/.ssh && chmod 700 ~/.ssh
grep -q '^Host lab$' ~/.ssh/config 2>/dev/null || cat >> ~/.ssh/config <<'CFG'

Host lab
    HostName 192.0.2.10
    User ops
    IdentityFile ~/.ssh/id_ed25519
CFG
chmod 600 ~/.ssh/config

# 4. Log in with the short name: no password, only the key (and its passphrase).
ssh lab whoami
