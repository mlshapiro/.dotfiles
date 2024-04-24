#!/bin/bash

sudo apt update
sudo apt install stow
sudo apt install ripgrep
sudo apt install jq
sudo apt install build-essential
sudo apt install zsh
sudo apt install pipx

pipx install bpytop
pipx install pipenv

if [[ ! -d ~/nvim-linux64 ]]; then
   wget -P ~ https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
   pushd ~
   tar xvzf nvim-linux64.tar.gz
   rm nvim-linux64.tar.gz
   mv nvim-linux64 nvim
   popd
fi

if [[ ! -d ~/miniconda3 ]]; then
   mkdir -p ~/miniconda3
   wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
   bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
   rm -rf ~/miniconda3/miniconda.sh
fi

stow -t $HOME -d os/linux git
stow -t $HOME conda
stow -t $HOME nvim
stow -t $HOME tmux
stow -t $HOME zsh
