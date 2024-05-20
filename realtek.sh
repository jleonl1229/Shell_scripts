#/bin/bash

echo "Updating"
sudo apt update
echo "Downloading the driver"
sudo install firmware-realtek
echo "Cargando el modulo en el kernel"
sudo modprobe rt18723de
echo "Checking the interface"
ip link
