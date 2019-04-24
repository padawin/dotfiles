"=================================================
" File: presentation.vim
" Description: presentation syntax
" Author: Ghislain Rodrigues <git@ghislain-rodrigues.fr>
" License: MIT

syntax match PresComment '^# .*'
syntax match PresSubTitleStart '^[ \t]\+## '
syntax match PresSubTitleEnd ' ##$'
syntax match PresTitleStart '^[ \t]\+# '
syntax match PresTitleEnd ' #$'
syntax match PresTitle '^[ \t]\+# .\+ #$' contains=PresTitleStart,PresTitleEnd
syntax match PresSubTitle '^[ \t]\+## .\+ ##$' contains=PresSubTitleStart,PresSubTitleEnd
syntax match PresPresFile '[^ ]\+\.pres'
syntax match PresCode '`[^`]\+`'
syntax match PresKeyPointStart '^\* '
syntax match PresKeyPoint '^\* .*' contains=PresKeyPointStart,PresCode

" Background
highlight Normal ctermfg=250 ctermbg=233
" Non text tilde (~) after last line to set like background
highlight NonText ctermfg=233

highlight PresComment ctermfg=237
highlight PresTitleStart ctermfg=237
highlight PresTitleEnd ctermfg=237
highlight PresSubTitleStart ctermfg=237
highlight PresSubTitleEnd ctermfg=237

highlight PresSubTitle ctermfg=22
highlight PresTitle ctermfg=35

highlight PresCode ctermfg=215 cterm=bold

highlight PresPresFile ctermfg=39
