# Your Bash Scripts Fail Silently. Fix It With One Line (set -euo pipefail)

Video: https://youtu.be/7fyJngojTyQ

Most production incidents caused by shell scripts are not crashes - they are scripts that kept running after something went wrong. Step by step, we break a real-looking backup script, then fix it with Bash strict mode: what each of the three options does, shown with a real failure, and the gotchas to know before adding it everywhere.

## Files

- `backup-strict.sh`
- `backup.sh`
- `cleanup-strict.sh`
- `cleanup.sh`
- `defaults.sh`

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
bash backup.sh
echo "exit code: $?"
bash backup-strict.sh
echo "exit code: $?"
cat cleanup.sh
bash cleanup.sh
bash cleanup-strict.sh
grep ERROR app.log | sort | head -3; echo "exit code: $?"
set -o pipefail; grep ERROR app.log | sort | head -3; echo "exit code: $?"
cat defaults.sh
bash defaults.sh
LOG_LEVEL=debug bash defaults.sh
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
