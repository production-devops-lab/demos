#!/bin/bash
# check-app.sh: a quick look at acme-app

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
exit 0
