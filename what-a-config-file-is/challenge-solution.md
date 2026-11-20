# Challenge solution: one JSON line, written as YAML

**The question:** write the JSON line `"replicas": 5,` as a line of YAML.

**The answer:**

```yaml
replicas: 5
```

What changed:

| JSON | YAML | Why |
|---|---|---|
| `"replicas"` | `replicas` | YAML does not need quotes around the name |
| `:` | `: ` | the colon stays, and YAML wants a **space** after it |
| `5` | `5` | the value is the same number |
| `,` at the end | nothing | YAML has one setting per line: no commas between lines |

The meaning is identical: the program runs five copies.

**Bonus:** the whole `acme-app.json` from the lesson, written as YAML, is `acme-app.yaml`:

```yaml
app: acme-app
port: 8080
replicas: 3
debug: false
```

All three files of the lesson (`acme-app.ini`, `acme-app.json`, `acme-app.yaml`) are in this same
folder: they hold the same four settings.
