"""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""
set nocompatible
set backspace=indent,eol,start
set whichwrap+=<,>,h,1
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
try
    colorscheme papercolor
catch
endtry
set background=dark

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

