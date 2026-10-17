#!/usr/bin/env bash
# (Re)start the HTTPS test server in the background on 127.0.0.1:8443.
# Usage: ./serve.sh CERT KEY
set -euo pipefail
cert="$1" key="$2"
pidfile="${TMPDIR:-/tmp}/demo-https-8443.pid"
if [[ -f "$pidfile" ]]; then
  old=$(cat "$pidfile")
  if grep -q tls-server /proc/"$old"/cmdline 2>/dev/null; then kill "$old"; sleep 0.3; fi
fi
nohup python3 tls-server.py "$cert" "$key" 8443 </dev/null >/dev/null 2>&1 &
echo $! > "$pidfile"
for _ in $(seq 1 50); do nc -z 127.0.0.1 8443 2>/dev/null && break; sleep 0.1; done
echo "serving https://127.0.0.1:8443 with $cert"
