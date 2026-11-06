#!/usr/bin/env bash
# Final challenge: from memory, a playbook for /tmp/acme-app/data on all servers. Check it, run it twice.
# Run it in a lesson folder (ansible.cfg, inventory.ini), with the two practice servers started.
set -euo pipefail
ansible-playbook --syntax-check data.yml   # prints only "playbook: data.yml": no spelling mistake
ansible-playbook data.yml                  # first run:  changed: [node01], changed: [node02] (yellow)
ansible-playbook data.yml                  # second run: ok: [node01], ok: [node02] (green), changed=0
# hosts: all   -> every server in the inventory (the group "web" would pick the same two here)
# state: directory -> an end state: "this path must be a folder", so the second run has nothing to do.
# The file module also creates the missing parent /tmp/acme-app if it is not there yet.
