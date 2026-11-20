# Challenge solution: what yamllint says about challenge.yaml

```yaml
---
app: acme-app
settings:
  port: 8080
   debug: false
```

**The report** (real output, yamllint 1.38):

```text
$ yamllint challenge.yaml
challenge.yaml
  5:9       error    syntax error: mapping values are not allowed here (syntax)
```

**How to read it:** line **5**, column **9**, an **error** found by the **syntax** check: the file cannot
be read.

**What is wrong:** `debug` has **three** spaces in front, `port` has two. So YAML does not read `debug`
as a key next to `port`: it tries to read line 5 as the continuation of the value of `port`, and then
finds a colon where no new key is allowed. That colon is column 9 of line 5, and that is exactly where
the report points. (Lesson 4: one space too many.)

**The fix:** two spaces before `debug`, like `port`.

```yaml
---
app: acme-app
settings:
  port: 8080
  debug: false
```

Run it again:

```text
$ yamllint challenge.yaml
$
```

No output: no problems found.
