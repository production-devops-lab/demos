# Challenge solution: two DevOps fixes

**The question:** a team releases its app once a year, every step is done by hand, and when something
breaks each side blames the other. Name two DevOps fixes.

**Any two of these are a good answer:**

1. **Small changes, released often.** Instead of one huge release a year, release one small change at a
   time. When something breaks, you know which change it was, and you can undo just that one.
2. **Let the computer repeat the steps.** Build, test and deploy with automated steps (a pipeline,
   lesson 2), so nothing depends on someone remembering step 14 late at night.
3. **One team, shared eyes on production.** The people who write the app also watch it run (lesson 6),
   so "it worked on my computer" is no longer the end of the conversation.
4. **Fix problems together, without blame.** After a problem, the team writes down what happened and how
   to prevent it (a postmortem, lesson 7), instead of looking for someone to blame.

**The one-sentence answer from the lesson:** DevOps means one team builds the app and runs it, with
small changes, automated steps and eyes on production.
