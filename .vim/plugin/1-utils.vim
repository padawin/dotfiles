" miscellaneous utils used in vim config files

function! SynStack()
  if !exists("*synstack")
    return
  endif
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! EchoSynStack()
  echo join(SynStack(), ", ")
endfunc
command! -nargs=0 SynStack :call SynStack()
command! -nargs=0 SynStackEcho :call EchoSynStack()
