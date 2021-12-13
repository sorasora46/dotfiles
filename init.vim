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
set updatetime=300
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
set cmdheight=2
set shortmess+=c
autocmd CompleteDone * pclose
" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd CursorHold * silent call CocActionAsync('highlight')

call plug#begin()

Plug 'sainnhe/everforest'                               "everforest theme

Plug 'vim-airline/vim-airline'                          "Status Line
Plug 'vim-airline/vim-airline-themes'                   "Theme for Status Line

Plug 'tpope/vim-surround'                               "Close and Declose pairs
Plug 'Raimondi/delimitMate'                             "Autoclose

Plug 'honza/vim-snippets'                               "Snippets

Plug 'preservim/nerdtree'                               "File System
Plug 'ryanoasis/vim-devicons'                           "Icon for File System
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          "Syntax for File System

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     "Fuzzy Finder
Plug 'junegunn/fzf.vim'                                 "Fuzzy Finder

Plug 'artur-shaik/vim-javacomplete2'                    "Autogenerate for Java

Plug 'neoclide/coc.nvim', {'branch': 'release'}         "Autocomplete
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-java', 'coc-clangd']

Plug 'tpope/vim-commentary'                             "Auto Commenting

call plug#end()

let g:everforest_background = 'soft'
let g:everforest_enable_italic = 0
let g:everforest_disable_italic_comment = 1
let g:everforest_sign_column_background = 'none'
let g:everforest_ui_contrast = 'high'
let g:everforest_show_eob = 0
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_diagnostic_virtual_text = 'colored'
let g:everforest_current_word = 'underline'
let g:everforest_better_performance = 1
colorscheme everforest

let mapleader=" "

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = "\ue0b4"
let g:airline_right_sep = "\ue0b6"
let g:airline_theme='everforest'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = "\uf06a Error: "
let g:airline#extensions#coc#warning_symbol = "\uf071 Warning: "

let NERDTreeCustomOpenArgs={'file':{'where':'p','keepopen':1,'stay':1}}
let NERDTreeShowHidden=1
let g:NERDTreeWinPos="right"
nnoremap <leader>nt :NERDTreeToggle<CR>

" Coc setting

" Co" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Coc setting

nnoremap กก :!echo Hello<CR>

nnoremap aj <ESC>:w<CR>
inoremap aj <ESC>:w<CR>
vnoremap aj <ESC>:w<CR>
nnoremap <leader>w <ESC>:w<CR>
" nnoremap <leader>f gg=G<C-o>

nnoremap <C-c><C-f> :e ~/.config/nvim/init.vim<CR>

nnoremap <leader>T :vsplit term://zsh<CR>i
nnoremap <leader>t :term<CR>i
tnoremap <ESC> <C-\><C-n>
tnoremap <leader>E <C-c><C-\><C-n>iexit<Enter>
nnoremap <leader>E i<C-c><C-\><C-n>iexit<Enter>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

nmap <A-d> :bd<CR>
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
