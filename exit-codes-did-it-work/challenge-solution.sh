#!/bin/bash
# is-folder.sh: say whether the path you hand it is a folder
# usage: ./is-folder.sh PATH
# exit codes: 0 = a folder, 1 = not a folder
#
# Lesson 8 challenge: is-folder.sh from lesson 6, with exit 0 for a folder and exit 1 if not.

if [ -d "$1" ]; then
  echo "$1: folder"
  exit 0
else
  echo "$1: not a folder"
  exit 1
fi
# Run it, and read the exit code right after:
#   ./is-folder.sh acme-app      ->  acme-app: folder
#   echo $?                      ->  0
#   ./is-folder.sh readme.txt    ->  readme.txt: not a folder
#   echo $?                      ->  1
