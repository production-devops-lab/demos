# Challenge solution: "Ansible must be installed on every server"

**The statement:** "Ansible must be installed on every server." True or false?

**The answer: false.** Ansible is installed only on the **control node**, the computer where you type.
The managed nodes (the servers) need only two things they almost always have already:

1. an **SSH server**, to take the call from the control node;
2. **Python**, to run the small program (the module) that Ansible sends.

**Why it works without installing anything:** for every task, Ansible logs in over SSH, sends the
module, lets the server's Python run it, reads the answer (changed or ok), and deletes the module. When
the job is done, nothing of Ansible stays on the server: only the change you asked for. This is what
**agentless** means.

**The kitchen picture:** the head chef (the control node) phones each kitchen (a managed node) and reads
out one standard step (the module). The kitchens need a phone (SSH) and cooks who speak the language
(Python), not a robot cook of their own.
