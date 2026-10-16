# Your Ansible Tests Pass. One Group of Servers Is Still Broken.

Video: https://youtu.be/S9vxvmT0Alw

Architecture diagrams simplify, and tests written from a diagram only cover the hosts it shows. We run a real role and a real test against a small inventory: everything is green, and one group of servers never got the change. Then we find the cause with ansible-inventory --graph and --list-hosts, fix a silent when condition, and roll the fix out with a canary.

## Files

- `ansible.cfg`
- `group_vars/app.yml`
- `group_vars/worker.yml`
- `inventory.ini`
- `roles/app_logrotate/tasks/main.yml`
- `site.yml`
- `test-all.yml`
- `test.yml`

## Commands from the video

Run them from inside this folder, in this order (some of them are expected to fail: that is the point of the demo).

```bash
cat site.yml
ansible-inventory --graph logging_clients
ansible-playbook site.yml --list-hosts
ansible-playbook test.yml --list-hosts
ansible-playbook site.yml
ansible-playbook test.yml
find target -type f | sort
ansible-playbook test-all.yml
grep -rn 'when:' roles/
sed -i '/when:/d' roles/app_logrotate/tasks/main.yml
ansible-playbook site.yml --check --diff --limit worker01
ansible-playbook site.yml --limit worker01
ansible-playbook test-all.yml
```

---

From the [ProductionDevOps](https://www.youtube.com/@production-devops) channel.
