if has("gui_macvim")
        set background=light
        colorscheme macvim
        set guifont=Monaco:h16.00
        set fuoptions=maxvert,maxhorz
        " The IM behaviour is too strange for my taste so
        set imdisable
endif

if has("gui_gtk2")
        colorscheme darkblue
        set guifont=Liberation\ Mono\ 14
endif

set lines=40
set columns=80
