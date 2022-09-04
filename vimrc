"""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""
set nocompatible
set backspace=indent,eol,start
set history=100
set ruler
set autoread
set hidden
set ignorecase
set smartcase
set magic

"""""""""""""""""""""""""""""""""""""""""
" Performance
"""""""""""""""""""""""""""""""""""""""""
set lazyredraw
set incsearch

"""""""""""""""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on
syntax on
set number
set cursorline

set hlsearch
set showmatch
set matchtime=2
set foldcolumn=1
set nowrap

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set wildmenu
set wildignore=*~
if has('win16') || has('win32')
    set wildignore+=.git/*,.hg/*,.svn/*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set background=dark
colorscheme papercolor

set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""
" Files
"""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowritebackup
set noswapfile

set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""
" Format
"""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent

"""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline_mode_map={
    \ 'niV'   : 'V REPLACE (NORMAL)',
    \ 's'     : 'SELECT',
    \ '^V'    : 'V-BLOCK',
    \ 'niI'   : 'INSERT (NORMAL)',
    \ 'ic'    : 'INSERT COMPL GENERIC',
    \ 'R'     : 'REPLACE',
    \ '^S'    : 'S-BLOCK',
    \ 'no'    : 'OP PENDING',
    \ 'V'     : 'V-LINE',
    \ 'multi' : 'MULTI',
    \ 'cv'    : 'VIM EX',
    \ 'ce'    : 'EX',
    \ '__'    : '------',
    \ 'no^V'  : 'OP PENDING BLOCK',
    \ '!'     : 'SHELL',
    \ 'c'     : 'COMMAND',
    \ 'ix'    : 'INSERT COMPL',
    \ 'rm'    : 'MORE PROMPT',
    \ 'i'     : 'INSERT',
    \ 'Rv'    : 'V REPLACE',
    \ 'Rx'    : 'REPLACE COMP',
    \ 'n'     : 'NORMAL',
    \ 'niR'   : 'REPLACE (NORMAL)',
    \ 'r'     : 'PROMPT',
    \ 'S'     : 'S-LINE',
    \ 't'     : 'TERMINAL',
    \ 'v'     : 'VISUAL',
    \ 'r?'    : 'CONFIRM',
    \ 'noV'   : 'OP PENDING LINE',
    \ 'Rc'    : 'REPLACE COMP GENERIC',
    \ 'nov'   : 'OP PENDING CHAR',
    \ }
let g:airline_theme='papercolor'

nnoremap <F5> :UndotreeToggle<CR>

