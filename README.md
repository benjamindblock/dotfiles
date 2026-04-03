# dotfiles

Standard git repo in the `~` (`$HOME`) directory. No symlinks or managers.

## What's Included

- **Shell**: Fish (default), Bash
- **Editor**: Neovim, Vim
- **Terminal**: Ghostty
- **Multiplexer**: tmux
- **Languages**: mise (Go, Node, Python, Ruby, TypeScript)
- **Automation**: Hammerspoon (window management)
- **macOS**: Custom defaults (Dock, Finder, animations, screenshots)
- **Git**: Aliases, pretty log, difftastic, global ignores
- **AI**: Claude Code and Codex configurations
- **CLI tools**: fzf, ripgrep, fd, eza, zoxide, direnv, and more (see `.config/Brewfile`)

## Bootstrap (Fresh Mac)

1. `xcode-select --install`
2. [Generate a new SSH key for GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
3. Add the following to `$HOME/.ssh/config`:
    ```
    Host github.com
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
    ```
4. Add the SSH key to your GitHub account and verify: `ssh -vT git@github.com`
5. Clone the repo into `$HOME`:
    ```
    cd ~
    git init .
    git remote add origin git@github.com:benjamindblock/dotfiles.git
    git pull origin main
    ```
6. Run the setup script: `bin/setup`
    - Installs Homebrew and all packages from `.config/Brewfile`
    - Sets Fish as the default shell (will prompt for `sudo` and password)
    - Installs vim-plug for Vim and Neovim
    - Installs Neovim plugins
    - Applies macOS defaults
    - Installs language runtimes via mise
7. Quit and relaunch your terminal (you'll now be in Fish)
8. Launch `Hammerspoon.app` — select "Keep in Dock", "Launch at Login"
9. (Optional) To use a different git identity for work, create `$HOME/Work/.gitconfig`:
    ```
    [user]
      name = Example Name
      email = example@work.com
    ```
    The default identity (set in `~/.gitconfig`) is:
    ```
    [user]
      name = Ben Block
      email = benjamindblock@gmail.com
    ```

## Updates

1. `git pull origin main`
2. `bin/update`
3. Restart your terminal
