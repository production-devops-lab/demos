# Challenge solution: the two values that change

```yaml
app: acme-app
release: 2.10
debug: no
owner: ops
```

**Value 1, line 2: `release: 2.10`.** It looks like a number, so YAML reads the number **2.1**: release
"two point ten" becomes "two point one". A version is not a number: put it in quotes.

**Value 2, line 3: `debug: no`.** Debug is a real yes-or-no setting, but `no` is read differently by
different tools: tools that follow the older YAML rules (Ansible among them) read it as `false`, tools
that follow the newer rules read the text `"no"`. Write the one spelling every tool agrees on: `false`.

**The other two are fine:** `acme-app` and `ops` are plain text, and plain text needs no quotes.

**The fixed file:**

```yaml
app: acme-app
release: "2.10"
debug: false
owner: ops
```

**The four rules from the lesson:**

1. Looks like a number but is not one (versions, ids with leading zeros): quotes.
2. A real yes or no: `true` or `false`, never `yes`, `no`, `on`, `off`.
3. A colon followed by a space, or a `#`, inside text: quotes.
4. In doubt about a piece of text: quote it.

**Check it yourself** (optional, if you have Python with the PyYAML library, which follows the older
rules):

```bash
python3 -c 'import yaml; print(yaml.safe_load(open("challenge.yaml")))'
# before: {'app': 'acme-app', 'release': 2.1, 'debug': False, 'owner': 'ops'}
# after:  {'app': 'acme-app', 'release': '2.10', 'debug': False, 'owner': 'ops'}
```
