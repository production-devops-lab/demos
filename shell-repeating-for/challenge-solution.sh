#!/bin/bash
# hosts.sh: say which servers we are checking
#
# Lesson 7 challenge: a loop over node01 and node02 that prints "Checking" and the name.

for host in node01 node02; do
  echo "Checking $host"
done
# Run it:   ./hosts.sh
# Checking node01
# Checking node02
# To add a server, add a word to the list: for host in node01 node02 node03; do
