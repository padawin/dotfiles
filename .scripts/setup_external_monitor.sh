#!/bin/sh
# Automatically setup external monitor

xrandr_command="/usr/bin/xrandr"
sed_command="/bin/sed"

is_hdmi_connected=`DISPLAY=:0 $xrandr_command | $sed_command -n '/HDMI1 connected/p'`

if [ ! -z $1 ]
then
	POSITION=$1
else
	POSITION='above'
fi

if [ -n "$is_hdmi_connected" ]; then
  DISPLAY=:0 $xrandr_command --output HDMI1 --auto --$POSITION LVDS1
else
  DISPLAY=:0 $xrandr_command --output HDMI1 --off
fi
