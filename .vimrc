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

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

" Source a global configuration file if available
" if filereadable("/etc/vim/vimrc")
"     source /etc/vim/vimrc
" endif

" my conf
"
set number      " show lines numbers
set autoindent  " set autoindenting on
set smartindent " set smart autoindenting
set tw=80       " set line length to 80 chars max
set fdm=marker  " folding
set mouse=a     " Enable mouse usage (all modes) in terminals

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" Map key to toggle opt
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)


" remove end of lines white spaces when saving
autocmd BufWritePre * silent! call TrimEOL()
autocmd BufReadPost * silent! call EOLUnix()

" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>

" , #perl # comments
map ,# :s/^/#/<CR>

" during a conflict resolution, the user can navigate with this pattern
" in the different parts of conflicts in the file
map gn /^\(<<<<\\|====\\|>>>>\)<CR>
MapToggle rl relativenumber

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

nnoremap <F5> :GundoToggle<CR>
nnoremap to :NERDTree .<CR>
nnoremap tc :NERDTreeClose<CR>

"colorscheme default
"colorscheme dw_green
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
