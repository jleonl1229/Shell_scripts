#!/bin/bash

while read line;
do
	vim testing.txt
	if [$? -eq 0];
	then
		xdotool key Return
		sleep 1
		xdotool type '$line'
		xdtool key Return
		if [xdotool type Return -eq 0];
		then
			xdotool key shift+semicolon
			xdotool type ':q!'
			echo "The password was $line"	
			break
		else
			xdotool key shift+semicolon
			xdotool type ':q!'
			xdotool type Return
		fi
	else
		echo "No file found"
	fi
done < $1
