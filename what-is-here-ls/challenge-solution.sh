#!/usr/bin/env bash
# Lesson 4 challenge: list acme-app. How many folders? How many files?
# Run it in the lesson folder (the video's home folder: acme-app, notes, readme.txt).
set -euo pipefail
ls acme-app
# config.txt  logs
# One folder: logs (blue in most terminals, and no extension).
# One file: config.txt (white, with the extension .txt).
# We did not move: pwd still shows the home folder.
