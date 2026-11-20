#!/bin/bash
# Challenge solution, lesson 5 of AI Assistants for Ops: the Safe Basics.
# Works in a throwaway folder: nothing outside it is touched, and nothing is deleted.
cd "$(mktemp -d)" || exit 1
mkdir -p acme-app/logs
touch acme-app/logs/app.log acme-app/logs/app.log.1 acme-app/logs/app.log.2

echo "The snippet from the challenge would delete:"
echo rm acme-app/logs/*.log

echo "The reviewed line would delete:"
echo rm acme-app/logs/app.log.*
