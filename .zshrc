# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
  git
  branch
)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8

export EDITOR='nvim'

alias l="eza -la --git -O --icons"
alias lt="eza -la --git -T -O --icons -I .git"
alias v=nvim

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"
