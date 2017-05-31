set pastetoggle=<F2>
set wildcharm=<C-Z>

" shortcut to edit this file
nnoremap <leader>es :vs <C-R>=MYVIMSHORTCUTS<CR><CR>
nnoremap <leader>. :source $MYVIMRC<CR>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
nnoremap <leader>n /^\(<<<<\\|====\\|>>>>\)<CR>
noremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>r :set relativenumber!<CR>
nnoremap <F3> :set hlsearch!<CR>
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
nnoremap <leader>[ ciW[]<esc>P
nnoremap <leader>( ciW()<esc>P
nnoremap <leader>{ ciW{}<esc>P
vnoremap <leader>" c""<esc>P
vnoremap <leader>' c''<esc>P
vnoremap <leader>[ c[]<esc>P
vnoremap <leader>( c()<esc>P
vnoremap <leader>{ c{}<esc>P

" ctrl u -> set the word under the cursor in uppercase
inoremap <c-u> <esc>viwUgi

" shortcut to comment a line, per filetype
autocmd FileType c,cpp,php,javascript nnoremap <buffer> <localleader>c I// <esc>:silent! s~^\(\s*\)// // ~\1~<cr>
autocmd FileType python     nnoremap <buffer> <localleader>c I# <esc>:s~^\(\s*\)# # ~\1~<cr>

" shortcut to comment a block, per filetype
autocmd FileType c,cpp,php,javascript vnoremap <buffer> <localleader>c <esc>'<O/*<esc>'>o*/<esc>
autocmd FileType python     vnoremap <buffer> <localleader>c <esc>'<O"""<esc>'>o"""<esc>
