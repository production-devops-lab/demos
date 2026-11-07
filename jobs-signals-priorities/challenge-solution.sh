#!/usr/bin/env bash
# Challenge solution (lesson 13): pause a background job with STOP, prove it with ps, resume it
# with CONT.
#
#   sleep 900 &                       a background job; $! is its PID
#   kill -STOP $!                     STOP cannot be handled or ignored: the kernel pauses it
#   ps -o pid,stat,cmd -p $!          STAT T = stopped
#   jobs                              [1]+ Stopped (signal)   sleep 900
#   kill -CONT $!                     resume it (in the background, like bg)
#   ps -o pid,stat,cmd -p $!          STAT S = sleeping again: it runs, and waits for its timer
#   kill $!                           clean up with TERM
#
# STOP vs TSTP: Ctrl+Z sends TSTP, which a program may handle (an editor can redraw the screen
# first). STOP is the version nobody can catch, like KILL.
set -uo pipefail
sleep 900 &
pid=$!
sleep 0.2                         # let the job start sleep before we pause it
kill -STOP "$pid"; sleep 0.2
ps -o pid,stat,cmd -p "$pid"
kill -CONT "$pid"; sleep 0.2
ps -o pid,stat,cmd -p "$pid"
kill "$pid"
wait "$pid" 2>/dev/null
echo "job $pid stopped with TERM"
