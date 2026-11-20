#!/usr/bin/env bash
# Lesson 7 challenge: in your practice repo, make a branch called test-idea. Where is the star?
# Self-contained: it builds a one-commit practice repo in a new temporary folder.
# Git must know your name and email (see lesson 3's setup.md).
set -euo pipefail
cd "$(mktemp -d)"
git init -q -b main acme-app
cd acme-app
printf 'acme-app\nA tiny demo app for this course.\n' > readme.txt
git add readme.txt
git commit -q -m "Add the readme"

git branch               # * main
git branch test-idea     # no message: it worked
git branch
#   * main
#     test-idea
# Answer: the star is still on main. Making a branch does not move you onto it.
# (To move onto it you would type: git switch test-idea. Then the star moves.)
