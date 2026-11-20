# Challenge solution: a short list, written with dashes

**The question:** write `ports: [8080, 8443]` (the short form, on one line) with dashes, one item per
line.

**The answer:**

```yaml
ports:
  - 8080
  - 8443
```

How to build it:

1. The key `ports`, a colon, and **nothing after it**: the value comes on the next lines.
2. One item per line: two spaces, a **dash**, a **space**, the value.
3. Same items, **same order**: first 8080, then 8443.

Both forms give the program exactly the same thing: a list of two numbers, `[8080, 8443]`.

**Also valid:** the dashes right under the key, with no spaces in front. Pick one style per file.

```yaml
ports:
- 8080
- 8443
```

**Not valid as a list:** `-8080` without the space after the dash. YAML reads it as text, not as an
item, and the two lines become the single text `-8080 -8443`, with no error.

**Check it yourself** (optional, if you have Python with the PyYAML library):

```bash
python3 -c 'import yaml; print(yaml.safe_load(open("challenge.yaml")))'
# {'ports': [8080, 8443]}   - the same result for the short form and the dash form
```
