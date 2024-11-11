#!/bin/bash

##Color
z="\033[96m"
ORANGE='\033[0;33m'
NC='\033[0m'
RED="\033[31m"
PURPLE='\e[35m'

##Instalasi

function install(){
    git clone https://github.com/noobz-id/noobzvpns.git
    cd noobzvpns/
    ./install.sh
}

function finish(){
    ##start Service
    systemctl start noobzvpns.service

    ##Auto Start Setelah reboot
    systemctl enable noobzvpns.service
}

function getmenu(){
    instalasi="https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/noobz/"

    mkdir menu
    cd menu
    wget -O menu "${instalasi}menu/m-noob.sh"
    cd /root
    chmod +x menu/*
    mv menu/* /usr/local/sbin
    rm -rf menu
}

function runinginstall(){
    instal
    finish
    getmenu
}
runinginstall
