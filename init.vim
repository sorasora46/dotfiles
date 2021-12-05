syntax on
filetype plugin indent on
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set number
" set relativenumber
set nohlsearch
set incsearch
set hidden
set nowrap
set noswapfile
set nobackup
set undofile
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set mouse=a
set splitbelow splitright
set termguicolors
set updatetime=3
set ignorecase
set smartcase
set showcmd
set noshowmode
set laststatus=2
set cursorline
set background=dark
set showtabline=2
set listchars=eol:↓,tab:\ \ ┊,trail:●,extends:…,precedes:…,space:·
set list
autocmd CompleteDone * pclose
" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType java setlocal omnifunc=javacomplete#Complete

call plug#begin()

Plug 'morhetz/gruvbox'                                  "gruvbox themes
Plug 'NLKNguyen/papercolor-theme'                       "Paper-color theme

Plug 'vim-airline/vim-airline'                          "Status Line
Plug 'vim-airline/vim-airline-themes'                   "Theme for Status Line

Plug 'Sirver/ultisnips'                                 "Snippets
Plug 'honza/vim-snippets'                               "Snippets

Plug 'tpope/vim-surround'                               "Close and Declose pairs
Plug 'Raimondi/delimitMate'                             "Autoclose

Plug 'preservim/nerdtree'                               "File System
Plug 'ryanoasis/vim-devicons'                           "Icon for File System
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          "Syntax for File System

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     "Fuzzy Finder
Plug 'junegunn/fzf.vim'                                 "Fuzzy Finder

Plug 'artur-shaik/vim-javacomplete2'                    "Autogenerate for Java

Plug 'neoclide/coc.nvim', {'branch': 'release'}         "Autocomplete

Plug 'tpope/vim-commentary'                             "Auto Commenting

call plug#end()

colorscheme PaperColor

let mapleader=" "

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='transparent'

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let NERDTreeCustomOpenArgs={'file':{'where':'p','keepopen':1,'stay':1}}
let NERDTreeShowHidden=1
nnoremap <leader>nt :NERDTreeToggle<CR>

nnoremap กก :!echo Hello<CR>

nnoremap aj <ESC>:w<CR>
inoremap aj <ESC>:w<CR>
vnoremap aj <ESC>:w<CR>
nnoremap <leader>w :w<CR>

" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <leader><Tab> <Right>

nnoremap <C-c><C-f> :e ~/.config/nvim/init.vim<CR>

nnoremap <leader>T :vsplit term://zsh<CR>i
nnoremap <leader>t :term<CR>i
tnoremap <ESC> <C-\><C-n>
tnoremap <leader>E <C-c><C-\><C-n>iexit<Enter>
nnoremap <leader>E i<C-c><C-\><C-n>iexit<Enter>

nnoremap <leader>f gg=G``

nnoremap <leader>ts ^
nnoremap <leader>te $

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><


nmap <leader>d :bd<CR>
nmap <A-p> :bp<CR>
nmap <A-n> :bn<CR>

nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==

inoremap ;; <esc>A;<esc>;:w<CR>

nnoremap <C-p> :Files<CR>

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

"alternative setting for minimal https://github.com/mhinz/vim-galore/blob/master/static/minimal-vimrc.vim
