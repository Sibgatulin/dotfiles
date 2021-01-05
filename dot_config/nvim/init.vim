syntax enable
colorscheme gruvbox

set number relativenumber       "Line numbers relative to the present line
set colorcolumn=88
set cursorline
set scrolloff=5
set spell spelllang=en_gb
let g:mapleader=" "

" using soft tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set backup		" keep a backup file (restore to previous version)
if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
endif
set undodir=$XDG_CONFIG_HOME/nvim/.undo//
set directory=$XDG_CONFIG_HOME/nvim/.swp//
set backupdir=$XDG_CONFIG_HOME/nvim/.backup//

if has("autocmd")
    filetype plugin indent on
    autocmd BufWritePre * %s/\s\+$//e  " remove trailing whitespaces on save
    autocmd BufWritePre *.py %s/\n\n# In\[[0-9]\+]:\n\n//e  " remove IPython breadcrumbs
    autocmd BufWritePre *.py execute ':Black'
    autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &
    autocmd BufWritePost *.config/polybar/*conf* !~/.config/polybar/launch.sh
endif

call plug#begin('~/.vim/plugged')

    " general
    Plug 'junegunn/fzf.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'jpalardy/vim-slime', {'branch': 'main'}

    " language
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'

    " python
    Plug 'psf/black'
    Plug 'plytophogy/vim-virtualenv'

    " syntax highlight
    Plug 'mechatroner/rainbow_csv'
    Plug 'ledger/vim-ledger'
    Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" Mappings
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
" Copy full path to system register
nmap <leader>cfp :let @+ = expand("%:p")<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
noremap <F5> :set spell! spell?<CR>
" fzf
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fr :Rg<CR>
" lightline
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'venv' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'venv': 'virtualenv#statusline'
      \ },
      \ }
" vim-ledger
let g:ledger_default_commodity="EUR"
let g:ledger_commodity_sep=" "
" vim-slime
let g:slime_target = "neovim"
nnoremap <leader>ip :split term://ipython | startinsert
" terminal
tnoremap <ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-h>
tnoremap <C-j> <C-\><C-n><C-j>
tnoremap <C-k> <C-\><C-n><C-k>
tnoremap <C-l> <C-\><C-n><C-l>
