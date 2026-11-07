#!/usr/bin/env bash
# Challenge solution (lesson 11): count the requests per HTTP method (field 4), biggest first.
#
#   cut -d' ' -f4 acme-app.log | sort | uniq -c | sort -rn
#
#   cut -d' ' -f4   keep field 4, the method (GET, POST)
#   sort            equal methods next to each other (uniq only merges neighbours)
#   uniq -c         one line per method, with a count in front
#   sort -rn        by number, biggest first
#
# Expected with the lesson's log:   13 GET   then   7 POST
#
# The same with awk, in one program (an array counts each method, END prints the totals):
#   awk '{n[$4]++} END {for (m in n) print n[m], m}' acme-app.log | sort -rn
#
# Run it from the folder that holds acme-app.log (the demo folder of this lesson).
set -euo pipefail
log=${1:-acme-app.log}
[ -f "$log" ] || { echo "usage: $0 [path/to/acme-app.log]" >&2; exit 2; }
cut -d' ' -f4 "$log" | sort | uniq -c | sort -rn
