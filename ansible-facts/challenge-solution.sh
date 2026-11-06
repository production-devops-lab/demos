#!/usr/bin/env bash
# Lesson 13 challenge: print node02's app version (the custom fact) from a play on node01.
# Run it in the lesson folder, after the lesson (acme.fact installed, fact cache in facts-cache/).
#
# The trap: the cache holds node02's facts from facts.yml, which ran BEFORE we installed acme.fact.
# Facts are a snapshot, so node02's cached facts have no ansible_local.acme yet.
# Fix: gather node02's facts again first (play 1), then read them through hostvars (play 2).
set -euo pipefail

cat > challenge.yml <<'YAML'
- name: Refresh node02's facts (the cache is older than acme.fact)
  hosts: node02
  gather_facts: true
  tasks: []

- name: Read them from node01
  hosts: node01
  gather_facts: false
  tasks:
    - name: Show node02's app version
      ansible.builtin.debug:
        msg: "node02 runs acme-app {{ hostvars['node02']['ansible_facts']['ansible_local']['acme']['app']['version'] }}"
YAML

ansible-playbook challenge.yml
# TASK [Show node02's app version]
# ok: [node01] => { "msg": "node02 runs acme-app 2.4.1" }
#
# Play 1 also refreshes the cache: from now on, a play on node01 alone (gather_facts: false)
# can read the version for 24 hours (fact_caching_timeout), without touching node02.
