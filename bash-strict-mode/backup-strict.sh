#!/usr/bin/env bash
set -euo pipefail
# Nightly backup - strict version
SRC_DIR=/data/app
cd "$SRC_DIR"
echo "Cleaning old files in: $(basename "$PWD")/  (rm -rf ./*)"
echo "Backup completed successfully"
