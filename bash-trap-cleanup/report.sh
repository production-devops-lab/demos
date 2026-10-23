#!/usr/bin/env bash
# Nightly report - with trap
set -euo pipefail
cleanup() {
  rc=$?
  rm -f "${TMP:-}"
  rmdir acme-report.lock
  echo "Cleanup done, exit code $rc"
}
on_error() { echo "Failed at line $1: $2"; }
mkdir acme-report.lock 2>/dev/null || { echo "Another run is in progress"; exit 1; }
trap cleanup EXIT
trap 'on_error $LINENO "$BASH_COMMAND"' ERR
trap 'exit 130' INT
trap 'exit 143' TERM
TMP=$(mktemp tmp.report.XXXX)
echo "Collecting data into $TMP"
sleep "${WORK_SECONDS:-0}"
cp "$TMP" "${REPORT_DIR:-outbox}/"
echo "Report sent"
