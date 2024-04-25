#!/bin/bash

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

stow -t $HOME -d machine/$(hostname) firefox
stow -t $HOME -d os/macos skhd
stow -t $HOME -d os/macos yabai
stow -t $HOME -d os/macos git
stow -t $HOME conda
stow -t $HOME nvim
stow -t $HOME tmux
stow -t $HOME zsh
