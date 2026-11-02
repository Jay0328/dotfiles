# GitHub CLI

# Run gh as the account in `git config github.user`, set by ~/.gitconfig-sporty /
# ~/.gitconfig-personal — the same rules that pick git's identity and SSH key.
# Fails instead of falling back to the active account when that one isn't logged in.
# `gh auth` is left alone so login / switch / status still see the real accounts.
gh() {
  local user token
  user=$(git config github.user 2>/dev/null)
  if [[ -z $user || $1 == auth ]]; then
    command gh "$@"
    return
  fi
  token=$(command gh auth token --user "$user" 2>/dev/null)
  if [[ -z $token ]]; then
    print -u2 "gh: $user is not logged in. Run: gh auth login -h github.com -p ssh --skip-ssh-key -w"
    return 1
  fi
  GH_TOKEN=$token command gh "$@"
}
