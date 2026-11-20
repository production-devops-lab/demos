# Challenge solution: prompt or command?

**The question:** in the line below, which part is the prompt, and which part is the command?

```
sre@lab:~$ ls
```

**The prompt** is everything up to and including the dollar sign: `sre@lab:~$`. The terminal prints it
by itself, to say "I am ready, your turn". You never type it.

**The command** is what comes after the prompt: `ls`. That is the part you type, before pressing Enter.
(It lists what is in a folder: you will use it in lesson 4.)

A tip for every lesson of this course: when you copy a command from a page, copy only the part after
the prompt. If you paste the prompt too, the terminal tries to run it as a command and prints an error.
