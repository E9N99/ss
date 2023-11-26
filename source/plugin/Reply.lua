function reply(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "روزا") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end

--------
if text == "تفعيل ردود السورس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,"• هذا الامر يخص المدير")
end
Redis:set(Fast.."Sasa:Jeka"..msg_chat_id,true)
send(msg_chat_id,msg_id,"• تم تفعيل ردود السورس")
end
if text == "تعطيل ردود السورس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,"• هذا الامر يخص المدير")
end
Redis:del(Fast.."Sasa:Jeka"..msg_chat_id)
send(msg_chat_id,msg_id,"• تم تعطيل ردود السورس")
end



if Redis:get(Fast.."Sasa:Jeka"..msg_chat_id) then

if text == 'هاي' or text == 'هيي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*هآي تع اشب شااي • 😹💔*',"md",false, false, false, false, reply_markup)
end
if text == 'سلام عليكم' or text == 'السلام عليكم' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*وعليكم السلام 🌝💜*',"md",false, false, false, false, reply_markup)
end
if text == 'سلام' or text == 'مع سلامه' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*مع الف سلامه يقلبي متجيش تاني 😹💔🎶*',"md",false, false, false, false, reply_markup)
end
if text == 'برايفت' or text == 'تع برايفت' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*خدوني معاكم برايفت والنبي 🥺💔*',"md",false, false, false, false, reply_markup)
end
if text == 'النبي' or text == 'صلي علي النبي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*عليه الصلاه والسلام 🌝💛*',"md",false, false, false, false, reply_markup)
end
if text == 'نعم' or text == 'يا نعم' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*نعم الله عليك 🌚❤️*',"md",false, false, false, false, reply_markup)
end
if text == '🙄' or text == '🙄🙄' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'* نزل عينك تحت كدا علشان هتخاد علي قفاك 😒❤️*',"md",false, false, false, false, reply_markup)
end
if text == '🙄' or text == '🙄🙄' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❍ 𓏶 𝒄𝒓𝒊𝒔𝒕𝒊𝒏 • 𝒔𝒐𝒖𝒓𝒄?? 𓏶 ❍', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*نزل عينك تحت كدا علشان هتخاد علي قفاك 😒❤️*',"md",false, false, false, false, reply_markup)
end
if text == '😂' or text == '😂😂' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❍ 𓏶 𝒄𝒓??𝒔𝒕𝒊𝒏 • 𝒔𝒐𝒖𝒓𝒄𝒆 𓏶 ❍', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ضحكتك عثل زيكك ينوحيي 🌝❤️*',"md",false, false, false, false, reply_markup)
end
if text == '😹' or text == '😹' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ضحكتك عثل زيكك ينوحيي 🌝❤️*',"md",false, false, false, false, reply_markup)
end
if text == '🤔' or text == '🤔🤔' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'* بتفكر في اي 🤔*',"md",false, false, false, false, reply_markup)
end
if text == '🌚' or text == '🌝' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*القمر ده شبهك 🙂❤️*',"md",false, false, false, false, reply_markup)
end
if text == '💋' or text == '💋💋' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*انا عايز مح انا كمان 🥺💔*',"md",false, false, false, false, reply_markup)
end
if text == '😭' or text == '😭😭' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*بتعيط تيب لي طيب 😥*',"md",false, false, false, false, reply_markup)
end
if text == '🥺' or text == '🥺🥺' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*متزعلش بحبك 😻🤍*',"md",false, false, false, false, reply_markup)
end
if text == '😒' or text == '😒😒' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*عدل وشك ونت بتكلمني 😒🙄*',"md",false, false, false, false, reply_markup)
end
if text == 'بحبك' or text == 'حبق' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*وانا كمان بعشقك يا روحي 🤗🥰*',"md",false, false, false, false, reply_markup)
end
if text == 'مح' or text == 'هات مح' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*محات حياتي يروحي 🌝❤️*',"md",false, false, false, false, reply_markup)
end
if text == 'هلا' or text == 'هلا وغلا' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❍ 𓏶 𝒄𝒓𝒊𝒔𝒕𝒊𝒏 • 𝒔𝒐𝒖𝒓??𝒆 𓏶 ❍', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*هلا بيك ياروحي 👋*',"md",false, false, false, false, reply_markup)
end
if text == 'هشش' or text == 'هششخرص' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*بنهش كتاكيت احنا هنا ولا اي ??😹*',"md",false, false, false, false, reply_markup)
end
if text == 'الحمد الله' or text == 'بخير الحمد الله' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*دايما ياحبيبي 🌝❤️*',"md",false, false, false, false, reply_markup)
end
if text == 'بف' or text == 'بص بف' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*وحيات امك ياكبتن خدوني معاكو بيف 🥺💔*',"md",false, false, false, false, reply_markup)
end
if text == 'خاص' or text == 'بص خاص' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ونجيب اشخاص 😂👻*',"md",false, false, false, false, reply_markup)
end
if text == 'صباح الخير' or text == 'مساء الخير' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*انت الخير يعمري 🌝❤️*',"md",false, false, false, false, reply_markup)
end
if text == 'صباح النور' or text == 'باح الخير' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*صباح العسل 😻🤍*',"md",false, false, false, false, reply_markup)
end
if text == 'حصل' or text == 'حثل' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*خخخ امال 😹*',"md",false, false, false, false, reply_markup)
end
if text == 'اه' or text == 'اها' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*اه اي يا قدع عيب 😹💔*',"md",false, false, false, false, reply_markup)
end
if text == 'كسم' or text == 'كسمك' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*عيب ياوسخ 🙄💔*',"md",false, false, false, false, reply_markup)
end
if text == 'بوتي' or text == 'يا بوتي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'روح وعقل بوتك 🥺💔',"md",false, false, false, false, reply_markup)
end
if text == 'متيجي' or text == 'تع' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*لا عيب بتكسف 😹💔*',"md",false, false, false, false, reply_markup)
end
if text == 'هيح' or text == 'لسه صاحي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*صح النوم 😹💔*',"md",false, false, false, false, reply_markup)
end
if text == 'منور' or text == 'نورت' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ده نورك ي قلبي 🌝💙*',"md",false, false, false, false, reply_markup)
end
if text == 'باي' or text == 'انا ماشي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ع فين لوين رايح وسايبنى 🥺💔*',"md",false, false, false, false, reply_markup)
end
if text == 'ويت' or text == 'ويت يحب' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*اي الثقافه دي 😒😹*',"md",false, false, false, false, reply_markup)
end
if text == 'خخخ' or text == 'خخخخخ' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*اهدا يوحش ميصحش كدا 😒??*',"md",false, false, false, false, reply_markup)
end
if text == 'شكرا' or text == 'مرسي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*العفو ياروحي 🙈🌝*',"md",false, false, false, false, reply_markup)
end
if text == 'حلوه' or text == 'حلو' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*انت الي حلو ياقمر 🤤🌝*',"md",false, false, false, false, reply_markup)
end
if text == 'بموت' or text == 'هموت' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*موت بعيد م ناقصين مصايب 😑😂*',"md",false, false, false, false, reply_markup)
end
if text == 'اي' or text == 'ايه' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*جتك اوهه م سامع ولا ايي 😹👻*',"md",false, false, false, false, reply_markup)
end
if text == 'طيب' or text == 'تيب' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*فرح خالتك قريب 😹💋💃🏻*',"md",false, false, false, false, reply_markup)
end
if text == 'حاضر' or text == 'حتر' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*حضرلك الخير يارب 🙂❤️*',"md",false, false, false, false, reply_markup)
end
if text == 'جيت' or text == 'انا جيت' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'* لف ورجع تانى مشحوار 😂🚶‍♂👻*',"md",false, false, false, false, reply_markup)
end
if text == 'بخ' or text == 'عو' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*يوه خضتني ياسمك اي 🥺💔*',"md",false, false, false, false, reply_markup)
end
if text == 'حبيبي' or text == 'حبيبتي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*اوه ياه 🌝😂*',"md",false, false, false, false, reply_markup)
end
if text == 'تمام' or text == 'تمم' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'* امك اسمها احلام 😹😹*',"md",false, false, false, false, reply_markup)
end
if text == 'خلاص' or text == 'خلص' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*خلصتت روحكك يبعيد 😹💔*',"md",false, false, false, false, reply_markup)
end
if text == 'سي في' or text == 'سيفي' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*كفيه شقط سيب حاجه لغيرك 😎😂*',"md",false, false, false, false, reply_markup)
end

end


end
return {Fast = reply}