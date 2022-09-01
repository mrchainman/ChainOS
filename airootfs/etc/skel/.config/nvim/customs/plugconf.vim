" Setup Plug if not installed
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" Specify Plugins
call plug#begin('~/.config/nvim/plugged')
" General utilities
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'inkarkat/vim-AdvancedSorters'
Plug 'tmhedberg/SimpylFold'
Plug 'voldikss/vim-floaterm'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
" Vimwiki
" Vifm
Plug 'vimwiki/vimwiki'
Plug 'vifm/vifm.vim'
"Git integration
Plug 'jreybert/vimagit'
Plug 'tanvirtin/vgit.nvim'
"Show hex colors
Plug 'ap/vim-css-color'
"Fuzzy finder
Plug 'junegunn/fzf.vim'
" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Needed for vgit
Plug 'nvim-lua/plenary.nvim'
" lua statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Dashboard
Plug 'mhinz/vim-startify', {'branch': 'center'}
" Sessions
Plug 'Shatur/neovim-session-manager'
call plug#end()
