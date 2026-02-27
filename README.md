# dotfiles
Standard git repo in the `~` directory. No other tools.

## Bootstap / Installation
1. `cd ~`
2. `xcode-select --install`
3. `git init .`
4. `git remote add origin git@github.com:benjamindblock/dotfiles.git`
5. `bin/setup`
6. `vi ~/.vimrc`
7. `:PlugInstall`
8. To specify a different git email/name to commit with, add a `.gitconfig` to `~/Projects` with:
```
[user]
  name = Example Name
  email = example@email.com
```
These are the default settings in `~/.gitconfig`:
```
[user]
  name = Ben Block
  email = benjamindblock@gmail.com
```
9. Launch `Hammerspoon.app`, select: `keep in menu`, `always launch at startup`
10. To make `fish` the default shell: add `/opt/homebrew/bin/fish`  to `/etc/shells`
11. `chsh -s /opt/homebrew/bin/fish`

## Updates
1. `git checkout main`
2. `git pull origin main`
3. Optional: `bin/setup`
4. Quit and restart terminal

## TODO
- Add `bin/update` in addition to `bin/setup`
