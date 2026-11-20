#!/bin/bash
# all-logs.sh: run check-app.sh on every acme-app log
# usage: ./all-logs.sh   (in the folder that holds check-app.sh)
#
# Final challenge of Shell Scripting from Zero: a script that checks both logs.

for log in acme-app/logs/app.log acme-app/logs/old.log; do
  ./check-app.sh "$log"
done
# Run it (remember chmod +x all-logs.sh):   ./all-logs.sh
# Checking acme-app
# Log found: acme-app/logs/app.log
# INFO lines: 2
# WARN lines: 1
# ERROR lines: 0
# Report done
# Checking acme-app
# Log found: acme-app/logs/old.log
# INFO lines: 2
# WARN lines: 1
# ERROR lines: 1
# Report done
# One script calls another: the loop hands check-app.sh one log per round, as its argument ($1).
