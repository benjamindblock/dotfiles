# History control
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=100000
HISTFILESIZE=2000000

# https://bluz71.github.io/2023/06/02/maximize-productivity-of-the-bash-shell.html
#  - cdspell - automatically fix directory typos when changing directory
#  - direxpand - automatically expand directory globs when completing
#  - dirspell - automatically fix directory typos when completing
#  - globstar - ** recursive glob
#  - histappend - append to history, don't overwrite
#  - nocaseglob - case-insensitive globbing
#  - no_empty_cmd_completion - do not TAB expand empty lines
shopt -s cdspell direxpand dirspell globstar histappend \
  nocaseglob no_empty_cmd_completion

# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB':menu-complete

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

# Unbreak broken, non-colored terminal
# export TERM="xterm-kitty"
alias ll="ls -Ahltr"
alias ls="ls -G"
alias vi="vim"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias todo="vi ~/Documents/todo.txt"
alias follow="tail -f -n +1"
alias k="kubectl"
alias tf="terraform"
alias srb="bundle exec srb tc"
alias srba="bundle exec srb tc -a"
alias ghostrc="vim ~/.config/ghostty/config"

function pry {
  if [ -f ./config/environment.rb ]; then
    echo "Starting pry with ./config/environment.rb loaded..."
    bundle exec pry -r ./config/environment.rb
  elif [ -f Gemfile ]; then
    echo "Starting pry in Gemfile context..."
    bundle exec pry
  else
    echo "Starting pry..."
    eval "$(which pry)"
  fi
}

# It's annoying to move the Paralus kubeconfig file into .kube all the time...
function kcfg {
  kube="${HOME}/.kube"
  kubeconfig="${HOME}/kubeconfig-bblock@syntaxdata.com.yaml"
  if [ -f "${kubeconfig}" ]; then
    cd "${HOME}"
    mv "${kubeconfig}" "${kube}"
    cd "-" > /dev/null
    echo "Moved ${kubeconfig} -> ${kube}"
  else
    echo "${kubeconfig} does not exist. Exiting."
  fi
}

# tmux-related aliases & functions
alias tls="tmux ls"

# Attach a tmux session
function ta {
  local session="$1"
  tmux attach -t "$session"
}

# Change up a variable number of directories
# E.g:
#   cu   -> cd ../
#   cu 2 -> cd ../../
#   cu 3 -> cd ../../../
function cu {
  local count=$1
  if [ -z "${count}" ]; then
    count=1
  fi
  local path=""
  for i in $(seq 1 ${count}); do
    path="${path}../"
  done
  cd $path
}

function mcd {
  mkdir -p "$1" && cd "$1"
}

# Open all modified files in vim tabs
function vimod {
  vim -p $(git status -suall | awk '{print $2}')
}

# Open files modified in a git commit in vim tabs; defaults to HEAD.
# Examples: 
#     virev 49808d5
#     virev HEAD~3
function virev {
  commit=$1
  if [ -z "${commit}" ]; then
    commit="HEAD"
  fi
  rootdir=$(git rev-parse --show-toplevel)
  sourceFiles=$(git show --name-only --pretty="format:" ${commit} | grep -v '^$')
  toOpen=""
  for file in ${sourceFiles}; do
    file="${rootdir}/${file}"
    if [ -e "${file}" ]; then
      toOpen="${toOpen} ${file}"
    fi
  done
  if [ -z "${toOpen}" ]; then
    echo "No files were modified in ${commit}"
    return 1
  fi
  vim -p ${toOpen}
}

removelink() {
  [ -L "$1" ] && mv "$(readlink "$1")" "$1"
}

# Colours have names too. Stolen from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
# TODO: Add remaining bright colors.
brtred='\[\e[0;91m\]' # Bright Red
brtgrn='\[\e[0;92m\]' # Bright Green
brtblu='\[\e[0;94m\]' # Bright Blue
brtpur='\[\e[0;95m\]' # Bright Pur
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=true
export PROMPT_DIRTRIM=3

git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    # The __git_ps1 function inserts the current git branch where %s is
    local GIT_PROMPT=`__git_ps1 "%s"`
    echo "[${GIT_PROMPT}]"
  fi
}

git_colon() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    echo ":"
  fi
}

export PS1="${txtgrn}[\A]${txtrst}:${brtblu}[\w]${txtrst}\$(git_colon)${txtpur}\$(git_prompt) ${txtred}|${txtrst} "
export PS4='+${BASH_SOURCE[0]##*/}($LINENO)/${FUNCNAME[0]}> '

source ~/bin/git-completion.sh
source ~/bin/z.sh
 
# Install env_parallel so that GNU parallel can use
# functions from .bashrc
source "$(which env_parallel.bash)"

# Init direnv
eval "$(direnv hook bash)"
