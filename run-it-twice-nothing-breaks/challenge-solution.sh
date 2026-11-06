#!/usr/bin/env bash
# Lesson 8 challenge: change the text in hello.txt, run the playbook. Which task says changed?
# Run it in the lesson folder, with the two practice servers started, after the lesson's runs.
set -euo pipefail
echo "Welcome to acme-app, now open at 8:00" > hello.txt   # the new text, on the control node
ansible-playbook acme-app.yml
# TASK [Create the app folder]
# ok: [node01]
# ok: [node02]                  <- the folders were already right
#
# TASK [Copy the welcome file]
# changed: [node01]
# changed: [node02]             <- the copy module compared the file on each server with hello.txt:
#                                  different content, so it copied the new one
# PLAY RECAP
# node01 : ok=2    changed=1 ...
# node02 : ok=2    changed=1 ...
#
# Run it once more: everything is green again (changed=0), because now the servers match.
ansible-playbook acme-app.yml | tail -3
