#!/usr/bin/env bash
# Challenge solution (lesson 14): what goes wrong with a file that does not exist, and the fix.
#
# Before the fix:
#   ./check-logs.sh error nope.log
#     grep: nope.log: No such file or directory
#     nope.log:  ERROR line(s)                                 <- count is empty
#     ./check-logs.sh: line 24: [: : integer expression expected
#   echo $?   ->  0                                            <- "none found": a lie!
#
# The fix: test every file before using it, inside the for loop, before the grep line:
#
#     if [ ! -f "$file" ]; then
#       echo "$file: no such file" >&2
#       exit 2
#     fi
#
#   [ -f "$file" ]   true if it is a regular file;  !  turns the answer around
#   >&2              the message goes to stderr, like the usage message
#   exit 2           2 = wrong usage, the promise in the header comment
#
# This script writes the fixed version as check-logs-fixed.sh in a temporary folder and runs it.
set -uo pipefail
dir=$(mktemp -d)
trap 'rm -rf -- "$dir"' EXIT
cd "$dir"
printf '%s\n' '2026-10-20 08:01:30 ERROR payment service timeout' > app.log
cat > check-logs-fixed.sh <<'SCRIPT'
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
  if [ ! -f "$file" ]; then
    echo "$file: no such file" >&2
    exit 2
  fi
  count=$(grep -c "$word" "$file")
  echo "$file: $count $word line(s)"
  if [ "$count" -gt 0 ]; then
    status=1
  fi
done
exit "$status"
SCRIPT
chmod +x check-logs-fixed.sh
./check-logs-fixed.sh error nope.log; echo "exit code: $?"
./check-logs-fixed.sh error app.log; echo "exit code: $?"
