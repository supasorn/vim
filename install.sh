#!/usr/bin/env sh

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo "Installing Vundle"
    git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc

vim +BundleInstall! +BundleClean +qall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
