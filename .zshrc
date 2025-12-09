#zmodload zsh/zprof

# Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# OMZ
#zstyle ':omz:update' mode disabled  # disable auto updates
#export OMZ="$HOME/.oh-my-zsh"

#plugins=(
#  git
#  #zsh-autosuggestions
#)

#source $OMZ/oh-my-zsh.sh

# Env
# export LANG=en_US.UTF-8
CASE_SENSITIVE="true"
export EDITOR='nvim'
export PATH=~/.npm-global/bin:$(go env GOPATH)/bin:/Users/ae4/Library/Python/3.9/bin:$PATH

source ~/.config/scripts/aliases.sh
[ -f ~/.config/scripts/pg_aliases.sh ] && source ~/.config/scripts/pg_aliases.sh
# Modules

# Zoxide
eval "$(zoxide init zsh)"

# Fzf
source <(fzf --zsh)

# Atuin
#. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh --disable-up-arrow)"

#zprof
# time zsh -i -c exit

#eval $(thefuck --alias)
