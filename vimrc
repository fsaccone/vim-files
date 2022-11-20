"""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/yuttie/comfortable-motion.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mbbill/undotree'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""
" Plugin options
"""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <TAB>
    \ coc#pum#visible()
        \ ? coc#pum#next(1)
        \ : CheckBackspace()
            \ ? '<TAB>'
            \ : coc#refresh()
inoremap <silent><expr> <S-TAB>
    \ coc#pum#visible()
        \ ? coc#pum#confirm()
        \ : '\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>'
inoremap <silent><expr> <c-space> coc#refresh()
autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Format :call CocActionAsync('format')

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-f> :call comfortable_motion#flick(40)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-40)<CR>
nnoremap <silent> <C-e> :call comfortable_motion#flick(40)<CR>
nnoremap <silent> <C-y> :call comfortable_motion#flick(-40)<CR>

let g:NERDTreeShowHidden                = 1
let g:NERDTreeStatusline                = ''
let g:NERDTreeWinPos                    = 'right'
let g:NERDTreeWinSize                   = 50
let g:NERDTreeMinimalUI                 = 1
let g:NERDTreeMinimalMenu               = 1
let g:NERDTreeCascadeSingleChildDir     = 0
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeDirArrowExpandable        = '+'
let g:NERDTreeDirArrowCollapsible       = '-'
nnoremap <silent> <C-t> :NERDTreeFocus<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd WinEnter * call NERDTreeQuit()

let g:undotree_WindowLayout         = 3
let g:undotree_HighlightChangedText = 0
let g:undotree_DiffAutoOpen         = 0
nnoremap <silent> <F5> :UndotreeToggle<CR>

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
set foldmethod=manual
set fillchars+=foldopen:-,foldclose:+,foldsep:1
set signcolumn=yes

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

set updatetime=300

"""""""""""""""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on
syntax on
set cursorline

set number
map <C-l> :call g:ToggleNumberMode()<CR>

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

set statusline=
set statusline+=%#StatusLineMode#
set statusline+=\ %{GetModeName()}
set statusline+=\ %#StatusLineFile#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#StatusLineSave#
set statusline+=%m

language en_US.utf-8
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
endif

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
" Utils
"""""""""""""""""""""""""""""""""""""""""
function! GetModeName()
    let l:cases = {
       \ 'n'       : 'NORMAL',
       \ 'no'      : 'OPERATOR PENDING',
       \ 'nov'     : 'OPERATOR PENDING CHAR',
       \ 'noV'     : 'OPERATOR PENDING LINE',
       \ 'noCTRL-V': 'OPERATOR PENDING BLOCK',
       \ 'niI'     : 'INSERT (NORMAL)',
       \ 'niR'     : 'REPLACE (NORMAL)',
       \ 'niV'     : 'VIRTUAL REPLACE (NORMAL)',
       \ 'nt'      : 'TERMINAL (NORMAL)',
       \ 'v'       : 'VISUAL',
       \ 'vs'      : 'VISUAL (SELECT)',
       \ 'V'       : 'VISUAL LINE',
       \ 'Vs'      : 'VISUAL LINE (SELECT)',
       \ 'CTRL-V'  : 'VISUAL BLOCK',
       \ 'CTRL-Vs' : 'VISUAL BLOCK (SELECT)',
       \ 's'       : 'SELECT',
       \ 'S'       : 'SELECT LINE',
       \ 'CTRL-S'  : 'SELECT BLOCK',
       \ 'i'       : 'INSERT',
       \ 'ic'      : 'INSERT COMPL GENERIC',
       \ 'ix'      : 'INSERT COMPL',
       \ 'R'       : 'REPLACE',
       \ 'Rc'      : 'REPLACE COMPL GENERIC',
       \ 'Rx'      : 'REPLACE COMPL',
       \ 'Rv'      : 'VIRTUAL REPLACE',
       \ 'Rvc'     : 'VIRTUAL REPLACE COMPL GENERIC',
       \ 'Rvx'     : 'VIRTUAL REPLACE COMPL',
       \ 'c'       : 'COMMAND',
       \ 'cv'      : 'VIM EX',
       \ 'ce'      : 'EX',
       \ 'r'       : 'PROMPT',
       \ 'rm'      : 'MORE PROMPT',
       \ 'r?'      : 'CONFIRM',
       \ '!'       : 'SHELL',
       \ 't'       : 'TERMINAL',
       \ }
    let l:mode = mode()

    return get(l:cases, l:mode, toupper(l:mode))
endfunction

function! NERDTreeQuit()  " https://github.com/preservim/nerdtree/issues/21
    redir => buffersoutput
    silent buffers
    redir END
    "                     1BufNo  2Mods.     3File           4LineNo
    let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
    let windowfound = 0

    for bline in split(buffersoutput, "\n")
        let m = matchlist(bline, pattern)

        if (len(m) > 0)
            if (m[2] =~ '..a..')
                let windowfound = 1
            endif
        endif
    endfor

    if (!windowfound)
        quitall
    endif
endfunction

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! g:ToggleNumberMode()
    if (&relativenumber == 1)
        set relativenumber!
    else
        set relativenumber
    endif
endfunction

