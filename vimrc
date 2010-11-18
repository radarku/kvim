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

""""""""""
" Settings
""""""""""
" Turn syntax highlighting on
syntax on
" Dark backgrounds
set background=dark
" Backspace over line breaks, etc.
set backspace=indent,eol,start
" Never start in insert mode
set noinsertmode
" Return bracket indentation to same level
set smartindent
" Following lines have same indentation
set autoindent
" Show matching set of parens as they are typed
set showmatch
" Show current cursor position at bottom
set ruler
" Show the command being typed
set showcmd
" Do not wrap lines
set nowrap
" Do not use (audible/visual) bell on error
set noerrorbells
" Use visual instead of audible bell
set visualbell
" Allow regex in pattern matching
set magic
" Says when anything is changed at bottom
set report=0
" Use a bash shell
set shell=/bin/bash
" Shows the mode when you're in command mode
set showmode
" Make backup (swap) files
set backup
" Write backup files
set writebackup
" Where to put backup files
set backupdir=~/.backups,/tmp
" Shows line numbers
set number
" Write backups
set autowrite
" Highlight as you search
set incsearch 
" Highlight searches
set hlsearch
" Case-insensitive searching
set ignorecase
" Enable use of mouse for scrolling or visual selection in normal mode
" (options are n/v/i/c/h/a/r/A) (a is all)
set mouse=n
" Insert two spaces after period when joining lines
set joinspaces 
" C indentation options
set cinoptions=>s,{0,}0,?0,^0,:0,=s,p0,t0,+s,(0,)20,*30
" Tab handling
set shiftround
" Don't treat these as word dividers
set iskeyword=@,48-57,_,192-255,-,.,:,/,@-@,$,%,#
" Don't redraw during macro execution - faster
set lazyredraw
" Tab completion of file/directory names
set wildchar=<TAB>
" Show a menu of files for tab completion
set wildmenu
" Tabs to the longest common file
set wildmode=list:longest
"....also try wildignore, and wildmode
" Set a command to run for :make and :grep
""set makeprg=gcc\ -o\ %<\ %
""set grepprg=ack
" Leave vi-compatible mode
set nocompatible
" Change buffers without saving
set hidden
" Don't change icon text
set noicon
" Look for a mode line in the buffer (e.g., //vim:set filetype=php:)
set modeline
" How many lines to read into a buffer for a modeline
set modelines=1
" Shortens messages to avoid prompts
set shortmess=I
" <Insert> to turn on paste mode (no indentation changes)
set pastetoggle=<Insert>
" Turn off vi compatibility mode
set nocp 

"-- Spaces (not tabs) 
set expandtab  
set tabstop=3
set shiftwidth=3

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

"""""""""""""""""""""""""""""""""""""""""""""""""
" Custom keymappings, this will change frequently
"""""""""""""""""""""""""""""""""""""""""""""""""
" Saves file if you accidentally use capital-W
map :W :w
" Use CTRL-Z to open a temporary shell, CTRL-D on the shell to get back to vim
map <C-Z> :shell<CR>
" Turn off search highlighting with \\
map <silent> <Leader><Leader> :nohlsearch<cr>
" Highlights leading tabs 
map <Leader>t :/^\t\+<CR>
" Highlights leading spaces
map <Leader>s :/^\s\+<CR>
" Search and replace highlighted word by hitting semi-colon
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/


"""""""""""""""""""""""""""""""""""""""""""""
" Now set filetype-based rules
"""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
filetype indent on

" Autocommands {
if has("autocmd")
   " Default {
   autocmd BufRead,BufNewFile * set formatoptions=tcql 
   autocmd BufRead,BufNewFile * set nocindent 
   autocmd BufRead,BufNewFile * set comments& 
   " }
   " Text Files {
   autocmd BufRead,BufNewFile *.txt set tw=72 
   autocmd BufRead,BufNewFile *.txt set formatoptions=tcql 
   autocmd BufRead,BufNewFile *.txt set nocindent
   autocmd BufRead,BufNewFile *.txt set comments&
   " }
   " Object-oriented Code {
   autocmd BufRead,BufNewFile *.pl,*.java,*.h,*.c,*.cpp set formatoptions=croql 
   autocmd BufRead,BufNewFile *.pl,*.java,*.h,*.c,*.cpp set cindent 
   autocmd BufRead,BufNewFile *.pl,*.java,*.h,*.c,*.cpp set comments=sr:/*,mb:*,el:*/,:// 
   autocmd BufRead,BufNewFile *.pl,*.java,*.h,*.c,*.cpp set spell
   " }
   " LaTeX {
   autocmd BufRead,BufNewFile *.tex set textwidth=75 
   autocmd BufRead,BufNewFile *.tex set spell spelllang=en_us 
   " }
   " Lisp {
   autocmd BufRead,BufNewFile *.lsp so $VIM/syntax/lisp.vim 
   " }
   " Proto {
   autocmd BufRead,BufNewFile *.proto setfiletype proto lisp 
   " }
endif 
" }

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

"-- Support make at command line
command -nargs=* Make make <args> | cwindow 3

"-- Make h and l cursor movement work across lines
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

"-- Status Line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
hi StatusLineNC ctermfg=black ctermbg=DarkGray cterm=NONE

"--Make buffer switching easier
nmap <C-n> :MBEbn<cr>
nmap <C-p> :MBEbp<cr>
nmap <C-h> <C-w>h<cr>
nmap <C-l> <C-w>l<cr>
nmap <C-j> <C-w>j<cr>
nmap <C-k> <C-w>k<cr>

"-- Colors for miniBufExplorer
"-- 0 = black, 1 = red, 2 = green, 3 = yellow,
"-- 4 = blue, 5 = magenta 6 = cyan, 7 = white
hi MBENormal  guibg=darkblue cterm=none ctermfg=7
hi MBEVisibleNormal guibg=darkblue cterm=none ctermfg=6
hi MBEChanged guibg=darkblue cterm=none ctermfg=5
hi MBEVisibleChanged guibg=darkblue cterm=none ctermfg=2

"-- Settings for miniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
