function Media(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
local Gcommand = Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if Gcommand then 
text = Gcommand or text
end
if neww then
text = neww or text
end
end
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
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
if text == "تعطيل التحميل" or text == "تعطيل فيسبوك" or text == "تعطيل انستا" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:set(Fast.."Media:lock"..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n• تم تعطيل التحميل ',"md",true)  
end
if text == "تفعيل التحميل" or text == "تفعيل فيسبوك" or text == "تعطيل انستا" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:del(Fast.."Media:lock"..msg.chat_id)
send(msg.chat_id,msg.id,'\n• تم تفعيل التحميل ',"md",true)  
end

if text then
if text:match("^فيسبوك (.*)$") or text:match("^fb (.*)$") or text:match("^انستا (.*)$") or text:match("^insta (.*)$") or text:match("^تيكتوك (.*)$") or text:match("^ساوند (.*)$")  then
if Redis:get(Fast.."Media:lock"..msg.chat_id) then
send(msg.chat_id,msg.id,'*• التحميل معطل*',"md",true)  
return false 
end
local rep = msg.id/2097152/0.5
local m = json:decode(requestt("https://api.telegram.org/bot"..Token.."/sendAnimation?chat_id="..msg_chat_id.."&animation=https://t.me/youtube7odabot/7951&reply_to_message_id="..rep)).result.message_id
local link = text:match("^فيسبوك (.*)$") or text:match("^fb (.*)$") or text:match("^انستا (.*)$") or text:match("^insta (.*)$") or text:match("^تيكتوك (.*)$") or text:match("^ساوند (.*)$")
os.execute("yt-dlp "..link.." -o '"..msg.sender_id.user_id.."'")
for file in io.popen('ls'):lines() do
if file:match(""..msg.sender_id.user_id) then
bot.sendVideo(msg.chat_id,msg.id,'./'..file,"@otlop12") 
requestt("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..m)
sleep(3)
os.remove(file)
end
end

end
end

if text == "فيسبوك" or text == "انستا" then
if Redis:get(Fast.."yt:lock"..msg.chat_id) then
send(msg.chat_id,msg.id,'*• اليوتيوب معطل*',"md",true)  
return false 
end
return send(msg_chat_id,msg_id,"• استخدم الامر هكذا : \n• انستا + اللينك \n• فيسبوك + اللينك")
end

end
return {Fast = Media}