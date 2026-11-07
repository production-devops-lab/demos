#!/bin/bash
# make-zombie.sh: a parent that never collects its child
sleep 1 &
exec sleep 300
