syntax match goCustomParen     "(" contains=cParen
syntax match goCustomFuncDef   "func\s\+\w\+\s*(" contains=goDeclaration,goCustomParen
" Exclude import as function name, for multi-line imports
syntax match goCustomFunc      "import\s\+(\|\(\w\+\s*\)(" contains=goCustomParen,goImport
syntax match goCustomScope     "\."
syntax match goCustomAttribute "\.\w\+" contains=goCustomScope
syntax match goCustomMethod    "\.\w\+\s*(" contains=goCustomScope,goCustomParen

"highlight def link goCustomFunc  Function
highlight def link goCustomMethod Function
highlight def link goCustomAttribute Identifier

function! s:tweak_colorscheme_colors_go()
	highlight goCustomFuncDef ctermfg=13
	highlight goCustomFunc ctermfg=43
	highlight goCustomAttribute ctermfg=247
	highlight goCustomMethod ctermfg=33
endfunction

" Set the rule if the colorscheme is re-applied
autocmd ColorScheme * call s:tweak_colorscheme_colors_go()
" Set the rule immediately, as this code is initially called *after* the
" colorscheme is set (in order to override the colorscheme)
call s:tweak_colorscheme_colors_go()
