# Challenge solution: what does your prompt show?

**The question:** open your terminal. What does your prompt show?

There is no single right answer: your prompt is yours. What matters is that you can read it. A typical
prompt has three parts:

| Where you are | A prompt can look like | The parts |
|---|---|---|
| Linux or WSL (bash) | `name@computer:~$` | your user name, `@`, the computer's name, `:`, the folder (`~` = your home folder), then `$` |
| Mac (zsh) | `name@computer ~ %` | the same parts, with a space before the folder, and `%` at the end |
| A browser lab | anything, often `user@...` or `root@...` | it depends on the site |

In the videos of this course the prompt is `sre@lab:~$`: user `sre`, on a practice computer called `lab`,
in the home folder.

Two signs at the end are worth knowing now:

- `$` (or `%` on a Mac): you are a normal user. This is what you want while you learn.
- `#`: you are **root**, the all-powerful administrator account. Some browser labs start you as root.
  It is fine in a lab that resets, but on your own computer, learn as a normal user.

Your terminal is ready when you see the prompt and a cursor after it. If the window shows only an error
or closes at once, see the setup guide (`setup.md`, next to this file).
