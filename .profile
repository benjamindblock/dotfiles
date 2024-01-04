# Obviously.
export EDITOR=/usr/bin/vim

# Homebrew
export PATH=/opt/homebrew/bin:${PATH}

# Personal binaries
export PATH="${PATH}:/usr/local/bin"
export PATH="~/bin:${PATH}"

# LLVM for building Odin
export PATH="${PATH}:/usr/local/opt/llvm@17/bin"

# Odin
export PATH="${PATH}:~/build/Odin"

export BASH_LOADABLES_PATH=${BASH_LOADABLES_PATH}:~/local/bash

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

source ~/.bashrc
