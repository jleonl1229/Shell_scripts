#!/bin/bash

function update()
{
	sudo apt update && sudo apt upgrade && sudo apt autoremove
	espeak "Locally updated sucessfully"
	xdotool type 'sudo apt update && sudo apt upgrade && sudo apt autoremove'
	xdotool key Return
	espeak "Remotely updated successfully"
}

function list()
{
	ls
	cd
	ls
	espeak "Locally listed successfully"
	xdotool type 'ls && cd && ls'
	xdotool key Return
	espeak "Remotely listed successfully"
}

echo "My PID is: $$"

trap update SIGUSR1
trap list SIGUSR2

while [ True ]; do
	sleep 1
done
