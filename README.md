# dotfiles
dotfiles managed with rcm

## Installation
1. `xcode-select --install`
2. `git clone git@github.com:benjamindblock/dotfiles.git .dotfiles`
3. `$HOME/.dotfiles/setup`
4. `vi .vimrc`
5. `:PlugInstall`

## Updates
1. `cd $HOME/.dotfiles`
2. `git checkout main`
3. `git pull origin main`
4. `rcup -v`
5. Optional: `$HOME/.dotfiles/setup`

## TODO
- How to manage work VS. personal git users with `gitconfig` file? Link to a private file?
