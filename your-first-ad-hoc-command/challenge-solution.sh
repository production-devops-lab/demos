#!/usr/bin/env bash
# Lesson 5 challenge: ping the group web. How many answers?
# Run it in the lesson folder, with the two practice servers started (setup guide of lesson 4).
set -euo pipefail
ansible web -m ping
# Two answers, one per server in the group web:
# node01 | SUCCESS => {
#     "changed": false,
#     "ping": "pong"
# }
# node02 | SUCCESS => {
#     "changed": false,
#     "ping": "pong"
# }
# The group web holds node01 and node02 (inventory.ini), so "web" and "all" pick the same two
# servers here. They are not the same thing: "all" is every server in the inventory, "web" only the
# servers listed under [web]. The answers can come in any order.
