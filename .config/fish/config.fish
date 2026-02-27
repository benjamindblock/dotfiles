# ==============================================================================
# PATH
# ==============================================================================

# fish_add_path prepends to $PATH and is idempotent, so entries listed later
# here end up with higher priority. Order matches the intended precedence from
# ~/.profile (highest priority first in the final PATH):
#   roc > elan > python > llvm@14 > bison > homebrew > usr/local > ~/bin >
#   ~/.local/bin > odin tools > postgresql > curl
fish_add_path ~/build/ols
fish_add_path ~/build/Odin
fish_add_path $HOME/.elan/bin
fish_add_path /opt/homebrew/opt/llvm@14/bin
fish_add_path $HOME/.local/bin
fish_add_path ~/bin
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/postgresql@16/bin
# Use brew curl over system curl.
fish_add_path /opt/homebrew/opt/curl/bin

# ==============================================================================
# Environment Variables
# ==============================================================================

set -gx EDITOR /usr/bin/vim
set -gx ODIN_ROOT /Users/bdb/build/Odin
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx LSCOLORS ExGxBxDxCxEgEdxbxgxcxd
set -gx GREP_OPTIONS --color
# Use brew curl over system curl.
set -gx LDFLAGS -L/opt/homebrew/opt/curl/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/curl/include

# ==============================================================================
# Prompt
# ==============================================================================

# Do not show any greeting
set --universal --erase fish_greeting
function fish_greeting; end

# Git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
    set_color brblue
    echo -n "$USER@"
    echo -n (command -q hostname; and hostname; or hostnamectl hostname)
    if [ $PWD != $HOME ]
        set_color brblack
        echo -n ':'
        set_color yellow
        echo -n (string join / (string split -r -m3 / (prompt_pwd))[-3..-1])
    end
    set_color brgreen
    printf '%s ' (__fish_git_prompt)
    set_color brred
    echo -n '| '
    set_color normal
end

function fish_right_prompt --description 'Write out the right prompt'
    set_color 666666
    date +'%Y-%m-%d %H:%M:%S'
    set_color normal
end

# ==============================================================================
# Tool Integrations
# ==============================================================================

direnv hook fish | source
mise activate fish | source
zoxide init fish | source

# ==============================================================================
# Abbreviations
# ==============================================================================

abbr -a vi vim
abbr -a tf tofu
abbr -a vimrc 'vim ~/.vimrc'
abbr -a bashrc 'vim ~/.bashrc'
abbr -a ghostrc 'vim ~/.config/ghostty/config'
abbr -a fishrc 'vim ~/.config/fish/config.fish'
abbr -a todo 'vim ~/Documents/todo.txt'
abbr -a follow 'tail -f -n +1'
abbr -a tls 'tmux ls'

# Parity between `ls` and `eza`
if command -v eza > /dev/null
    abbr -a l 'eza'
    abbr -a ls 'eza'
    abbr -a ll 'eza -l'
    abbr -a lll 'eza -la'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end


# ==============================================================================
# Functions
# ==============================================================================

function ta --description 'Attach a tmux session'
    tmux attach -t $argv[1]
end

# Change up N directories. E.g.: cu 3 -> cd ../../../
function cu --description 'Change up N directories (default: 1)'
    set count $argv[1]
    if test -z "$count"
        set count 1
    end
    set path ""
    for i in (seq 1 $count)
        set path $path"../"
    end
    cd $path
end

function mcd --description 'Create and enter a directory'
    mkdir -p $argv[1] && cd $argv[1]
end

function vimod --description 'Open all modified git files in vim tabs'
    vim -p (git status -suall | awk '{print $2}')
end

# Open files modified in a given git commit in vim tabs; defaults to HEAD.
# Examples: virev 49808d5 / virev HEAD~3
function virev --description 'Open files modified in a git commit in vim tabs'
    set commit $argv[1]
    if test -z "$commit"
        set commit HEAD
    end
    set rootdir (git rev-parse --show-toplevel)
    set sourceFiles (string split \n (git show --name-only --pretty="format:" $commit) | grep -v '^$')
    set toOpen
    for file in $sourceFiles
        set file $rootdir/$file
        if test -e $file
            set -a toOpen $file
        end
    end
    if test -z "$toOpen"
        echo "No files were modified in $commit"
        return 1
    end
    vim -p $toOpen
end

function removelink --description 'Replace a symlink with the file it points to'
    if test -L $argv[1]
        mv (readlink $argv[1]) $argv[1]
    end
end

# ==============================================================================
# Colored output
# ==============================================================================

# Colored man output
# Ref: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline
