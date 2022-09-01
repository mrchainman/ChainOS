" VGit
""""""""""""""""""""""""
" Buffer
map <leader>gbp :VGit buffer_hunk_preview<CR>
map <leader>gbb :VGit buffer_blame_preview<CR>
map <leader>gbd :VGit buffer_diff_preview<CR>
map <leader>gbh :VGit buffer_history_preview<CR>
map <leader>gbg :VGit buffer_gutter_blame_preview<CR>
" Project
map <leader>gpp :VGit project_hunks_preview<CR>
map <leader>gps :VGit project_hunks_staged_preview<CR>
map <leader>gpd :VGit project_diff_preview<CR>
map <leader>gpl :VGit project_logs_preview<CR>
map <leader>gpc :VGit project_commits_preview<CR>
" Settings
map <leader>gx :VGit toggle_diff_preference<CR>
" Branch
map <leader>gc :VGit checkout



function GitCommit() abort
  exec ":!git add %"
  let message = input('Enter commit message: ')
  call system("git commit -m '" . message . "'")
endfunction

map <leader>ga :call GitCommit()<CR>


lua << EOF
require('vgit').setup({
settings = {
     live_blame = {
      enabled = true,
    },
    live_gutter = {
      enabled = false,
    },
    scene = {
      diff_preference = 'split',
    },
  }
})
EOF
