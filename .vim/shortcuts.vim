set pastetoggle=<F2>
set wildcharm=<C-Z>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
nnoremap <leader>n /^\(<<<<\\|====\\|>>>>\)<CR>
noremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>r :set relativenumber!<CR>
nnoremap <F3> :set hlsearch!<CR>
nnoremap <leader>t :b <C-Z>
nnoremap <leader>s :bnext<CR>
nnoremap <leader>a :bprevious<CR>
nnoremap <leader>m :make<CR>

" Non quitting analog of ZZ
nmap zz :w<CR>

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv
noremap <Up>     <NOP>
noremap <Down>   <NOP>
noremap <Left>   <NOP>
noremap <Right>  <NOP>

nnoremap <leader>" ciW""<esc>P
nnoremap <leader>' ciW''<esc>P

" ctrl u -> set the word under the cursor in uppercase
inoremap <c-u> <esc>viwUgi
