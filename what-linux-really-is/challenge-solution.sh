#!/usr/bin/env bash
# Challenge solution (lesson 1): print the kernel, the distribution and its family in one line.
#
#   bash challenge-solution.sh
#   -> kernel 6.8.0-...-generic on Ubuntu 24.04 LTS (family: debian)          (Ubuntu VM)
#   -> kernel 5.14.0-...el9_6.x86_64 on AlmaLinux 9.6 (family: rhel centos fedora)   (AlmaLinux VM)
#
# One-liner version, to paste in a terminal:
#   ( . /etc/os-release; echo "kernel $(uname -r) on $PRETTY_NAME (family: ${ID_LIKE:-$ID})" )
#
# Notes:
# - The parentheses run it in a subshell, so the variables from os-release do not stay in your shell.
# - ${ID_LIKE:-$ID}: Debian and Fedora have no ID_LIKE (they ARE the family), so we fall back to ID.
# - In a container, the kernel is the host's: try it in a container and on the host, and compare.
set -euo pipefail

. /etc/os-release
echo "kernel $(uname -r) on ${PRETTY_NAME:-$NAME} (family: ${ID_LIKE:-$ID})"
