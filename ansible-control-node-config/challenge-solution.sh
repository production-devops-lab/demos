#!/usr/bin/env bash
# Lesson 3 challenge: from elsewhere/, ping all the nodes without copying any file.
cd elsewhere
ANSIBLE_CONFIG=../ansible.cfg ansible all -m ping
# It works because a relative path in ansible.cfg (inventory = inventory.ini)
# is resolved next to the config file, not in the current directory.
