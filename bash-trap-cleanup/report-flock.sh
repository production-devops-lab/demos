#!/usr/bin/env bash
# Nightly report - lock with flock
set -euo pipefail
exec 9>acme-report.flock
flock -n 9 || { echo "Another run is in progress"; exit 1; }
echo "Working, lock held"
sleep "${WORK_SECONDS:-1}"
echo "Report sent"
