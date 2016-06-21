set pastetoggle=<F2>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
noremap gn /^\(<<<<\\|====\\|>>>>\)<CR>
noremap <F5> :GundoToggle<CR>
noremap to :NERDTree .<CR>
noremap tc :NERDTreeClose<CR>
" ,/ C/C++/C#/Java // comments
nnoremap ,/ :s/^/\/\//<CR>
" , #perl # comments
nnoremap ,# :s/^/#/<CR>
nnoremap rl :set relativenumber!<CR>

