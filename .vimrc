syntax on
filetype plugin indent on
set nocompatible
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent
set splitbelow
set splitright
set nowrap
set hidden
set ignorecase
set smartcase
set cursorline
set scrolloff=8
set laststatus=2
set showmode
set showcmd
set incsearch
set nohlsearch
set showmatch
set path+=**
set wildmenu
set listchars=eol:↓,tab:\ \ ┊,trail:●,extends:…,precedes:…,space:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list

nnoremap <C-c><C-f> :e ~/.vimrc<CR>

let mapleader=" "

let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1
nnoremap <leader>n :Vexplore<CR>

inoremap aj <esc>:w<CR>
vnoremap aj <esc>:w<CR>
nnoremap aj <esc>:w<CR>
nnoremap <leader>w :w<CR>

nnoremap <leader>f gg=G``

nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nmap <A-p> :bp<CR>
nmap <A-n> :bn<CR>

nnoremap <leader>T :vert term<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <leader>E <C-c><C-\><C-n>iexit<Enter>
nnoremap <leader>E i<C-c><C-\><C-n>iexit<Enter>
