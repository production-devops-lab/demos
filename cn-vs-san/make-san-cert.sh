#!/usr/bin/env bash
# Self-signed development certificate with a Subject Alternative Name (SAN) list.
set -euo pipefail
openssl req -x509 -newkey rsa:2048 -nodes -days 365 \
  -keyout san.key -out san.pem \
  -subj "/CN=app.lab.example" \
  -addext "subjectAltName=DNS:app.lab.example,DNS:localhost,IP:127.0.0.1" 2>/dev/null
echo "created san.pem (certificate) and san.key (private key)"
