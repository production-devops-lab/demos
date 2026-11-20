#!/bin/bash
# check-app.sh: report on an acme-app log
# usage: ./check-app.sh LOGFILE
# exit codes: 0 = done, 1 = no log

app="acme-app"
log="$1"

echo "Checking $app"

if [ -f "$log" ]; then
  echo "Log found: $log"
  for level in INFO WARN ERROR; do
    echo -n "$level lines: "
    grep -c "$level" "$log"
  done
else
  echo "No log file at: $log"
  exit 1
fi
echo "Report done"
exit 0
