#!/usr/bin/env bash
# Challenge: every warning or worse that acme-web logged in the previous boot after 02:00, message only.
journalctl -u acme-web -b -1 -p warning --since "2026-10-20 02:00" -o cat
# Expected on the lab journal:
#   upstream acme-app slow: 9.6s
#   upstream acme-app unavailable: connection refused
