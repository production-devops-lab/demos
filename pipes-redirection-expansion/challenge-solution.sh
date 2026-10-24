#!/usr/bin/env bash
# Challenge solution (lesson 4): save the ERROR lines of app.log to a file named with today's date,
# show how many there are, and hide any error message - in one line.
#
#   grep ERROR app.log 2>/dev/null | tee "errors-$(date +%F).txt" | wc -l
#
# Piece by piece:
#   grep ERROR app.log      keep only the lines that contain ERROR (stdout)
#   2>/dev/null             discard grep's own error messages (e.g. app.log missing)
#   | tee FILE              write the lines to FILE, and pass them on
#   "errors-$(date +%F).txt"  command substitution: date +%F prints 2026-10-23 -> errors-2026-10-23.txt
#                           (double quotes: one word, even if the format ever contains a space)
#   | wc -l                 count the lines that reach it: the number is shown on screen
#
# Run it from the folder that contains app.log:
set -uo pipefail

grep ERROR app.log 2>/dev/null | tee "errors-$(date +%F).txt" | wc -l
