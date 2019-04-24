" presentation filetype
if exists("did_load_filetypes")
	finish
endif
augroup filetypedetect
	autocmd! BufRead,BufNewFile *.pres setfiletype presentation
augroup END
