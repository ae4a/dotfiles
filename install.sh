#!/bin/bash

# Packages
sudo pacman -Sy zsh curl mc nvim tmux zoxide starship ttf-jetbrains-mono-nerd

# Font cache update
fc-cache -f -v

# OMZ
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell to zsh
shch -s /bin/zsh
