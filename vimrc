"--------------------------------
"-- VIM Configuration
"-- Kyle Usbeck
"--
"-- Many of these are options are derived from elsewhere,
"-- so thanks to all who helped!
"--------------------------------

"-- Syntax Coloring for Specific terminals
if has("terminfo")
  set t_Co=16
  set t_Sf=^[[3%p1%dm
  set t_Sb=
  set t_vb=
else
  set t_Co=16
  set t_Sf=^[[3%dm
  set t_Sb=^[[4%dm
  set t_vb=
endif

"-- Settings
syntax on
set backspace=2
set noinsertmode
set smartindent
set autoindent
set showmatch
set ruler
set showcmd
set nowrap
set noerrorbells
set magic
set report=0
set shell=/bin/bash
set showmode
set visualbell
set backup
set writebackup
set backupdir=~/.backups,/tmp
set number
set autowrite
set incsearch 
set hlsearch
set showcmd 
set mouse=n
set joinspaces 
set cinoptions=>s,{0,}0,?0,^0,:0,=s,p0,t0,+s,(0,)20,*30
set shiftround
set iskeyword=@,48-57,_,192-255,-,.,:,/,@-@
set lazyredraw
set wildchar=<TAB>
"set makeprg=gcc\ -o\ %<\ %
set nocompatible
set hidden
set noicon
set modeline
set modelines=1
set shortmess=I
set grepprg=grep\ -nH\ $*
set pastetoggle=<Insert>

"-- Spaces (not tabs) 
set expandtab  
set tabstop=3
set shiftwidth=3

"-- Tab completion
function! InsertTabWrapper(direction)
   let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
   elseif "backward" == a:direction
      return "\<c-p>"
   else
      return "\<c-n>"
   endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"-- Syntax Highlighting
"highlight Comment     NONE
"highlight Constant    NONE
highlight Delimiter   NONE
highlight Directory   NONE
highlight Error       NONE
highlight ErrorMsg    NONE
highlight Folded      NONE
highlight Identifier  NONE
highlight LineNr      NONE
highlight ModeMsg     NONE
highlight MoreMsg     NONE
"highlight Normal      NONE
highlight NonText     NONE
"highlight PreProc     NONE
highlight Question    NONE
highlight Search      NONE
highlight Special     NONE
highlight SpecialKey  NONE
highlight Statement   NONE
highlight StatusLine  NONE
highlight Title       NONE
highlight Todo        NONE
highlight Type        NONE
highlight Visual      NONE
highlight WarningMsg  NONE

"-- syntax highlighting, if you want to change the colors here is your guide
"-- 0 = black, 1 = red, 2 = green, 3 = yellow,
"-- 4 = blue, 5 = magenta 6 = cyan, 7 = white
"highlight Comment         ctermbg=2  ctermfg=7
"highlight Constant        cterm=bold ctermfg=5
highlight Comment          ctermfg=6
highlight Delimiter        cterm=bold ctermfg=1
highlight Conditional      cterm=bold ctermfg=3
"highlight Macro           cterm=bold ctermfg=5
highlight Folded           ctermfg=yellow ctermbg=blue cterm=NONE 
highlight Directory        ctermfg=DarkBlue
highlight Error            cterm=bold ctermfg=1 ctermbg=2
highlight ErrorMsg         cterm=bold ctermfg=1
highlight Include          ctermfg=5
highlight Identifier       ctermfg=3
highlight LineNr           cterm=none ctermfg=7 ctermbg=0
highlight ModeMsg          cterm=bold ctermfg=3 ctermbg=1
highlight MoreMsg          cterm=bold ctermfg=2
highlight NonText          cterm=bold ctermfg=4
"highlight Normal          cterm=bold ctermfg=15 ctermbg=0
"highlight PreProc         ctermfg=14
highlight Question         cterm=bold ctermfg=2
highlight Search           ctermbg=2
highlight Special          cterm=bold ctermfg=4
highlight Operator         cterm=bold ctermfg=1
highlight SpecialKey       ctermfg=DarkBlue
highlight Statement        cterm=bold ctermfg=3
highlight StatusLine       ctermfg=0 ctermbg=7
highlight StatusLineNC     cterm=bold ctermfg=0 ctermbg=3
highlight Title            cterm=bold ctermfg=4
highlight Todo             ctermfg=red ctermbg=yellow
highlight Type             cterm=bold ctermfg=2
highlight Visual           cterm=bold ctermfg=1 ctermbg=3
highlight WarningMsg       cterm=bold ctermfg=1 ctermbg=4

"-- custom keymappings, this will change frequently
map :W :w
map <C-Z>       :shell<CR>
map <C-S>       <C-D>
map ,deb o#ifdef SYSLOG<CR>fprintf(stderr,ANSI_COLOR_RED)&lt;CR>fprintf(stderr,"\n")&lt;CR>fprintf(stderr,COLOR_OFF)&lt;CR>#endif<ESC>kk$hhhhi
map ,m :w<CR>:!make<CR>
map ,Kom o/**/<ESC>hi<RETURN>*<RETURN><ESC>60a*<ESC>kk60i*<ESC>jYpPA<SPACE>
map ,kom o/**/<ESC>hi<RETURN>*<RETURN><ESC>^4i+<ESC>kk4A+<ESC>jYpPA<SPACE>
map <silent> <Leader><Leader> :nohlsearch<cr>
"map ,jf  o/***<ESC>i<RETURN> @file<TAB>%<RETURN><RETURN>@brief<TAB><RETURN><RETURN>@author<TAB>Joshua Shaffer<RETURN><RETURN><ESC>!!date<RETURN><ESC>^i *  @date<TAB><ESC>$a<RETURN><RETURN><RETURN>$Id$<RETURN><RETURN>$Log$<RETURN><RETURN><ESC>^a/<SPACE><RETURN><ESC>


"--Make buffer switching easier
nmap <C-n> :MBEbn<cr>
nmap <C-p> :MBEbp<cr>
nmap <C-h> <C-w>h<cr>
nmap <C-l> <C-w>l<cr>
nmap <C-j> <C-w>j<cr>
nmap <C-k> <C-w>k<cr>
nmap <C-y> :Dox<cr>


"""""""""""""""""""""""""""""""""""""""""""""
" now set filetype-based rules (autocommands)
"""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
filetype indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")

 " In text files, always limit the width of text to 72 characters
 autocmd BufRead *.txt set tw=72 formatoptions=tcql nocindent nowrap comments&

 augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For C and C++ files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd FileType * set formatoptions=tcql nocindent nowrap comments& spell
  autocmd FileType pl,java  set omnifunc=javacomplete#Complete formatoptions=croql cindent nowrap comments=sr:/*,mb:*,el:*/,:// spell
  "autocmd FileType java  set makeprg=ant\ -emacs\ -find\ build.xml\ 
  autocmd FileType h,c,cpp  set formatoptions=croql cindent nowrap comments=sr:/*,mb:*,el:*/,:// spell
  autocmd FileType tex set textwidth=75 spell spelllang=en_us
  autocmd FileType lsp so $VIM/syntax/lisp.vim 
  "autocmd FileType js so $VIM/syntax/javascript.vim set nospell
  "autocmd FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
  
  " add support for changing timestamp during every save
  " adapted from: http://www.naglenet.org/vim/vim.html#tip_date
  " autocmd BufWritePre *.h,*.c,*.cpp,*.pl,*.java norm _L
  
 augroup END

 augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files
  " set binary mode before reading the file
  autocmd BufReadPre,FileReadPre *.gz,*.bz2 set bin
  autocmd BufReadPost,FileReadPost  *.gz call GZIP_read("gunzip")
  autocmd BufReadPost,FileReadPost  *.bz2 call GZIP_read("bunzip2")
  autocmd BufWritePost,FileWritePost   *.gz call GZIP_write("gzip")
  autocmd BufWritePost,FileWritePost   *.bz2 call GZIP_write("bzip2")
  autocmd FileAppendPre       *.gz call GZIP_appre("gunzip")
  autocmd FileAppendPre       *.bz2 call GZIP_appre("bunzip2")
  autocmd FileAppendPost      *.gz call GZIP_write("gzip")
  autocmd FileAppendPost      *.bz2 call GZIP_write("bzip2")

  " After reading compressed file: Uncompress text in buffer with "cmd"
  fun! GZIP_read(cmd)
    " set 'cmdheight' to two, to avoid the hit-return prompt
    let ch_save = &ch
    set ch=3
    " when filtering the whole buffer, it will become empty
    let empty = line("'[") == 1 && line("']") == line("$")
    let tmp = tempname()
    let tmpe = tmp . "." . expand("<afile>:e")
    " write the just read lines to a temp file "'[,']w tmp.gz"
    execute "'[,']w " . tmpe
    " uncompress the temp file "!gunzip tmp.gz"
    execute "!" . a:cmd . " " . tmpe
    " delete the compressed lines
    '[,']d
    " read in the uncompressed lines "'[-1r tmp"
    set nobin
    execute "'[-1r " . tmp
    " if buffer became empty, delete trailing blank line
    if empty
      normal Gdd''
    endif
    " delete the temp file
    call delete(tmp)
    let &ch = ch_save
    " When uncompressed the whole buffer, do autocommands
    if empty
      execute ":doautocmd BufReadPost " . expand("%:r")
    endif
  endfun

  " After writing compressed file: Compress written file with "cmd"
  fun! GZIP_write(cmd)
    if rename(expand("<afile>"), expand("<afile>:r")) == 0
      execute "!" . a:cmd . " <afile>:r"
    endif
  endfun

  " Before appending to compressed file: Uncompress file with "cmd"
  fun! GZIP_appre(cmd)
    execute "!" . a:cmd . " <afile>"
    call rename(expand("<afile>:r"), expand("<afile>"))
  endfun


 augroup END

 " This is disabled, because it changes the jumplist.  Can't use CTRL-O to go
 " back to positions in previous files more than once.
 if 0
  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
   autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
 endif

endif " has("autocmd")

command -nargs=* Make make <args> | cwindow 3

" Make h and l perform as they should have
nmap <silent> h :<C-U>call ContextLeft()<CR>
nmap <silent> l :<C-U>call ContextRight()<CR>

func! ContextLeft()
    let cnt = v:count == 0 ? 1 : v:count
    if col('.') == 1 && line('.') != 1 && &ve != "all"
        exe "normal! " . cnt. "k$"
    else
        exe "normal! " . cnt. "h"
    endif
endfunc

func! ContextRight()
    let cnt = v:count == 0 ? 1 : v:count
    if col('.') >= strlen(getline('.')) && line('.') != line('$') && &ve != "all"
        exe "normal! " . cnt . "j^"
    else
        exe "normal! " . cnt . "l"
    endif
endfunc 

" make vim exit if the last window is a quixfix one
au BufEnter * call MyLastWindow()

function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction 

" C/C++ Brace folding
function FoldBrace()
    if getline(v:lnum+1)[0] == '{'
        return '>1'
    endif
    if getline(v:lnum)[0] == '}'
        return '<1'
    endif
    return foldlevel(v:lnum-1)                                
endfunction                                                    

set foldexpr=FoldBrace()
"set foldmethod=expr    

"-- Highlights leading tabs and spaces
map <Leader>t :/^\t\+<CR>
map <Leader>s :/^\s\+<CR>

"-- Search and replace highlighted word.
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

"-- Java options
hi HL_HiCurLine ctermfg=yellow ctermbg=blue cterm=NONE
hi javaCommentTitle cterm=bold ctermfg=4 ctermbg=NONE
let java_highlight_java_lang_ids=1
let java_highlight_java_io=1
let java_highlight_functions="style"
let java_highlight_debug=1
hi link javaParen Comment

"-- Status Line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
hi StatusLineNC ctermfg=black ctermbg=DarkGray cterm=NONE

"-- Colors for miniBufExplorer
"-- 0 = black, 1 = red, 2 = green, 3 = yellow,
"-- 4 = blue, 5 = magenta 6 = cyan, 7 = white
hi MBENormal  guibg=darkblue cterm=none ctermfg=7
hi MBEVisibleNormal guibg=darkblue cterm=none ctermfg=6
hi MBEChanged guibg=darkblue cterm=none ctermfg=5
hi MBEVisibleChanged guibg=darkblue cterm=none ctermfg=2

"-- Settings for miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
