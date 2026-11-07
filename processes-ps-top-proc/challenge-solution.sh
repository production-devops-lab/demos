#!/usr/bin/env bash
# Challenge solution (lesson 12): start "sleep 500" in the background, then read its parent (PPID)
# and its state from /proc.
#
#   sleep 500 &                         the shell prints [1] and the PID; $! holds the PID too
#   grep -E '^(PPid|State)' /proc/$!/status
#       State:  S (sleeping)            S: sleep waits for time to pass, it does not use the CPU
#       PPid:   <the PID of your shell> compare with: echo $$
#   ps -o pid,ppid,stat,cmd -p $!       the same facts, as ps columns
#   kill $!                             clean up (signals: lesson 13)
#
# Why S and not R? A process is R only while it runs on a CPU (or waits for one). sleep spends
# all its time waiting for a timer, so it is almost always S.
set -uo pipefail
sleep 500 &
pid=$!
sleep 0.2
echo "my shell: PID $$"
grep -E '^(State|PPid)' "/proc/$pid/status"
ps -o pid,ppid,stat,cmd -p "$pid"
kill "$pid"
wait "$pid" 2>/dev/null
echo "sleep $pid stopped"
