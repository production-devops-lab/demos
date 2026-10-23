#!/usr/bin/env bash
# Start the job twice, half a second apart
WORK_SECONDS=2 ./report-flock.sh &
sleep 0.5
./report-flock.sh || echo "Second run refused, exit code $?"
wait
