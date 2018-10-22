" Open a review file next to your patch file to write a code review

function! ReviewLine()
	" Stores the current line number and the line itself
	let l:l = "\nline ".line('.')."\n".getline('.')."\n"
	" This variable is set on first execution of the function, so if it is set,
	" just go to the next window
	if exists('g:review_started')
		exe 'wincmd l'
	else
		" Set the variable for future uses, open a split on the right with a
		" file named as "nameOfTheCurrentFile.review"
		let g:review_started = 1
		let l:bufname = bufname('%')
		set splitright
		exe 'vs '.l:bufname.".review"
	endif
	" Go at the end of the file
	exe 'normal! G'
	" Append the line to review (stored at the beginning of the function) to
	" the review file
	silent! exe 'put =l:l'
	" Move the cursor after, to be ready to add a comment
	exe 'normal! G'
endfunction

" You need a leader key to use it. Type:
" :help leader
" To know more about it if you need
nnoremap <leader>c :call ReviewLine()<cr>
