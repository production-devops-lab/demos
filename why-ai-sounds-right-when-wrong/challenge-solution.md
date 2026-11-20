# Challenge: which line could it not know?

You asked: "How do I see the files in the log folder of acme-app?"
The example answer (written for this lesson, not from a real assistant):

1. Use the `ls` command to list the files in a folder.
2. Your logs are in `/var/log/acme-app`, owned by the user `acme`.
3. Add `-l` to see the size and the date of each file.

## Solution

**Line 2.** It is a detail of *your* system: where *your* acme-app writes its logs and which user owns
them. The assistant has never seen your server, so this is a likely guess (many apps log under
`/var/log`), not a fact. Warning sign number 1.

Lines 1 and 3 are general facts about Linux that you can check in the manual (`man ls`), the same on
every system.

What to do: treat line 2 as a claim to check, for example by looking at the app's real configuration
or listing the folder yourself (lesson 7).
