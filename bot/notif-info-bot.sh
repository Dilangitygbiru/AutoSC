#!/bin/bash
# COLOR VALIDATION
clear
y='\033[1;33m' #yellow
BGX="\033[42m"
CYAN="\033[96m"
z="\033[96m"
RED='\033[0;31m'
NC='\033[0m'
gray="\e[1;30m"
Blue="\033[0;34m"
green='\033[0;32m'
grenbo="\e[92;1m"
purple="\033[1;95m"
YELL='\033[0;33m'
##
MYIP=$(wget -qO- ipinfo.io/ip);
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
####
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
dropbear_service=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
#Status | Geo Project
clear
# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="🟢ON"
else
   status_ssh="🔴OFF "
fi

# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="🟢ON"
else
    status_ws_epro="🔴OFF "
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="🟢ON"
else
   status_haproxy="🔴OFF "
fi

# STATUS SERVICE XRAY
if [[ $xray_service == "running" ]]; then 
   status_xray="🟢ON"
else
   status_xray="🔴OFF "
fi

# STATUS SERVICE NGINX
if [[ $nginx_service == "running" ]]; then 
   status_nginx="🟢ON"
else
   status_nginx="🔴OFF "
fi

# STATUS SERVICE Dropbear
if [[ $dropbear_service == "running" ]]; then 
   status_dropbear="🟢ON"
else
   status_dropbear="🔴 "
fi
###DOMAIN
domain=$(cat /etc/xray/domain)

function notif_statusvps() {
    versi=$(cat /root/versi/version)
    sleep 2
    TIME="10"
    URL="https://api.telegram.org/bot$KEY/sendMessage"
    TEXT="Satus Service VPN Script V$versi R[Longterm]
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️STATUS SERVICE NOTIF⚠️</b>
<b>     domain: $domain</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>HAPROXY : $status_haproxy</code>
<code>SSH     : $status_ssh</code>
<code>WSe-Pro : $status_ws_epro</code>
<code>XRAY    : $status_xray</code>
<code>Nginx   : $status_nginx</code>
<code>Dropbear: $status_dropbear</code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>BY BOT : @riot_cazorla</code>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
notif_statusvps
