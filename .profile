export TERMINAL=alacritty
export EDITOR=vim
# Set the keyboard layouts, dvorak and us
# And set capslock to ctrl
setxkbmap dvorak,us -variant altgr-intl -option compose:ralt -option ctrl:nocaps
export PATH=$HOME/.self/bin:$HOME/.local/bin:$HOME/go/bin:$PATH

if [ -f ~/.profile_local ]; then
	source ~/.profile_local
fi
