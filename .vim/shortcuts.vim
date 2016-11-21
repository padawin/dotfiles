set pastetoggle=<F2>
set wildcharm=<C-Z>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
noremap gn /^\(<<<<\\|====\\|>>>>\)<CR>
noremap gt :GundoToggle<CR>
noremap to :NERDTree .<CR>
noremap tc :NERDTreeClose<CR>
nnoremap rl :set relativenumber!<CR>
nnoremap <F3> :set hlsearch!<CR>
inoremap <F6> <Esc>
nnoremap <C-k><C-t> :b <C-Z>
nnoremap <C-k><C-n> :bnext<CR>
nnoremap <C-k><C-h> :bprevious<CR>
