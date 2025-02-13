# Dotfiles setup

SHELL := /bin/bash  # override default /bin/sh

help:
	echo "See Makefile for recipe list"

.PHONY: help

stow:
	# Generic stow directories regardless of platform
	stow -t $(HOME) conda
	stow -t $(HOME) nvim
	stow -t $(HOME) tmux
	stow -t $(HOME) zsh
	stow -t $(HOME) lazygit
	stow -t $(HOME) yazi

	# Add scripts directory
	sudo chmod 0755 scripts/.scripts/*
	stow -t $(HOME) scripts

vm:
	sudo apt update
	sudo apt install git-all
	sudo apt install stow
	sudo apt install ripgrep
	sudo apt install jq
	sudo apt install build-essential
	sudo apt install zsh
	sudo apt install pipx
	sudo apt install fzf
	sudo apt install neovim

	pipx install bpytop
	pipx install pipenv
	pipx install "python-lsp-server[all]"

	# install rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	# rust utilities
	cargo install --locked yazi-fm yazi-cli

	# install miniforge
	if [[ ! -d ~/miniforge ]]; then
	   mkdir -p ~/miniforge
	   wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O ~/miniforge/miniconda.sh
	   bash ~/miniforge/miniconda.sh -b -u -p ~/miniforge
	   rm -rf ~/miniforge/miniconda.sh
	fi

	# link config from this repository
	make stow
	stow -t $(HOME) -d os/linux git

linux:
	# start from vm install
	make vm

	# sublime text config
	stow -t $(HOME)/.config/sublime-text/Packages sublime-text

	# # install zed
	# curl -f https://zed.dev/install.sh | sh
	# stow -t $(HOME) zed

	# # install wezterm
	# stow -t $(HOME) wezterm

macos:

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

	# terminal
	brew install ripgrep
	brew install jq
	brew install fzf
	brew install fd
	brew install yazi
	# brew install fish

	# neovim
	brew install neovim
	brew install lua-language-server

	# languages
	brew install node
	brew install miniforge
	brew install pipx
	pipx install pipenv
	pipx install "python-lsp-server[all]"
	pipx install bpytop
	brew install chruby ruby-install

	# https://jekyllrb.com/docs/installation/macos/
	ruby-install ruby 3.3.5

	# install rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	# install applications from homebrew
	brew install --cask sublime-text
	brew install --cask sublime-merge
	# brew install --cask iterm2
	# brew install --cask postgres-unofficial
	# brew install --cask zed
	# brew install --cask zen-browser

	# stow for macos
	make stow
	stow -t $(HOME) zed
	stow -t $(HOME) wezterm
	stow -t $(HOME) -d os/macos git
	stow -t $(HOME) -d os/macos skhd
	stow -t $(HOME) -d os/macos yabai
	stow -t $(HOME) -d os/macos Library
	stow -t $(HOME)/Library/Application\ Support/Sublime\ Text/Packages sublime-text
	# stow -t $(HOME) fish

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
