#!/bin/sh
if [ -e ~/.vimrc ] ; then
	mv ~/.vimrc ~/.vimrc.old
fi
if [ -e ~/.gvimrc ] ; then
	mv ~/.gvimrc ~/.gvimrc.old
fi
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

echo "Run git submodule init; git submodule update"
echo "Run third-party/vimoutliner/install.sh"
