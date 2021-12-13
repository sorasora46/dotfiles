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
set nobackup
set noswapfile
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set listchars=eol:↓,tab:\ \ ┊,trail:●,extends:…,precedes:…,space:·
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set list
autocmd BufWritePre * :%s/\s\+$//e

colorscheme darkblue

nnoremap <C-c><C-f> :e ~/.vimrc<CR>

let mapleader=" "



" ---- ---- ---- ----    Files Exploring    ---- ---- ---- ----
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1
nnoremap <leader>n :Vexplore<CR>
" ---- ---- ---- ----    Files Exploring    ---- ---- ---- ----



" ---- ---- ---- ----    Save and Escaping Setting    ---- ---- ---- ----
inoremap aj <esc>:w<CR>
vnoremap aj <esc>:w<CR>
nnoremap <leader>w :w<CR>
" ---- ---- ---- ----    Save and Escaping Setting    ---- ---- ---- ----



" ---- ---- ---- ----    Moving Line and Formatting Setting    ---- ---- ---- ----
nnoremap <leader>f gg=G``

nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
" ---- ---- ---- ----    Moving Line and Formatting Setting    ---- ---- ---- ----



" ---- ---- ---- ----    Pane Setting    ---- ---- ---- ----
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
" ---- ---- ---- ----    Pane Setting    ---- ---- ---- ----



" ---- ---- ---- ----    Buffer Setting    ---- ---- ---- ----
nmap <A-p> :bp<CR>
nmap <A-n> :bn<CR>
" ---- ---- ---- ----    Buffer Setting    ---- ---- ---- ----



" ---- ---- ---- ----    Terminal Setting    ---- ---- ---- ----
nnoremap <leader>T :vert term<CR>
tnoremap <ESC> <C-\><C-n>
tnoremap <leader>E <C-c><C-\><C-n>iexit<Enter>
nnoremap <leader>E i<C-c><C-\><C-n>iexit<Enter>
" ---- ---- ---- ----    Terminal Setting    ---- ---- ---- ----



" https://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-colour
set laststatus=2            " set the bottom status bar

function! ModifiedColor()
    if &mod == 1
        hi statusline guibg=White ctermfg=8 guifg=OrangeRed4 ctermbg=15
    else
        hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15
    endif
endfunction

au InsertLeave,InsertEnter,BufWritePost   * call ModifiedColor()
" default the statusline when entering Vim
hi statusline guibg=White ctermfg=8 guifg=DarkSlateGray ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=[%{getbufvar(bufnr('%'),'&mod')?'modified':'saved'}]
"modified flag

set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:[%n]                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
