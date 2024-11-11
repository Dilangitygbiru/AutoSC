#!/bin/bash

z="\033[96m"
ORANGE='\033[0;33m'
NC='\033[0m'
RED="\033[31m"
PURPLE='\e[35m'
biru="\033[0;36m"
GREEN='\033[0;32m'
Suffix="\033[0m"
Bold='\e[1m'

function upd(){
cd
rm -rf /root/udp
mkdir -p /root/udp

# change to time GMT+7
echo "change to time GMT+7"
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# install udp-custom
echo downloading udp-custom
wget -q -O /root/udp/udp-custom "https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/Udp/udp-custom-linux-amd64" && chmod +x /root/udp/udp-custom

echo downloading default config
wget -q -O /root/udp/config.json "https://raw.githubusercontent.com/Dilangitygbiru/AutoSC/main/Udp/config.json" && chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null
}

SERVICE1="udp-custom"

if systemctl is-active --quiet $SERVICE1; then
    echo -e " UPD Has Been Installed"
else
    echo -e " ${z}┌──────────────────────────────────────────┐${NC}"
    echo -e "      $PURPLE          Install UDP              $NC"
    echo -e " ${z}└──────────────────────────────────────────┘${NC}"
    echo -e ""
    read -p "  Are you sure, installed UDP? [y/n]: " yes
        if [ $yes = 'y' ]; then
            udp >/dev/null 2>&1
            rm udp-custom.sh >/dev/null 2>&1
            echo -e " Success Install UDP!! check the service first"
        elif [ $yes = 'n' ]; then
            menu
        else
            echo -e "  Wrong Input Commad, Please Try Again"
            menu
        fi
fi