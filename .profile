# Obviously.
export EDITOR=/usr/bin/vim

# Homebrew
export PATH=/opt/homebrew/bin:${PATH}

# Odin
export ODIN_ROOT=/Users/bdb/build/Odin

# Resolve ld issues with linking against MacOS versions.
export MACOSX_DEPLOYMENT_TARGET=12.0

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/bdb/build/Odin:$PATH"
export PATH="/Users/bdb/build/ols:$PATH"

# Use brew curl over system curl.
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

# Personal binaries
export PATH="/Users/bdb/bin:$PATH"

# Don't update brew packages automatically
export HOMEBREW_NO_AUTO_UPDATE=1

# LLVM at the start of $PATH to overrule the system LLVM
# that MacOS installs with Xcode.
export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"

export BASH_LOADABLES_PATH=${BASH_LOADABLES_PATH}:~/local/bash

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

source ~/.bashrc
