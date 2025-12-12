#!/bin/bash

# References/sources
# https://github.com/sobolevn/dotfiles/blob/master/macos/settings.sh

# === Misc ===

# Disable language selection popup:
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0

# Screen saver
defaults write com.apple.screensaver idleTime -int 0
defaults write com.apple.screensaver.user idleTime -int 0

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -int 0
defaults write com.apple.dock autohide-delay -float 0

# === Finder ===

# Keep folders on top when sorting by name:
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show Finder path bar:
defaults write com.apple.finder ShowPathbar -bool true

# Do not show status bar in Finder:
defaults write com.apple.finder ShowStatusBar -bool false

# Show hidden files in Finder:
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions in Finder:
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show Library folder
chflags nohidden ~/Library

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Remove desctop
defaults write com.apple.finder CreateDesktop false

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# === App Store ===

# Disable in-app rating requests from apps downloaded from the App Store.
defaults write com.apple.appstore InAppReviewEnabled -int 0

# Restarting apps:
echo 'Restarting apps...'
killall Finder
killall Dock

echo 'Done!'
