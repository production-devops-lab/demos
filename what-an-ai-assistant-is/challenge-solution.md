# Challenge: helper or chef?

Three jobs. For each one: can the AI assistant (the helper) **draft** it, or must **you** (the chef) do it?

1. "Explain this error message in plain words."
2. "Write a first draft of a checklist for the morning check of acme-app."
3. "Decide whether to restart the production database now."

## Solution

1. **The helper can draft it.** Explaining an error in plain words is one of the things it is good at.
   You still read the explanation critically: it is likely text, not a checked fact.
2. **The helper can draft it.** A first draft saves time. You read every line, remove what does not
   fit acme-app and add what it could not know (it has never seen your servers).
3. **You do it.** A restart in production is a decision, and you answer for the result. The helper
   can list things to consider, but the decision, and the check before it, are yours.

Rule of thumb: the helper drafts, the chef checks and decides.
