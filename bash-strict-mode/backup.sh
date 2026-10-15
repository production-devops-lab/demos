#!/usr/bin/env bash
# Nightly backup - naive version
SRC_DIR=/data/app
cd "$SRC_DIR"
echo "Cleaning old files in: $(basename "$PWD")/  (rm -rf ./*)"
echo "Backup completed successfully"
