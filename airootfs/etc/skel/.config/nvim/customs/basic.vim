" Set leaderkey
let mapleader =";"

" Set colorscheme
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require("catppuccin").setup({transparent_background = true})
EOF

colorscheme catppuccin

" Setup some basics
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set nocompatible
set encoding=utf-8
set number relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set autochdir
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.cache/viminfo

nnoremap c "_c
filetype plugin on
syntax on
