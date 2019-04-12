
function! MyPythonHighlights() abort
	syntax match pyCustomParen     "(" contains=cParen
	syntax match pyCustomFunc      "\w\+\s*(" contains=pyCustomParen
	syntax match pyCustomScope     "\."
	syntax match pyCustomAttribute "\.\w\+" contains=pyCustomScope
	syntax match pyCustomMethod    "\.\w\+\s*(" contains=pyCustomScope,pyCustomParen

	highlight def link pyCustomFunc  Function
	highlight def link pyCustomMethod Function
	highlight def link pyCustomAttribute Identifier

	highlight pyCustomFunc ctermfg=43
	highlight pyCustomAttribute ctermfg=247
	highlight pyCustomMethod ctermfg=33

	highlight pythonSelf ctermfg=4 cterm=bold

	" Docstrings
	highlight pythonDocstring ctermfg=29 cterm=italic
	" Actual strings
	highlight pythonString ctermfg=35
	highlight pythonStrFormat ctermfg=9
endfunction

augroup MyColors
    autocmd!
	autocmd BufEnter *.py call MyPythonHighlights()
augroup END

" Colorscheme
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_diffmode="high"
colorscheme solarized

" Invisible chars display:
set listchars=space:·,trail:█
highlight WhiteSpaceBol ctermfg=grey
highlight WhiteSpaceMol ctermfg=black
highlight WhiteSpaceEol ctermfg=red
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/
2match WhiteSpaceEol / \+$/

" Don't mark pascal, camel and snake case as badly spelt
syntax match CamelNoSpell '\<\l\+\(\u\l*\)\+\>' contains=@NoSpell
syntax match SnakeNoSpell '\<\l\+\(_\l\+\)\+\>' contains=@NoSpell
syntax match PascalNoSpell '\<\(\u[a-z]*\)\{2,\}\>' contains=@NoSpell
" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
syntax match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
