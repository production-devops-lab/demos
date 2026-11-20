#!/bin/bash
# check-app.sh: report on an acme-app log
# usage: ./check-app.sh LOGFILE
# exit codes: 0 = done, 1 = no log
#
# Lesson 9 challenge: add DEBUG to the list, run it on app.log. What is new? What is the exit code?

app="acme-app"
log="$1"

echo "Checking $app"

if [ -f "$log" ]; then
  echo "Log found: $log"
  for level in INFO WARN ERROR DEBUG; do
    echo -n "$level lines: "
    grep -c "$level" "$log"
  done
else
  echo "No log file at: $log"
  exit 1
fi
echo "Report done"
exit 0
# Run it:   ./check-app.sh acme-app/logs/app.log ; echo $?
# Checking acme-app
# Log found: acme-app/logs/app.log
# INFO lines: 2
# WARN lines: 1
# ERROR lines: 0
# DEBUG lines: 0
# Report done
# 0
# New: one more line, DEBUG lines: 0 (app.log has no DEBUG lines). The exit code is still 0: grep's
# "found nothing" (1) does not leak out, because the script ends on purpose with exit 0 (lesson 8).
