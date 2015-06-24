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
"set noequalalways
set expandtab
set showmatch
set path+=** " Search in all subdirectories

" Remember marks in 20 last files
" Remember up to 1000 lines per register
set viminfo='20,<1000

" Search options
"set ignorecase
"set smartcase
set incsearch

" Folding
set foldenable
set foldmethod=syntax

" Buffers
set switchbuf=usetab,split
map <Leader>bb :buf 
map <Leader>vb :vertical sb 

" Tabs
set tabpagemax=1

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


"                         *** Languages ***
"         *** C

set cino=:0

"         *** Python
autocmd FileType python setlocal softtabstop=4
autocmd FileType python setlocal shiftwidth=4


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

set wildmode=longest,list

" No i (included files), takes too long...
set complete=.,w,b,u,t
