#!/usr/bin/env bash
# Challenge solution (lesson 7): a folder "team" for group acme where
#   - members create files that stay in group acme          -> setgid (2)
#   - nobody can delete the files of others                 -> sticky (1)
#   - members read, write and enter; others cannot even enter -> 770
# So: chmod 3770 (= 2 + 1, then rwx rwx ---), group acme.
#
#   mkdir team
#   chgrp acme team
#   chmod 3770 team
#   ls -ld team              -> drwxrws--T  ... root acme ... team
#                               s = setgid + x for the group; T = sticky WITHOUT x for others,
#                               which is right here: others must not enter (a capital letter only
#                               means "x is missing" - on purpose this time).
#
# Proof (as root, with runuser; dev1 and dev2 are in group acme, visitor is not):
#   runuser -u dev1 -- touch team/plan.txt        ok
#   ls -l team/plan.txt                           group acme (setgid)
#   runuser -u dev2 -- rm -f team/plan.txt        Operation not permitted (sticky: not dev2's file)
#   runuser -u visitor -- ls team                 Permission denied (others: ---)
#
# Tip: also set umask 0002 for the team members (or use a default ACL, lesson 25), so the files
# they create are group-writable.
#
# This script runs the proof. It needs root and the demo users/group from the lesson; it only
# creates and removes the folder "team" in the current directory.
set -uo pipefail
[[ $(id -u) -eq 0 ]] || { echo "run as root (it uses runuser)"; exit 1; }
for u in dev1 dev2 visitor; do id "$u" >/dev/null 2>&1 || { echo "missing demo user $u"; exit 1; }; done

mkdir -p team && chgrp acme team && chmod 3770 team
ls -ld team
runuser -u dev1 -- touch team/plan.txt && ls -l team/plan.txt
runuser -u dev2 -- rm -f team/plan.txt || echo "-> dev2 cannot delete dev1's file (sticky)"
runuser -u visitor -- ls team || echo "-> visitor cannot enter (others: ---)"
rm -rf -- team
