#!/usr/bin/env bash
# Lesson 7 challenge: with ansible-doc only, add acme_env=lab to /etc/environment on web.
#
# 1. Find the module:     ansible-doc -l ansible.builtin | grep -i line
#                         -> ansible.builtin.lineinfile   Manage lines in text files
# 2. Recall its options:  ansible-doc -s ansible.builtin.lineinfile
#                         -> path (required), line, state (default: present), ...
# 3. Run it twice: the first run says CHANGED ("line added"), the second SUCCESS, changed false.
ansible web -b -m ansible.builtin.lineinfile -a "path=/etc/environment line=acme_env=lab"
