function! CompileGoFile()
	let l:current_file=expand('%')
	if l:current_file =~ '_test.go'
		GoTestCompile
	else
		GoBuild
	endif
endfun

augroup GoBuild
	autocmd VimEnter,BufReadPost,BufWritePost *.go silent call CompileGoFile()
augroup END

