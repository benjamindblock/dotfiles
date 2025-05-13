################################################################
# START PATH MODIFICATIONS
################################################################
export PATH="/opt/homebrew/opt/postgresql@16/bin:${PATH}"

# M1-specific configs.
if [[ "$(uname -m)" == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:${PATH}"
  export PATH="/opt/homebrew/opt/curl/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
fi

# Personal binaries
export PATH="${PATH}:/usr/local/bin"
export PATH="$HOME/bin:${PATH}"

# LLVM for building Odin at the start of $PATH to overrule
# the system LLVM that MacOS installs with Xcode.
export PATH="${PATH}:/usr/local/opt/llvm@17/bin"
export PATH="/opt/homebrew/opt/llvm@14/bin:${PATH}"

# Odin
export PATH="${PATH}:$HOME/build/Odin"
export PATH="${PATH}:$HOME/build/ols"

################################################################
# END PATH MODIFICATIONS
################################################################

# Obviously.
export EDITOR="$(which vim)"

# Odin
export ODIN_ROOT="$HOME/build/Odin"

# Don't update brew packages automatically
export HOMEBREW_NO_AUTO_UPDATE=1

# Colorize.
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Kubeconfig
export KUBECONFIG="$HOME/.kube/kubeconfig-bblock@syntaxdata.com.yaml"

# Brew setup.
eval "$(/opt/homebrew/bin/brew shellenv)"

source "$HOME/.bashrc"
