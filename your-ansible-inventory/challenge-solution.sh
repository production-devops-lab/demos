#!/usr/bin/env bash
# Lesson 4 challenge: a second group, [db], with node02 in it. Where does node02 appear?
# Run it in the lesson folder (the one with ansible.cfg and inventory.ini).
set -euo pipefail
cat > inventory.ini <<'INI'
[web]
node01
node02

[db]
node02
INI
ansible-inventory --graph
# Output:
# @all:
#   |--@ungrouped:
#   |--@web:
#   |  |--node01
#   |  |--node02
#   |--@db:
#   |  |--node02
# node02 appears TWICE: a server can be in more than one group.
# It is still ONE server: a command for "all" talks to node02 once, not twice.
