# Final challenge solution: the journey, from memory

**The question:** from memory, draw the journey of an app from code to users, and who watches it.

**One good drawing:**

```
   code  ---->  pipeline  ---->  servers  ---->  users
 (every      (build, test,     (own, or
  version     deploy,           rented in
  saved)      automated)        the cloud)
    ^                                              |
    |                                              v
    +---------  learn, roll back if needed  <---- watch
                                              (logs, metrics,
                                               alerts, on call)
```

**Check your drawing against the course:**

- **Code** lives in version control: every version saved, with who and why (lesson 5).
- The **pipeline** builds, tests and deploys every change, the same way every time (lessons 2 and 4).
- It runs on **servers**, owned or rented in the cloud, in real data centers (lesson 3).
- **Users** get the change; then the team **watches** production with logs, metrics and alerts (lesson 6).
- If something is wrong: **roll back**, find the cause, fix it, write it down (lessons 2 and 7).
- Who watches? **The same team that builds it**: that is DevOps (lesson 1). DevOps engineers and SREs
  do this work every day (lesson 7).

**Where next:** Linux from Zero, then Kubernetes from Zero or Ansible from Zero.
