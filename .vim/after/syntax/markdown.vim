syn match    customHeader1     "^# "
syn match    customHeader2     "^## "
syn match    customHeader3     "^### "
syn match    customHeader4     "^#### "
syn match    customHeader5     "^##### "

highlight customHeader1 ctermfg=34
highlight customHeader2 ctermfg=32
highlight customHeader3 ctermfg=127
highlight customHeader4 ctermfg=45
highlight customHeader5 ctermfg=220

syn region markdownCodeBlock start="\n\n    \|\t" end="\n\n" contained
