#!/usr/bin/env bash
# setup-acme.sh: prepare acme-app on managed nodes, with ad hoc commands
set -euo pipefail
target=${1:-web}

step() {
  echo "== $1"; shift
  ansible "$target" "$@" | grep '=>'     # one status line per host
}

step "app directory" -b -m file -a "path=/srv/acme-app state=directory owner=ops mode=0755"
step "version file"  -b -m copy -a "dest=/srv/acme-app/VERSION content='1.0\n' owner=ops"
step "app user"      -b -m user -a "name=acme shell=/sbin/nologin"
