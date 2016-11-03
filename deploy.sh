#! /bin/bash

SOURCE=$(dirname $(readlink -f $0))

files[0]='.gconf/apps/gnome-terminal'
files[1]='.ackrc'
files[2]='.bashrc'
files[3]='.config/awesome'
files[4]='.config/i3status'
files[5]='.config/geany'
files[6]='.scripts'
files[7]='.vimrc'
files[8]='.bash_profile'
files[9]='.bash_aliases'
files[10]='.gitconfig'
files[11]='.vim'
files[12]='.i3'
files[13]='.tmux.conf'
files[14]='.git_template'

for f in "${files[@]}"
do
	[ -a $f ] && rm -rf $HOME/$f

	sourcedir=$(dirname $HOME/$f)
	if [ ! -d $(dirname $HOME/$f) ]
	then
		mkdir -p $sourcedir
	fi
	ln -s $SOURCE/$f $HOME/$f
done

[ ! -d ~/.vim/backup ] && mkdir -p ~/.vim/backup
