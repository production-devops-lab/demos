#!/usr/bin/env bash
# Start the two lab HTTPS test servers (openssl s_server) if they are not running yet.
#   bash serve.sh DIR      (DIR made by make-lab.sh)
#   port 8443: shop.example     port 8444: shoppe.example
# Stop them with: pkill -f 's_server -accept 127.0.0.1:844'
set -euo pipefail
d="${1:?usage: bash serve.sh DIR}"
start() {   # start PORT SITE
  if ! (exec 3<>"/dev/tcp/127.0.0.1/$1") 2>/dev/null; then
    nohup setsid openssl s_server -accept "127.0.0.1:$1" -cert "$d/$2.crt" \
      -cert_chain "$d/issuing-ca.crt" -key "$d/.keys/$2.key" -www -quiet >/dev/null 2>&1 &
    for _ in 1 2 3 4 5 6 7 8 9 10; do (exec 3<>"/dev/tcp/127.0.0.1/$1") 2>/dev/null && break; sleep 0.3; done
  fi
}
start 8443 shop
start 8444 shoppe
