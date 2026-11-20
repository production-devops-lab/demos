#!/usr/bin/env bash
# Lesson 3 challenge: type pwd in your terminal. How many folders are in the path?
# Run it in a new terminal (it starts in your home folder).
set -euo pipefail
pwd
# In the video's lab the answer is:
# /lab/sre
# Read it from the left: the first / is the top of the cabinet (root), then the folder lab, then the
# folder sre. So: two folders below the root.
# On your own computer you will see your own path, usually /home/ followed by your user name
# (on a Mac: /Users/ followed by your name). That is also two folders below the root: home, then yours.
