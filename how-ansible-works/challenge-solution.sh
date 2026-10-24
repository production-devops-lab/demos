#!/usr/bin/env bash
# Lesson 2 challenge: /opt/acme-app owned by ops on every node, with one command.
# Run it twice: the first run reports CHANGED, the second one SUCCESS with "changed": false.
ansible all -b -m ansible.builtin.file -a "path=/opt/acme-app state=directory owner=ops group=ops mode=0755"
