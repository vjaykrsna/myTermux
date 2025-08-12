" ~/.config/nvim/init.vim

" --- General ---
set number
set relativenumber
set cursorline
set scrolloff=8
set signcolumn=yes
set updatetime=50

" --- Tabs & Indentation ---
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" --- Search ---
set incsearch
set ignorecase
set smartcase

" --- Plugins ---
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()
