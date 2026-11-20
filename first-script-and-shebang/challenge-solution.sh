#!/bin/bash
# where.sh: say where I am, and what is here
#
# Lesson 2 challenge: add a shebang and a comment to where.sh from lesson 1, then run it with bash.
# The two lines above are the answer: line 1 is the shebang (bash reads this file), line 2 a comment.
pwd
ls
# Run it:   bash where.sh
# The output does NOT change:
# /lab/sre
# acme-app  check-app.sh  notes  readme.txt  where.sh
# Why? To bash, both new lines start with #, so they are comments and it skips them. The shebang
# starts to matter in lesson 3, when you run the file itself.
