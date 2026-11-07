#!/usr/bin/env bash
# Challenge solution (lesson 10): change log_level=debug to log_level=info in app.conf,
# with a backup first, and prove the change with diff.
#
#   cp -a app.conf app.conf.bak                                   backup first (owner and date kept)
#   vim -es -c '%s/log_level=debug/log_level=info/' -c wq app.conf  the edit, no editor on screen
#   diff app.conf.bak app.conf                                    2 lines: < old, > new (exit code 1)
#
# Interactive alternative: vim app.conf, then  :%s/debug/info/  Enter, then  :wq  Enter
# (or nano app.conf, Ctrl+\ to replace, Ctrl+O to save, Ctrl+X to exit).
#
# Why search for "log_level=debug" and not just "debug"? The longer pattern can only match the
# setting, never a comment or a path that happens to contain the word.
#
# This script runs the proof in a temporary folder (it never touches your real files).
set -euo pipefail
dir=$(mktemp -d)
trap 'rm -rf -- "$dir"' EXIT
cd "$dir"
printf '%s\n' '# acme-app settings' 'port=9090' 'log_level=debug' 'data_dir=/var/lib/acme-app' > app.conf

cp -a app.conf app.conf.bak
vim -es -c '%s/log_level=debug/log_level=info/' -c wq app.conf
diff app.conf.bak app.conf || echo "-> diff exit code $?: the files differ, as expected"
