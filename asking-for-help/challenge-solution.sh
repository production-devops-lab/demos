#!/usr/bin/env bash
# Lesson 8 challenge: ask ls for help. Which option shows hidden names?
# Run it in the lesson folder (the video's home folder).
set -euo pipefail
ls --help | head -12
# ls --help is a long page (more than 100 lines), so here we keep only its top. Near the top:
#   -a, --all                  do not ignore entries starting with .
# "Entries starting with ." are the hidden names of lesson 4. So the answer is -a (or --all).
# Try it in a folder you know:
ls -a
# .  ..  acme-app  notes  readme.txt
# Two new names appear: "." is this folder itself, ".." is the parent folder (cd .. in lesson 5).
# Hidden files you create yourself (names starting with a dot) would appear here too.
# On a Mac, ls --help is not supported: use man ls instead (press q to quit). -a works there too.
