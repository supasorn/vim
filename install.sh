#!/usr/bin/env sh

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc

vim +PlugInstall +qall
