#!/bin/bash

if [ -z "${1}" ];
then
	echo "Introduce the name of a file as first argument"
	exit 1
fi

i=1
size=$(ls -la | grep $1 | awk '{print $5}')

if [ -z "${size}" ];
then
	echo "File not found"
	exit 1
fi

while [ $i -lt $size ];
do
	if [ $i -eq 1 ];
	then
		printf '\0' > $1
	else
		printf '\0' >> $1
	fi
	let i=$i+1	
done
printf '\0' >> $1
exit 0
