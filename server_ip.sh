#!/bin/bash

#read -p "Introduce the domain name(example: google.com): " domain
#seeker=$(dig $domain  | grep $domain.  | tail -1 | awk '{printf $5}')
while read line; do
    seeker=$(ping -c 1 -n $line | grep "bytes from" | awk '{printf $4}' | sed s/.$//)
    response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$line")
    #echo -e "$line\tIP:$seeker\tResponse:$response"
    printf "%-30s IP:%-30s Response:%s\n" "$line" "$seeker" "$response"
done < $1
# echo $seeker
