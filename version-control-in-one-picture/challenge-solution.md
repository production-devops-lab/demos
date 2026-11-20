# Challenge solution: which commit message is better?

**The question:** which commit message is better, and why?

- A: `fix`
- B: `Fix checkout button: it sent empty orders`

**The answer: B.**

A commit message is the **why** of the change, written for the next person who reads the history,
maybe you, months later, during a problem.

- **A says almost nothing.** Fix what? Why? When something breaks, a list of commits called "fix" does
  not tell you where to look.
- **B says what changed and why.** It names the part (the checkout button) and the problem it solves (it
  sent empty orders). If the checkout breaks again, this commit is the first one to look at, and going
  back to the version before it is one step.

**A simple habit for good messages:**

1. Start with a verb: Fix, Add, Remove, Change.
2. Name the part you changed.
3. After a colon, say why, in plain words.
