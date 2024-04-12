" miscellaneous utils used in vim config files

function! SynStack()
  if !exists("*synstack")
    return
  endif
  return map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function! ToggleCursorbind()
  if &cursorbind == 1
    set nocursorbind
  else
    set cursorbind
  endif
endfunc

function! EchoSynStack()
  echo join(SynStack(), ", ")
endfunc
command! -nargs=0 SynStack :call SynStack()
command! -nargs=0 SynStackEcho :call EchoSynStack()

" Credits: https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript/6271254#6271254
function! GetVisualSelection()
	" Why is this not a built-in Vim script function?!
	let [line_start, column_start] = getpos("'<")[1:2]
	let [line_end, column_end] = getpos("'>")[1:2]
	let lines = getline(line_start, line_end)
	if len(lines) == 0
		return ''
	endif
	let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
	let lines[0] = lines[0][column_start - 1:]
	return join(lines, "\n")
endfunction
command! -nargs=0 VisualSelection :call GetVisualSelection()

function! Grep(txt)
	execute "silent lgrep " . a:txt
	execute "normal \<C-O>"
	lopen
endfunc
