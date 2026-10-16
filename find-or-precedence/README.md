# The find -o Bug Almost Everyone Writes (and the One-Character Fix)

Video: https://youtu.be/CeFtExfmAZM

find . -type f -name A -o -name B looks like it searches for files named A or B. It does not. Step by step, we reproduce the bug on a real folder, see the invisible AND that find adds, fix it with parentheses, and look at the second trap: actions like -print that only apply to the last branch.

## Files

- `conf/journald.conf`
- `conf/journald.conf.d/README`
- `conf/notes.txt`
- `logs/system.journal`
- `logs/user-1000.journal`

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
find . | sort
find . -type f -name '*.journal' -o -name '*journald*'
ls -ld conf/journald.conf.d
find . -type f \( -name '*.journal' -o -name '*journald*' \)
find . -name '*.journal' -o -name '*.conf' -print
find . \( -name '*.journal' -o -name '*.conf' \) -print
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
