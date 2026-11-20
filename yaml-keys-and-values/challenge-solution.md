# Challenge solution: the two mistakes in challenge.yaml

```yaml
app: acme-app
Port: 8080
replicas:3
```

**Mistake 1, line 2: `Port` with a capital P.** For YAML, `Port` and `port` are two different keys:
capital letters count. acme-app looks for the key `port`, so it does not find this setting. Depending on
the program, it then uses a default value or stops. This mistake does **not** break the file: YAML reads
it without complaint, and that is what makes it sneaky.

**Mistake 2, line 3: no space after the colon.** `replicas:3` is not a key and a value: YAML reads it as
the text `replicas:3`. Text alone, among keys and values, does not fit, so the program stops with an
error.

**The fixed file:**

```yaml
app: acme-app
port: 8080
replicas: 3
```

**Check it yourself** (optional, if you have Python with the PyYAML library):

```bash
python3 -c 'import yaml; print(yaml.safe_load(open("challenge.yaml")))'
# an error: "while scanning a simple key ... could not find expected ':'"
```

With the fixed file, the same command prints `{'app': 'acme-app', 'port': 8080, 'replicas': 3}`.
