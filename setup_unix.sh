#!/bin/sh
if [ -e ~/.vimrc ] ; then
	mv ~/.vimrc ~/.vimrc.old
fi
if [ -e ~/.gvimrc ] ; then
	mv ~/.gvimrc ~/.gvimrc.old
fi
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

echo "Run git submodule update --init --recursive"
echo "Then run make in ~/.vim/bundle/lusty and ~/.vim/bundle/vim-fsharp"
echo "Then go to ~/.vim/bundle/YouCompleteMe; do there"
echo "'python install.py --all'"
echo "Then run vim and execute ':Helptags'"
