syntax match pyCustomParen     "(" contains=cParen
syntax match pyCustomFunc      "\w\+\s*(" contains=pyCustomParen
syntax match pyCustomScope     "\."
syntax match pyCustomAttribute "\.\w\+" contains=pyCustomScope
syntax match pyCustomMethod    "\.\w\+\s*(" contains=pyCustomScope,pyCustomParen

highlight def link pyCustomFunc  Function
highlight def link pyCustomMethod Function
highlight def link pyCustomAttribute Identifier
highlight def link pyString String

function! s:tweak_colorscheme_colors_python()
	highlight pyCustomFunc ctermfg=43
	highlight pyCustomAttribute ctermfg=247
	highlight pyCustomMethod ctermfg=33

	highlight pythonSelf ctermfg=4 cterm=bold

	" Docstrings
	highlight pythonDocstring ctermfg=29 cterm=italic
	" Actual strings
	highlight pythonStrFormat ctermfg=9
endfunction

" Set the rule if the colorscheme is re-applied
autocmd! ColorScheme * call s:tweak_colorscheme_colors_python()
" Set the rule immediately, as this code is initially called *after* the
" colorscheme is set (in order to override the colorscheme)
call s:tweak_colorscheme_colors_python()
