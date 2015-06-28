colorscheme iawriter
set background=light
if has("gui_running")
        set linespace=5
        if has("gui_gtk2")
                " On my Ubuntu machine this does not work;
                " set guifont=Whatever happily uses some default font
                " without any error message
                set guifont=Cousine\ 12,Andale\ Mono\ 14
        endif
        if has("gui_macvim")
                set guifont=Cousine:h12.00,Menlo:h12.00
        endif
endif
