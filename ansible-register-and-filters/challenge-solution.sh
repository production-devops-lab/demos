#!/usr/bin/env bash
# Lesson 14 challenge: print the DISABLED apps from apps.yml, comma separated.
# Run it in the lesson folder (apps.yml, ansible.cfg and inventory.ini from the lesson).
#
# selectattr('enabled') keeps the items whose enabled key is true.
# Its opposite is rejectattr('enabled'): it drops them and keeps the others.
set -euo pipefail

cat > challenge.yml <<'YAML'
- name: The disabled apps
  hosts: node01
  gather_facts: false
  vars_files: apps.yml
  tasks:
    - name: Print them
      ansible.builtin.debug:
        msg: "disabled: {{ apps | rejectattr('enabled') | map(attribute='name') | join(', ') }}"
YAML

ansible-playbook challenge.yml
# TASK [Print them]
# ok: [node01] => { "msg": "disabled: acme-api" }
#
# The same with an explicit test: selectattr('enabled', 'false') - selectattr and rejectattr
# take a test as their second argument (default: is the value true?).
