# Making the shell look nicer than before
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST

# PROMPT for dark themes, no bold
PROMPT='%F{253}%6~%F{105}%B$(parse_git_branch) %b%F{253}\$ '

# PROMPT for light themes, no bold
# PROMPT='%F{16}%3~%F{59}%B$(parse_git_branch) %b%F{16}\$ '

# kitty setup for alt+arrow key to jump words
bindkey "\e[1;3D" backward-word # ⌥←
bindkey "\e[1;3C" forward-word # ⌥→

# Colored prompt
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# A few custom commands
alias ll="ls -Ahltr"

# Open up source files easily
alias todo="vi ~/Documents/todo.txt"
alias kc="vi ~/.config/kitty/kitty.conf"
alias vimrc="vi ~/.vimrc"
alias zshrc="vi ~/.zshrc"

# View images in kitty
alias icat="kitty +kitten icat --align=left"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit && compinit

# RENV init for shell
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nodenv init for shell
eval "$(nodenv init -)"

# pyenv init for shell
eval "$(pyenv init -)"

# Set vim as editor
export EDITOR=vi

# Fix for Command-T issue
# Ref: https://github.com/wincent/command-t/issues/341
# export PATH="/usr/local/opt/ruby/bin/:$PATH"

# Setting a custom StarDict path
export STARDICT_DATA_DIR=$HOME/usr/share/stardict/dic:$HOME/.stardict/dic

# Setting path for ZCode games
export ZCODE_PATH=/usr/local/share/zcode:/usr/local/share/zcode/infocom:$HOME/.zcode

alias irssi="irssi --config=<((cat ~/.irssi/chatnets && cat ~/.irssi/config))"

export KITTY_LISTEN_ON=unix:/tmp/mykitty-$PPID
