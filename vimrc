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

set foldcolumn=1
set foldmethod=syntax

set belloff=all
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has('gui_macvim')
    autocmd GUIEnter * set vb t_vb=t_vb
endif

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
set nowrap

let $LANG = 'en'
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
colorscheme main
set t_Co=256

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

set list
set listchars=space:·

"""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""
let g:undotree_WindowLayout         = 3
let g:undotree_HighlightChangedText = 0
let g:undotree_DiffAutoOpen         = 0
nnoremap <F5> :UndotreeToggle<CR>

let g:NERDTreeStatusline                = ''
let g:NERDTreeWinPos                    = 'right'
let g:NERDTreeWinSize                   = 50
let g:NERDTreeMinimalUI                 = 1
let g:NERDTreeMinimalMenu               = 1
let g:NERDTreeCascadeSingleChildDir     = 0
let g:NERDTreeCascadeOpenSingleChildDir = 0 
let g:NERDTreeDirArrowExpandable        = '+'
let g:NERDTreeDirArrowCollapsible       = '-'
nnoremap <C-t> :NERDTreeFocus<CR>
autocmd VimEnter * NERDTree | wincmd p

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <C-f> :call comfortable_motion#flick(40)<CR>
nnoremap <C-b> :call comfortable_motion#flick(-40)<CR>
nnoremap <C-e> :call comfortable_motion#flick(40)<CR>
nnoremap <C-y> :call comfortable_motion#flick(-40)<CR>

