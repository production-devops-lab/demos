# Challenge solution: put the journey in order

**The question:** put these in order: test, users, code, deploy, build.

**The answer:**

```
code  ->  build  ->  test  ->  deploy  ->  users
```

1. **Code**: a developer writes or changes the instructions (the recipe).
2. **Build**: the code becomes a package that is ready to run (the dish is cooked).
3. **Test**: automatic checks make sure it still works; a failing test stops the journey (tasting).
4. **Deploy**: the tested package goes to the servers in production (the dish goes to the table).
5. **Users**: from now on, customers see the change.

**Bonus, the step people forget:** after the users comes **watch**. If something is wrong in
production, you **roll back** to the previous version that worked, and then fix the code. So the
journey is really a loop: code, build, test, deploy, users, watch, and back to code.

**Why test comes before deploy:** if the tests ran after the deploy, the customers would be the first to
taste a broken dish.
