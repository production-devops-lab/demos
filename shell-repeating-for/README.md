# Repeating: for (Shell Scripting from Zero)

![Repeating: for (Shell Scripting from Zero)](img/thumbnail.jpg)

**Video:** coming soon on the [channel](https://www.youtube.com/@production-devops).

Counting the info, warning and error lines of a log means the same command three times, with one word changed. In this lesson of Shell Scripting from Zero we let the script repeat it: grep -c counts the lines that contain a word, and a for loop does the work once for each item on a list. First by hand, one piece at a time, then in our acme-app script, explained line by line and run on two logs. Every new word is explained on screen and every command runs for real. The challenge and its solution are in the demos repo.

## Files in this folder

- [`acme-app/config.txt`](acme-app/config.txt)
- [`acme-app/logs/app.log`](acme-app/logs/app.log)
- [`acme-app/logs/old.log`](acme-app/logs/old.log)
- [`check-app.sh`](check-app.sh)
- [`notes/ideas.txt`](notes/ideas.txt)
- [`notes/todo.txt`](notes/todo.txt)
- [`readme.txt`](readme.txt)
- [`challenge-solution.sh`](challenge-solution.sh) (solution of the challenge: try it yourself first)

## What you need

A Linux shell (a VM, WSL or a container is fine). Everything runs inside this folder.

## Before you start

The video runs these commands first, off screen:

```bash
mkdir -p /lab && ln -sfn "$PWD" /lab/sre && cd /lab/sre && export HOME=/lab/sre
alias ls='ls --color=auto'
PROMPT_COMMAND='PS1="\[\e[1;32m\]sre@lab\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]$ "'
```

## The lesson, step by step

The same explanations as the video, with every command. Read it, then run it yourself.

We want to count the info, warning and error lines of a log. That is the same work three times, with one word changed. Today, the script repeats it for us.

You will need a terminal with bash. And check app dot s h from lesson six, with its fork. Or just watch. Every step is on screen.

### The plan

This is lesson seven of Shell Scripting from Zero. First, we count one kind of line, with grep. Then a list, and a loop: for. By hand, then in our script. And we run it on both logs.

### Counting

One new command: grep. Grep, a word, then a file, prints the lines that contain that word. With dash c, it only counts them.

Which lines of app dot log are warnings? We grep for WARN.

```console
$ grep "WARN" acme-app/logs/app.log
```

One line. Now we add dash c, to count instead.

```console
$ grep -c "WARN" acme-app/logs/app.log
```

And the info lines? The same command, with one word changed.

```console
$ grep -c "INFO" acme-app/logs/app.log
```

Then again for ERROR. Same work, again and again. Time for a loop.

### The loop

- `loop — Lines that run again, once for each item on a list (like a checklist: do this for each item on the list)`: 
New word: loop. Some lines that run again and again, once for each item on a list. Think of a checklist: do this, for each item on the list.

**for: once per item**

```mermaid
%%{init: {"flowchart": {"wrappingWidth": 480}}}%%
flowchart LR
  L["the list<br/><b>INFO WARN ERROR</b>"] --> R1["round 1<br/>level = <b>INFO</b><br/>do the work"]
  R1 --> R2["round 2<br/>level = <b>WARN</b><br/>do the work"]
  R2 --> R3["round 3<br/>level = <b>ERROR</b><br/>do the work"]
  R3 --> D["list empty<br/><b>done</b>"]
  classDef list fill:#3a2a0d,stroke:#d29922,color:#ffffff
  classDef round fill:#0d2a4a,stroke:#58a6ff,color:#ffffff
  classDef done fill:#1f6f43,stroke:#3fb950,color:#ffffff
  class L list
  class R1,R2,R3 round
  class D done
```

The loop takes the first word, puts it in a jar called level, and does the work. Then the next word, and the next. When the list is empty, it is done.

```console
$ for level in INFO WARN ERROR; do echo "$level"; done
```

- `for level`: a jar for the current item
For level: a jar called level holds the current item.

- `in INFO WARN ERROR`: the list, split by spaces
In, then the list. Three words, split by spaces.

- `; do`: the work starts here
Semicolon, do: the work starts here.

- `echo "$level";`: the work: once per item
The work: print what is in the jar. Once per item.

- `done`: end of the work: next item
Done ends the work. Then the next item, until the list is empty.

### By hand

We run that loop. One word per line: three rounds.

```console
$ for level in INFO WARN ERROR; do echo "$level"; done
```

Now the work is grep dash c on app dot log. Same loop, new work.

```console
$ for level in INFO WARN ERROR; do grep -c "$level" acme-app/logs/app.log; done
```

Two, one, zero. Right, but which number is which? The script will say.

### So far

So far: grep dash c counts the lines that contain a word. For, in a list, do, done: the work runs once per item. Next: the loop in our script, with labels.

### In the script

Here is the whole script. It has three parts, and one of them is new.

```
#!/bin/bash
# check-app.sh: a quick look at acme-app

app="acme-app"
log="$1"

echo "Checking $app"

if [ -f "$log" ]; then
  echo "Log found: $log"
  for level in INFO WARN ERROR; do
    echo -n "$level lines: "
    grep -c "$level" "$log"
  done
else
  echo "No log file at: $log"
fi
```

Part one: the shebang, the jars and the title. As before. Part two: the fork, as in lesson six. Part three is new: the loop, on the yes road. It replaces cat.

```
    for level in INFO WARN ERROR; do
      echo -n "$level lines: "
      grep -c "$level" "$log"
    done
```

For each word on the list, put it in the jar level, and do the work. Print the word, then lines. Dash n means: no new line, stay on this line. Count the lines with that word, in the log. The number lands right after the label. Done: back to the top, with the next word.

All together. If the log is there, count each kind of line. If not, say so.

```
#!/bin/bash
# check-app.sh: a quick look at acme-app

app="acme-app"
log="$1"

echo "Checking $app"

if [ -f "$log" ]; then
  echo "Log found: $log"
  for level in INFO WARN ERROR; do
    echo -n "$level lines: "
    grep -c "$level" "$log"
  done
else
  echo "No log file at: $log"
fi
```

### Run it

First, app dot log.

```console
$ ./check-app.sh acme-app/logs/app.log
```

Two info lines, one warning, no errors. Each number has its label. Now old dot log, from yesterday.

```console
$ ./check-app.sh acme-app/logs/old.log
```

One error here. Three lines of work, and no copy and paste.

### Good to know

The list can hold anything. Words, server names, file names. The jar changes every round. Only the current item is inside. Grep cares about capital letters. Capital INFO is not lowercase info. To count one more kind, you add a word to the list. Not a line of code.

### Recap

Recap: for, in a list, do, done. The work runs once per item. Grep dash c counts the lines that contain a word. Your challenge: a script called hosts dot s h, with a loop over node zero one and node zero two. It prints checking, and the name, for each one. The solution is in the demo repo.

### Where next

Where next? Lesson eight: exit codes. Did it work? And a surprise: our script gives the wrong answer, twice.

Next lesson: exit codes. Did it work? Subscribe so you do not miss it.

## All the commands, to copy

Run them from inside this folder, in this order (some are expected to fail: that is the point of the demo).

```bash
grep "WARN" acme-app/logs/app.log
grep -c "WARN" acme-app/logs/app.log
grep -c "INFO" acme-app/logs/app.log
for level in INFO WARN ERROR; do echo "$level"; done
for level in INFO WARN ERROR; do grep -c "$level" acme-app/logs/app.log; done
./check-app.sh acme-app/logs/app.log
./check-app.sh acme-app/logs/old.log
```

## Challenge

Your challenge: a script called hosts dot s h, with a loop over node zero one and node zero two.

When you have tried: [`challenge-solution.sh`](challenge-solution.sh).

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel: real-world DevOps and SRE, explained with real commands.
