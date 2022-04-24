# Making the shell look nicer than before
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST

# PROMPT for dark themes, no bold
PROMPT='%F{253}%6~%F{105}%B$(parse_git_branch) %b%F{253}\$ '

# PROMPT for light themes, no bold
# PROMPT='%F{0}%3~%F{27}%B$(parse_git_branch) %b%F{0}\$ '

# Colored prompt
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# A few custom commands
alias ll="ls -Ahltr"
alias rm="rm -i"

# Open up source files easily
alias todo="vi ~/Documents/todo.txt"
alias kc="vi ~/.config/kitty/kitty.conf"
alias vimrc="vi ~/.vimrc"
alias zshrc="vi ~/.zshrc"

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
export STARDICT_DATA_DIR=~/usr/share/stardict/dic
export ZCODE_PATH=/usr/local/share/zcode:/usr/local/share/zcode/infocom:$HOME/.zcode
