# Lesson 1 challenge: which file is newer?

**Question:** `report-v2.txt` or `report-final.txt`: which one is newer, and how do you know?

**Answer:** you cannot know from the names. "final" sounds newer than "v2", but someone may have
edited `report-v2.txt` after writing `report-final.txt`. The file's date only tells you when it was
last touched, not what changed or why.

That is exactly the problem version control solves. With Git there is one file, `report.txt`, and
every saved version records:

- **what** changed (the exact lines),
- **who** changed it,
- **when**,
- **why** (a message written by a person).

So "which one is newer?" is never a question: the newest version is on top of the history, with its
note. Lesson 6 shows how to read that history with `git log`.
