#!/bin/bash

z="\033[96m"
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'

clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33m            Please Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            #progresbar Update
            echo -ne "\033[0;32m$GREENBG "
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33m         Please Wait Downloading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
    if [ ! -e /etc/bot/version ]; then
        mkdir -p /etc/bot/version
    fi

    versi123=$(cat /etc/bot/version/versi)

    IZIN=$( curl https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/bot/version | grep $versi123 ); >/dev/null 2>&1

    versiupdate=$(curl https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/bot/version);

function version(){
    if [ ! -e /etc/bot/version ]; then
        mkdir -p /etc/bot/version
    fi

    url="https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/bot"

    wget -O /etc/bot/version/versi "${url}/version" >/dev/null 2>&1
}

function botupdatesystem(){
    systemctl stop kyt

    url="https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/bot"

    mkdir shelbot
    cd shelbot

    wget "${url}/update/shel/bot-backup"
    wget "${url}/update/shel/bot-cek-login-ssh"
    wget "${url}/update/shel/bot-cek-ss"
    wget "${url}/update/shel/bot-cek-tr"
    wget "${url}/update/shel/bot-cek-vless"
    wget "${url}/update/shel/bot-cek-ws"
    wget "${url}/update/shel/bot-member-trojan"
    wget "${url}/update/shel/bot-member-ssh"
    wget "${url}/update/shel/bot-member-vless"
    wget "${url}/update/shel/bot-member-ws"
    wget "${url}/update/shel/bot-restore"
    wget "${url}/update/shel/bot-vps-info"
    wget "${url}/update/shel/bot-service-info"
    wget "${url}/update/shel/bot-trial-trojan"
    wget "${url}/update/shel/bot-trial-vless"
    wget "${url}/update/shel/bot-trial-ws"

    cd /root
    chmod +x shelbot/*
    mv shelbot/* /usr/bin
    rm -rf shelbot

    mkdir botupdate
    cd botupdate

    wget "${url}/update/bot/info.py"
    wget "${url}/update/bot/menu.py"
    wget "${url}/update/bot/setting.py"
    wget "${url}/update/bot/shadowsocks.py"
    wget "${url}/update/bot/ssh.py"
    wget "${url}/update/bot/start.py"
    wget "${url}/update/bot/trojan.py"
    wget "${url}/update/bot/vless.py"
    wget "${url}/update/bot/vmess.py"
    wget "${url}/update/bot/menunoobz.py"

    cd /root
    mv botupdate/* /usr/bin/kyt/modules
    rm -rf botupdate

    systemctl restart kyt
}

res1() {
    version
    botupdatesystem
}

netfilter-persistent
clear
echo -e "${z}┌──────────────────────────────────────────┐${NC}"
echo -e "             CEK UPDATE BOT       "
echo -e "${z}└──────────────────────────────────────────┘${NC}"
    if [ $versi123 = $IZIN ]; then
        echo -e "${NC}${Green}OUR BOT IS UP TO DATE !${NC}"
        rm update-bot.sh >/dev/null 2>&1
        rm -rf update
    else
        clear
        echo -e "${z}┌──────────────────────────────────────────┐${NC}"
        echo -e "             UPDATE BOT RIOT STORE       "
        echo -e "${z}└──────────────────────────────────────────┘${NC}"
        echo -e "${z}┌──────────────────────────────────────────┐${NC}"
        echo -e "     ${YELLOW}[*] Fix Bug Trial SSH${NC}"
        echo -e "     ${YELLOW}[*] Fix Bug Trial vmess${NC}"
        echo -e "     ${YELLOW}[*] Fix Bug Trial vless${NC}"
        echo -e "     ${YELLOW}[*] Add member list Vmess and Vless${NC}"
        echo -e "     ${YELLOW}[*] Change Menu Bot${NC}"
        echo -e "${z}└──────────────────────────────────────────┘${NC}"
        read -p "   Update Bot system and Etc ? [y/n]: " question
            if [ ${question} = 'y' ] || [ ${question} = 'Y']; then
                echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
                echo -e ""
                echo -e "  ${YELLOW} Update Bot Service${NC}"
                fun_bar 'res1'
                rm update-bot.sh >/dev/null 2>&1
                rm -rf update
                echo -e "  ${Green}  Update Done!${NC}"
                echo -e ""
                echo -e " ${z}└──────────────────────────────────────────┘${NC}"
            elif [ ${question} = 'n' ] || [ ${question} = 'N' ]; then
                echo -e "    ${YELLOW} Back on Menu Update in 3 second${NC}"
                sleep 3
                rm update-bot.sh >/dev/null 2>&1
                rm -rf update
                menu
            else
                echo -e "   ${RED} Command Wrong, example : y or n. Tyr Again Later!${NC}"
                sleep 2
                rm update-bot.sh >/dev/null 2>&1
                rm -rf update
                menu
            fi

    fi
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
