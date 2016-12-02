set pastetoggle=<F2>
set wildcharm=<C-Z>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
nnoremap <C-n> /^\(<<<<\\|====\\|>>>>\)<CR>
noremap gt :UndotreeToggle<CR>
noremap to :NERDTree .<CR>
noremap tc :NERDTreeClose<CR>
nnoremap rl :set relativenumber!<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <C-k><C-t> :b <C-Z>
nnoremap <C-k><C-s> :bnext<CR>
nnoremap <C-k><C-n> :bprevious<CR>

" Non quitting analog of ZZ
nmap zz :w<CR>
