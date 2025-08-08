#zmodload zsh/zprof

# Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# Other plugins

CASE_SENSITIVE="true"
zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Env
# export LANG=en_US.UTF-8
export EDITOR='nvim'
export PATH=~/.npm-global/bin:$PATH
. "$HOME/.atuin/bin/env"

# Alias
alias l="eza -la --git -O --icons"
alias lt="eza -la --git -T -O --icons -I .git"
alias v=nvim

# Modules

eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"

#zprof
# time zsh -i -c exit
