#!/usr/bin/env sh

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
ln -sf ~/.vim/tmux.conf ~/.tmux.conf
ln -sf ~/.vim/zshrc ~/.zshrc
cp ~/.vim/init.vim ~/.config/nvim/init.vim

vim +PlugInstall +qall
