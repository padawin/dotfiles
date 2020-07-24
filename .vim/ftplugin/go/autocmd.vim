fun! CompileGoFile()
	let l:current_file=expand('%')
	if l:current_file =~ '_test.go'
		silent GoTestCompile
	else
		silent GoBuild
	endif
endfun


augroup GoBuild
	autocmd!
	autocmd BufWritePre *.go :GoImports
	autocmd BufWritePost * call CompileGoFile()
augroup END
