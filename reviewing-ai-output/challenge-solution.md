# Challenge: which files does it delete?

The folder `acme-app/logs` holds three files:

- `app.log` (the live log: keep it)
- `app.log.1` (an old copy)
- `app.log.2` (an older copy)

The snippet to review:

```bash
# Delete the old copies of the log.
rm acme-app/logs/*.log
```

## Solution

`*.log` means: anything (or nothing), then `.log` **at the end** of the name.

| File | Ends with `.log`? | Deleted? |
|---|---|---|
| `app.log` | yes | **yes: the live log is gone** |
| `app.log.1` | no (ends with `.1`) | no |
| `app.log.2` | no (ends with `.2`) | no |

So the snippet does the opposite of the comment: it deletes the one file we wanted to keep and leaves
both old copies. The comment is a promise, not a proof.

A correct line for this request is the one from the lesson:

```bash
rm acme-app/logs/app.log.*
```

How to check a pattern without deleting anything (lesson 6): put `echo` in front, and the shell prints
the names the star matches instead of deleting them:

```bash
echo rm acme-app/logs/*.log
```

A runnable demonstration (works in a throwaway folder) is in `challenge-solution.sh`.
