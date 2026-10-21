# Shell

# CLI messages (git etc.) in English; dates / currency still follow the system locale.
export LC_MESSAGES=en_US.UTF-8

alias dotfiles='cd "$DOTFILES"'
alias reload='exec zsh'

alias ll="eza -aghlH --sort=Name --time-style relative --group-directories-last --git --octal-permissions --icons=auto"
