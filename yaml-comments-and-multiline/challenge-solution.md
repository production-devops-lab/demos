# Challenge solution: what the program reads

```yaml
# lab settings
app: acme-app  # our app
message: >
  Hello
  from the lab.
```

**Line by line:**

- Line 1 starts with `#`: the whole line is a comment, a note for people. The program skips it.
- Line 2: the key `app`, the value `acme-app`. After the value, spaces and then `#` start a comment:
  `# our app` is skipped too.
- Line 3: the key `message`, then `>`: the text starts on the next line, and its lines are **folded**
  into one.
- Lines 4 and 5 are indented, so they are the text of `message`.

**What the program reads: two settings.**

```text
app     = acme-app
message = Hello from the lab.
```

**The exact value of `message`:** `Hello from the lab.` on **one line**. The line break between `Hello`
and `from the lab.` became a space, because of `>`. (Strictly speaking, the value also ends with one line
break after the dot: that is how both `|` and `>` finish a block. Add a minus, `>-` or `|-`, to drop
it.)

**With `|` instead of `>`** the value would keep both lines:

```text
Hello
from the lab.
```

**Check it yourself** (optional, if you have Python with the PyYAML library):

```bash
python3 -c 'import yaml; print(repr(yaml.safe_load(open("challenge.yaml"))))'
# {'app': 'acme-app', 'message': 'Hello from the lab.\n'}
```
