#!/bin/sh
if [ -f ~/.vimrc ] ; then
	mv ~/.vimrc ~/.vimrc.old
fi
if [ -f ~/.gvimrc ] ; then
	mv ~/.gvimrc ~/.gvimrc.old
fi
if [ -f ~/.inputrc ] ; then
	mv ~/.inputrc ~/.inputrc.old
fi
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
ln -sf ~/.vim/inputrc ~/.inputrc
