function! s:tweak_colorscheme_colors_diff()
	highlight diffAdded term=none ctermfg=35 guifg=#99ad6a
endfunction

" Set the rule if the colorscheme is re-applied
autocmd! ColorScheme * call s:tweak_colorscheme_colors_diff()
" Set the rule immediately, as this code is initially called *after* the
" colorscheme is set (in order to override the colorscheme)
call s:tweak_colorscheme_colors_diff()
