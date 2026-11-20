#!/usr/bin/env bash
# Lesson 9 challenge: list a folder called nothere. Find who, what and why.
# Run it in the lesson folder (the video's home folder).
set -uo pipefail
ls nothere || echo "(exit code $?: the command did not work)"
# ls: cannot access 'nothere': No such file or directory
# who:  ls                          (the command that complains)
# what: cannot access 'nothere'     (the name you gave it)
# why:  No such file or directory   (there is nothing with that name here)
# The words in the middle differ a little from cat's message, but the three parts are the same.
# The fix: ask pwd (where am I?) and ls (what is here?), then use a name that exists.
