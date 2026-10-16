#!/usr/bin/env bash
# check-logs-naive.sh - the version we all wrote once
df -h logs/acme | awk 'NR==2 {print "disk usage: " $5}'
find logs/acme -name '*.log' -mmin -15
echo "check done"
