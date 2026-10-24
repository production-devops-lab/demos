#!/usr/bin/env bash
# Lesson 6 challenge: setup-acme.sh takes the version as argument 2.
#   ./challenge-solution.sh web 1.1   -> only "version file" reports CHANGED
#   ./challenge-solution.sh web 1.1   -> run it again: SUCCESS everywhere
set -euo pipefail
target=${1:-web}
version=${2:-1.0}

step() {
  echo "== $1"; shift
  ansible "$target" "$@" | grep '=>'     # one status line per host
}

step "app directory" -b -m file -a "path=/srv/acme-app state=directory owner=ops mode=0755"
step "version file"  -b -m copy -a "dest=/srv/acme-app/VERSION content='${version}\n' owner=ops"
step "app user"      -b -m user -a "name=acme shell=/sbin/nologin"
