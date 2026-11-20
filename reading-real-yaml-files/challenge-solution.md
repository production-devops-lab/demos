# Challenge solution: the line that breaks challenge.yaml

```yaml
---
apiVersion: v1
kind: Pod
metadata:
  name: acme-app
spec:
  containers:
    - name: web
        image: nginx:1.27-alpine
      ports:
        - containerPort: 80
```

**The broken line: line 9, `image`.** It starts at column 9, after **eight** spaces. But `name`, the
first key of the same item, starts at column 7 (four spaces, the dash and one space). Keys of the same
group must line up. With two extra spaces, YAML tries to read `image` as the continuation of the value `web`, then
finds a colon where no new key is allowed, and stops with an error. (Lesson 4: one group, one column.)

**What yamllint says** (lesson 7; real output, yamllint 1.38):

```text
$ yamllint challenge.yaml
challenge.yaml
  9:14      error    syntax error: mapping values are not allowed here (syntax)
```

Line 9, column 14: the colon after `image`.

**The fix:** `image` lines up with `name`, like `ports`.

```yaml
    - name: web
      image: nginx:1.27-alpine
      ports:
        - containerPort: 80
```

This is exactly `pod.yaml` from the lesson, and `yamllint pod.yaml` prints nothing: no problems.

**Where next:** Kubernetes from Zero (write a Pod, then run it on a practice cluster) and Ansible from
Zero (write a playbook, then run it on two practice servers). Both start from zero.
