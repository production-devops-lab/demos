#!/usr/bin/env bash
# Lesson 4 challenge: make a new file todo.txt, then run status, add, and status again.
# What changes colour? (It works in a new temporary folder and changes nothing else.)
set -euo pipefail
cd "$(mktemp -d)"
git init -q practice
cd practice
echo "Buy bread" > todo.txt     # a new file (echo writes the text into it)
git status
#   Untracked files:
#       todo.txt              <- red: Git sees it, but has never saved it
git add todo.txt
git status
#   Changes to be committed:
#       new file:   todo.txt  <- green: on the tray, ready to sign
# Answer: todo.txt goes from red (untracked) to green (on the tray). Nothing is saved yet:
# git status still says "No commits yet". Saving is lesson 5.
