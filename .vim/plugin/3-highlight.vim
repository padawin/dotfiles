function! MyMarkdownHighlights() abort
    syntax region mdCodeAround  start=+^ \n\(\t|    \)+ end=+^$+ keepend contains=markdownCodeBlock
    " highlight def link mdCodeAround Normal
    highlight mdCodeAround ctermfg=43
endfunction

augroup MyColors
    autocmd!
    autocmd BufEnter *.md call MyMarkdownHighlights()
augroup END

" Colorscheme
colorscheme jellybeans

" Invisible chars display:
set listchars=space:·,trail:█
highlight WhiteSpaceBol ctermfg=grey
highlight WhiteSpaceMol ctermfg=black
highlight WhiteSpaceEol ctermfg=red
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/
2match WhiteSpaceEol / \+$/

" augroup GeneralHighlight
" 	" Don't mark pascal, camel and snake case as badly spelt
" 	autocmd Syntax * syntax match CamelNoSpell '\<\l\+\(\u[a-z0-9]*\)\+\>' contains=@NoSpell
" 	autocmd Syntax * syntax match SnakeNoSpell '\<\l\+\(_[a-z0-9]\+\)\+\>' contains=@NoSpell
" 	autocmd Syntax * syntax match PascalNoSpell '\<\(\u[a-z0-9]*\)\{2,\}\>' contains=@NoSpell
" 	" Don't count acronyms / abbreviations as spelling errors
" 	" (all upper-case letters, at least three characters)
" 	" Also will not count acronym with 's' at the end a spelling error
" 	" Also will not count numbers that are part of this
" 	" Recognizes the following as correct:
" 	autocmd Syntax * syntax match AcronymNoSpell '\<\(\u\d\)\{3,}s\?\>' contains=@NoSpell
" augroup END

" Spell mistakes
highlight SpellBad cterm=underline,bold ctermfg=none ctermbg=NONE

" Colorscheme override
highlight IncSearch term=standout cterm=standout ctermfg=166 gui=reverse
highlight Search term=reverse cterm=reverse ctermfg=136 guifg=Black guibg=Yellow

highlight VertSplit ctermbg=238 ctermfg=238
highlight StatusLineNC ctermbg=238 ctermfg=250

highlight String cterm=italic ctermfg=35 guifg=#99ad6a

highlight QuickFixLine ctermbg=none
