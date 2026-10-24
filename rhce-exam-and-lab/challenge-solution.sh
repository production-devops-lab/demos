#!/usr/bin/env bash
# Lesson 1 challenge: a third managed node, node03 on port 2203, and three pongs.
# lab/up.sh reads the list of nodes from the NODES variable (name:port).
NODES="node01:2201 node02:2202 node03:2203" bash lab/up.sh
echo 'node03 ansible_host=127.0.0.1 ansible_port=2203' >> inventory.ini
ansible all -m ping
# Note: always pass the same NODES list when you run lab/up.sh again,
# or the ssh config for node03 is rewritten without it.
