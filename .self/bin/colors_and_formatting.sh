#!/bin/bash

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# ANSI Colors
echo "ANSI Colors"
for c in {30..37}; do
	echo -en "\e[${c}m${c}\e[0m\n"
done
echo "ANSI Bright Colors"
for c in {90..97}; do
	echo -en "\e[${c}m${c}\e[0m\n"
done
echo "xterm 256 colors"
for c in {0..255}; do
	echo -en "\e[38;5;${c}m38;5;${c}\e[0m\n"
done
# for clbg in {40..47} {100..107} 49 ; do
# 	#Foreground
# 	for clfg in {30..37} {90..97} 39 ; do
# 		#Formatting
# 		for attr in 0 1 2 4 5 7 ; do
# 			#Print the result
# 			echo -en "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
# 		done
# 		echo #Newline
# 	done
# done

exit 0
