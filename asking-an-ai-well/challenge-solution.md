# Challenge: rewrite a weak prompt

Weak prompt:

> fix my script, it does not work

The assistant cannot see your script, your error or your system, so it can only guess.

## One possible solution

```text
I have a small bash script, check-app.sh, that prints the last lines of the
acme-app log. Here it is:

    #!/bin/bash
    cat acme-app/log/app.log

When I run it with "bash check-app.sh" I get this error:

    cat: acme-app/log/app.log: No such file or directory

Limits: do not suggest restarting anything. Bash only.
Example of what I expect: the script prints the log lines, like
"2026-11-02 08:00:01 INFO acme-app started".
Explain the error first, then the fix. Tell me what you are not sure about.
```

What changed:

- **Context**: what the script is for, the script itself, the command you ran and the exact error.
- **Limits**: what must not happen (no restarts) and which tools to use.
- **Example**: what a good result looks like.
- **Doubts**: you ask it to say what it is guessing.
- **No secrets**: nothing in it is a password, a key or data about real people (lesson 3).

The answer is still a draft: you review it (lesson 5), test it (lesson 6) and check its claims
(lesson 7). Lesson 7 uses exactly this error.
