# Try it yourself: Ansible and two practice servers

From this lesson on, every command of Ansible from Zero runs for real. You need:

1. **A Linux terminal you can throw away.** The lab script changes system settings (it adds a user
   `ops`, SSH keys and SSH settings), so use a machine that is only for practice: a virtual machine, a
   spare Ubuntu in WSL on Windows, or a container started with `--privileged`. You need to be able to
   run commands as root (`sudo`).
2. **Ansible.** Follow the official installation guide, it is kept up to date:
   https://docs.ansible.com/ansible/latest/installation_guide/ . On Ubuntu, `sudo apt install
   ansible-core` is enough for this course.
3. **The tools the lab needs:** an SSH server and client, `sudo`, `python3` and `util-linux`
   (on Ubuntu: `sudo apt install openssh-server openssh-client sudo python3 util-linux`).

Then become root (`sudo -i`): on this practice machine you type everything as root, because the lab
keeps its SSH key in a folder only root can read. Go to the folder of a lesson (it holds `ansible.cfg`,
`inventory.ini` and `lab/up.sh`) and start the two practice servers:

```bash
bash lab/up.sh
```

It prints `ready: node01 ...` and `ready: node02 ...`. Each practice server is an SSH server on your own
machine (127.0.0.1, ports 2201 and 2202) with its own name and its own `/etc`, `/home` and `/tmp`, and
the user `ops` can log in with a key. The script also writes an SSH setting, so the names `node01` and
`node02` in the inventory lead to these two servers.

The script is safe to run again at any time: it only adds what is missing. `bash lab/up.sh reset`
gives both practice servers a fresh start.

**Lesson 4** needs only Ansible (`ansible-inventory` reads the list, it contacts no server). The
practice servers are used from **lesson 5** on.
