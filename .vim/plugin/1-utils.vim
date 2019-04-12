" miscellaneous utils used in vim config files

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! -nargs=0 SynStack :call SynStack()
