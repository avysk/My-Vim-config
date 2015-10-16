"                         *** Pathogen -- set runtime path ***
call pathogen#infect()

"                        *** Please behave ***
set nocp
set modeline
set modelines=5
set backspace=indent,eol,start
set noequalalways
set expandtab
set showmatch
set hidden " Use hidden buffers liberally
set path+=** " Search in all subdirectories
set wildmode=list:longest

set hlsearch

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

" Relative line numbers
set rnu

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

"                         *** Bindings ***
" text in Russian
map <Leader>rus :so ~/.vim/scripts/rus_text.vim<C-M>
" text in Engling
map <Leader>eng :so ~/.vim/scripts/eng_text.vim<C-M>
" scratch
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
" tagbar
nmap <F12> :TagbarToggle<CR>
" Dash.app
nmap <silent> <F2> <Plug>DashSearch


"                        *** Plugins settings ***

"       *** Lusty explorer
" Silence message about non-available Ruby
let g:LustyJugglerSuppressRubyWarning = 1

"       *** Ultisnips
let g:UltiSnipsEditSplit="vertical"

"       *** VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'list_margin': 2}, {'path': '~/vimwiki', 'list_margin': 2}]
nmap <leader>tt <Plug>VimwikiToggleListItem

"         *** Git
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

"       *** Vimoutliner
autocmd FileType votl set listchars=tab:\ \ ,trail:∴,extends:→,precedes:←,nbsp:·



"                         *** Languages ***

"         *** INTERCAL
au BufRead,BufNewFile *.i set syntax=intercal

"         *** C
set cino=:0
" use clang for syntastic
let g:syntastic_c_compiler = 'clang'

"         *** FORTRAN
let fortran_free_source=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1
let fortran_more_precise=1
let fortran_do_enddo=1

"         *** Python
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal shiftwidth=4

"         *** OCaml
let g:ocaml_folding=1
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"let s:ocp_indent = 'source ' . g:opamshare . '/vim/syntax/ocp-indent.vim'
autocmd FileType ocaml iabbrev <buffer> _ML (*<C-M><BS><BS>vim:sw=2<C-M>*)
autocmd FileType ocaml setlocal tw=0
autocmd FileType ocaml setlocal softtabstop=2
autocmd FileType ocaml setlocal shiftwidth=2
"autocmd FileType ocaml exec s:ocp_indent

execute "set rtp+=" . g:opamshare . "/merlin/vim"

" use merlin for syntastic
let g:syntastic_ocaml_checkers = ['merlin']

"         *** Lisp
let g:lisp_rainbow=1

"         *** Scala
au BufRead,BufNewFile *.sc set filetype=scala

"         *** Javascript
let g:syntastic_javascript_jslint_args = "--white"

"         *** Julia
let g:latex_to_unicode_auto = 1


" KEEP THOSE AT THE BOTTOM
syntax on
filetype plugin on
filetype indent on
let g:typescript_use_builtin_tagbar_defs=1
