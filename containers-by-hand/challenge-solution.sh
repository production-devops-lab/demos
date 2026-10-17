#!/usr/bin/env bash
# Challenge solution (Kubernetes Path, part 1). Needs root (or sudo) on a Linux machine.
# A shell in new PID + network namespaces cannot see the host's processes or interfaces.
set -euo pipefail

echo "== host view"
echo "processes: $(ps -e --no-headers | wc -l)"
ip -brief link | awk '{print "interface:", $1, $2}'

echo "== inside new PID + network namespaces"
unshare --pid --net --fork --mount-proc bash -c '
  echo "processes: $(ps -e --no-headers | wc -l)   (just this shell and the commands it runs)"
  ps -e
  ip -brief link | awk "{print \"interface:\", \$1, \$2}"
'
