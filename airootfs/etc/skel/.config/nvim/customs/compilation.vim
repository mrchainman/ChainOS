" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>com :w! \| !compiler <c-r>%<CR>

" Build Docker
map <leader>db :!docker build -f % -t

" Docker Compose
map <leader>dcu :!docker-compose -f % up -d<CR>
map <leader>dcd :!docker-compose -f % down <CR>
map <leader>dcsa :!docker-compose -f % start <CR>
map <leader>dcso :!docker-compose -f % stop <CR>
map <leader>dcb :!docker-compose -f % build <CR>
map <leader>dcB :!docker-compose -f % build --no-cache <CR>
