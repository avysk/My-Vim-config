setlocal spell
setlocal spelllang=ru_yo
setlocal spellfile=~/.vim/spell/my.ru.utf-8.add
setlocal nolist
setlocal linebreak

" Next two are unfortunately global
set showbreak=.\ \ 
set display+=lastline

map <buffer> <Down> gj
map <buffer> <Up> gk
imap <buffer> <Down> <C-o>gj
imap <buffer> <Up> <C-o>gk

so ~/.vim/scripts/iawriter_theme.vim
