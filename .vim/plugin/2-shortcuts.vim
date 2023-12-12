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
nnoremap <BS> :noh<CR>
nnoremap <leader>s :bnext<CR>
nnoremap <leader>a :bprevious<CR>
nnoremap <leader>m :make<CR><C-o>:bo cwindow<CR>
nnoremap <leader>g :lgrep <c-r><c-w><CR><C-o>:bo lwindow<CR>
nnoremap <leader>t :tabe %<CR>
" Get current file's directory in command mode
cnoremap <c-o> <c-r>=expand("%:p:h")<CR>/

" Override some lesser used keys
" Non quitting analog of ZZ
nnoremap zz :w<CR>
nnoremap <leader>zz zz
" Copy the current line without the EOL
nnoremap Y 0v$hy

" Swap some keys to access more usable ones easier
" Access quickly command mode
nnoremap : ;
nnoremap ; :
" Access quickly block visual mode
nnoremap v <C-V>
nnoremap <C-V> v
vnoremap v <C-V>
vnoremap <C-V> v

nnoremap * *<c-o>

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

nnoremap <leader>c :call ToggleCursorbind()<CR>

noremap <Up>     <NOP>
noremap <Down>   <NOP>
noremap <Left>  gT
noremap <Right> gt

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
inoremap <expr> <TAB> pumvisible() ? '<C-y>' : "\<TAB>"
" Enter does not select the currently hovered item in the popup menu.
" This is to avoid a pre-selected autocompletion to be selected when the
" currently entered word is enough and the user wants to enter a new line.
inoremap <expr> <CR> pumvisible() ? "<C-o>o" : "<CR>"

" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" have to use nmap for whatever reason
nmap <leader>/ <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
" }}}
