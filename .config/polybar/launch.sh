#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

echo "--- start bottom" | tee -a /tmp/polybar1$USER.log /tmp/polybar2$USER.log

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	echo $m
	MONITOR=$m polybar bottom >>/tmp/polybar1$USER.log 2>&1 & disown
done

echo "Bars launched..."
