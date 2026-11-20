#!/usr/bin/env bash
# Lesson 6 challenge: read config.txt in acme-app. Which folder holds the logs?
# Run it in the lesson folder (the video's home folder).
set -euo pipefail
cd acme-app
cat config.txt
# name=acme-app
# port=8080
# log_folder=logs
# The last line answers it: log_folder=logs. The logs are in the folder logs, inside acme-app,
# which is where we found app.log in the video.
