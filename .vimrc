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

let mapleader=' '
let maplocalleader=' '

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

" Colorscheme
set background=dark
set t_Co=256
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
