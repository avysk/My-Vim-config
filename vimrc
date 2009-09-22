"                        *** Please behave ***
set nocp
syntax on
filetype plugin on
filetype indent on
set modeline
set backspace=indent,eol,start
set noequalalways
set expandtab

"                        *** Decorations ***
set listchars=tab:⇒⋄,trail:∴,extends:→,precedes:←,nbsp:·
set list
set ruler
set laststatus=2
set showcmd
set wildmenu

"                         *** Languages ***
"         *** Haskell

" style

autocmd FileType haskell set expandtab

" use ghc functionality for haskell files
autocmd FileType haskell compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser="/Users/alexey/bin/openbrowser"
let g:haddock_browser_callformat="%s file:///%s"
let g:haddock_docdir="/opt/local/share/ghc-6.10.1/doc/ghc/"
let g:haddoc_indexfiledir="~/.vim"

" haskell interactivity
"autocmd FileType haskell source ~/.vim/plugin/shim.vim
"autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>


"         *** Scheme
autocmd Filetype scheme source ~/.vim/ftplugin/SchemeMode.vim
