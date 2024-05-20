#/bin/bash

MYIP=$(curl -s ifconfig.me)
echo "My public ip is: $MYIP"

curl ipinfo.io/$MYIP
