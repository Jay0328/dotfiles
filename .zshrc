# ~/.zshrc  (symlinked from dotfiles)

# Powerlevel10k instant prompt — must stay near the top.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Directory of this repo, resolved through the symlink.
export DOTFILES="${${(%):-%x}:A:h}"
: ${HOMEBREW_PREFIX:=/opt/homebrew}

# ---------------------------------------------------------------------------
# zim (modules listed in .zimrc)
# ---------------------------------------------------------------------------
# Point p10k at the repo so `p10k configure` writes here instead of replacing a symlink.
export POWERLEVEL9K_CONFIG_FILE="$DOTFILES/.p10k.zsh"
ZIM_HOME="$HOME/.zim"
ZIM_CONFIG_FILE="$DOTFILES/.zimrc"
# Install missing modules and rebuild init.zsh when .zimrc changes.
if [[ ! "$ZIM_HOME/init.zsh" -nt "$ZIM_CONFIG_FILE" ]]; then
  source "$HOMEBREW_PREFIX/opt/zimfw/share/zimfw.zsh" init
fi
source "$ZIM_HOME/init.zsh"
[[ -f "$POWERLEVEL9K_CONFIG_FILE" ]] && source "$POWERLEVEL9K_CONFIG_FILE"

# ---------------------------------------------------------------------------
# Per-feature config: zsh/*.zsh, then git-ignored zsh/*.local.zsh
# ---------------------------------------------------------------------------
for f in "$DOTFILES"/zsh/*.zsh(N); do
  [[ $f == *.local.zsh ]] || source "$f"
done
for f in "$DOTFILES"/zsh/*.local.zsh(N); do
  source "$f"
done
unset f
