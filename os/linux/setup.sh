#!/bin/bash

sudo apt update
sudo apt install git-all
sudo apt install stow
sudo apt install ripgrep
sudo apt install jq
sudo apt install build-essential
sudo apt install zsh
sudo apt install pipx

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
stow -t $HOME conda
stow -t $HOME nvim
stow -t $HOME tmux
stow -t $HOME zsh
stow -t $HOME lazygit
