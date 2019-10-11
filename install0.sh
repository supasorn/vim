#!/bin/bash
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt-get update
sudo apt -y install neovim vim zsh tmux curl ripgrep
chsh -s /usr/bin/zsh
git clone https://github.com/supasorn/vim.git ~/.vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
sh ~/.vim/install.sh
zsh
