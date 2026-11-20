# Installing Git and setting your name (do it once)

You need a terminal (Linux from Zero, lesson 2, shows how to get one) and Git.

## 1. Is Git already there?

```
git --version
```

If it prints a version such as `git version 2.43.0`, skip to step 3.

## 2. Install Git

- **Ubuntu, Debian, WSL on Windows:** `sudo apt install git`
- **Fedora, RHEL, AlmaLinux, Rocky:** `sudo dnf install git`
- **macOS:** run `git --version`; if Git is missing, macOS offers to install the
  command line developer tools. Accept, then run `git --version` again.
- **Windows without WSL:** install "Git for Windows" from the official Git website. It includes a
  terminal called Git Bash, where every command of this course works.

## 3. Tell Git who you are (once per computer)

Every commit records an author. Git refuses to commit until you set one:

```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
```

The last line names the main line `main`, as in the videos. You can use any name and email: on
GitHub (lesson 8) they become public, so pick what you are happy to show.

## 4. The lab in the videos

In the videos the prompt is `sre@lab:~/acme-app$`, the author is `ops <ops@example.com>` and the dates
are fixed, so your commit IDs will be different. That is normal: an ID depends on the content, the
author and the date.
