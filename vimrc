language C

"                         *** Pathogen -- set runtime path ***
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"                        *** Please behave ***
set nocompatible

" Use space for leader
nnoremap <Space> <Nop>
nmap <Space> <Leader>

set backspace=indent,eol,start
set expandtab

set modeline
set modelines=5

set path+=** " Search in all subdirectories

set showmatch
set noequalalways
set wildmode=list:longest
set relativenumber

" Remember marks in 20 last files
" Remember up to 1000 lines per register
set viminfo='20,<1000

" Permanent undo
if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim_undo_files
    set undolevels=5000
endif

" Search options
set ignorecase
set smartcase
set incsearch
set hlsearch

" Folding
set foldenable
set foldmethod=syntax

" Buffers
set hidden " Use hidden buffers liberally
set switchbuf=usetab,newtab
map <Leader>bb :buf 
map <Leader>vb :vertical sb 

" Tabs
set tabpagemax=20


"                        *** Decorations ***
"set listchars=
"set list
"set listchars=tab:¿¿,trail:¿,extends:¿,precedes:¿,nbsp:·
"if ($TERM=="screen")
"        set nolist
"else
"        set list
"        set listchars=tab:¿¿,trail:¿,extends:¿,precedes:¿,nbsp:·
"endif
set ruler
set laststatus=2
set showcmd

"                         *** Bindings ***
" text in Russian
map <Leader>rus :so ~/vimfiles/scripts/rus_text.vim<C-M>
" text in Engling
map <Leader>eng :so ~/vimfiles/scripts/eng_text.vim<C-M>
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

" Right/Left to move through location list (e.g. Syntastic errors)
nnoremap <Right> :lnext<CR>
nnoremap <Left> :lprev<CR>
" PgDown to drop search highlighting
nnoremap <PageDown> :nohl<CR>
inoremap <PageDown> <C-O>:nohl<CR>
" PgUp to go to alternate file
nnoremap <PageUp> <C-^>

"                        *** Plugins settings ***

"       *** Lusty explorer
" Silence message about non-available Ruby
let g:LustyJugglerSuppressRubyWarning = 1

"       *** Ultisnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<Right>"
let g:UltiSnipsListSnippets="<Left>"
let g:UltiSnipsJumpForwardTrigger="<Down>"
let g:UltiSnipsJumpBackwardTrigger="<Up>"


"       *** VimWiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'list_margin': 2},
                    \ {'path': '~/vimwiki', 'list_margin': 2},
                    \ {'path': '~/Dropbox/vimwiki-md', 'list_margin': 2, 'syntax': 'markdown', 'ext': '.md'}]
nmap <leader>tt <Plug>VimwikiToggleListItem
autocmd FileType vimwiki set tw=80

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

"       *** Syntastic
let g:syntastic_always_populate_loc_list = 1
" be passive on go
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


"       *** Vimoutliner
autocmd FileType votl set listchars=tab:\ \ ,trail:¿,extends:¿,precedes:¿,nbsp:·



"                         *** Languages ***

"         *** INTERCAL
au BufRead,BufNewFile *.i set syntax=intercal

"         *** C
set cino=:0
" use gcc for syntastic
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=gnu99 -Wall -I/opt/local/include'

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
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']

"         *** Lisp
let g:lisp_rainbow=1

"         *** Scala
au BufRead,BufNewFile *.sc set filetype=scala

"         *** Javascript
let g:syntastic_javascript_jslint_args = "--white"
" ...and jsx extensions
let g:jsx_ext_required = 0

"         *** Julia
let g:latex_to_unicode_auto = 1

"         *** Typescript
let g:typescript_use_builtin_tagbar_defs=1

"         *** Ruby
autocmd FileType ruby setlocal softtabstop=2
autocmd FileType ruby setlocal shiftwidth=2
"autocmd FileType ruby setlocal makeprg=rake\ -s
autocmd FileType ruby compiler rspec
let g:syntastic_ruby_checkers=['rubocop', 'mri']
" let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

"         *** Rust
let g:racer_cmd=$HOME . "/.cargo/bin/racer"
let $RUST_SRC_PATH=$HOME . "/Projects/External/rustc-1.10.0/src/"

"         *** Go
autocmd FileType go set listchars=tab:⋄\ ,trail:∴,extends:→,precedes:←,nbsp:·
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
let g:go_list_type = "quickfix"

" KEEP THOSE AT THE BOTTOM
syntax on
filetype plugin on
filetype indent on

set encoding=utf-8
set fileencoding=utf-8
