#!/usr/bin/env bash
# Lesson 15 challenge: replace the encrypted vars FILE with ONE encrypted value (encrypt_string),
# then run app.yml with a vault ID.
# Run it in the lesson folder, after the lesson (~/.vault-pass.txt exists, mode 600).
# Lab value only: never put a real secret on the command line (it lands in shell history; use --prompt).
set -euo pipefail

# 1. One encrypted value, label "dev", written as the whole vars file.
#    "Encryption successful" goes to stderr, so only the YAML lands in the file.
ansible-vault encrypt_string --vault-id dev@~/.vault-pass.txt 'acme-lab-demo' --name db_pass \
  > group_vars/web/vault.yml

# 2. The file is readable YAML again: only the value is encrypted (header 1.2;AES256;dev).
head -3 group_vars/web/vault.yml
# db_pass: !vault |
#           $ANSIBLE_VAULT;1.2;AES256;dev
#           <hex: different on every run, random salt>

# 3. Run the playbook with the vault ID.
ansible-playbook app.yml --vault-id dev@~/.vault-pass.txt
# ok: [node01] => { "msg": "db_pass has 13 characters" }
# ok: [node02] => { "msg": "db_pass has 13 characters" }
