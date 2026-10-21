# Homebrew

# `brew bundle` from any directory uses the Brewfile in this repo.
export HOMEBREW_BUNDLE_FILE="$DOTFILES/Brewfile"

# `brew install` / `brew uninstall` also add / remove the package in the Brewfile.
# Only the touched entries change, so machines with different packages don't
# overwrite each other the way `brew bundle dump` would.
brew() {
  command brew "$@" || return

  local cmd=$1 type= arg n line entry
  local -a names kinds lines
  case $cmd in
    install|uninstall|remove|rm) ;;
    *) return 0 ;;
  esac
  for arg in "${@:2}"; do
    case $arg in
      --cask|--casks) type=cask ;;
      --formula|--formulae) type=brew ;;
      -*) ;;
      *) names+=("$arg") ;;
    esac
  done
  (( $#names )) || return 0

  if [[ -n $type ]]; then
    kinds=($type)
  elif [[ $cmd == install ]]; then
    kinds=(brew)
  else
    kinds=(brew cask)
  fi
  # e.g. `brew "atlassian/acli/acli"`, `cask "ghostty"`
  lines=(${(f)"$(command grep -E "^(${(j:|:)kinds}) \"" "$HOMEBREW_BUNDLE_FILE")"})

  for n in $names; do
    # Entries may carry a tap prefix, so match on the last path segment.
    entry=
    for line in $lines; do
      line=${${line#* \"}%%\"*}
      [[ ${line:t} == ${n:t} ]] && { entry=$line; break }
    done
    if [[ $cmd == install ]]; then
      # `brew bundle add` appends duplicates, so skip what is already listed.
      [[ -n $entry ]] || command brew bundle add ${${type:#brew}:+--cask} "$n"
    elif [[ -n $entry ]]; then
      command brew bundle remove "$entry"
    fi
  done
}
