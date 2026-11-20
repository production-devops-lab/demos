# Challenge: which two lines must you replace?

You want help with this problem. Before you paste it into an AI assistant, which lines must you
replace with a placeholder (or remove)? Everything here is fictional; the hidden value is shown as `****`.

```text
1. Error: connection refused on port 8080
2. API_KEY=****
3. The failing order came from ana@example.com
4. I ran: ls acme-app/logs
```

## Solution

- **Line 2**: an API key is a secret. In your real file the real key would be there. Mask it before you paste:

  ```
  API_KEY=****
  ```

- **Line 3**: an e-mail address is data about a real person (in real life it would not be
  example.com). Replace it: `The failing order came from <customer-email>`.

Lines 1 and 4 can stay: an error message and a command you ran are exactly what the assistant needs to
help, and they give no access to anything.

The ten-second check: a password, key or token? Data about real people? Real servers, customers or
projects? All no: paste. Any yes: replace it first.
