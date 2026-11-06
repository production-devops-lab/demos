# Challenge solution: you want 3 copies, and 5 are running

**The question:** your order (the desired state) says "3 copies of acme-app", but 5 copies are running
right now (the actual state). What does the control loop do?

**The answer:** it **stops 2 copies**. The loop does not only start things: it corrects the difference
in **both** directions.

1. Look: 5 copies are running.
2. Compare with the order: 3 are wanted. They differ by 2.
3. Correct: stop 2 copies, so 3 are left.
4. Look again: 3 running, 3 wanted. Nothing to do, until something changes.

**The thermostat again:** you set 21 degrees and the room is at 23. A thermostat does not only heat: it
stops heating (or turns on the cooling) until the room is back at 21. The control loop works the same
way: too few copies, it starts some; too many, it stops some.

**When does this happen for real?** For example when you change your order from 5 copies to 3: you only
write the new number, and the loop removes the extra copies for you. You will do exactly this in lesson 6.
