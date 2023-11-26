function rdod(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "??????") 
text = msg.content.text.text
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "روزا") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
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
if text == "تفعيل ردود السورس الخليجيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,"• هذا الامر يخص المدير")
end
Redis:set(Fast.."rb:bna"..msg_chat_id,true)
send(msg_chat_id,msg_id,"• تم تفعيل ردود السورس")
end
if text == "تعطيل ردود السورس الخليجيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,"• هذا الامر يخص المدير")
end
Redis:del(Fast.."rb:bna"..msg_chat_id)
send(msg_chat_id,msg_id,"• تم تعطيل ردود السورس")
end



if Redis:get(Fast.."rb:bna"..msg_chat_id) then

if text == '،' or text == '،،،' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*تـدوم عمࢪيي💘 ️*',"md",false, false, false, false, reply_markup)
end
if text == '😐' or text == '🙂' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'* شـبي حـلـو صـافـن😻💋 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'اريد اكبل' or text == 'ارتبط' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*امـشي وخࢪ مـنـا يدوࢪ تـڪـبيل😏 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'لتزحف' or text == 'زاحف' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*شـعليڪ بـي عمࢪيي خـلي يـزحف💘☹️ ️*',"md",false, false, false, false, reply_markup)
end

if text == 'كلخره' or text == 'كل خره' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*اسـف عمࢪيي مـا خليڪ بـحـلڪي😹💘 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'زحف' or text == 'زاحفه' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*زاحـف ع خـالـڪ شـڪࢪه🤤💋 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'دي' or text == 'دد' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*امـشـيڪ بـيها عمࢪيي😗😹 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'فرخ' or text == 'كحبه' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ويـنـه بـلـه خـل حـصـࢪه😹🤤 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'تعالي خاص' or text == 'خاص' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*هااا يـول اخـذتـها خـاص😹🙊 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'اكرهك' or text == 'اكرهج' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*عـساس انـي مـيـت بيڪڪ دمـشـي لڪ😿😹 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'احبك' or text == 'احبج' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*يـحـياتـي وانـي هـم حـبـڪڪ🙈💋️*',"md",false, false, false, false, reply_markup)
end

if text == 'باي' or text == 'سيو' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*ويـن دايـح عمࢪيي خـلـينـا مـونـسـيـن🥺💘️*',"md",false, false, false, false, reply_markup)
end

if text == 'عوائل' or text == 'صايره عوائل' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*حـبيـبي ولله ࢪبـط فـيـشه ويـانـا🙈💋 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'واكف' or text == 'وكف' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*شـغال عمࢪيي🤓💘 ️*',"md",false, false, false, false, reply_markup)
end


if text == 'وين المدير' or text == 'المدير' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*عمࢪيي تـفـضل وياڪ مـديـࢪ💘️*',"md",false, false, false, false, reply_markup)
end
if text == 'انجب' or text == 'نجبي' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*صـاࢪ عمࢪيي💘🥺 ️*',"md",false, false, false, false, reply_markup)
end

if text == 'تحبني' or text == 'تحبيني' then
if not Redis:get(Fast.."rb:bna"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
return send(msg_chat_id,msg_id,'*سـؤال صـعـب خلـيـني افڪࢪ☹️️*',"md",false, false, false, false, reply_markup)
end

end


end
return {Fast = rdod}