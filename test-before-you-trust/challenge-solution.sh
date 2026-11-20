#!/bin/bash
# Challenge solution, lesson 6 of AI Assistants for Ops: the Safe Basics.
# A practice folder of your own (a fresh temporary folder): nothing outside it is touched, and the
# dry runs delete nothing, they only print.
cd "$(mktemp -d)" || exit 1
touch a.txt a.txt.1
ls

echo "Dry run 1: the star can be nothing, so a.txt is on the list"
echo rm a.txt*

echo "Dry run 2: a dot before the star, so only a.txt.1"
echo rm a.txt.*
