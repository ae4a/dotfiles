#!/bin/bash

# Packages
sudo pacman -Sy --noconfirm --needed zsh curl stow eza mc nvim tmux zoxide starship ttf-jetbrains-mono-nerd atuin

# Font cache update
fc-cache -f -v

# Change default shell to zsh
shch -s /bin/zsh

stow .
