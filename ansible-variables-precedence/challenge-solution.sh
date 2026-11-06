#!/usr/bin/env bash
# Lesson 12 challenge: node02 says "production", node01 "staging", without -e.
# Start from the end of the lesson (the default port is already in group_vars/all.yml).
#
# Why host_vars/node02.yml alone is not enough: app_env comes from vars/acme.yml, which the play
# loads with vars_files, and the play beats the whole inventory (rule 2). So the default has to
# move to the bottom of the ladder (rule 5), and node02 overrides it one rung higher (rule 1).
set -euo pipefail

# 1. The play's vars file keeps only values that must beat the inventory: none, here
printf '# values here beat the whole inventory\n' > vars/acme.yml

# 2. The defaults, at the bottom of the ladder
printf 'app_port: 9000\napp_env: staging\n' > group_vars/all.yml

# 3. node02's own values, one rung higher
printf 'app_port: 8081\napp_env: production\n' > host_vars/node02.yml

ansible-playbook app.yml
# ok: [node01] => { "msg": "acme-app (staging) on port 8080" }
# ok: [node02] => { "msg": "acme-app (production) on port 8081" }
