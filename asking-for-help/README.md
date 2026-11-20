# Asking a Linux Command for Help: --help (No Experience Needed)

![Asking a Linux Command for Help: --help (No Experience Needed)](img/thumbnail.jpg)

**Video:** coming soon on the [channel](https://www.youtube.com/@production-devops).

Nobody remembers every option of every command, and engineers look things up many times a day. This lesson of Linux from Zero adds one new piece, --help, that makes a command explain itself. We read the help page of mkdir line by line, find the answer to a question from the last lesson, use the help of cat to answer a new one, and see what to do when --help does not work, for example on a Mac. No experience needed: every new word is explained on screen, and every command runs for real. The challenge and its solution are in the demos repo.

## Files in this folder

- [`acme-app/config.txt`](acme-app/config.txt)
- [`acme-app/logs/app.log`](acme-app/logs/app.log)
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

Nobody remembers every detail of every command. Engineers look things up, many times a day. And at the end, what to do when the help does not work.

To follow along, you need a terminal. Lesson two shows how to get one. On a Mac, watch the end of this lesson first.

### The plan

This is lesson eight of Linux from Zero. First, what an option is. Then the new piece: dash dash help. Then we read a help page. And what to do when it does not work.

### Options

- `option — An extra word, starting with a dash, that changes what a command does (like a note on your request: "in colour, please")`: 
New word: option. It is an extra word, starting with a dash, that changes what a command does. Like a note on your request: in colour, please.

```console
$ mkdir --help
```

Here is the one new piece of this lesson. We add it to a command you know.

- `mkdir`: a command you know
Make dir, from lesson seven.

- `--help`: the option: explain yourself
Then a space, and dash dash help. It means: do not do your job, explain it.

### Try it

How does make dir work? We type make dir, dash dash help.

```console
$ mkdir --help
```

Make dir did not make a folder. It printed its help page. Let's read the top.

- `usage line — The first line of a help page: how to type the command (like the instructions at the top of a form)`: 
New word: usage line. It is the first line of a help page: how to type the command. Like the instructions at the top of a form.

```
Usage: mkdir [OPTION]... DIRECTORY...
Create the DIRECTORY(ies), if they do not already exist.
  -p, --parents     no error if existing, make parent directories as needed,
  -v, --verbose     print a message for each created directory
```

First, usage: how to type it. Square brackets mean optional. Then one or more folder names. Then, what it does: create the folders, if they do not already exist. Then the options, one per line, each with a dash. Look at dash p: no error if existing. In lesson seven, make dir refused. This option is for that.

Look again at dash p, and dash dash parents. They are the same option. The short form has one dash, and one letter. The long form has two dashes and a whole word. It is easier to read.

### So far

So far: an option is an extra word, with a dash. With dash dash help, a command explains itself. Next: the same on cat, with a question to answer.

### Again

Our question: can cat number the lines of a file? We ask cat, dash dash help.

```console
$ cat --help
```

A longer page, but the same shape. Usage, what it does, then the options.

```
Usage: cat [OPTION]... [FILE]...
Concatenate FILE(s) to standard output.
  -n, --number             number all output lines
```

Usage: cat, maybe some options, then the files. What it does: concatenate files, and show them. Standard output means the screen. And our answer: dash n, number all output lines. Found in seconds.

Any help page has the same shape. Usage: how to type the command. A description: what it does. Then the options, one per line, each with a dash. Read the first lines first, and skim the rest.

### Good to know

Some commands only know a short version, dash h. On a Mac, many commands do not know dash dash help. Then try the manual. Type man, then the command's name. Press q to quit. And dash dash help only prints. It changes nothing.

### Recap

Recap: an option is an extra word, with a dash. Dash dash help shows usage, a description, and the options. No help? Try dash h, or the manual. Your challenge: ask l s for help. Which option shows hidden names? The solution is in the demo repo.

### Where next

Where next? Lesson nine: mistakes are safe. Reading error messages, without fear.

Next lesson: mistakes are safe. Reading error messages. Subscribe so you do not miss it.

## All the commands, to copy

Run them from inside this folder, in this order (some are expected to fail: that is the point of the demo).

```bash
mkdir --help
cat --help
```

## Challenge

Your challenge: ask l s for help. Which option shows hidden names? The solution is in the demo repo.

When you have tried: [`challenge-solution.sh`](challenge-solution.sh).

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel: real-world DevOps and SRE, explained with real commands.
