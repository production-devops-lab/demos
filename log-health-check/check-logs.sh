#!/usr/bin/env bash
# check-logs.sh - log health check, exit 0 OK / 1 WARNING / 2 CRITICAL
set -euo pipefail

LOG_DIR=${LOG_DIR:-/var/log/acme}
WARN=${WARN:-80}            # disk usage % for WARNING
CRIT=${CRIT:-90}            # disk usage % for CRITICAL
MAX_AGE=${MAX_AGE:-15}      # minutes without new log lines
MAX_ERRORS=${MAX_ERRORS:-5} # ERROR lines in the last 200

status=0
names=(OK WARNING CRITICAL)
check() {  # check <level> <message>
  echo "${names[$1]}: $2"
  if (( $1 > status )); then status=$1; fi
}

[[ -d $LOG_DIR ]] || { check 2 "$LOG_DIR does not exist"; exit 2; }

used=$(df --output=pcent "$LOG_DIR" | tail -n 1 | tr -dc '0-9')
if   (( used >= CRIT )); then check 2 "disk ${used}% (critical at ${CRIT}%)"
elif (( used >= WARN )); then check 1 "disk ${used}% (warning at ${WARN}%)"
else                          check 0 "disk ${used}%"
fi

if [[ -n $(find "$LOG_DIR" -name '*.log' -mmin -"$MAX_AGE" -print -quit) ]]; then
  check 0 "logs updated in the last ${MAX_AGE} min"
else
  check 1 "no log written in the last ${MAX_AGE} min"
fi

errors=$(tail -n 200 "$LOG_DIR/app.log" | grep -c ERROR || true)
if (( errors > MAX_ERRORS )); then check 1 "$errors ERROR lines in the last 200"
else                               check 0 "$errors ERROR lines in the last 200"
fi

echo "overall: ${names[$status]}"
exit "$status"
