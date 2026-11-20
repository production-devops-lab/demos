#!/usr/bin/env bash
# Lesson 6 challenge: in your practice repo, run git log --oneline. How many pages are there?
# Self-contained: it rebuilds the practice repo of lesson 5 (two commits) in a new temporary folder.
# Git must know your name and email (see lesson 3's setup.md).
set -euo pipefail
cd "$(mktemp -d)"
git init -q acme-app
cd acme-app
printf 'acme-app\nA tiny demo app for this course.\n' > readme.txt
printf 'name=acme-app\nport=8080\n' > config.txt
git add readme.txt config.txt
git commit -q -m "Add readme and config"
echo "It says hello on port 8080." >> readme.txt
git add readme.txt
git commit -q -m "Describe the app in the readme"

git log --oneline
#   1a2b3c4 (HEAD -> main) Describe the app in the readme
#   5d6e7f8 Add readme and config
# Answer: two pages, one line each. The newest is on top, and HEAD (you are here) points to it.
# Your IDs are different from these: an ID depends on the content, the author and the date.
