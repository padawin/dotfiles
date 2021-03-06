set pastetoggle=<F2>
set wildcharm=<C-Z>

" shortcut to edit this file
" @TODO change path name into path of current file
nnoremap <leader>es :vs ~/.vim/plugin/2-shortcuts.vim<CR>
nnoremap <leader>. :source $MYVIMRC<CR>

nnoremap <leader><leader> :find *
nnoremap <leader>b :buffers<CR>:buffer<Space>

nnoremap <leader>N :e .notes<CR>
nnoremap <leader>S :e $HOME/.vim/scratchpad<CR>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
nnoremap <leader>n /^\(<<<<\\|====\\|>>>>\)<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>r :set relativenumber!<CR>:set list!<CR>
nnoremap <F3> :noh<CR>
nnoremap <leader>s :bnext<CR>
nnoremap <leader>a :bprevious<CR>
nnoremap <leader>m :make<CR><C-o>:cwindow<CR>
nnoremap <leader>g :grep <c-r><c-w><CR><C-o>:cwindow<CR>

" Non quitting analog of ZZ
nnoremap zz :w<CR>
nnoremap <leader>zz zz
nnoremap : ;
nnoremap ; :
nnoremap * *<c-o>

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

" Tab to get suggestion for badly spelt word
nnoremap <leader><tab> ]s1z=
nnoremap <leader><s-tab> [s1z=

" convenience and shortcut commands
" different completions made more accessible
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>
inoremap <c-k> <c-x><c-k>
inoremap <c-s> <c-x><c-o>

" Complete selected word
inoremap <expr> <TAB> pumvisible() ? '<CR>' : "\<TAB>"

" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" have to use nmap for whatever reason
nmap <leader>/ <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
" }}}
