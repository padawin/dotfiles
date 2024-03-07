" show lines numbers
set number
" Highlight the line where the cursor is
set cursorline
" autoindent as per C rules
set cindent
" line length to 80 chars max
set textwidth=80
" folding
set foldmethod=manual
" Enable mouse usage (normal mode) in terminals
set mouse=n

set scrolloff=3

" Always show a status bar
set laststatus=2
set statusline=
" flags and buf no
set statusline+=%*[%n%H%R%W]%*
" cut at start
set statusline+=\ %<
" path
set statusline+=\ %-40f\ %=
" SynStack under cursor
set statusline+=[%{join(SynStack())}]
set statusline+=%#warningmsg#%m%*
" filetype
set statusline+=[%{strlen(&ft)?&ft:'none'}
" encoding
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}]
" line and column
set statusline+=%10((%l/%L,%c)%)
" percentage of file
set statusline+=\ %P
" search is done as the letters are typed
set incsearch

" highlight search results by default
set hlsearch
" Search is case insensitive...
set ignorecase
" ...Unless a capital letter is typed, in which case, the search becomes case sensitive
set smartcase
" Backspace over everything in insert mode
set backspace=indent,eol,start

" Invisible chars display:
set listchars=space:·,trail:█

set completeopt=menuone,popup,noinsert

" Set spell check
set spell spelllang=en spellfile=$HOME/.vim/spell/techspeak.utf-8.add,$HOME/.vim/spell/en.utf-8.add

" Find in recursive paths + "fuzzy" search
set path+=**

set grepprg=ag

" avoid tilde files in working directory
set backupdir=~/.vim/backup
" avoid swap files in working directory
set directory=~/.vim/backup/

set wildchar=<Tab> wildmenu wildmode=full
" To be able to leave an unsaved buffer to access another one
set hidden
set tags=.git/tags;/

" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

set splitbelow
set splitright

let mapleader=' '
let maplocalleader=' '

let &colorcolumn=&l:textwidth . ",".join(range(120,999),",")

let g:cpp_member_variable_highlight = 1
let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pylint', 'pycodestyle', 'pyflakes']
let g:pymode_run_bind = '<leader>R'
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_lint_cwindow = 0
let g:acp_completeOption = '.,w,b,u'

"let g:go_fmt_command = "goimports"
"let g:go_fmt_options = {
"      \ 'goimports': '-local github.com',
"      \ }
let g:go_auto_type_info = 1

" This value is set to '<c-c>' by default, making an annoying delay when wanting
" to use <c-c> as its normal usage (escape-like)
" Defined in: /usr/share/vim/vim82/ftplugin/sql.vim
let g:omni_sql_no_default_maps = '1'
