set number                                     " show lines numbers
set cindent                                    " autoindent as per C rules
set textwidth=80                               " line length to 80 chars max
set foldmethod=manual                          " folding
set mouse=n                                    " Enable mouse usage (normal
                                               " mode) in terminals
set laststatus=2                               " Always show a status bar
set statusline=
set statusline+=%*[%n%H%R%W]%*\                " flags and buf no
set statusline+=%<\                            " cut at start
set statusline+=%-40f\                         " path
set statusline+=%=%#warningmsg#%m%*
set statusline+=[%{strlen(&ft)?&ft:'none'}\    " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}]   " encoding
set statusline+=%10((%l/%L,%c)%)\              " line and column
set statusline+=%P                             " percentage of file
set incsearch                                  " search is done as the letters
                                               " are typed
set hlsearch                                   " highlight search results by
                                               " default
set ignorecase                                 " Search is case insensitive...
set smartcase                                  " ...Unless a capital letter is
                                               " typed, in which case, the
                                               " search becomes case sensitive
set backspace=indent,eol,start                 " Backspace over everything in
                                               " insert mode

set completeopt=menu,preview,menuone
inoremap <expr> <TAB> pumvisible() ? '<CR>' : "\<TAB>"

set spell spelllang=en spellfile=$HOME/.vim/spell/techspeak.utf-8.add,$HOME/.vim/en.utf-8.add

" Find in recursive paths + "fuzzy" search
set path+=**

set grepprg=ag

let mapleader=' '
let maplocalleader=' '

filetype off

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'klen/python-mode'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'vim-scripts/AutoComplPop'

" All of your Plugins must be added before the following line
call vundle#end()

" activate filetypes and syntax highlighting
filetype plugin indent on
syntax on

source ~/.vim/utils.vim

let MYVIMSHORTCUTS = '~/.vim/shortcuts.vim'
call SafeSource(MYVIMSHORTCUTS)

augroup Completion
	autocmd!
	autocmd FileType python set omnifunc=syntaxcomplete#Complete
augroup END

set noautoread
augroup Refresh
	autocmd!
	" Refresh buffers externally changed
	autocmd InsertEnter,CursorMoved,CursorMovedI * silent! checktime
augroup END

augroup ExtraFiletype
	autocmd!
	autocmd BufNewFile,BufReadPost *tpp set filetype=cpp
augroup END

augroup CTags
	autocmd!
	autocmd BufWritePost * silent !ctags-gen
augroup END

set t_Co=256

" avoid tilde files in working directory
set backupdir=~/.vim/backup
" avoid swap files in working directory
set directory=~/.vim/backup/

" fix home and end keys in tmux

set wildchar=<Tab> wildmenu wildmode=full
" To be able to leave an unsaved buffer to access another one
set hidden
set tags=.git/tags;/

set splitbelow
set splitright

set background=dark
let g:solarized_termcolors=256
let g:solarized_diffmode="high"
colorscheme solarized

" Invisible chars display:
set listchars=space:·,trail:█
highlight WhiteSpaceBol ctermfg=grey
highlight WhiteSpaceMol ctermfg=black
highlight WhiteSpaceEol ctermfg=red
match WhiteSpaceMol / /
2match WhiteSpaceBol /^ \+/
2match WhiteSpaceEol / \+$/

" Don't mark pascal, camel and snake case as badly spelt
syntax match CamelNoSpell '\<\l\+\(\u\l*\)\+\>' contains=@NoSpell
syntax match SnakeNoSpell '\<\l\+\(_\l\+\)\+\>' contains=@NoSpell
syntax match PascalNoSpell '\<\(\u[a-z]*\)\{2,\}\>' contains=@NoSpell
" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
syntax match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell

let &colorcolumn=&l:textwidth . ",".join(range(120,999),",")

let g:cpp_member_variable_highlight = 1
let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pylint', 'pycodestyle', 'pyflakes']
let g:pymode_run_bind = '<leader>R'
let g:pymode_breakpoint_bind = '<leader>B'
let g:pymode_lint_cwindow = 0
