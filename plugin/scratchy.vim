" Vim scratch buffer implementation
" Alexey Vyskubov <alexey@ocaml.nl>

" Do this only once
"if exists("scratchy_version")
"        finish
"endif

let scratchy_version = "0.1"

let ScratchName = "--scratch--"

" Open scratch window
function! OpenScratchWindow()
    let l:old_tab = tabpagenr()
    execute "tabdo CloseScratch"
    execute "tabn " . old_tab
    if bufexists("--scratch--")
        execute "vertical 40new"
        execute "buf --scratch--"
    else
        execute "vertical 40new"
        execute "file --scratch--"
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
    endif
endfunction

" Close scratch window in tab
function! CloseScratchWindow()
    let winnr=bufwinnr("--scratch--")
    if winnr > 0
        execute winnr . "wincmd w"
        execute "wincmd c"
    endif
endfunction

" Open scratch tab
function! OpenScratchTab()
    let s:old_tab = tabpagenr()
    execute "tabdo CloseScratch"
    if bufexists("--scratch--")
        execute "tab sbuffer --scratch--"
    else
        execute "tabe --scratch--"
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
    endif
endfunction

" Return back
function! JumpBack()
    echo s:old_tab
    execute "tabn" . s:old_tab
endfunction

command! -nargs=0 Scratch call OpenScratchTab()
command! -nargs=0 JumpBack call JumpBack()
command! -nargs=0 OpenScratch call OpenScratchWindow()
command! -nargs=0 CloseScratch call CloseScratchWindow()
map <F4> :Scratch<CR>
"map <F5> :JumpBack<CR>
map <F5> :OpenScratch<CR>
map <F6> :CloseScratch<CR>

"vim:sts=4:sw=4
