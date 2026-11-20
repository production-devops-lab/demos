#!/bin/bash
# where.sh: greet the name you hand it
# usage: ./where.sh NAME
#
# Lesson 5 challenge: make where.sh greet the name you hand it.

name="$1"                   # the first argument, in a jar with a clear name

echo "Hello, $name"
# Run it:   ./where.sh sre
# Hello, sre
# And with no argument (./where.sh) the jar is empty, so it prints just: Hello,
# Lesson 6 shows how to check for that with if.
