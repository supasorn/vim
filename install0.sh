#!/bin/bash
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/supasorn/vim/master/install0.sh)"
sudo add-apt-repository --remove ppa:x4121/ripgrep
sudo add-apt-repository ppa:neovim-ppa/unstable
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get update
sudo apt -y install neovim vim zsh tmux curl ripgrep git exuberant-ctags nodejs
chsh -s /usr/bin/zsh
git clone https://github.com/supasorn/vim.git ~/.vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
sh ~/.vim/install.sh
zsh



