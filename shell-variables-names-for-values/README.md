# Variables: Names for Values (Shell Scripting from Zero)

![Variables: Names for Values (Shell Scripting from Zero)](img/thumbnail.jpg)

**Video:** coming soon on the [channel](https://www.youtube.com/@production-devops).

Your script repeats the same name and the same long path, and changing one means hunting for every copy. In this lesson of Shell Scripting from Zero we give each value a name: a variable. We fill one and open it by hand, make the mistake every beginner makes (spaces around the equals sign), then use two variables in our acme-app script, explained line by line and run for real. Every new word is explained on screen. The challenge and its solution are in the demos repo.

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

Our script repeats names and long paths. Change one, and you hunt for every copy. Today, a name for each value, and the one mistake every beginner makes.

You will need a terminal with bash. And check app dot s h from lesson three, with its allowed to run stamp. Or just watch. Every step is on screen.

### The plan

This is lesson four of Shell Scripting from Zero. First, a labelled jar: the variable. We fill one and open it, by hand. Then the classic mistake: spaces. And we put two jars in our script.

### A jar

- `variable — A name that holds a value, so you can use it later (like a labelled jar: the label outside, the value inside)`: 
New word: variable. A name that holds a value, so you can use it later. Think of a labelled jar: the label outside, the value inside.

**Fill the jar, open the jar**

```mermaid
%%{init: {"flowchart": {"wrappingWidth": 480}}}%%
flowchart LR
  F["<b>app=#quot;acme-app#quot;</b><br/>fill the jar"] --> J["jar <b>app</b><br/>inside: acme-app"]
  J --> O["<b>$app</b><br/>open the jar"]
  O --> V["acme-app"]
  classDef act fill:#3a2a0d,stroke:#d29922,color:#ffffff
  classDef jar fill:#0d2a4a,stroke:#58a6ff,color:#ffffff
  classDef val fill:#1f6f43,stroke:#3fb950,color:#ffffff
  class F,O act
  class J jar
  class V val
```

Name, equals, value: that fills a jar called app. Later, a dollar sign before the name opens the jar, and gives back what is inside.

### By hand

We fill a jar called app, with the text acme app. No output: bash just remembers it.

```console
$ app="acme-app"
```

Now we open it. Echo, then dollar app, in double quotes.

```console
$ echo "$app"
```

Inside a sentence, it works the same way.

```console
$ echo "Checking $app"
```

```console
$ app="acme-app"
```

- `app`: the label: the variable's name
First, the label: the name of the variable.

- `=`: put this inside: no spaces around it
Equals means: put this inside. No spaces around it.

- `"acme-app"`: the value, in double quotes
Then the value, in double quotes. The quotes keep it in one piece.

### The mistake

Now the classic mistake. The same line, with spaces around the equals sign.

```console
$ app = "acme-app"
```

Who: app. Why: command not found. With spaces, bash thinks app is a command. The fix: no spaces. Name, equals, value, all stuck together.

### So far

So far: name, equals, value fills a jar. No spaces. Dollar, then the name, opens it. Next: two jars in our script.

### In the script

Here is the whole script. It has three parts. We read them one at a time.

```
#!/bin/bash
# check-app.sh: a quick look at acme-app

app="acme-app"
log="acme-app/logs/app.log"

echo "Checking $app"
echo "Log file: $log"
cat "$log"
```

Part one: the shebang and the comment, as before. Part two is new: we fill two jars. Part three: the work. It opens the jars.

```
app="acme-app"
log="acme-app/logs/app.log"
```

The jar app holds the name of our app. The jar log holds the path to the log. A path, as in Linux from Zero.

```
echo "Checking $app"
echo "Log file: $log"
cat "$log"
```

Echo prints a title. Dollar app becomes acme app. Then a line that says which log we read. Then cat reads it. Dollar log in double quotes: the path stays one piece.

All together. Fill two jars at the top, open them below. To check another log, you change one line.

```
#!/bin/bash
# check-app.sh: a quick look at acme-app

app="acme-app"
log="acme-app/logs/app.log"

echo "Checking $app"
echo "Log file: $log"
cat "$log"
```

### Run it

We run it, with dot slash. The stamp from lesson three is still there.

```console
$ ./check-app.sh
```

Look at the first two lines. The jars opened: acme app, and the path. We run it once more. Same jars, same result.

```console
$ ./check-app.sh
```

### Good to know

Names use letters, digits and underscores. No spaces. The dollar sign is only for opening. To fill, no dollar. Put double quotes around a jar you open. Single quotes would print dollar log, as it is. And a new terminal forgets your jars. A script fills them again, every run.

### Recap

Recap: a variable is a labelled jar. Name, equals, value. Dollar name opens it. And no spaces around the equals sign. Your challenge: in where dot s h, fill a jar called greeting, with good morning. Print it with echo, then run the script. The solution is in the demo repo.

### Where next

Where next? Lesson five: arguments. You choose the log when you run the script, without changing the file.

Next lesson: arguments, giving a script its input. Subscribe so you do not miss it.

## All the commands, to copy

Run them from inside this folder, in this order (some are expected to fail: that is the point of the demo).

```bash
app="acme-app"
echo "$app"
echo "Checking $app"
app = "acme-app"
./check-app.sh
```

## Challenge

Your challenge: in where dot s h, fill a jar called greeting, with good morning.

When you have tried: [`challenge-solution.sh`](challenge-solution.sh).

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel: real-world DevOps and SRE, explained with real commands.
