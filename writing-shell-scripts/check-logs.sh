#!/usr/bin/env bash
# check-logs.sh: count the ERROR or WARN lines in acme-app logs
# exit codes: 0 = none found, 1 = found, 2 = wrong usage

usage() {
  echo "usage: $0 error|warn FILE..." >&2
  exit 2
}

case "$1" in
  error) word="ERROR" ;;
  warn)  word="WARN" ;;
  *)     usage ;;
esac
shift
if [ $# -eq 0 ]; then
  usage
fi

status=0
for file in "$@"; do
  count=$(grep -c "$word" "$file")
  echo "$file: $count $word line(s)"
  if [ "$count" -gt 0 ]; then
    status=1
  fi
done
exit "$status"
