#!/bin/bash
clear
echo "bot backup"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp -r /etc/cron.d backup/cron.d
cp -r /var/lib/kyt/ backup/kyt 
cp -r /etc/xray backup/xray
cp -r /etc/vmess backup/vmess
cp -r /etc/vless backup/vless
cp -r /etc/trojan backup/trojan
cp -r /etc/shadowsocks backup/shadowsocks
cp -r /etc/kyt/limit/vmess/ip backup/ip/vmess
cp -r /etc/kyt/limit/vless/ip backup/ip/vless
cp -r /etc/kyt/limit/trojan/ip backup/ip/trojan
cp -r /etc/kyt/limit/shadowsocks/ip backup/ip/shadowsocks
cp -r /etc/kyt/limit/ssh/ip backup/ip/ssh
cp -r /var/www/html/ backup/html
cd /root
domain=$(cat /etc/xray/domain)
IP=$(curl -sS ipv4.icanhazip.com)
date=$(date +"%Y-%m-%d")
zip -r $IP-$date.zip backup

function send_backup(){
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendDocument"
TEXT="<code>Script Auto Install by RIOT Tunneling</code>

 <u>✨Backup VPS Created successfully✨</u>

 Upload your backup file to a supported file hosting (direct link)
"

curl -F chat_id=$CHATID -F document=@"$1"/root/$IP-$date.zip > /dev/null 2>&1 -F caption="Backup: ${date}" $URL

}
send_backup
rm -rf /root/backup
rm -rf /root/$IP-$date.zip