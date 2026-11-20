#!/bin/bash
# Lesson 3 challenge: make where.sh (lesson 2) runnable, run it with ./, and check the x with ls -l.
# Run these three commands in the folder where you saved where.sh. (This file runs them for you.)
chmod +x where.sh   # the "allowed to run" stamp: no message means it worked
ls -l where.sh      # -rwxr-xr-x ... where.sh   <- the start: an x in each of the three groups
./where.sh          # runs: Linux checks the stamp, reads line 1 (#!/bin/bash) and starts bash
# /lab/sre
# acme-app  check-app.sh  notes  readme.txt  where.sh
# Forgot the stamp?  ./where.sh  ->  bash: ./where.sh: Permission denied
# Forgot the ./?     where.sh    ->  where.sh: command not found
