#!/bin/bash

# Misc

alias l="eza -la --group-directories-first --git -O --icons"
alias lt="eza -la --git -T -O --icons -I .git"
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias lg=lazygit
alias ld=lazydocker
alias n=nvim
alias gemini-pro="GEMINI_MODEL=\"gemini-2.5-pro\" gemini"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Daily
# Eazy access dirs for temp stuff

DAILY_DIR="$HOME/daily"

daily() {
  mkdir -p "$DAILY_DIR/$(date +%Y%m%d)"
  cd "$DAILY_DIR/$(date +%Y%m%d)"
}

# Rsync

cpr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 "$@"
}

mvr() {
  rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files "$@"
}

gethostname() {
  if [ "$(uname)" = "Darwin" ]; then
    echo "$(hostname)"
  elif [ "$(uname)" = "Linux" ]; then
    cat "/etc/hostname"
  else
    echo "unknown"
  fi
}

backupr() {
  ssh homeserver "mkdir -p ~/backup/$(gethostname)/$(whoami)"
  rsync -a --delete --quiet -e ssh --exclude '.cache' $HOME/dev $DAILY_DIR homeserver:backup/$(gethostname)/$(whoami)
}

