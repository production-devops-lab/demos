# Challenge solution: put debug inside settings

```yaml
app: acme-app
settings:
  port: 8080
debug: false
```

**Is `debug` inside `settings`?** No. `debug` starts at the left edge, with no spaces, like `app` and
`settings`. Fewer spaces than `port` means the `settings` group is over, so `debug` is a top-level
setting. The file is valid YAML: no error tells you that `debug` is in the wrong place.

What a program reads from it:

```text
app      = acme-app
settings = { port: 8080 }
debug    = false          <- outside settings
```

**The fix: two spaces before `debug`**, exactly like `port`. Same spaces as the line above means the
same group.

```yaml
app: acme-app
settings:
  port: 8080
  debug: false
```

Now `settings` holds two keys: `port` and `debug`.

**Watch out:** three spaces would be an error (is `debug` next to `port`, or inside it?), and a Tab key is
never allowed at the start of a line.

**Check it yourself** (optional, if you have Python with the PyYAML library):

```bash
python3 -c 'import yaml; print(yaml.safe_load(open("challenge.yaml")))'
# before: {'app': 'acme-app', 'settings': {'port': 8080}, 'debug': False}
# after:  {'app': 'acme-app', 'settings': {'port': 8080, 'debug': False}}
```
