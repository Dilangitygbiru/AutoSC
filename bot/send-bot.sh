#!/bin/bash
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"

#Bot SSH
function send_ssh(){
    TEXT="
    <code>  ──────────────────────────────</code>
    <code>    🏶 <strong>SSH and OVPN ACCOUNT</strong> 🏶   </code>
    <code>──────────────────────────────</code>
    <code>⧆ Host             : $domain</code>
    <code>⧆ Username         : $Login</code>
    <code>⧆ Password         : $Pass</code>
    <code>──────────────────────────────</code>
    <code>⧆ Port OpenSSH     : 443, 80, 22</code>
    <code>⧆ Port Dropbear    : 443, 109</code>
    <code>⧆ Port Dropbear WS : 443, 109</code>
    <code>⧆ Port SSH UDP     : 1-65535</code>
    <code>⧆ Port SSH WS      : 80, 8080, 8081-9999</code>
    <code>⧆ Port SSH SSL WS  : 443</code>
    <code>⧆ Port SSL/TLS     : 400-900</code>
    <code>⧆ Port OVPN WS SSL : 443</code>
    <code>⧆ Port OVPN SSL    : 443</code>
    <code>⧆ Port OVPN TCP    : 1194</code>
    <code>⧆ Port OVPN UDP    : 2200</code>
    <code>⧆ BadVPN UDP       : 7100, 7300, 7300</code>
    <code>──────────────────────────────</code>
    <code>⧆ <strong>SSH TLS/SNI : </strong><pre>$domain:443@$Login:$Pass</pre></code>
    <code>⧆ <strong>SSH Non TLS : </strong><pre>$domain:80@$Login:$Pass</pre></code>
    <code>──────────────────────────────</code>
    <code>⧆ <strong>Payload WSS: </strong><pre>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</pre></code>
    <code>──────────────────────────────</code>
    <code>⧆ Aktif Selama     : $masaaktif Hari</code>
    <code>⧆ Dibuat Pada      : $tnggl</code>
    <code>⧆ Berakhir Pada    : $expe</code>
    <code>──────────────────────────────</code>
    <code>🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 </code>
    <code>────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_sshtrial(){
    TEXT="
    <code>  ──────────────────────────────</code>
    <code>   🏶 <strong>Your Trial VPN Details</strong> 🏶 </code>
    <code>──────────────────────────────</code>
    <code>⧆ Hostname  : $domain</code>
    <code>⧆ Username  : $Login</code>
    <code>⧆ Password  : $Pass</code>
    <code>──────────────────────────────</code>
    <code>⧆ OpenSSH       : 22</code>
    <code>⧆ Dropbear      : 443, 109, 143</code>
    <code>⧆ SSL/TLS       : 400-900</code>
    <code>⧆ SSH WS TLS    : 443</code>
    <code>⧆ SSH WS NTLS   : 80, 8080, 8081-9999</code>
    <code>⧆ OVPN WS NTLS  : 80, 8080, 8880</code>
    <code>⧆ OVPN WS TLS   : 443</code>
    <code>⧆ UDP           : 1-65353</code>
    <code>⧆ BadVPN UDP    : 7100,7200,7300</code>
    <code>──────────────────────────────</code>
    <code>⧆ SSH TLS/SNI   : <pre>$domain:443@$Login:$Pass</pre></code>
    <code>⧆ SSH Non TLS   : <pre>$domain:80@$Login:$Pass</pre></code>
    <code>──────────────────────────────</code>
    <code>⧆ Payload WSS : <pre>GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]</pre></code>
    <code>──────────────────────────────</code>
    <code>⧆ Ovpn Download : <pre>https://$domain:81/</pre></code>
    <code>──────────────────────────────</code>
    <code>⧆ Save Link Account: <pre>https://$domain:81/ssh-$Login.txt</pre></code>
    <code>──────────────────────────────</code>
    <code>⧆ Dibuat Pada    : $tnggl</code>
    <code>⧆ Berakhir Pada  : $pup Menit</code>
    <code>──────────────────────────────</code>
    <code>🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 </code>
    <code>──────────────────────────────</code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Vmess
function send_vmess(){
    TEXT="
     <code>  ──────────────────────────────</code> 
     <code>   🏶 <strong>Xray/Vmess Account</strong> 🏶 </code>
     <code>────────────────────────────── </code>
     <code>⧆ Remarks          : ${user}</code>
     <code>⧆ Domain           : ${domain}</code>
     <code>⧆ Wilcard          : bug.${domain}</code>
     <code>⧆ User Quota       : ${Quota1}</code>
     <code>⧆ User Ip          : ${iplimit} IP</code>
     <code>⧆ Port TLS         : 400-900</code>
     <code>⧆ Port none TLS    : 80, 8080, 8081-9999</code>
     <code>⧆ id               : ${uuid}</code>
     <code>⧆ alterId          : 0</code>
     <code>⧆ Security         : auto</code>
     <code>⧆ Network          : ws</code>
     <code>⧆ Path             : /Multi-Path</code>
     <code>⧆ Dynamic          : https://bugmu.com/path</code>
     <code>⧆ ServiceName      : vmess-grpc</code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Link TLS : </strong><pre>${vmesslink1}</pre> </code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Link none TLS : </strong><pre>${vmesslink2}</pre> </code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Link GRPC : </strong><pre>${vmesslink3}</pre> </code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Format OpenClash : </strong><pre>https://${domain}:81/vmess-$user.txt</pre></code>
     <code>────────────────────────────── </code>
     <code>⧆ Aktif Selama     : $masaaktif Hari</code>
     <code>⧆ Dibuat Pada      : $tnggl</code>
     <code>⧆ Berakhir Pada    : $expe</code>
     <code>────────────────────────────── </code>
     <code>🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 </code>
     <code>────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialvmess(){
    TEXT="
     <code>  ──────────────────────────────</code>
     <code>   🏶 <strong>Trial Vmess Account</strong> 🏶 </code> 
     <code>────────────────────────────── </code>
     <code>⧆ Remarks          : ${user} </code>
     <code>⧆ Domain           : ${domain} </code>
     <code>⧆ User Quota       : ${Quota} </code>
     <code>⧆ Limit IP         : ${iplimit} IP </code>
     <code>⧆ Port TLS         : 400-900 </code>
     <code>⧆ Port none TLS    : 80, 8080, 8081-9999 </code>
     <code>⧆ id               : ${uuid} </code>
     <code>⧆ alterId          : 0 </code>
     <code>⧆ Security         : auto </code>
     <code>⧆ Network          : ws </code>
     <code>⧆ Path             : /Multi-Path </code>
     <code>⧆ Dynamic          : https://bugmu.com/path </code>
     <code>⧆ ServiceName      : vmess-grpc </code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Link TLS : </strong> </code><pre>${vmesslink1}</pre> </code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Link none TLS : </strong><pre>${vmesslink2}</pre> </code>
     <code>────────────────────────────── </code>
     <code>⧆ <strong>Link GRPC : </strong><pre>${vmesslink3}</pre> </code>
     <code>───────────────────────────── </code>
     <code>⧆ <strong>Format OpenClash : </strong><pre>https://${domain}:81/vmess-$user.txt</pre> </code>
     <code>────────────────────────────── </code>
     <code>⧆ Dibuat Pada      : $tnggl </code>
     <code>⧆ Berakhir Pada    : $pup Minutes </code>
     <code>────────────────────────────── </code>
     <code>🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 </code>
     <code>────────────────────────────── </code>
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Vless
function send_vless(){
    TEXT="
     ────────────────────────────── 
        🏶 <strong>Xray/Vless Account</strong> 🏶     
     ────────────────────────────── 
     ⧆ Remarks     : ${user}
     ⧆ Domain      : ${domain}
     ⧆ Wilcard     : bug.${domain}
     ⧆ User Quota  : ${Quota1}
     ⧆ User Ip     : ${iplimit} IP
     ⧆ port TLS    : 400-900
     ⧆ Port NTLS   : 80, 8080, 8081-9999
     ⧆ User ID     : ${uuid}
     ⧆ Encryption  : none
     ⧆ Path        : /Multi-Path
     ⧆ Dynamic     : https://bugmu.com/path
     ────────────────────────────── 
     ⧆ <strong>Link TLS : </strong>
     <pre>${vlesslink1}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link NTLS : </strong>
     <pre>${vlesslink2}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link GRPC : </strong>
     <pre>${vlesslink3}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Format OpenClash : </strong>
     <pre>https://${domain}:81/vless-$user.txt</pre>
     ────────────────────────────── 
     ⧆ Aktif Selama     : $masaaktif Hari
     ⧆ Dibuat Pada      : $tnggl
     ⧆ Berakhir Pada    : $expe
     ────────────────────────────── 
     🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialvless(){
    TEXT="
     ────────────────────────────── 
        🏶 <strong>Trial Vless Account</strong> 🏶    
     ────────────────────────────── 
     ⧆ Remarks     : ${user}
     ⧆ Domain      : ${domain}
     ⧆ Wilcard     : bug.${domain}
     ⧆ User Quota  : ${Quota1}
     ⧆ User Ip     : ${iplimit} IP
     ⧆ port TLS    : 400-900
     ⧆ Port NTLS   : 80, 8080, 8081-9999
     ⧆ User ID     : ${uuid}
     ⧆ Encryption  : none
     ⧆ Path        : /Multi-Path
     ⧆ Dynamic     : https://bugmu.com/path
     ────────────────────────────── 
     ⧆ <strong>Link TLS : </strong>
     <pre>${vlesslink1}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link NTLS   : </strong>
     <pre>${vlesslink2}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Link GRPC   : </strong>
     <pre>${vlesslink3}</pre> 
     ────────────────────────────── 
     ⧆ <strong>Format OpenClash : </strong>
     <pre>https://${domain}:81/vless-$user.txt</pre>
     ────────────────────────────── 
     ⧆ Aktif Selama     : $masaaktif Hari
     ⧆ Dibuat Pada      : $tnggl
     ⧆ Berakhir Pada    : $expe
     ────────────────────────────── 
     🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#Bot Trojan
function send_trojan(){
    TEXT="
     ──────────────────────────────  
        🏶 <strong>Xray/Trojan Account</strong> 🏶     
     ──────────────────────────────  
     ⧆ Remarks          : ${user}  
     ⧆ Host/IP          : ${domain} 
     ⧆ User Quota       : ${Quota} 
     ⧆ User IP          : ${iplimit} IP 
     ⧆ port             : 400-900  
     ⧆ Key              : ${uuid}  
     ⧆ Path             : /trojan-ws  
     ⧆ ServiceName      : trojan-grpc  
     ──────────────────────────────  
     ⧆ <strong>Link WS : </strong>  
     <pre>${trojanlink}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong> 
     <pre>${trojanlink1}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Format OpenClash : </strong> 
     <pre>https://${domain}:81/trojan-$user.txt</pre>  
     ──────────────────────────────  
     ⧆ Dibuat Pada      : $tnggl 
     ⧆ Berakhir Pada    : $pup Minutes 
     ──────────────────────────────  
     🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialtrojan(){
    TEXT="
     ──────────────────────────────  
       🏶 <strong>Trial Trojan Account</strong> 🏶     
     ──────────────────────────────  
     ⧆ Remarks          : ${user}  
     ⧆ Host/IP          : ${domain} 
     ⧆ User Quota       : ${Quota} 
     ⧆ User IP          : ${iplimit} IP 
     ⧆ port             : 400-900  
     ⧆ Key              : ${uuid}  
     ⧆ Path             : /trojan-ws  
     ⧆ ServiceName      : trojan-grpc  
     ──────────────────────────────  
     ⧆ <strong>Link WS  : </strong> 
     </pre>${trojanlink}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong>  
     </pre>${trojanlink1}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Format OpenClash : </strong>
     https://${domain}:81/trojan-$user.txt  
     ──────────────────────────────  
     ⧆ Dibuat Pada      : $tnggl 
     ⧆ Berakhir Pada    : $pup Minutes 
     ──────────────────────────────  
     🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}

#bot ssws
function send_shadowshocks(){
    TEXT="
     ────────────────────────────── 
     🏶 <strong>Xray/Shadowshock Account</strong> 🏶 
     ────────────────────────────── 
     ⧆ Remarks     : ${user} 
     ⧆ Domain      : ${domain} 
     ⧆ Wilcard     : bug.${domain} 
     ⧆ User Quota  : ${Quota} 
     ⧆ User Ip     : ${iplimit} IP 
     ⧆ Port TLS    : 400-900 
     ⧆ Password    : ${uuid} 
     ⧆ Cipers      : aes-128-gcm 
     ⧆ Network     : ws/grpc 
     ⧆ Path        : /ss-ws 
     ⧆ ServiceName : ss-grpc 
     ──────────────────────────────  
     ⧆ <strong>Link WS TLS : </strong>
     <pre>${sslinkws}</pre>
     ──────────────────────────────  
     ⧆ <strong>Link WS None TLS : </strong>
     <pre>${nonsslinkws}</pre>
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong>
     <pre>${sslinkgrpc}</pre> 
     ──────────────────────────────  
     ⧆ Aktif Selama   : $masaaktif Hari 
     ⧆ Dibuat Pada    : $tnggl 
     ⧆ Berakhir Pada  : $expe 
     ──────────────────────────────  
     🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function send_trialshadowshocks(){
    TEXT="
     ────────────────────────────── 
     🏶 <strong>Trial Shadowshock Account</strong> 🏶 
     ────────────────────────────── 
     ⧆ Remarks     : ${user} 
     ⧆ Domain      : ${domain} 
     ⧆ Wilcard     : bug.${domain} 
     ⧆ User Quota  : ${Quota} 
     ⧆ User Ip     : ${iplimit} IP 
     ⧆ Port TLS    : 400-900 
     ⧆ Password    : ${uuid} 
     ⧆ Cipers      : aes-128-gcm 
     ⧆ Network     : ws/grpc 
     ⧆ Path        : /ss-ws 
     ⧆ ServiceName : ss-grpc 
     ──────────────────────────────  
     ⧆ <strong>Link WS TLS : </strong>
     <pre>${sslinkws}</pre>
     ──────────────────────────────  
     ⧆ <strong>Link WS None TLS : </strong> 
     <pre>${nonsslinkws}</pre> 
     ──────────────────────────────  
     ⧆ <strong>Link GRPC : </strong>
     <pre>${sslinkgrpc}</pre> 
     ──────────────────────────────  
     ⧆ Dibuat Pada    : $tnggl 
     ⧆ Berakhir Pada  : $pup Minutes 
     ──────────────────────────────  
     🏶 <strong>Support Us RIOT Tunneling</strong> 🏶 
     ────────────────────────────── 
    "
    curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}