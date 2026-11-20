#!/usr/bin/env bash
# Lesson 5 challenge: change readme.txt, then add it and commit it, with a good message.
# Self-contained: it builds a practice repo like the video's in a new temporary folder.
# Git must know your name and email (see lesson 3's setup.md).
set -euo pipefail
cd "$(mktemp -d)"
git init -q acme-app
cd acme-app
printf 'acme-app\nA tiny demo app for this course.\n' > readme.txt
printf 'name=acme-app\nport=8080\n' > config.txt
git add readme.txt config.txt
git commit -q -m "Add readme and config"         # page 1, as in the video

# The challenge: change readme.txt (here we add a line; in real life, use your editor)
echo "It says hello on port 8080." >> readme.txt
git status                                       # modified: readme.txt (red, not on the tray)
git add readme.txt                               # on the tray
git commit -m "Describe the app in the readme"   # a good message: what changed, starting with a verb
#   [main 1a2b3c4] Describe the app in the readme
#    1 file changed, 1 insertion(+)
git status                                       # nothing to commit, working tree clean
