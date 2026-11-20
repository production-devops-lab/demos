#!/usr/bin/env bash
# Lesson 3 challenge: make a folder called shopping-list, and run git init inside it.
# Run it anywhere you can write (it works in a new temporary folder and changes nothing else).
set -euo pipefail
cd "$(mktemp -d)"
mkdir shopping-list
cd shopping-list
git init
# Git answers with one line, ending with the path of your new folder:
#   Initialized empty Git repository in /tmp/tmp.XXXXXXXXXX/shopping-list/.git/
# The book (.git) is ready, and empty. Run git init a second time and it says
# "Reinitialized existing Git repository": nothing is lost.
