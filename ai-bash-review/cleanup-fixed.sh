#!/bin/bash
# acme-app: keep the 3 newest releases, delete the rest
set -euo pipefail
shopt -s nullglob
KEEP=3
cd -- "${RELEASE_DIR:?is not set}"
releases=(*/)
count=${#releases[@]}
(( count > KEEP )) || exit 0
for old in "${releases[@]:0:count-KEEP}"; do
  echo "Removing $old"
  rm -rf -- "$old"
done
