#!/bin/bash

function handler1()
{
	espeak "SIGUSR1 recieved"
}

function handler2()
{
	espeak "SIGUSR2 recieved"
}

echo "My PID is: $$"
trap handler1 SIGUSR1
trap handler2 SIGUSR2
while [ True ];do
	sleep 1
done
