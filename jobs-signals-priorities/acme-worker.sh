#!/bin/bash
# acme-worker.sh: works until it is told to stop
trap 'echo "TERM received: saving state, bye"; exit 0' TERM
echo "worker started"
while true
do
  sleep 1
done
