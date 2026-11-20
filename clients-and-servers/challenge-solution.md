# Challenge solution: who is client, who is server?

**The question:** you pay on acme-app. To charge you, acme-app asks a payment service. In each
conversation, who is the client and who is the server?

**The rule from the lesson:** client and server are **roles**, not kinds of machines. In a conversation,
whoever **asks first** is the client; whoever **waits and answers** is the server.

There are two conversations:

| Conversation | Client (asks) | Server (answers) |
|---|---|---|
| 1. "Please take my payment" | **your browser** | **acme-app** |
| 2. "Please charge this card" | **acme-app** | **the payment service** |

So **acme-app plays both roles at once**: it is the server for your browser, and the client of the
payment service. It is the same picture as the database in the lesson.

**The order of the messages:**

1. Your browser sends a request to acme-app.
2. Acme-app sends its own request to the payment service.
3. The payment service answers acme-app (for example, "payment accepted").
4. Acme-app answers your browser: a response with status **200 OK** and the "thank you" page.

The payment service never talks to your browser directly: each side only answers the one who asked.
