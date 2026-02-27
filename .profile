# Obviously.
export EDITOR=/usr/bin/vim

# Odin
export ODIN_ROOT=/Users/bdb/build/Odin

# Resolve ld issues with linking against MacOS versions.
export MACOSX_DEPLOYMENT_TARGET=12.0

# Use brew curl over system curl.
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

################################################################
# START PATH MODIFICATIONS
################################################################
export PATH="/opt/homebrew/opt/postgresql@16/bin:${PATH}"

# Homebrew
export PATH=/opt/homebrew/bin:${PATH}

# Personal binaries
export PATH="${PATH}:/usr/local/bin"
export PATH="~/bin:${PATH}"
export PATH="~/.local/bin:${PATH}"

# LLVM for building Odin at the start of $PATH to overrule
# the system LLVM that MacOS installs with Xcode.
export PATH="/opt/homebrew/opt/llvm@14/bin:${PATH}"

# Odin
export PATH="${PATH}:${HOME}/build/Odin"
export PATH="${PATH}:${HOME}/build/ols"

################################################################
# END PATH MODIFICATIONS
################################################################

# Don't update brew packages automatically
export HOMEBREW_NO_AUTO_UPDATE=1

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
