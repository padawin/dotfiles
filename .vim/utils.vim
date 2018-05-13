" miscellaneous utils used in vim config files
"
" $Id$

" source a file if it exists
function! SafeSource(path)
  if filereadable(expand(a:path))
    exec 'source ' . a:path
  endif
endfunction

" toggle a boolean option for the current buffer
function! ToggleBooleanOption(name)
    let s:bufname = bufname('%')
    let s:value = getbufvar(s:bufname, '&' . a:name)
    call setbufvar(s:bufname, '&' . a:name, !s:value)
endfunction

fun! Runcmd(cmd)
    silent! exe "noautocmd botright pedit ".a:cmd
    noautocmd wincmd P
    set buftype=nofile
    exe "noautocmd r! ".a:cmd
	exe "normal! gg"
	" goes back to previous window
    " noautocmd wincmd p
endfun
com! -nargs=1 Runcmd :call Runcmd("<args>")
