#! /bin/bash

SOURCE=$(dirname $(readlink -f $0))

# Prepare git hooks
for hook in $(ls $SOURCE/git_hooks/); do
	if [ ! -f ".git_template/hooks/$hook" ]; then
		ln -fs "$SOURCE/git_hooks/$hook" ".git_template/hooks/$hook"
	fi
done

files[0]='.gconf/apps/gnome-terminal'
files[1]='.ackrc'
files[2]='.bashrc'
files[3]='.config/i3'
files[4]='.config/polybar'
files[5]='.scripts'
files[6]='.vimrc'
files[7]='.bash_profile'
files[8]='.bash_aliases'
files[9]='.gitconfig'
files[10]='.gitattributes'
files[11]='.gitignore-global'
files[12]='.vim'
files[13]='.tmux.conf'
files[14]='.git_template'
files[15]='.self'
files[16]='.editorconfig'
files[17]='.Xresources'
files[18]='.inputrc'
files[19]='xterm-256color-italic.terminfo'

for f in "${files[@]}"
do
	[ -a $f ] && rm -rf $HOME/$f

	sourcedir=$(dirname $HOME/$f)
	if [ ! -d $(dirname $HOME/$f) ]
	then
		mkdir -p $sourcedir
	fi
	ln -fs $SOURCE/$f $HOME/$f
done

mkdir -p ~/.vim/backup
