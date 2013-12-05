"                         *** Pathogen -- set runtime path ***
call pathogen#infect()

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

"         *** INTERCAL
au BufRead,BufNewFile *.i set syntax=intercal

"         *** C
set cino=:0

"         *** FORTRAN
let fortran_free_source=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1
let fortran_more_precise=1
let fortran_do_enddo=1

"         *** Scheme
autocmd Filetype scheme source ~/.vim/ftplugin/SchemeMode.vim

"         *** Python
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal shiftwidth=4

"         *** OCaml
let g:ocaml_folding=1
let s:opam_share = substitute(system('opam config var share'), '\n', '', '')
let s:ocp_indent = 'source ' . s:opam_share . '/vim/syntax/ocp-indent.vim'
autocmd FileType ocaml iabbrev <buffer> _ML (*<C-M><BS><BS>vim:sw=2<C-M>*)
autocmd FileType ocaml setlocal tw=0
autocmd FileType ocaml setlocal softtabstop=2
autocmd FileType ocaml setlocal shiftwidth=2
exec s:ocp_indent

let s:merlin_path_1 = 'set rtp+=' . s:opam_share . '/ocamlmerlin/vim'
let s:merlin_path_2 = 'set rtp+=' . s:opam_share . '/ocamlmerlin/vimbufsync'

" Broken for macvim
" exec s:merlin_path_1
" exec s:merlin_path_2

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

" Twitter
if has ("python")
        let twitvim_enable_python = 1
endif
let twitvim_count = 20

" Autoremove fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" More fugitive hacks
function IsFugitive()
    if stridx(bufname(""),"fugitive://") == 0
        return "[!!!]"
    else
        return bufnr("")
    endif
endfunction


set statusline=(%{IsFugitive()})\ %(%h\ %)%t%(\ %m%)\ %y\ %=%(%c%V\ %l/%L(%P)%)
