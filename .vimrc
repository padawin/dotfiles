" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

" my conf
"
set number          " show lines numbers
set autoindent      " set autoindenting on
set smartindent     " set smart autoindenting
set ignorecase      " set case insensitive matching
set shiftwidth=4    " tab is 4 spaces
set tabstop=4       " tab is 4 spaces
set softtabstop=4   " y=tab is 4 spaces
set tw=120          " set line length to 80 chars max
set fdm=marker      "folding

" activate filetypes and syntax highlighting
filetype plugin indent on
syntax on

" paramétrage des templates
" snippetsEmu conf
let g:snip_start_tag = "@"
let g:snip_end_tag = "@"
let g:snip_set_textmate_cp = 1

let php_folding = 1

set nohlsearch

" mappe sur la combinaison C-SPACE (NUL)
imap <unique> <Nul> <Plug>Jumper

source ~/.vim/utils.vim

call SafeSource('~/.vim/shortcuts.vim')

if has("autocmd")
    autocmd FileType php,*.php    call SafeSource("~/.vim/filetypes/php.vim")
    autocmd FileType python,*.py  call SafeSource("~/.vim/filetypes/python.vim")
    autocmd FileType html,*.html 	call SafeSource("~/.vim/filetypes/html.vim")
    autocmd FileType cs,*.cs    call SafeSource("~/.vim/filetypes/cs.vim")
endif

function! TrimEOL()
  let line = line(".")
  exec 'v:^--\s*$:s:\s\+$::e'
  exec line
endfunction

function! EOLUnix()
	:set fileformat=unix
endfunction

" remove end of lines white spaces when saving
autocmd BufWritePre * silent! call TrimEOL()
autocmd BufReadPost * silent! call EOLUnix()

" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>

" , #perl # comments
map ,# :s/^/#/<CR>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
map gn /\(<<<<\\|====\\|>>>>\)<CR>

set pastetoggle=<F2>

set t_Co=256

" avoid tilde files in working directory
set backupdir=~/.vim/backup
" avoid swap files in working directory
set directory=~/.vim/backup/

" ctrl up and ctrl down in tmux
set t_kN=[6;*~
set t_kP=[5;*~

" fix home and end keys in tmux
set t_kh=OH
set t_@7=OF

" open Ctags in a tabe or vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"colorscheme default
"colorscheme dw_green
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
