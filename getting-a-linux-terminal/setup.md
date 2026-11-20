# Setup guide: a Linux terminal for Linux from Zero

You need **one** of the options below. All of them are free. For this course, any of them is enough:
the lessons use only `pwd`, `ls`, `cd`, `cat`, `mkdir` and `--help`, and they only look at folders or
add new ones.

Product menus and installers change over time, so this guide gives the steps in general terms and
points you to the official documentation for the exact screens.

## Windows: WSL (Windows Subsystem for Linux) - recommended on Windows

WSL runs a real Linux inside Windows (Windows 10 version 2004 or later, or Windows 11).

1. Open Microsoft's official guide: search for **"Install WSL" Microsoft Learn**. Follow it, because it
   is kept up to date.
2. In short, the guide asks you to open **PowerShell as an administrator** and type:

   ```powershell
   wsl --install
   ```

   This installs WSL and, by default, the Ubuntu distribution. You need an administrator account.
3. **Restart** the computer when asked.
4. Open **Ubuntu** from the Start menu. The first start takes a minute. It asks you to choose a
   **Linux user name** and a **password**. This password is only for Linux; when you type it, nothing
   appears on the screen (no dots, no stars). That is normal.
5. You see a prompt that ends with `$`. Your terminal is ready.

If something fails, the "Troubleshooting" section of the same official guide covers the common cases
(for example, virtualization turned off in the computer's settings).

## Mac: the Terminal app

1. A Mac comes with an app called **Terminal**. Find it with the Mac's search (Spotlight): type
   "Terminal" and open it.
2. You see a prompt that usually ends with `%` (the Mac's default shell is zsh). Your terminal is ready.

Good to know: macOS is not Linux. `pwd`, `ls`, `cd`, `cat` and `mkdir` work the same way for this
course. Some options differ; in particular many Mac commands do not understand `--help` (lesson 8 shows
what to do instead).

## Linux: the terminal app

1. Open the **terminal** app from your app menu (it may be called Terminal, Console or Konsole).
2. On many desktops the keyboard shortcut **Ctrl + Alt + T** opens it too.
3. You see a prompt that ends with `$`. Your terminal is ready.

## Any computer, nothing to install: a Linux lab in the browser

Some websites give you a Linux terminal in a browser tab. The Linux runs on their computer, not yours.
Search for **"Linux terminal in browser"** and pick one that does not ask for payment details.

- Many of them **reset** when you close the tab: your files are gone. That is fine for practice.
- **Never** type passwords, keys or private files into a website's terminal.
- Some start you as `root` (the prompt ends with `#`). In a lab that resets this is fine.

## Make your terminal look like the lessons (optional)

The lessons use a small practice folder: `acme-app` (with `config.txt` and a `logs` folder holding
`app.log`), `notes` (with `todo.txt` and `ideas.txt`) and `readme.txt`. The files of every lesson are in
its folder of the demos repo. You can follow along without them: your own home folder has different
names, and that is fine. Lesson 7 (`mkdir`) shows how to make folders of your own.
