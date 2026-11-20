#!/usr/bin/env bash
# Lesson 7 challenge: inside notes, make a folder called old, and check it with ls.
# Run it in the lesson folder (the video's home folder).
set -euo pipefail
cd notes
mkdir old       # no message: it worked
ls
# ideas.txt  old  todo.txt
# old is the new, empty folder (blue in most terminals). The two notes did not change.
# Run the script a second time and mkdir refuses: "File exists". Nothing is lost.
