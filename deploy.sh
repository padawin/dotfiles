#! /bin/bash

SOURCE=$(dirname $(readlink -f $0))

# Prepare git hooks
for hook in $(ls $SOURCE/git_hooks/); do
	ln -s "$SOURCE/git_hooks/$hook" ".git_template/hooks/$hook"
done

files[0]='.gconf/apps/gnome-terminal'
files[1]='.ackrc'
files[2]='.bashrc'
files[3]='.config/i3status'
files[4]='.config/i3blocks/'
files[5]='.config/geany'
files[6]='.scripts'
files[7]='.vimrc'
files[8]='.bash_profile'
files[9]='.bash_aliases'
files[10]='.gitconfig'
files[11]='.gitattributes'
files[12]='.gitignore-global'
files[13]='.vim'
files[14]='.i3'
files[15]='.tmux.conf'
files[16]='.git_template'
files[17]='.self'
files[18]='.editorconfig'
files[19]='.Xresources'
files[20]='.inputrc'

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

[ ! -d ~/.vim/backup ] && mkdir -p ~/.vim/backup
