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

if [[ ! -d ~/miniforge3 ]]; then
   mkdir -p ~/miniforge3
   wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh -O ~/miniforge3/miniconda.sh
   bash ~/miniforge3/miniconda.sh -b -u -p ~/miniforge3
   rm -rf ~/miniforge3/miniconda.sh
fi

stow -t $HOME -d os/linux git
stow -t $HOME conda
stow -t $HOME nvim
stow -t $HOME tmux
stow -t $HOME zsh
