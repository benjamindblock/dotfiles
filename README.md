# dotfiles
Standard git repo in the `~` (`$HOME`) directory. No other tools.

## Bootstap / Installation
1. `cd ~`
2. `xcode-select --install`
3. [Generate a new SSH key to connect to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
4. Add the following to `$HOME/.ssh/config`
    ```
    Host github.com
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
    ```
5. Add new SSH key to GitHub account and ensure connection: `ssh -vT git@github.com`
6. `git init .`
7. `git remote add origin git@github.com:benjamindblock/dotfiles.git`
8. `git pull origin main`
9. Start a Bash session: `bash`
10. `bin/setup`
11. `vi ~/.vimrc`
12. `:PlugInstall`
13. To specify a different git email/name to commit with for **work**, add a `.gitconfig` to `$HOME/Work` with:
```
[user]
  name = Example Name
  email = example@work.com
```
These are the default settings in `~/.gitconfig`:
```
[user]
  name = Ben Block
  email = benjamindblock@gmail.com
```
14. Launch `Hammerspoon.app`, select: `keep in menu`, `always launch at startup`
15. To make `bash` the default shell: add `/opt/homebrew/bin/bash` (or wherever `which bash` points to) to `/etc/shells`
16. `chsh -s /opt/homebrew/bin/bash`

## Updates
1. `git checkout main`
2. `git pull origin main`
3. Optional: `bin/setup`
4. Optional: re-source applications (Vim, Kitty, zsh, etc.)

## TODO
- Add `bin/update` in addition to `bin/setup`
