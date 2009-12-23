#!/bin/sh
if [ -e ~/.vimrc ] ; then
	mv ~/.vimrc ~/.vimrc.old
fi
if [ -e ~/.gvimrc ] ; then
	mv ~/.gvimrc ~/.gvimrc.old
fi
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
