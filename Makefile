# Dotfiles setup

SHELL := /bin/bash  # override default /bin/sh

help:
	echo "See Makefile for recipe list"

.PHONY: help


stow:
	stow -t $(HOME) conda
	stow -t $(HOME) nvim
	stow -t $(HOME) tmux
	stow -t $(HOME) zsh
	stow -t $(HOME) lazygit
	stow -t $(HOME) yazi
	stow -t $(HOME) fish
	stow -t $(HOME) kitty

ubuntu:
	sudo apt update
	sudo apt install git-all
	sudo apt install stow
	sudo apt install ripgrep
	sudo apt install jq
	sudo apt install build-essential
	sudo apt install zsh
	sudo apt install pipx
	sudo apt-get install ripgrep
	sudo apt install fzf
	sudo apt-get install jq

	pipx install bpytop
	pipx install pipenv
	pipx install "python-lsp-server[all]"

	# install neovim
	if [[ ! -d ~/nvim-linux64 ]]; then
	   wget -P ~ https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	   pushd ~
	   tar xvzf nvim-linux64.tar.gz
	   rm nvim-linux64.tar.gz
	   mv nvim-linux64 nvim
	   popd
	fi

	# install miniforge
	if [[ ! -d ~/miniforge ]]; then
	   mkdir -p ~/miniforge
	   wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O ~/miniforge/miniconda.sh
	   bash ~/miniforge/miniconda.sh -b -u -p ~/miniforge
	   rm -rf ~/miniforge/miniconda.sh
	fi

	stow -t $HOME -d os/linux git

macos:
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
	brew install koekeishiya/formulae/yabai
	brew install koekeishiya/formulae/skhd
	brew install ripgrep
	brew install jq
	brew install fzf
	brew install node
	brew install pipx
	brew install miniforge
	brew install lua-language-server
	brew install yazi
	brew install fish

	pipx install bpytop
	pipx install pipenv
	pipx install "python-lsp-server[all]"

	# install applications from homebrew
	brew install --cask kitty
	# brew install --cask iterm2
	# brew install --cask postgres-unofficial

	# link config from this repository
	stow -t $(HOME) -d os/macos skhd
	stow -t $(HOME) -d os/macos yabai
	stow -t $(HOME) -d os/macos git

	# link config from nextcloud
	if [[ -d ~/nextcloud.shamith.net ]]; then
		stow -t $(HOME) -d ~/nextcloud.shamith.net/computing secrets
		stow -t $(HOME) -d ~/nextcloud.shamith.net/computing rclone

		sudo chmod 0600 ~/nextcloud.shamith.net/computing/secrets/.ssh/*
		sudo chmod 0600 ~/nextcloud.shamith.net/computing/secrets/.gnupg/*
	else
		echo "Failed to get secrets: ~/nextcloud.shamith.net directory required"
		exit 1
	fi
	
