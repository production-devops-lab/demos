# Lesson 2 challenge: three commit messages for a shopping list

Imagine a file `shopping-list.txt` kept in a Git repository. Three changes, three commits. One good
answer (yours can be different):

| Page | What you did | Commit message |
|---|---|---|
| 1 | created the list with bread, milk and eggs | `Add the first shopping list` |
| 2 | removed milk, already in the fridge | `Remove milk: we still have some` |
| 3 | added tomatoes for Sunday's dinner | `Add tomatoes for Sunday dinner` |

What makes them good:

- **short**: one line each;
- they say **what** changed, starting with a verb (Add, Remove);
- when it helps, they say **why** ("we still have some");
- next month, you can read the history and understand it without opening the file.

Messages to avoid: `update`, `fix`, `stuff`, `changes`. They are true for every commit, so they tell
you nothing.
