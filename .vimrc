filetype off

let vundle_readme = expand('~/.vim/bundle/Vundle.vim/README.md')
" Auto-installing Vundle
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ap/vim-css-color'

Plugin 'AndrewRadev/linediff.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'easymotion/vim-easymotion'

Plugin 'padawin/vim-presentation'
Plugin 'fatih/vim-go'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'beyondmarc/glsl.vim'
Plugin 'klen/python-mode'

" All of your Plugins must be added before the following line
call vundle#end()

" activate filetypes and syntax highlighting
filetype plugin indent on
syntax on

if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
		\	if &omnifunc == "" |
		\		setlocal omnifunc=syntaxcomplete#Complete |
		\	endif
endif

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
	autocmd BufWritePost * silent !ctags-gen check-git 2> /dev/null
augroup END

" Most of the configurations are is:
" This one contains most of the `set ` commands
" plugin/0-settings.vim
" This one contains some functions to use when needed
" plugin/1-utils.vim
" This one contains all my mappings
" plugin/2-shortcuts.vim
" This one sets up my syntax highlight, colorscheme and related
" plugin/3-highlight.vim

" Allow .vimrc files to be created in projects and automatically loaded
set exrc
set secure
