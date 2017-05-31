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
set cindent
set tw=80       " set line length to 80 chars max
set fdm=manual  " folding
set mouse=n     " Enable mouse usage (normal mode) in terminals
set laststatus=2                  " Always show a status bar
set statusline=
set statusline+=%<\                            " cut at start
set statusline+=%*[%n%H%M%R%W]%*\              " flags and buf no
set statusline+=%-40f\                         " path
set statusline+=%=[%{strlen(&ft)?&ft:'none'}\  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}]   " encoding
set statusline+=%10((%l,%c)%)\                 " line and column
set statusline+=%P                             " percentage of file
set hlsearch                                   " highlight search results by default
set bs=indent,eol,start     " Backspace over everything in insert mode

" Find in recursive paths + "fuzzy" search
set path+=**

set nocompatible              " be iMproved, required
let mapleader=' '
let maplocalleader=' '

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" activate filetypes and syntax highlighting
filetype plugin indent on
syntax on

source ~/.vim/utils.vim

let MYVIMSHORTCUTS = '~/.vim/shortcuts.vim'
call SafeSource(MYVIMSHORTCUTS)

" remove end of lines white spaces when saving
autocmd BufWritePre * silent! call TrimEOL()
autocmd BufReadPost * silent! call EOLUnix()

set noautoread
autocmd InsertEnter,CursorMoved,CursorMovedI * silent! checktime

autocmd BufNewFile,BufReadPost *tpp set filetype=cpp

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

set wildchar=<Tab> wildmenu wildmode=full
" To be able to leave an unsaved buffer to access another one
set hidden
set tags=.git/tags;/

set splitbelow
set splitright

" syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pep8', 'flake8']
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"colorscheme default
"colorscheme dw_green
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

let &colorcolumn="80,".join(range(120,999),",")
