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
function ToggleBooleanOption(name)
    let s:bufname = bufname('%')
    let s:value = getbufvar(s:bufname, '&' . a:name)
    call setbufvar(s:bufname, '&' . a:name, !s:value)
endfunction

function! TrimEOL()
  let line = line(".")
  exec 'v:^--\s*$:s:\s\+$::e'
  exec line
endfunction

function! EOLUnix()
	:set fileformat=unix
endfunction
