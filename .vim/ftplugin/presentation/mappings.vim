" Do not show search
set nohlsearch
set nonumber
set laststatus=0

let &colorcolumn=""

" Mappings
" This one is for edition, when having an index, it opens in a split pane the
" name of the index file on the current line, useful when the file does not
" exist.
nnoremap <leader>G $yiW:vs <c-r>"<CR>
" Goes to the next index file
nnoremap <leader>g $gf
" Searches the index file names
nnoremap <leader>f / \zs\([^ ]\+\.pres$\)<CR>
nnoremap <leader><leader> :bn<CR>
