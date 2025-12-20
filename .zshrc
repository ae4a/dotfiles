# ****************** DEBUG ******************

# zmodload zsh/zprof

# ****************** Starship ******************

export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# ****************** Initial setup, some env ******************

# export LANG=en_US.UTF-8
CASE_SENSITIVE="true"
export EDITOR='nvim'
export PATH=~/.npm-global/bin:$(go env GOPATH)/bin:/Users/ae4/Library/Python/3.9/bin:$PATH

source ~/.config/scripts/aliases.sh
[ -f ~/.config/scripts/pg_aliases.sh ] && source ~/.config/scripts/pg_aliases.sh


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
bindkey '^p' pet-select

# Zoxide
eval "$(zoxide init zsh)"

# Fzf
source <(fzf --zsh)

# Atuin
#. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

# ****************** DEBUG ******************

# zprof
# time zsh -i -c exit
