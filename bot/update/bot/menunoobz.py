from kyt import *

@bot.on(events.CallbackQuery(data=b'menunoobz'))
async def menunoobz(event):
	async def menunoobz_(event):
		inline = [
[Button.inline(" [ Create Account ] ","create-noob")],
[Button.inline(" [ Trial Account ] ","Trial-noob"),
Button.inline(" [ Delete Account ] ","delete-noob")],
[Button.inline(" [ List Member Account ] ","list-noob"),
Button.inline(" [ Renew Account ] ","renew-noob")],
[Button.inline(" ‹ Back Panel › ","start")]]
		z = requests.get(f"http://ip-api.com/json/?fields=country,region,city,timezone,isp").json()
		domain1 = f" cat /etc/xray/domain"
		vm = f'grep -E "^### " "/etc/xray/config.json" | cut -d " " -f 2-3 | column -t | sort | uniq | wc -l'
		outputvms = subprocess.check_output(vm, shell=True, stderr=subprocess.STDOUT).decode("ascii")
		domaintele = subprocess.check_output(domain1, shell=True).decode("ascii")
		msg = f"""
━━━━━━━━━━━━━━━━━━━━━━━ 
**👑 ADMIN PANEL NOOBZ 👑**
━━━━━━━━━━━━━━━━━━━━━━━ 
✅ **» Service     :** `NOOBZVPN`
✅ **» Hostname/IP :** `{domaintele.strip()}`
✅ **» ISP         :** `{z["isp"]}`
✅ **» Country     :** `{z["country"]}`

**» Total Account Created:** 
✅ **» Acount     :** `0` __account__
🤖 **» @riot_cazorla**
━━━━━━━━━━━━━━━━━━━━━━━ 
"""
		await event.edit(msg,buttons=inline)
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await menunoobz_(event)
	else:
		await event.answer("Access Denied",alert=True)