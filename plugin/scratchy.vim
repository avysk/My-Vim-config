" Vim scratch buffer implementation
" Alexey Vyskubov <alexey@ocaml.nl>

" Do this only once
if exists("scratchy_version")
        finish
endif

" map <F13> <C-\><C-N>:ScratchTab<CR>
" map <F14> <C-\><C-N>:ScratchWindow<CR>
" map <F15> <C-\><C-N>:CloseScratch<CR>
" imap <F13> <C-\><C-N>:ScratchTab<CR>
" imap <F14> <C-\><C-N>:ScratchWindow<CR>
" imap <F15> <C-\><C-N>:CloseScratch<CR>

let s:scratch_name = "--scratch--"
let s:scratch_geometry = "vertical rightbelow 40"
"let s:scratch_geometry = "topleft 20"

" Nothing to touch below this line
" --------------------------------
let scratchy_version = "0.2"

" Close scratch window or tab
function CloseScratch()
    let l:win_num = bufwinnr(s:scratch_name)
    if l:win_num > 0
        " Close scratch window in the current tab
        execute win_num . "wincmd w"
        execute "wincmd c"
        execute "wincmd ="
    endif
endfunction

" Open scratch window
function OpenScratchWindow()
    let l:old_tab = tabpagenr()
    execute "tabdo CloseScratch"
    execute "tabn " . old_tab
    if bufexists(s:scratch_name)
        execute s:scratch_geometry . "new"
        execute "buf ". s:scratch_name
    else
        execute s:scratch_geometry . "new"
        execute "file " . s:scratch_name
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
    endif
endfunction

" Open scratch tab
function OpenScratchTab()
    let s:old_tab = tabpagenr()
    execute "tabdo CloseScratch"
    if bufexists(s:scratch_name)
        execute "tabe"
        execute "buf " . s:scratch_name
    else
        execute "tabe " . s:scratch_name
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
    endif
    let t:is_scratch_tab=1
endfunction

" Return back
function JumpBack()
    echo s:old_tab
    execute "tabn" . s:old_tab
endfunction

" Open scratch tab if not there, go back if we're there
function ToggleScratchTab()
    if gettabvar(tabpagenr(), "is_scratch_tab")
        call JumpBack()
    else
        call OpenScratchTab()
    endif
endfunction

" Open scratch window if we don't have one, close if we do
function ToggleScratchWindow()
    if gettabvar(tabpagenr(), "is_scratch_tab")
        call JumpBack()
    else
        let l:win_num = bufwinnr(s:scratch_name)
        if l:win_num > 0
            call CloseScratch()
        else
            call OpenScratchWindow()
        endif
    endif
endfunction

command -nargs=0 ScratchTab call ToggleScratchTab()
command -nargs=0 ScratchWindow call ToggleScratchWindow()
command -nargs=0 CloseScratch call CloseScratch()

" vim:sts=4:sw=4
