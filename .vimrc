syntax on
filetype plugin on

set clipboard=unnamedplus
set backspace=indent,eol,start
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set number
set relativenumber
set nohlsearch
set incsearch
set hidden
set nowrap
set noswapfile
set nobackup
set nowritebackup
set undofile
set scrolloff=10
set colorcolumn=80
set signcolumn=number
set mouse=a
set splitbelow splitright
set termguicolors
set updatetime=300
set ignorecase
set smartcase
set showcmd
set noshowmode
set laststatus=2
set background=dark
set showtabline=0
set cmdheight=2
set shortmess+=c
set encoding=utf-8
set completeopt=menu,menuone,noinsert,noselect
set belloff=all
set spell spelllang=en_us
set undodir=~/vimfiles/undo//
set autochdir
set omnifunc=syntaxcomplete#Complete

colorscheme torte

autocmd BufWritePre * %s/\s\+$//e

let mapleader = " "
inoremap fj <ESC>
vnoremap fj <ESC>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

inoremap ( (<C-g>u
inoremap [ [<C-g>u
inoremap { {<C-g>u
inoremap " "<C-g>u
inoremap ' '<C-g>u
inoremap < <<C-g>u

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
