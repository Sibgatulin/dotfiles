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

    " language
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dense-analysis/ale'

    " python
    Plug 'psf/black'
    Plug 'sillybun/vim-repl'

    " syntax highlight
    Plug 'mechatroner/rainbow_csv'
    Plug 'ledger/vim-ledger'
    Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" Mappings
" Copy full path to system register
nmap <leader>cfp :let @+ = expand("%:p")<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
noremap <F5> :set spell! spell?<CR>

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
" vim-repl
nnoremap <leader>rt :REPLToggle<CR>
let g:repl_program = {
			\	'python': ['/usr/bin/env ipython'],
			\	'default': ['bash']
			\	}
" vim-ledger
let g:ledger_default_commodity="EUR"
let g:ledger_commodity_sep=" "
