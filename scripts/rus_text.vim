setlocal spell
setlocal spelllang=ru_yo
setlocal spellfile=~/vimfiles/spell/my.ru.utf-8.add
setlocal nolist
setlocal linebreak

" Next two are unfortunately global
set showbreak=.\ \ 
set display+=lastline

map <buffer> <Down> gj
map <buffer> <Up> gk
imap <buffer> <Down> <C-o>gj
imap <buffer> <Up> <C-o>gk

" Fix the preivous spelling mistake in insert mode with C-l
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

so ~/vimfiles/scripts/iawriter_theme.vim
