# Setup: yamllint on your computer

yamllint is a free, open source linter for YAML files, written in Python. Install it once, in any Linux
terminal (on Windows, a WSL terminal works; on macOS, the Terminal app).

Pick **one** of these:

```bash
# with pip, the Python package installer (works almost everywhere)
python3 -m pip install --user yamllint

# or with your Linux distribution's package manager
sudo apt install yamllint      # Debian, Ubuntu
sudo dnf install yamllint      # Fedora, RHEL-like systems
```

Check that it works:

```bash
yamllint --version
```

Then, in the folder with the lesson's files (`acme-v1.yaml`, `acme-v2.yaml`, `acme-v3.yaml`,
`challenge.yaml`):

```bash
yamllint acme-v1.yaml
yamllint acme-v2.yaml
yamllint acme-v3.yaml
```

The lesson was recorded with yamllint 1.38 and its default rules. Other versions may word a message a
little differently; the line and column numbers stay the same.

**Good to know:** yamllint prints nothing when a file has no problems. Its exit code is `1` when it finds
at least one error, and `0` otherwise (warnings alone do not change it).
