#!/usr/bin/env bash
# Nightly report - naive version
set -euo pipefail
mkdir acme-report.lock 2>/dev/null || { echo "Another run is in progress"; exit 1; }
TMP=$(mktemp tmp.report.XXXX)
echo "Collecting data into $TMP"
cp "$TMP" "${REPORT_DIR:-outbox}/"
rm -f "$TMP"
rmdir acme-report.lock
echo "Report sent"
