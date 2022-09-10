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

set nohlsearch
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
set noautochdir

set fileformats=unix,dos,mac

" Disallows editing directories
for file in argv()
    if isdirectory(file)
        echon 'vimrc: Unable to open `' . file . '`. Editing directories is forbidden.'
        quit
        break
    endif
endfor

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

let g:undotree_WindowLayout=3
let g:undotree_HighlightChangedText=0
let g:undotree_DiffAutoOpen=0

nnoremap <F5> :UndotreeToggle<CR>

nnoremap <C-t> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p

let g:comfortable_motion_no_default_key_mappings=1
nnoremap <silent> <C-f> :call comfortable_motion#flick(40)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-40)<CR>

