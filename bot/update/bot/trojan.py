from kyt import *

@bot.on(events.CallbackQuery(data=b'create-trojan'))
async def create_trojan(event):
	async def create_trojan_(event):
		async with bot.conversation(chat) as user:
			await event.respond('**Username:**')
			user = user.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			user = (await user).raw_text
		async with bot.conversation(chat) as pw:
			await event.respond("**Format Quota :**\n __10mb/1gb__\n __0 For Unlimited__\n**Quota Trojan:**")
			pw = pw.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			pw = (await pw).raw_text
		async with bot.conversation(chat) as exp:
			await event.respond("**Choose Expiry Day**",buttons=[
[Button.inline(" 3 Day ","3"),
Button.inline(" 7 Day ","7")],
[Button.inline(" 30 Day ","30"),
Button.inline(" 60 Day ","60")]])
			exp = exp.wait_event(events.CallbackQuery)
			exp = (await exp).data.decode("ascii")
		async with bot.conversation(chat) as limitiptele:
			await event.respond("**Choose Limit IP**",buttons=[
[Button.inline(" 1 IP ","1"),
Button.inline(" 2 IP ","2")],
[Button.inline(" 3 IP ","3"),
Button.inline(" 5 IP ","5")],
[Button.inline(" 10 IP ","10"),
 Button.inline(" 15 IP ","15")],
[Button.inline(" Unlimited ","1000")]])
			limitiptele = limitiptele.wait_event(events.CallbackQuery)
			limitiptele = (await limitiptele).data.decode("ascii")
		await event.edit("Processing.")
		await event.edit("Processing..")
		await event.edit("Processing...")
		await event.edit("Processing....")
		time.sleep(3)
		await event.edit("`Processing Crate Premium Account`")
		time.sleep(1)
		await event.edit("`Processing... 0%\n▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ `")
		time.sleep(1)
		await event.edit("`Processing... 4%\n█▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ `")
		time.sleep(2)
		await event.edit("`Processing... 8%\n██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ `")
		time.sleep(3)
		await event.edit("`Processing... 20%\n█████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ `")
		time.sleep(2)
		await event.edit("`Processing... 36%\n█████████▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ `")
		time.sleep(1)
		await event.edit("`Processing... 52%\n█████████████▒▒▒▒▒▒▒▒▒▒▒▒ `")
		time.sleep(1)
		await event.edit("`Processing... 84%\n█████████████████████▒▒▒▒ `")
		time.sleep(0)
		await event.edit("`Processing... 100%\n█████████████████████████ `")
		time.sleep(1)
		await event.edit("`Wait.. Setting up an Account`")
		cmd = f'printf "%s\n" "{user}" "{exp}" "{pw}" "{limitiptele}" | addtr'
		try:
			a = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			await event.respond("**User Already Exist**")
		else:
			today = DT.date.today()
			later = today + DT.timedelta(days=int(exp))
			b = [x.group() for x in re.finditer("trojan://(.*)",a)]
			print(b)
			domain = re.search("@(.*?):",b[0]).group(1)
			uuid = re.search("trojan://(.*?)@",b[0]).group(1)
			msg = f"""
**──────────────────────────────**
**⚡ Xray/Trojan Account ⚡**
**──────────────────────────────**
**» Remarks     :** `{user}`
**» Host Server :** `{domain}`
**» User Quota  :** `{pw}`
**» IP Limit    :** `{limitiptele} IP`
**» Port        :** `400-900`
**» User ID     :** `{uuid}`
**» Path        :** `/Multi-Path/trojan-ws`
**» Dynamic     :** `https://bugmu.com/path`
**» Grcp Service :** `trojan-grpc`
**──────────────────────────────**
**» Link WS    :** 
`{b[0].replace(" ","")}`
**──────────────────────────────**
**» Link GRPC  :** 
`{b[1].replace(" ","")}`
**──────────────────────────────**
**» Format OpenClash : https://{domain}:81/trojan-{user}.txt
**──────────────────────────────**
**Expired Until:** `{later}`
**» 🤖@riot_cazorla**
"""
			await event.respond(msg)
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await create_trojan_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'cek-trojan'))
async def cek_trojan(event):
	async def cek_trojan_(event):
		cmd = 'bot-cek-tr'.strip()
		x = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
		print(x)
		z = subprocess.check_output(cmd, shell=True).decode("utf-8")
		await event.respond(f"""

{z}

**Shows Logged In Users Trojan**
**» 🤖@riot_cazorla**
""",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await cek_trojan_(event)
	else:
		await event.answer("Access Denied",alert=True)

@bot.on(events.CallbackQuery(data=b'trial-trojan'))
async def trial_trojan(event):
	async def trial_trojan_(event):
		async with bot.conversation(chat) as exp:
			await event.respond("**Choose Expiry Minutes**",buttons=[
[Button.inline(" 10 Menit ","10"),
Button.inline(" 15 Menit ","15")],
[Button.inline(" 30 Menit ","30"),
Button.inline(" 60 Menit ","60")]])
			exp = exp.wait_event(events.CallbackQuery)
			exp = (await exp).data.decode("ascii")
			expiry_minutes = int(exp)
			cmd = f'printf "%s\n" "{exp}" | bot-trial-trojan'.strip()
		x = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
		print(x)
		z = subprocess.check_output(cmd, shell=True).decode("utf-8")
		await event.respond(f"""
`
{z}
`
**» 🤖@riot_cazorla**
""")
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await trial_trojan_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'delete-trojan'))
async def delete_trojan(event):
	async def delete_trojan_(event):
		async with bot.conversation(chat) as user:
			await event.respond('**Username:**')
			user = user.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			user = (await user).raw_text
		cmd = f'printf "%s\n" "{user}" | deltr'
		try:
			a = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			await event.respond("**User Not Found**")
		else:
			msg = f"""**Successfully Deleted**"""
			await event.respond(msg)
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await delete_trojan_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'list-trojan'))
async def show_trojan(event):
	async def show_trojan_(event):
		cmd = 'bot-member-trojan'.strip()
		x = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
		print(x)
		z = subprocess.check_output(cmd, shell=True).decode("utf-8")
		await event.respond(f"""
`
{z}
`
**Show All Trojan User**
**» 🤖@riot_cazorla**
""",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await show_trojan_(event)
	else:
		await event.answer("Access Denied",alert=True)

@bot.on(events.CallbackQuery(data=b'trojan'))
async def trojan(event):
	async def trojan_(event):
		inline = [
[Button.inline(" [ Create Trojan ] ","create-trojan"),
Button.inline(" [ Trial Trojan ] ","trial-trojan")],
[Button.inline(" [ Cek Trojan Online ] ","cek-trojan"),
Button.inline(" [ Delete Trojan ] ","delete-trojan")],
[Button.inline(" [ List Member Trojan ] ","list-trojan")],
[Button.inline("‹ Main Menu ›","menu")]]
		z = requests.get(f"http://ip-api.com/json/?fields=country,region,city,timezone,isp").json()
		trojan = f'grep -E "^#! " "/etc/xray/config.json" | cut -d " " -f 2-3 | column -t | sort | uniq | wc -l'
		outputtrjn = subprocess.check_output(trojan, shell=True, stderr=subprocess.STDOUT).decode("ascii")
		msg = f"""
━━━━━━━━━━━━━━━━━━━━━━━ 
**👑 TROJAN MANAGER 👑**
━━━━━━━━━━━━━━━━━━━━━━━ 
✅ **» Service:** `TROJAN`
✅ **» Hostname/IP:** `{DOMAIN}`
✅ **» ISP:** `{z["isp"]}`
✅ **» Country:** `{z["country"]}`

**» Total Account Created:** 
🔰 **» Acount     :** `{outputtrjn.strip()}` __account__
🤖 **» @riot_cazorla**
━━━━━━━━━━━━━━━━━━━━━━━ 
"""
		await event.edit(msg,buttons=inline)
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await trojan_(event)
	else:
		await event.answer("Access Denied",alert=True)
