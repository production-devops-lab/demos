#!/bin/bash
# is-folder.sh: say whether the path you hand it is a folder
# usage: ./is-folder.sh PATH
#
# Lesson 6 challenge: use -d on $1 and print "folder" or "not a folder".

if [ -d "$1" ]; then
  echo "$1: folder"
else
  echo "$1: not a folder"
fi
# Run it in the lab (remember chmod +x is-folder.sh):
#   ./is-folder.sh acme-app      ->  acme-app: folder
#   ./is-folder.sh readme.txt    ->  readme.txt: not a folder   (a file, not a folder)
#   ./is-folder.sh nothing       ->  nothing: not a folder      (it does not exist at all)
