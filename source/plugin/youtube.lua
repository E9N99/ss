function youtube(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "روزا") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
function time_to_sec(time)
    local sec = 0
    local time_table = {}
    for i in string.gmatch(time, "%d+") do
        table.insert(time_table, i)
    end
    local hour = tonumber(time_table[1])
    local min = tonumber(time_table[2])
    local sec = tonumber(time_table[3])
    return hour*3600 + min*60 + sec
end
if text == "تعطيل اليوتيوب" or text == "تعطيل يوتيوب" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:set(Fast.."yt:lock"..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n• تم تعطيل اليوتيوب ',"md",true)  
end
if text == "تفعيل اليوتيوب" or text == "تفعيل يوتيوب" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:del(Fast.."yt:lock"..msg.chat_id)
send(msg.chat_id,msg.id,'\n• تم تفعيل اليوتيوب ',"md",true)  
end

if text then
if text:match("^بحث (.*)$") then
if Redis:get(Fast.."yt:lock"..msg.chat_id) then
send(msg.chat_id,msg.id,'*• اليوتيوب معطل*',"md",true)  
return false 
end
local search = text:match("^بحث (.*)$")
local j = json:decode(http.request("https://anubis.fun/api/yt.php?q="..URL.escape(search)..""))
local datar = {data = {{text = "قناه السورس" , url = 'http://t.me/'..chsource..''}}}
for i = 1,6 do
link = j.results[i].id
title = j.results[i].title
title = title:gsub("/","-") 
title = title:gsub("\n","-") 
title = title:gsub("|","-") 
title = title:gsub("'","-") 
title = title:gsub('"',"-") 
datar[i] = {{text = title , data =msg.sender_id.user_id.."dl/"..link}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
send(msg.chat_id,msg.id,'• نتائج بحثك ل *'..search..'*',"md",false, false, false, false, reply_markup)
end
end

if Redis:get(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id) == "mp3" then
Redis:del(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id)
local rep = msg.id/2097152/0.5
local m = json:decode(https.request("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/youtube7odabot/7951&reply_to_message_id="..rep)).result.message_id
local se = https.request("https://anubis.fun/api/yt.php?q="..URL.escape(text))
local j = json:decode(se)
local link = "http://youtu.be/"..j.results[1].id
local title = j.results[1].title
local title = title:gsub("]","")
local title = title:gsub("[[]","")
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
local d = j.results[1].time
local d = tostring(d)
if d:match("(%d+):(%d+):(%d+)") then
tti = d
elseif d:match("(%d+):(%d+)") then
tti = "00:"..d
end
local dur = time_to_sec(tti)
local p = j.results[1].ch
local thumb = j.results[1].image
local rand = math.random(0,10000)
download(thumb,rand..'.png')
local p = p:gsub("/","-") 
local p = p:gsub("\n","-") 
local p = p:gsub("|","-") 
local p = p:gsub("'","-") 
local p = p:gsub('"',"-") 
os.execute("yt-dlp "..link.." -f 251 -o '"..title..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./'..title..'.mp3',"["..title.."]("..link..")","md",tostring(dur),title,p,"./"..rand..".png") 
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
Redis:del(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id)
sleep(2)
os.remove(""..title..".mp3")
os.remove(rand..".png")
end
if Redis:get(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id) == "mp4" then
local rep = msg.id/2097152/0.5
local m = json:decode(https.request("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/youtube7odabot/7951&reply_to_message_id="..rep)).result.message_id
local se = https.request("https://anubis.fun/api/yt.php?q="..URL.escape(text))
local j = json:decode(se)
local link = "http://youtu.be/"..j.results[1].id
local title = j.results[1].title
local title = title:gsub("]","")
local title = title:gsub("[[]","")
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
local d = j.results[1].time
local d = tostring(d)
if d:match("(%d+):(%d+):(%d+)") then
tti = d
elseif d:match("(%d+):(%d+)") then
tti = "00:"..d
end
local dur = time_to_sec(tti)
local p = j.results[1].ch
local p = p:gsub("/","-") 
local p = p:gsub("\n","-") 
local p = p:gsub("|","-") 
local p = p:gsub("'","-") 
local p = p:gsub('"',"-") 
os.execute("yt-dlp "..link.." -f 18 -o '"..title..".mp4'")
bot.sendVideo(msg_chat_id,msg_id,'./'..title..'.mp4',"["..title.."]("..link..")","md") 
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
Redis:del(Fast.."youtube"..msg.sender_id.user_id..msg_chat_id)
sleep(2)
os.remove(""..title..".mp4")
end
if text == "يوتيوب" then
if Redis:get(Fast.."yt:lock"..msg.chat_id) then
send(msg.chat_id,msg.id,'*• اليوتيوب معطل*',"md",true)  
return false 
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تحميل صوت', data = senderr..'/mp3'..msg_id}, {text = 'تحميل فيديو', data = senderr..'/mp4'..msg_id}, 
},
}
}
return send(msg_chat_id,msg_id, [[*
• اختر كيف تريد التحميل
*]],"md",false, false, false, false, reply_markup)
end

if text and Redis:get(Fast.."toar"..msg.sender_id.user_id) then
Redis:del(Fast.."toar"..msg.sender_id.user_id)
local json = json:decode(https.request("https://ayad-12.xyz/7oda.php?from=auto&to=ar&text="..text)).result
send(msg_chat_id,msg_id,json,"html",true)
end
if text and Redis:get(Fast.."toen"..msg.sender_id.user_id) then
Redis:del(Fast.."toen"..msg.sender_id.user_id)
local json = json:decode(https.request("https://ayad-12.xyz/7oda.php?from=auto&to=en&text="..text)).result
send(msg_chat_id,msg_id,json,"html",true)
end
if text == 'ترجمه' or text == 'ترجمة' or text == 'ترجم' or text == 'translat' then 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'ترجمه الي العربية', data = msg.sender_id.user_id..'toar'},{text = 'ترجمه الي الانجليزية', data = msg.sender_id.user_id..'toen'}},
{{text = ' ✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = "https://t.me/cristin_so"}},
}
}
return send(msg_chat_id,msg_id, [[*
• Hey Send Text translate
• ارسل النص لترجمته
*]],"md",false, false, false, false, reply_markup)
end

end
return {Fast = youtube}