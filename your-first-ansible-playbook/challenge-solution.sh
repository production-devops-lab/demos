#!/usr/bin/env bash
# Lesson 7 challenge: add a third task, a folder /tmp/acme-app/logs. Run it. How many changed?
# Run it in the lesson folder, with the two practice servers started, after the lesson's run.
# The new playbook is acme-app-logs.yml (copy it next to acme-app.yml): the same file, plus
#     - name: Create the logs folder
#       ansible.builtin.file:
#         path: /tmp/acme-app/logs
#         state: directory
# (same indentation as the other two tasks).
set -euo pipefail
ansible-playbook --syntax-check acme-app-logs.yml
ansible-playbook acme-app-logs.yml
# PLAY RECAP
# node01 : ok=3    changed=1    unreachable=0    failed=0 ...
# node02 : ok=3    changed=1    unreachable=0    failed=0 ...
# ok=3: three tasks ran fine. changed=1: only the NEW task changed something.
# The folder and the file were already there from the lesson's run, so those two tasks were "ok"
# (green) and did nothing. Lesson 8 is all about this.
