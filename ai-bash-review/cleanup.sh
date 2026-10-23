#!/bin/bash
# acme-app: keep the 3 newest releases, delete the rest
KEEP=3
cd $RELEASE_DIR
for old in $(ls -t | tail -n +$((KEEP + 1))); do
  echo "Removing $old"
  rm -rf $old
done
echo "Done: kept the $KEEP newest releases"
