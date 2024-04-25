#!/bin/bash

# remove terminal from dark mode theme
defaults write com.apple.Terminal NSRequiresAquaSystemAppearance -bool YES

# show all hidden files
defaults write com.apple.finder AppleShowAllFiles -boolean true; killall Finder

# install services from homebrew
brew install wget
brew install gnupg
brew install git
brew install lazygit
brew install stow
brew install restic
brew install rclone
brew install yabai 
brew install skhd
brew install ripgrep
brew install jq
brew install node
brew install pipx
brew install miniforge

pipx install bpytop
pipx install pipenv

# install applications from homebrew
brew install --cask iterm2
brew install --cask postgres-unofficial

# link config from this repository
stow -t $HOME -d os/macos skhd
stow -t $HOME -d os/macos yabai
stow -t $HOME -d os/macos git
stow -t $HOME conda
stow -t $HOME nvim
stow -t $HOME tmux
stow -t $HOME zsh

# link config from nextcloud
if [[ ! -d ~/nextcloud.shamith.net ]]; then
    stow -t $HOME -d ~/nextcloud.shamith.net/computing secrets
    stow -t $HOME -d ~/nextcloud.shamith.net/computing rclone
else
    exit "~/nextcloud.shamith.net directory required"
fi
