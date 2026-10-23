#!/usr/bin/env bash
# Challenge solution: a temp DIRECTORY cleaned on success, failure and Ctrl+C.
#
#   bash challenge-solution.sh                          # success  -> exit 0, directory removed
#   FAIL=1 bash challenge-solution.sh                   # failure  -> exit 1, directory removed
#   WORK_SECONDS=5 timeout --preserve-status -s INT 1 bash challenge-solution.sh
#                                                       # Ctrl+C   -> exit 130, directory removed
#   ls -d /tmp/acme-work.* 2>/dev/null || echo "nothing left behind"
set -euo pipefail

cleanup() {
  rc=$?                                  # first line: the real exit code
  rm -rf -- "${WORKDIR:-}"               # empty if mktemp never ran: nothing is removed
  echo "Removed ${WORKDIR:-nothing}, exit code $rc"
}

WORKDIR=$(mktemp -d /tmp/acme-work.XXXXXX)
trap cleanup EXIT                        # right after the resource exists
trap 'exit 130' INT
trap 'exit 143' TERM

echo "Working in $WORKDIR"
touch "$WORKDIR/data.csv"
sleep "${WORK_SECONDS:-0}"
if [ "${FAIL:-0}" = 1 ]; then
  false                                  # simulated failure: set -e stops here, EXIT still runs
fi
echo "Done"
