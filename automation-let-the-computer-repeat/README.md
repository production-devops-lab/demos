# Automation: Let the Computer Repeat It (DevOps from Zero, No Experience Needed)

![Automation: Let the Computer Repeat It (DevOps from Zero, No Experience Needed)](img/thumbnail.jpg)

**Video:** https://youtu.be/r-csTuLUyBs

Every Friday, someone does the same twenty clicks. One Friday, they miss one. This lesson of DevOps from Zero shows, with pictures and a restaurant comparison, why people slip on repeated jobs, what a script is, what DevOps teams automate, and what "infrastructure as code" means. At the end: three questions that tell you if a job should be automated, and when it should not. No terminal, nothing to install, no experience needed. Every new word is explained on screen. The challenge and its solution are in the demos repo.

## Files in this folder

- [`challenge-solution.md`](challenge-solution.md) (solution of the challenge: try it yourself first)

## What you need

A Linux shell (a VM, WSL or a container is fine). Everything runs inside this folder.

## The lesson, step by step

The same explanations as the video, with every command. Read it, then run it yourself.

Every Friday, someone does the same twenty clicks. One Friday, they miss one. At the end: three questions that tell you what to automate.

For this lesson you need nothing. Just watch. No terminal and no code. Only pictures. About five minutes.

### The plan

This is lesson four of DevOps from Zero. First, a job done by hand, every week. Then, why people slip. Then automation, and servers written as files. And three questions, to decide what to automate.

### By hand

**Every Friday, by hand**

```mermaid
%%{init: {"flowchart": {"wrappingWidth": 480}}}%%
flowchart LR
  P["<b>a person</b><br/>every Friday"] --> S["<b>20 steps</b><br/>clicks and commands"]
  S --> R["<b>a copy</b> of the<br/>acme-app data"]
  classDef you fill:#0d2a4a,stroke:#58a6ff,color:#ffffff
  classDef step fill:#3a2a0d,stroke:#d29922,color:#ffffff
  classDef ok fill:#1f6f43,stroke:#3fb950,color:#ffffff
  class P you
  class S step
  class R ok
```

Here is a job. Every Friday, a person makes a safety copy of the acme app data. It takes twenty steps, by hand.

Why do people slip? The job is boring, so attention drifts. The phone rings at step twelve. Where was I? It is late, and people are tired. And each person does it a little differently.

**One Friday, one missed step**

```mermaid
%%{init: {"flowchart": {"wrappingWidth": 480}}}%%
flowchart LR
  M["<b>step 14 missed</b><br/>nobody notices"] --> B["the copy is<br/><b>empty</b>"]
  B --> F["found out months later,<br/>when the copy is <b>needed</b>"]
  classDef bad fill:#3d1418,stroke:#f85149,color:#ffffff
  class M,B,F bad
```

One Friday, step fourteen is missed. Nobody notices. Months later, someone needs that copy, and it is empty.

### Automation

- `automation — Letting a computer repeat a job for you, the same way every time (like a kitchen machine: set it once, every batch comes out the same)`: 
The fix is automation. A computer repeats the job for you, the same way every time. Like a kitchen machine: every batch comes out the same.

- `script — A file of steps that a computer follows, from top to bottom (like a recipe card followed word by word, never skipping a line)`: 
The steps go in a script. A script is a file of steps that a computer follows, from top to bottom. It never skips a line.

**Write it once, run it every Friday**

```mermaid
%%{init: {"flowchart": {"wrappingWidth": 480}}}%%
flowchart LR
  Y["<b>you</b><br/>write the 20 steps<br/><b>once</b>"] --> SC["<b>script</b><br/>runs every Friday<br/>by itself"]
  SC --> R["<b>the copy</b><br/>same steps<br/>every time"]
  classDef you fill:#0d2a4a,stroke:#58a6ff,color:#ffffff
  classDef sc fill:#3a2a0d,stroke:#d29922,color:#ffffff
  classDef ok fill:#1f6f43,stroke:#3fb950,color:#ffffff
  class Y you
  class SC sc
  class R ok
```

You write the twenty steps once, in a script. Every Friday, the computer runs it by itself. Same steps, every time.

### So far

So far: by hand, repeated jobs slip, and often nobody notices. With automation, you write the steps once, and the computer repeats them. Next: we automate whole servers. Then, the three questions.

### In DevOps

What do DevOps teams automate? The build, the tests and the deploy: the pipeline of lesson two. Safety copies of data. Health checks, every minute. We see them in lesson six. And the setup of the servers themselves.

- `infrastructure as code — Describing your servers in files, so a tool can build them (like a written floor plan: any builder makes the same kitchen)`: 
That last one has a name: infrastructure as code. You describe your servers in files, and a tool builds them. Like a floor plan for a kitchen.

**Servers, written as a file**

```mermaid
%%{init: {"flowchart": {"wrappingWidth": 480}}}%%
flowchart TB
  F["<b>a file</b><br/>3 servers<br/>with acme-app"] --> T["<b>a tool</b><br/>reads the file"]
  T --> S1["server 1 ✓"]
  T --> S2["server 2 ✓"]
  T --> S3["server 3 ✓"]
  classDef file fill:#0d2a4a,stroke:#58a6ff,color:#ffffff
  classDef tool fill:#3a2a0d,stroke:#d29922,color:#ffffff
  classDef ok fill:#1f6f43,stroke:#3fb950,color:#ffffff
  class F file
  class T tool
  class S1,S2,S3 ok
```

The file says: three servers, with acme app. A tool reads it, and sets up all three the same way. Ansible is one such tool.

- `drift — Servers that should match, slowly becoming different (like ten kitchens that each change the recipe a little)`: 
This also fixes drift. Drift is when servers that should match slowly become different. Run the tool again, and they match again.

### Three questions

Now, the three questions. One: do I do it often? Two: is it the same steps every time? Three: does a mistake hurt? Two or three yes answers? Automate it.

And when not to automate? A job you do only once. Steps you do not understand yet. Do them by hand first, and write them down. And be honest: automation takes time to write and to look after.

### Recap

Recap: repeated jobs done by hand slip. A script holds the steps. The computer repeats them. Infrastructure as code means your servers are described in files. Your challenge: a weekly twenty step report, moving your desk, a check every minute. Which do you automate? The answer is in the demo repo.

### Where next

Where next? Lesson five: saving every version of these files. Lesson six: is production healthy? And to automate for real, there is the course Ansible from Zero.

Next lesson: saving every version, version control in one picture. Subscribe so you do not miss it.

## Challenge

Your challenge: a weekly twenty step report, moving your desk, a check every minute. Which do you automate? The answer is in the demo repo.

When you have tried: [`challenge-solution.md`](challenge-solution.md).

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel: real-world DevOps and SRE, explained with real commands.
