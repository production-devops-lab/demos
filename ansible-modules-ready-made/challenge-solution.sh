#!/usr/bin/env bash
# Lesson 6 challenge: run the folder command again on node01. Yellow or green?
# Run it in the lesson folder, with the two practice servers started (setup guide of lesson 4),
# after the two commands of the lesson.
set -euo pipefail
ansible node01 -m file -a "path=/tmp/acme-app state=directory"
# node01 | SUCCESS => {        <- GREEN this time
#     "changed": false,         <- nothing was changed
#     ...
#     "path": "/tmp/acme-app",
#     "state": "directory",
#     ...
# }
# Why? We did not say "create a folder". We said "/tmp/acme-app must BE a folder".
# The file module looked first, found the folder already there, and did nothing.
# Lesson 8 shows this with a whole playbook: run it twice, nothing breaks.
#
# Note: in the video the hidden setting ANSIBLE_REMOTE_TMP=/tmp/.ansible-tmp is used, so the
# copy answer shows a temporary path under /tmp. Without it you see a path in the home folder of
# the user ops on the server. Both are fine; you do not need the setting.
