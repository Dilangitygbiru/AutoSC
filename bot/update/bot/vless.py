from kyt import *

@bot.on(events.CallbackQuery(data=b'create-vless'))
async def create_vless(event):
	async def create_vless_(event):
		async with bot.conversation(chat) as user:
			await event.respond('**Username:**')
			user = user.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			user = (await user).raw_text
		async with bot.conversation(chat) as pw:
			await event.respond("**Format Quota :**\n __10mb/1gb__\n __0 For Unlimited__\n**Quota Vless:**")
			pw = pw.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			pw = (await pw).raw_text
		async with bot.conversation(chat) as exp:
			await event.respond("**Expired Days :**",buttons=[
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
		await event.edit("` ⌛ Wait.. Setting up an Account`")
		cmd = f'printf "%s\n" "{user}" "{exp}" "{pw}" "{limitiptele}" | addvless'
		try:
			a = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			await event.respond("**User Already Exist**")
		else:
			today = DT.date.today()
			later = today + DT.timedelta(days=int(exp))
			x = [x.group() for x in re.finditer("vless://(.*)",a)]
			print(x)
			# remarks = re.search("#(.*)",x[0]).group(1)
			# domain = re.search("@(.*?):",x[0]).group(1)
			uuid = re.search("vless://(.*?)@",x[0]).group(1)
			# path = re.search("path=(.*)&",x[0]).group(1)
			msg = f"""
**──────────────────────────────**
**⚡ Xray/Vless Account ⚡**
**──────────────────────────────**
**» Remarks     :** `{user}`
**» Host Server :** `{DOMAIN}`
**» User Quota  :** `{pw}`
**» Limit IP    :** `{limitiptele} IP`
**» Port Squid   :** `3128`
**» port TLS     :** `400-900`
**» Port NTLS    :** `80, 8080, 8081-9999`
**» Port GRPC    :** `443`
**» NetWork     :** `(WS) or (gRPC)`
**» User ID     :** `{uuid}`
**» Path Vless  :** `/multi-path/vless `
**» Path Dynamic:** `http://BUG.COM/vless `
**──────────────────────────────**
**» Link TLS   : **
`{x[0]}`
**──────────────────────────────**
**» Link NTLS  :**
`{x[1].replace(" ","")}`
**──────────────────────────────**
**» Link GRPC  :**
`{x[2].replace(" ","")}`
**──────────────────────────────**
**» Format OpenClash :** https://{DOMAIN}:81/vless-{user}.txt
**──────────────────────────────**
**» Expired Until:** `{later}` Days
**» 🤖@riot_cazorla**
"""
			await event.respond(msg)
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await create_vless_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'cek-vless'))
async def cek_vless(event):
	async def cek_vless_(event):
		cmd = 'bot-cek-vless'.strip()
		x = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
		print(x)
		z = subprocess.check_output(cmd, shell=True).decode("utf-8")
		await event.respond(f"""

{z}

**Shows Logged In Users Vless**
**» 🤖@riot_cazorla**
""",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await cek_vless_(event)
	else:
		await event.answer("Access Denied",alert=True)

@bot.on(events.CallbackQuery(data=b'delete-vless'))
async def delete_vless(event):
	async def delete_vless_(event):
		async with bot.conversation(chat) as user:
			await event.respond('**Username:**')
			user = user.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			user = (await user).raw_text
		cmd = f'printf "%s\n" "{user}" | delvless'
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
		await delete_vless_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'trial-vless'))
async def trial_vless(event):
	async def trial_vless_(event):
		async with bot.conversation(chat) as exp:
			await event.respond("**Choose Expiry Minutes**",buttons=[
[Button.inline(" 10 Menit ","10"),
Button.inline(" 15 Menit ","15")],
[Button.inline(" 30 Menit ","30"),
Button.inline(" 60 Menit ","60")]])
			exp = exp.wait_event(events.CallbackQuery)
			exp = (await exp).data.decode("ascii")
			expiry_minutes = int(exp)
			cmd = f'printf "%s\n" "{exp}" | bot-trial-vless'.strip()
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
		await trial_vless_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'list-vless'))
async def show_vless(event):
	async def show_vless_(event):
		cmd = 'bot-member-vless'.strip()
		x = subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT, universal_newlines=True)
		print(x)
		z = subprocess.check_output(cmd, shell=True).decode("utf-8")
		await event.respond(f"""
`
{z}
`
**Show All Vless User**
**» 🤖@riot_cazorla**
""",buttons=[[Button.inline("‹ Main Menu ›","menu")]])
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await show_vless_(event)
	else:
		await event.answer("Access Denied",alert=True)

