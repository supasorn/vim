#!/usr/bin/env sh

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
ln -sf ~/.vim/tmux.conf ~/.tmux.conf
ln -sf ~/.vim/zshrc ~/.zshrc

mkdir -p ~/.config/nvim
ln -sf ~/.vim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/lf
ln -sf ~/.vim/lfrc ~/.config/lf/lfrc
ln -sf ~/.vim/lfcd.sh ~/.config/lf/lfcd.sh

nvim +PlugInstall +qall

#cp ~/.vim/key-bindings.zsh ~/.fzf/shell/ 

#cd ~/.vim/plugged/FuzzyFinder
#curl -Lo fix-top-left-focus-bug.patch https://github.com/vim-scripts/FuzzyFinder/pull/2.diff
#patch -p1 <fix-top-left-focus-bug.patch
