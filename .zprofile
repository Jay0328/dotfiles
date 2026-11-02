# ~/.zprofile — login shells only.

eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# User-level binaries (herdr-app, hc)
export PATH="$HOME/.local/bin:$PATH"
