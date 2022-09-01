" Vimwiki
let g:vimwiki_list = [{'path': '~/wiki/vimwiki/', 'path_html': '~/wiki/vimwiki_html/'}, {'path': '~/wiki/privatewiki/', 'path_html': '~/wiki/privatewiki_html/'}]

" Ueberzug in vifm
let g:vifm_exec = expand('$HOME/.config/vifm/scripts/vifmrun')

" FZF/RG
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow\ -w
let FZF_DEFAULT_OPTS="-m --height 50% --border"


" Find Files
map <leader>f :Files<CR>
map <leader>F :GFiles<CR>
map <leader>R :Rg<CR>

" Change dir
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Vifm
map <leader>n :Vifm<CR>
map <leader>N :VsplitVifm<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!browser-chooser.sh <c-r>%<CR><CR>


" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Compile latex at saving
autocmd BufWritePost main.tex !compiler %

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
