if exists("g:currently_hovered_word")
  finish
endif
let g:currently_hovered_word = 1

let s:save_cpo = &cpo
set cpo&vim

let s:toggled = 0

set updatetime=500

function! ClearHighLightWordUnderCursor()
	syntax clear WordUnderCursor
	let s:toggled = 0
endfunction

function! HighLightWordUnderCursor()
	let charUnderCursor = matchstr(getline('.'), '\%' . col('.') . 'c.')
	let wordUnderCursor = expand('<cword>')
	call ClearHighLightWordUnderCursor()
	if match(charUnderCursor, '^[a-zA-Z0-9_]') != -1 && match(wordUnderCursor, '^[a-zA-Z0-9_]\+$') != -1
		let fg = synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")
		if fg != ""
			execute "highlight WordUnderCursor ctermbg=235 ctermfg=" . fg
		else
			highlight WordUnderCursor ctermbg=235 ctermfg=white
		endif
		execute "syntax match WordUnderCursor '" . wordUnderCursor . "' containedin=ALL contained"
	endif
	let s:toggled = 1
endfunction

function! ToggleHighLightWordUnderCursor()
	if s:toggled
		call ClearHighLightWordUnderCursor()
	else
		call HighLightWordUnderCursor()
	endif
endfunction

highlight WordUnderCursor cterm=reverse

augroup CurrentlyHoveredWordHighlight
	autocmd CursorMoved * call ClearHighLightWordUnderCursor()
	nnoremap <leader>w :call ToggleHighLightWordUnderCursor()<CR>
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
