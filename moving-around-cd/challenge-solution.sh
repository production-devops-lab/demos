#!/usr/bin/env bash
# Lesson 5 challenge: walk to logs, ask pwd, then come home in one word.
# Run it in the lesson folder (the video's home folder).
set -euo pipefail
cd acme-app     # logs is inside acme-app: one folder at a time
cd logs
pwd
# /lab/sre/acme-app/logs     (in the video's lab; yours shows your own home path first)
cd              # cd alone: straight home, from anywhere
pwd
# /lab/sre
# Note: in a script, cd alone goes to your real home folder ($HOME). In the video's lab, home is
# /lab/sre. If you run this script elsewhere, the last line shows your own home folder.
