#!/bin/bash
# check-app.sh: a quick look at acme-app

app="acme-app"
log="acme-app/logs/app.log"

echo "Checking $app"
echo "Log file: $log"
cat "$log"
