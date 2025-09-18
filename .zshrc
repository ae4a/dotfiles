#zmodload zsh/zprof

# Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# OMZ
zstyle ':omz:update' mode disabled  # disable auto updates
export OMZ="$HOME/.oh-my-zsh"

plugins=(
  git
  #zsh-autosuggestions
)

source $OMZ/oh-my-zsh.sh

# Env
# export LANG=en_US.UTF-8
CASE_SENSITIVE="true"
export EDITOR='nvim'
export PATH=~/.npm-global/bin:$PATH

# Alias
alias l="eza -la --git -O --icons"
alias lt="eza -la --git -T -O --icons -I .git"
alias lg=lazygit
alias v=nvim
alias b=bluetui
alias gemini-pro="GEMINI_MODEL=\"gemini-2.5-pro\" gemini"
alias daily="mkdir -p ~/z/current/daily/$(date +%Y%m%d); cd ~/z/current/daily/$(date +%Y%m%d)" # Eazy access dirs for temp stuff


# Modules

# Zoxide
eval "$(zoxide init zsh)"

# Fzf
source <(fzf --zsh)

# Atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

#zprof
# time zsh -i -c exit

eval $(thefuck --alias)
