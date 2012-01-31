"                        *** Please behave ***
set nocp
syntax on
filetype plugin on
filetype indent on
set modeline
set modelines=5
set backspace=indent,eol,start
set noequalalways
set expandtab
set showmatch
set path+=** " Search in all subdirectories

" Remember marks in 20 last files
" Remember up to 1000 lines per register
set viminfo='20,<1000

" Search options
set ignorecase
set smartcase
set incsearch

" Folding
set foldenable
set foldmethod=syntax

" Buffers
set switchbuf=usetab,newtab
map <Leader>bb :buf 
map <Leader>vb :vertical sb 


" Tabs
set tabpagemax=20

"                        *** Decorations ***
"set listchars=
set list
set listchars=tab:⇒⋄,trail:∴,extends:→,precedes:←,nbsp:·
"if ($TERM=="screen")
"        set nolist
"else
"        set list
"        set listchars=tab:⇒…,trail:∴,extends:→,precedes:←,nbsp:·
"endif
set ruler
set laststatus=2
set showcmd
set statusline=(%n)\ %(%h\ %)%t%(\ %m%)\ %y\ %=%(%c%V\ %l/%L(%P)%)

"                         *** Settings for text in Russian ***
map <Leader>rus :so ~/.vim/scripts/text.vim<C-M>

"                         *** Bindings ***
map <F4> <C-\><C-N>:ScratchTab<CR>
map <F5> <C-\><C-N>:ScratchWindow<CR>
map <F6> <C-\><C-N>:CloseScratch<CR>
map <F13> <C-\><C-N>:ScratchTab<CR>
map <F14> <C-\><C-N>:ScratchWindow<CR>
map <F15> <C-\><C-N>:CloseScratch<CR>
imap <F4> <C-\><C-N>:ScratchTab<CR>
imap <F5> <C-\><C-N>:ScratchWindow<CR>
imap <F6> <C-\><C-N>:CloseScratch<CR>
imap <F13> <C-\><C-N>:ScratchTab<CR>
imap <F14> <C-\><C-N>:ScratchWindow<CR>
imap <F15> <C-\><C-N>:CloseScratch<CR>

"                         *** Languages ***
"         *** C

set cino=:0

"         *** Haskell

" style

autocmd FileType haskell setlocal expandtab
autocmd FileType haskell setlocal softtabstop=4
autocmd FileType haskell setlocal shiftwidth=4

" use ghc functionality for haskell files
autocmd FileType haskell compiler ghc

" configure browser for haskell_doc.vim
" let g:haddock_browser="/Users/alexey/bin/openbrowser"
" let g:haddock_browser="w3m"
" let g:haddock_browser_callformat="%s file:///%s"
" let g:haddock_docdir="/opt/local/ghc-7.0.1/share/doc/ghc/html"
" let g:haddoc_indexfiledir="~/.vim"

" haskell interactivity - requires Ruby in vim
"autocmd FileType haskell source ~/.vim/plugin/shim.vim
"autocmd FileType haskell nmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell vmap <C-c><C-l> :GhciRange<CR>
"autocmd FileType haskell nmap <C-c><C-f> :GhciFile<CR>


"         *** Scheme
autocmd Filetype scheme source ~/.vim/ftplugin/SchemeMode.vim

"         *** Python
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal shiftwidth=4

"         *** OCaml
let g:ocaml_folding=1
autocmd FileType ocaml iabbrev <buffer> _ML (*<C-M><BS><BS>vim:sw=2<C-M>*)
autocmd FileType ocaml setlocal tw=0
autocmd FileType ocaml setlocal softtabstop=2
autocmd FileType ocaml setlocal shiftwidth=2

"         *** Lisp
let g:lisp_rainbow=1

"         *** Clojure
let g:vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1           " Rainbow parentheses'!

" ---------------------------------------------------------------------------
" Automagic Clojure folding on defn's and defmacro's
"
function GetClojureFold()
        "     if getline(v:lnum) =~ '^\s*(defn.*\s'
        "            return ">1"
        "      elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
        "            return ">1"
        "      elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
        "            return ">1"
        if getline(v:lnum) =~ '^(def'
                return ">1"
        elseif getline(v:lnum) =~ '^(ns\s'
                return ">1"
        elseif getline(v:lnum) =~ '^\s*$'
                let my_cljnum = v:lnum
                let my_cljmax = line("$")

                while (1)
                        let my_cljnum = my_cljnum + 1
                        if my_cljnum > my_cljmax
                                return "<1"
                        endif

                        let my_cljdata = getline(my_cljnum)

                        " If we match an empty line, stop folding
                        "if my_cljdata =~ '^$'
                        if my_cljdata =~ '^('
                                "return "<1"
                                return 0
                        elseif my_cljdata =~ '^;'
                        " Stop folding on top-level comments
                                return 0
                        else
                                return "="
                        endif
                endwhile
        else
                return "="
        endif
endfunction

function TurnOnClojureFolding()
      setlocal foldexpr=GetClojureFold()
      setlocal foldmethod=expr
endfunction

autocmd FileType clojure call TurnOnClojureFolding()
