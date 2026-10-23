#!/bin/bash
# Challenge solution: the fixed cleanup script with a DRY_RUN switch.
#   RELEASE_DIR=/opt/app/releases DRY_RUN=1 ./challenge-solution.sh   -> only prints
#   RELEASE_DIR=/opt/app/releases ./challenge-solution.sh             -> deletes
set -euo pipefail
shopt -s nullglob
KEEP=3
DRY_RUN=${DRY_RUN:-0}
cd -- "${RELEASE_DIR:?is not set}"
releases=(*/)
count=${#releases[@]}
(( count > KEEP )) || exit 0
for old in "${releases[@]:0:count-KEEP}"; do
  if [[ $DRY_RUN == 1 ]]; then
    echo "Would remove $old"
  else
    echo "Removing $old"
    rm -rf -- "$old"
  fi
done
