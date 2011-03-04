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

" for MacVim
set imd

"                        *** Decorations ***
"set listchars=
set listchars=tab:⇒⋄,trail:∴,extends:→,precedes:←,nbsp:·
set list
set ruler
set laststatus=2
set showcmd

"                         *** Settings for text in Russian ***
map <F12> :so ~/.vim/scripts/text.vim<C-M>
imap <F12> <Esc>:so ~/.vim/scripts/text.vim<C-M>

"                         *** Languages ***
"         *** C

set cino=:0

"         *** Haskell

" style

autocmd FileType haskell set expandtab
autocmd FileType haskell set softtabstop=4
autocmd FileType haskell set shiftwidth=4

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
autocmd FileType python set softtabstop=4
autocmd FileType python set shiftwidth=4

"         *** OCaml
let g:ocaml_folding=1
ab _ML (*<C-M><BS><BS>vim:sw=2<C-M>*)


"         *** Lisp
let g:lisp_rainbow=1

"         *** Clojure
let g:vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1           " Rainbow parentheses'!

" ---------------------------------------------------------------------------
" Automagic Clojure folding on defn's and defmacro's
"
function GetClojureFold()
      if getline(v:lnum) =~ '^\s*(defn.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*(defmacro.*\s'
            return ">1"
      elseif getline(v:lnum) =~ '^\s*(defmethod.*\s'
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
                  if my_cljdata =~ '^$'
                        return "<1"
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
