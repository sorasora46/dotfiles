syntax on
filetype plugin on

set clipboard=unnamed
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
set cursorline
set background=light
set showtabline=0
set cmdheight=2
set shortmess+=c
set encoding=utf-8
set completeopt=menu,menuone,noinsert,noselect
set belloff=all
set spell spelllang=en_us
set undodir=~/vimfiles/undo//
set guioptions=Ac
set autochdir
set omnifunc=syntaxcomplete#Complete

autocmd BufWritePre * %s/\s\+$//e

nnoremap <C-c><C-f> :e ~/.vimrc<CR>

let mapleader = " "
inoremap fj <ESC>
vnoremap fj <ESC>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <c-up> <c-w>+
inoremap <c-down> <c-w>-
inoremap <c-left> <c-w>>
inoremap <c-right> <c-w><

nnoremap <silent> <A-k> :m .-2<CR>==
nnoremap <silent> <A-j> :m .+1<CR>==
inoremap <silent> <A-k> <ESC>:m .-2<CR>==
inoremap <silent> <A-j> <ESC>:m .+1<CR>==
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap ( (<C-g>u
inoremap [ [<C-g>u
inoremap { {<C-g>u
inoremap " "<C-g>u
inoremap ' '<C-g>u
inoremap < <<C-g>u