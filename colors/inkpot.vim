" Vim color file
" Maintainer: Ciaran McCreesh <ciaranm@gentoo.org>
" This should work in the GUI and on 88/256 colour terminals (urxvt and some
" Xterm versions). It won't work in 8/16 colour terminals.

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "inkpot"

"hi   Normal         gui=NONE   guifg=#cfbfad   guibg=#1e1e27   cterm=NONE   ctermfg=78   ctermbg=80
hi   Normal         gui=NONE   guifg=#cfbfad   guibg=#1e1e27   cterm=NONE   ctermfg=78   ctermbg=NONE
hi   IncSearch      gui=BOLD   guifg=#303030   guibg=#cd8b60   cterm=BOLD   ctermfg=80   ctermbg=73
hi   Search         gui=NONE   guifg=#303030   guibg=#cd8b60   cterm=NONE   ctermfg=80   ctermbg=73
hi   ErrorMsg       gui=BOLD   guifg=#ffffff   guibg=#ff3300   cterm=BOLD   ctermfg=79   ctermbg=64
hi   WarningMsg     gui=BOLD   guifg=#ffffff   guibg=#ff6600   cterm=BOLD   ctermfg=79   ctermbg=68
hi   ModeMsg        gui=BOLD   guifg=#7e7eae   guibg=NONE      cterm=BOLD   ctermfg=39
hi   MoreMsg        gui=BOLD   guifg=#7e7eae   guibg=NONE      cterm=BOLD   ctermfg=39
hi   Question       gui=BOLD   guifg=#ffcd00   guibg=NONE      cterm=BOLD   ctermfg=72
hi   StatusLine     gui=BOLD   guifg=#b9b9b9   guibg=#3e3e5e   cterm=BOLD   ctermfg=84   ctermbg=81
hi   StatusLineNC   gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e   cterm=NONE   ctermfg=84   ctermbg=81
hi   VertSplit      gui=NONE   guifg=#b9b9b9   guibg=#3e3e5e   cterm=NONE   ctermfg=84   ctermbg=82
hi   WildMenu       gui=BOLD   guifg=#ffcd00   guibg=#1e1e2e   cterm=BOLD   ctermfg=72   ctermbg=80

hi   DiffText       gui=NONE   guifg=#ffffcd   guibg=#00cd00   cterm=NONE   ctermfg=78   ctermbg=24
hi   DiffChange     gui=NONE   guifg=#ffffcd   guibg=#008bff   cterm=NONE   ctermfg=78   ctermbg=23
hi   DiffDelete     gui=NONE   guifg=#ffffcd   guibg=#cd0000   cterm=NONE   ctermfg=78   ctermbg=48
hi   DiffAdd        gui=NONE   guifg=#ffffcd   guibg=#00cd00   cterm=NONE   ctermfg=78   ctermbg=24

hi   Cursor         gui=NONE   guifg=#404040   guibg=#8b8bff   cterm=NONE   ctermfg=8    ctermbg=39
hi   lCursor        gui=NONE   guifg=#404040   guibg=#8b8bff   cterm=NONE   ctermfg=8    ctermbg=39
hi   CursorIM       gui=NONE   guifg=#404040   guibg=#8b8bff   cterm=NONE   ctermfg=8    ctermbg=39

hi   Folded         gui=NONE   guifg=#cfcfcd   guibg=#4b208f   cterm=NONE   ctermfg=78   ctermbg=35
hi   FoldColumn     gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e   cterm=NONE   ctermfg=38   ctermbg=80

hi   Directory      gui=NONE   guifg=#00ff8b   guibg=NONE      cterm=NONE   ctermfg=29   ctermbg=NONE
"hi   LineNr         gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e   cterm=NONE   ctermfg=38   ctermbg=80
hi   LineNr         gui=NONE   guifg=#8b8bcd   guibg=#2e2e2e   cterm=NONE   ctermfg=38   ctermbg=NONE
hi   NonText        gui=BOLD   guifg=#8b8bcd   guibg=NONE      cterm=BOLD   ctermfg=38   ctermbg=NONE
hi   SpecialKey     gui=BOLD   guifg=#8b00cd   guibg=NONE      cterm=BOLD   ctermfg=34   ctermbg=NONE
hi   Title          gui=BOLD   guifg=#af4f4b   guibg=#1e1e27   cterm=BOLD   ctermfg=52   ctermbg=80
hi   Visual         gui=NONE   guifg=#cd8b00   guibg=#ffffcd   cterm=NONE   ctermfg=52   ctermbg=78

hi   Comment        gui=NONE   guifg=#cd8b00   guibg=NONE      cterm=NONE   ctermfg=52   ctermbg=NONE
hi   Constant       gui=NONE   guifg=#ffcd8b   guibg=NONE      cterm=NONE   ctermfg=73   ctermbg=NONE
"hi   String         gui=NONE   guifg=#ffcd8b   guibg=#404040   cterm=NONE   ctermfg=73   ctermbg=8
hi   String         gui=NONE   guifg=#ffcd8b   guibg=#404040   cterm=NONE   ctermfg=73   ctermbg=NONE
hi   Error          gui=NONE   guifg=#ffffff   guibg=#ff0000   cterm=NONE   ctermfg=79   ctermbg=64
hi   Identifier     gui=NONE   guifg=#ff8bff   guibg=NONE      cterm=NONE   ctermfg=71   ctermbg=NONE
hi   Ignore         gui=NONE   guifg=#8b8bcd   guibg=NONE      cterm=NONE   ctermfg=38   ctermbg=NONE
hi   Number         gui=NONE   guifg=#506dbd   guibg=NONE      cterm=NONE   ctermfg=22   ctermbg=NONE
hi   PreProc        gui=NONE   guifg=#409090   guibg=NONE      cterm=NONE   ctermfg=10   ctermbg=NONE
hi   Special        gui=NONE   guifg=#c080d0   guibg=NONE      cterm=NONE   ctermfg=39   ctermbg=NONE
hi   Statement      gui=NONE   guifg=#808bed   guibg=NONE      cterm=NONE   ctermfg=26   ctermbg=NONE
hi   Todo           gui=BOLD   guifg=#303030   guibg=#c08040   cterm=BOLD   ctermfg=08   ctermbg=68
hi   Type           gui=NONE   guifg=#ff8bff   guibg=NONE      cterm=NONE   ctermfg=71   ctermbg=NONE
hi   Underlined     gui=BOLD   guifg=#ffffcd   guibg=NONE      cterm=BOLD   ctermfg=78   ctermbg=NONE

