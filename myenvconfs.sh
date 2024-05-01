#!/bin/bash

sudo apt-get install xdotool -y
sudo apt-get install vim -y
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cat <<EOF > ~/.vimrc
set number
syntax on 
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
call plug#end()
EOF
xdotool type --delay 100 'vim'
xdotool key Return
xdotool key shift+semicolon
xdotool type 'PlugInstall'
xdotool key Return
sleep 10
xdotool type ':x!'
xdotool key Return
xdotool type ':x!'
xdotool key Return
sudo apt-get install hydra -y
sudo apt-get install nmap -y
sudo apt-get install ssh -y
sudo apt-get install netcat -y
sudo apt-get install espeak -y
sudo apt-get install cmatrix -y
sudo apt-get install gcc -y
sudo apt-get insatll htop -y
sudo apt-get install python3 -y
sudo apt-get install python3 python3-pip -y
sudo pip3 install virtualenv
sudo install Flask
