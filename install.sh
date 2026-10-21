#!/usr/bin/env bash
#
# Link the dotfiles in this repo into $HOME.
#
#   ./install.sh          link only (existing files are backed up first)
#   ./install.sh --deps   also install everything in Brewfile (zsh plugins are in .zimrc)
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# "<path in repo>  <path under $HOME>"
LINKS=(
  ".zprofile            .zprofile"
  ".zshrc               .zshrc"
  ".gitconfig           .gitconfig"
  ".gitconfig-personal  .gitconfig-personal"
  ".gitconfig-sporty    .gitconfig-sporty"
  ".ssh/config          .ssh/config"
)

say() { printf '  %-8s %s\n' "$1" "$2"; }

link() {
  local src="$DOTFILES/$1" dst="$HOME/$2"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    say ok "$2"
    return
  fi

  if [[ -e "$dst" || -L "$dst" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "$2")"
    mv "$dst" "$BACKUP_DIR/$2"
    say backup "$2 -> $BACKUP_DIR/$2"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  say link "$2 -> $src"
}

install_deps() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is not installed; see https://brew.sh" >&2
    exit 1
  fi
  brew bundle install --file="$DOTFILES/Brewfile"
}

main() {
  case "${1:-}" in
    --deps)
      echo "Dependencies:"
      install_deps
      echo
      ;;
    "") ;;
    *)
      sed -n '2,6p' "${BASH_SOURCE[0]}" | cut -c3-
      exit 1
      ;;
  esac

  echo "Dotfiles:"
  local entry src dst
  for entry in "${LINKS[@]}"; do
    read -r src dst <<<"$entry"
    link "$src" "$dst"
  done
  echo
  echo "Done. Restart your shell or run: exec zsh"
}

main "$@"
