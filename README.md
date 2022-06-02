# dotfiles
dotfiles managed with [rcm](https://github.com/thoughtbot/rcm)

## Bootstap / Installation
1. `xcode-select --install`
2. `git clone git@github.com:benjamindblock/dotfiles.git .dotfiles`
3. `~/.dotfiles/setup`
4. `vi ~/.vimrc`
5. `:PlugInstall`
6. To specify a different git email/name to commit with, add a `.gitconfig` to `~/Projects` with:
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
7. Launch `Hammerspoon.app`, select: `keep in menu`, `always launch at startup`
8. Add a file `.irssi/chatnets` with your credentials:
```
chatnets = {
  libera = {
    type = "IRC";
    nick = "<nick>";
    realname = "<realname>";
    autosendcmd = "/^msg NickServ IDENTIFY <nick> <password>; wait 2000";
  };
};
```

## Updates
1. `cd ~/.dotfiles`
2. `git checkout main`
3. `git pull origin main`
4. `rcup -v`
5. Optional: `~/.dotfiles/setup`
6. Optional: re-source applications (Vim, Kitty, zsh, etc.)

## TODO
- Add additional interactive fiction tools
- Karabiner JSON doesn't seem to be working
