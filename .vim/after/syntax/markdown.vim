syn match    customHeader1     "^# "
syn match    customHeader2     "^## "
syn match    customHeader3     "^### "
syn match    customHeader4     "^#### "
syn match    customHeader5     "^##### "

syn region markdownCodeBlock start="\n\n    \|\t" end="\n\n" contained

function! s:tweak_colorscheme_colors_markdown()
	highlight customHeader1 ctermfg=34
	highlight customHeader2 ctermfg=32
	highlight customHeader3 ctermfg=127
	highlight customHeader4 ctermfg=45
	highlight customHeader5 ctermfg=220

endfunction

" Set the rule if the colorscheme is re-applied
autocmd! ColorScheme * call s:tweak_colorscheme_colors_markdown()
" Set the rule immediately, as this code is initially called *after* the
" colorscheme is set (in order to override the colorscheme)
call s:tweak_colorscheme_colors_markdown()