@bot.on(events.CallbackQuery(data=b'restore-vless'))
async def restore_vless(event):
	async def restore_vless_(event):
		async with bot.conversation(chat) as user:
			await event.respond('**Username:**')
			user = user.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			user = (await user).raw_text
		async with bot.conversation(chat) as uuid:
			await event.respond('**UUID:**')
			uuid = uuid.wait_event(events.NewMessage(incoming=True, from_users=sender.id))
			uuid = (await uuid).raw_text
		async with bot.conversation(chat) as pw:
			await event.respond("**Format Quota :**\n __10mb/1gb__\n __0 For Unlimited__\n**Quota Vless:**")
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
		await event.edit("` ⌛ Wait.. Setting up an Account`")
		cmd = f'printf "%s\n" "{user}" "{uuid}" "{exp}" "{pw}" "{limitiptele}" | restorevless'
		try:
			a = subprocess.check_output(cmd, shell=True).decode("utf-8")
		except:
			await event.respond("**User Already Exist**")
		else:
			today = DT.date.today()
			later = today + DT.timedelta(days=int(exp))
			b = [x.group() for x in re.finditer("vless://(.*)",a)]
#			c = [x.group() for x in re.finditer("Host XrayDNS(.*)",a)]
#			d = [x.group() for x in re.finditer("Pub Key(.*)",a)]
			print(b)
#			print(d)
#			print(c)
#			xx = re.search("Pub Key      :(.*)",d[0]).group(1)
#			xxx = re.search("Host XrayDNS :(.*)",d[0]).group(1)
			z = base64.b64decode(b[0].replace("vless://","")).decode("ascii")
			z = json.loads(z)
			z1 = base64.b64decode(b[1].replace("vless://","")).decode("ascii")
			z1 = json.loads(z1)
			msg = f"""
**──────────────────────────────**
**⚡ Succes Restore Account Vless ⚡**
**──────────────────────────────**
**» Remarks      :** `{z["ps"]}`
**» Domain       :** `{z["add"]}`
**» User Quota   :** `{pw}`
**» User Quota   :** `{limitiptele} IP`
**» Port Squid   :** `3128`
**» port TLS     :** `400-900`
**» Port NTLS    :** `80, 8080, 8081-9999`
**» Port GRPC    :** `443`
**» User ID      :** `{z["id"]}`
**» AlterId      :** `0`
**» Security     :** `auto`
**» NetWork      :** `(WS) or (gRPC)`
**» Path         :** `(/multi path)/vless`
**» Path Dynamic :** `http://BUG.COM/path`
**» ServiceName  :** `vless-grpc`
**──────────────────────────────**
**» Link TLS     :** 
`{b[0].strip("'").replace(" ","")}`
**──────────────────────────────**
**» Link NTLS    :** 
`{b[1].strip("'").replace(" ","")}`
**──────────────────────────────**
**» Link GRPC    :** 
`{b[2].strip("'")}`
**──────────────────────────────**
**» Format OpenClash :** https://{DOMAIN}:81/vless-{user}.txt
**──────────────────────────────**
**» Expired Until:** `{later}`
**» Active:** `{exp}` Days
**──────────────────────────────**
**» 🤖@riot_cazorla**
"""
			await event.respond(msg)
	chat = event.chat_id
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await restore_vless_(event)
	else:
		await event.answer("Akses Ditolak",alert=True)

@bot.on(events.CallbackQuery(data=b'vless'))
async def vless(event):
	async def vless_(event):
		inline = [
[Button.inline(" [ Create Vless ] ","create-vless"),
Button.inline(" [ Trial Vless ] ","trial-vless")],
[Button.inline(" [ Cek Vless Online ] ","cek-vless"),
Button.inline(" [ Delete Vless ] ","delete-vless")],
[Button.inline(" [ Restore Vless ] ","restore-vless"),
Button.inline(" [ List Member Vless ] ","list-vless")],
[Button.inline("‹ Main Menu ›","menu")]]
		z = requests.get(f"http://ip-api.com/json/?fields=country,region,city,timezone,isp").json()
		domain1 = f" cat /etc/xray/domain"
		domaintele = subprocess.check_output(domain1, shell=True).decode("ascii")
		vm = f'grep -E "^#& " "/etc/xray/config.json" | cut -d " " -f 2-3 | column -t | sort | uniq | wc -l'
		outputvls = subprocess.check_output(vm, shell=True, stderr=subprocess.STDOUT).decode("ascii")
		msg = f"""
━━━━━━━━━━━━━━━━━━━━━━━ 
**👑 VLESS MANAGER 👑**
━━━━━━━━━━━━━━━━━━━━━━━ 
🔰 **» Service     :** `VLESS`
🔰 **» Hostname/IP :** `{domaintele.strip()}`
🔰 **» ISP         :** `{z["isp"]}`
🔰 **» Country     :** `{z["country"]}`

**» Total Account Created:** 
🔰 **» Acount     :** `{outputvls.strip()}` __account__
🤖 **» @riot_cazorla**
━━━━━━━━━━━━━━━━━━━━━━━ 
"""
		await event.edit(msg,buttons=inline)
	sender = await event.get_sender()
	a = valid(str(sender.id))
	if a == "true":
		await vless_(event)
	else:
		await event.answer("Access Denied",alert=True)
