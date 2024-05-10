#!/bin/bash

function cript($1)
{
	xdotool type '$1'
	xdotool key Return
	xdotool type '$1'
	xdotool key Return
	sleep 1
}

function uncript($1)
{
	xdotool key Return
	xdotool key Return
	sleep 1
}

function neutral($ext, $elec, $1)
{
	com1="ls -a" | grep .txt
	$com1 | while read file;
	do
		xdotool type --delay 100 'vim $file'
		xdotool key Return
		xdotool key shift+semicolon
		xdotool type ':X'
		xdotool key Return
		if [ $elec -eq 'c' ];
		then
			cript($1);
		elif [ $elec -eq "uc" ];
		then
			uncript($1);
		else
			echo "Invalid command"
		fi
		xdotool type ':x!'
		xdotool key Return
		xdotool type ':x!'
		xdotool key Return
	done
}

function main($1)
{
	read -p "Insert the extension(txt...): " ext
	if [ "$ext" != "" ];
	then
		read -p "Cript(c)/Uncript(uc)" elec
		if [ "$elec" != "" ];
		then
			neutral($ext, $elec, $1)
		else
			echo "Invalid option"
		fi
	else
		echo "There is no extension"
	fi
}

main($1)
