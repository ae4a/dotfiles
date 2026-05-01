# ****************** DEBUG ******************

# zmodload zsh/zprof

# ****************** Starship ******************

export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# ****************** Initial setup, some env ******************

# export LANG=en_US.UTF-8
CASE_SENSITIVE="true"
export EDITOR='nvim'
export PATH=$HOME/.local/bin:$HOME/.npm-global/bin:$(go env GOPATH)/bin:/Users/ae4/Library/Python/3.9/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config" # For lazygit

hash -d ...=../..
hash -d ....=../../..
hash -d .....=../../../..

source ~/.env
source ~/.config/scripts/aliases.sh
[ -f ~/.config/scripts/pg_aliases.sh ] && source ~/.config/scripts/pg_aliases.sh

setopt AUTO_CD

# ****************** Auto completion ******************

autoload -Uz compinit
compinit

# SSH

h=()
if [[ -r ~/.ssh/config ]]; then
 h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
# if [[ -r ~/.ssh/known_hosts ]]; then
#  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
# fi
if [[ $#h -gt 0 ]]; then
 zstyle ':completion:*:ssh:*' hosts $h
 zstyle ':completion:*:slogin:*' hosts $h
fi

# Makefile

zstyle ':completion:*:*:make:*' tag-order 'targets'

# ****************** Other modules and tools ******************

# Pet
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon

# Zoxide
eval "$(zoxide init zsh)"

# Fzf
source <(fzf --zsh)

# Atuin
#. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

# Remove vi mode
bindkey -e
bindkey '^p' pet-select

# Ghostty notifications
# if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
#   source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
# fi

: ${GHOSTTY_NOTIFY_MIN:=3}
: ${GHOSTTY_ICON:=/Applications/Ghostty.app/Contents/Resources/Ghostty.icns}

# Commands to suppress notifications for (prefix match)
GHOSTTY_NOTIFY_IGNORE=(
  nvim
  opencode
  lazygit
  man
  less
  htop
  lg
  n
  ssh
)

notify_done() {
  local dur="$1"
  local cmd="$2"

  local session window pane
  if [[ -n "$TMUX" ]]; then
    session="$(tmux display-message -p '#S' 2>/dev/null)"
    window="$(tmux display-message -p '#I:#W' 2>/dev/null)"
    pane="$(tmux display-message -p '#D' 2>/dev/null)"
  fi

  local ctx
  if [[ -n "$session" ]]; then
    ctx="${session} ${window}"
  else
    ctx="shell"
  fi

  local title="${ctx} • Done (${dur}s)"
  local message="${cmd//$'\n'/ }"
  (
    if [[ -n "$pane" ]]; then
      local active
      active="$(tmux display-message -p '#S:#I:#D' 2>/dev/null)"
      local win_index="${window%%:*}"
      [[ "$active" == "${session}:${win_index}:${pane}" ]] && exit 0
    fi
    local out
    out="$(alerter --message "$message" --title "$title" --app-icon "$GHOSTTY_ICON" </dev/null 2>/dev/null)"
    if [[ "$out" == "@CONTENTCLICKED" ]]; then
      osascript -e 'tell application "Ghostty" to activate' >/dev/null 2>&1
      if [[ "$TERM_PROGRAM" == "ghostty" && -n "$session" && -n "$window" ]]; then
        local win_index="${window%%:*}"
        tmux select-window -t "${session}:${win_index}" 2>/dev/null
      fi
    fi
  ) &!
}

# Track command start + command line
preexec() {
  typeset -g __notify_start=$EPOCHSECONDS
  typeset -g __notify_cmd="$1"
}
# On prompt: previous command finished
precmd() {
  local now=$EPOCHSECONDS
  local start=${__notify_start:-$now}
  local dur=$(( now - start ))
  (( dur >= GHOSTTY_NOTIFY_MIN )) || return
  [[ -n "$__notify_cmd" ]] || return
  local cmd_name="${__notify_cmd%% *}"
  for ignore in "${GHOSTTY_NOTIFY_IGNORE[@]}"; do
    [[ "$cmd_name" == "$ignore" ]] && return
  done
  notify_done "$dur" "$__notify_cmd"
}

# ****************** DEBUG ******************


# zprof
# time zsh -i -c exit
