# Challenge solution: 3 steps on 20 servers

**The question:** a change needs 3 steps on one server, and you have 20 servers. How many steps by
hand? And with automation, how many steps do you write?

**By hand:** 3 steps × 20 servers = **60 steps**, done one by one, each one a chance for a typo, a
forgotten server or a slightly different change.

**With automation:** you write the **3 steps once**, in one file. The program repeats them on all 20
servers, the same way every time. You run one command, and you keep the file as a record of what was
done.

**And with 200 servers?** By hand: 600 steps. With automation: still 3 steps to write. That is why the
gap grows with every server you add.
