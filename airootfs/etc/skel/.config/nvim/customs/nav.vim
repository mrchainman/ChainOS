" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Navigating with guides
inoremap <leader>f <Esc>/<++><Enter>"_c4l
vnoremap <leader>f <Esc>/<++><Enter>"_c4l
map <leader>f <Esc>/<++><Enter>"_c4l

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell<CR>
map <leader>oe :setlocal spell spelllang=en<CR>
map <leader>od :setlocal spell spelllang=de<CR>
map <leader>oi :setlocal spell spelllang=it<CR>

" Check file in shellcheck:
map <leader>s :!clear && shellcheck %<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>tvb :vsplit term://bash<CR>
map <leader>tvf :vsplit term://fish<CR>
map <leader>tvi :vsplit term://ipython<CR>
map <leader>tsb :split term://bash<CR>
map <leader>tsf :split term://fish<CR>
map <leader>tsi :split term://ipython<CR>
tmap <C-e> <C-\><C-n>
map <leader>T :FloatermToggle<CR>
map <C-t> :tabnext<CR>
map <C-n> :tabnew<CR>

map <leader>v :source ~/.config/nvim/init.vim<CR>
map <leader>V :edit ~/.config/nvim/customs/<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
