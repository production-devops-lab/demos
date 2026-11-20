#!/usr/bin/env bash
# Final challenge of Linux from Zero: read config.txt, then make a folder called backup at home,
# and check it with ls. Run it in the lesson folder (the video's home folder).
set -euo pipefail
cd acme-app         # config.txt is inside acme-app
cat config.txt
# name=acme-app
# port=8080
# log_folder=logs
cd ..               # back up to the home folder (cd alone works too)
mkdir backup        # no message: it worked
ls
# acme-app  backup  notes  readme.txt
# backup is there. Five commands, one folder at a time, and a look after every change.
