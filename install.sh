#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

echo "Figuring out which package manager to use"
which dnf 1> /dev/null
if [ $? -eq 0 ]; then
	INSTALL_PROG="dnf"
else
	INSTALL_PROG="apt"
	sudo apt update
fi
echo "Use $INSTALL_PROG"

echo "Install some needed programs using system's package manager"
# Install needed programs
sudo $INSTALL_PROG install \
	git vim alacritty tmux python3 pip \
	i3 flameshot feh ranger \
	rofi \
	polybar sysstat acpi volumeicon network-manager-applet \
	xset \
	light \
	htop tree

(
	echo "Install fzf"
	echo "fzf releases: https://github.com/junegunn/fzf/releases"
	read -p "URL to fzf archive to install (leave empty to skip): " -r URL
	if [ ! -z "$URL" ]; then
		DIR=$(mktemp -d)
		cd $DIR
		wget $URL
		tar xzvf `basename $URL`
		mv fzf ~/.local/bin/fzf
		rm `basename $URL`
	fi
	echo "fzf installed"
)

(
	echo "Install gti"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/rwos/gti.git
	cd gti
	make
	mv gti ~/.local/bin/gti
	echo "gti installed"
)

(
	echo "Install markdown"
	DIR=$(mktemp -d)
	cd $DIR
	wget https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
	unzip Markdown_1.0.1.zip
	mv Markdown_1.0.1/Markdown.pl ~/.local/bin/markdown
	echo "markdown installed"
)

(
	echo "Install git branch-status"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/bill-auger/git-branch-status
	cd git-branch-status
	mv git-branch-status ~/.local/bin/git-branch-status
	echo "git branch-status installed"
)

(
	echo "Install Github Notifications"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/padawin/github-notifications
	cd github-notifications
	make
	mv github-notifications ~/.local/bin/github-notifications
	echo "github notifications installed"
)

(
	echo "Install German Practice"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/padawin/german-practice
	cd german-practice
	BINDIR=~/.local/bin/ make all install
	echo "German Practice installed"
)

echo "Install tmuxp"
pip3 install --user tmuxp

# Some setup
# For italic terminal:
tic -x xterm-256color-italic.terminfo
