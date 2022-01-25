#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o nounset

echo "Figuring out which package manager to use"
if [ ! -z `which dnf` ]; then
	INSTALL_PROG="dnf"
else
	INSTALL_PROG="apt"
	sudo apt update
fi
echo "Use $INSTALL_PROG"

echo "Install some needed programs using system's package manager"
# Install needed programs
sudo $INSTALL_PROG install -y \
	git vim alacritty tmux tmate python3 pip \
	i3 i3ipc flameshot feh ranger \
	rofi \
	polybar sysstat acpi volumeicon network-manager-applet \
	xset \
	light \
	htop tree \
	fontawesome-fonts

if [ -z "`which fzf`" ]; then
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
fi
echo -e "\e[0;32m✔\e[0m fzf installed"

if [ -z "`which gti`" ]; then
	echo "Install gti"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/rwos/gti.git
	cd gti
	make
	mv gti ~/.local/bin/gti
fi
echo -e "\e[0;32m✔\e[0m gti installed"

if [ -z "`which markdown`" ]; then
	echo "Install markdown"
	DIR=$(mktemp -d)
	cd $DIR
	wget https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
	unzip Markdown_1.0.1.zip
	mv Markdown_1.0.1/Markdown.pl ~/.local/bin/markdown
fi
echo -e "\e[0;32m✔\e[0m markdown installed"

if [ -z "`which rofication-gui`" ]; then
	echo "Install rofication"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/regolith-linux/regolith-rofication.git
	cd regolith-notification
	sudo python setup.py install
fi
echo -e "\e[0;32m✔\e[0m rofication installed"

if [ -z "`which git-branch-status`" ]; then
	echo "Install git branch-status"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/bill-auger/git-branch-status
	cd git-branch-status
	mv git-branch-status ~/.local/bin/git-branch-status
fi
echo -e "\e[0;32m✔\e[0m git branch-status installed"

if [ -z "`which github-notifications`" ]; then
	echo "Install Github Notifications"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/padawin/github-notifications
	cd github-notifications
	make
	mv github-notifications ~/.local/bin/github-notifications
fi
echo -e "\e[0;32m✔\e[0m github notifications installed"

if [ -z "`which german-practice`" ]; then
	echo "Install German Practice"
	DIR=$(mktemp -d)
	cd $DIR
	git clone https://github.com/padawin/german-practice
	cd german-practice
	BINDIR=~/.local/bin/ make all install
fi
echo -e "\e[0;32m✔\e[0m German Practice installed"

if [ -z "`which tmuxp`" ]; then
	echo "Install tmuxp"
	pip3 install --user tmuxp
fi
echo -e "\e[0;32m✔\e[0m tmuxp installed"

# Some setup
# For italic terminal:
tic -x xterm-256color-italic.terminfo

cd ~
if [ ! -d dotfiles ]; then
	git clone git@github.com:padawin/dotfiles
	cd dotfiles
	./deploy.sh
fi

read -p "Is your GITHUB_NOTIFICATION_TOKEN set?"
echo -e "\e[0;32m✔\e[0m Installation complete"
