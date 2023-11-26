function porn_d(msg)
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
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end

if text == "قفل الاباحي" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:set(Fast..msg.chat_id..'porn',true)
send(msg.chat_id,msg.id,'\n• تم قفل الاباحي بنجاح')
end
if text == "فتح الاباحي" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:del(Fast..msg.chat_id..'porn')
send(msg.chat_id,msg.id,'\n• تم فتح الاباحي بنجاح')
end




if Redis:get(Fast..msg.chat_id..'porn') then 
if (msg.content.photo or msg.content.sticker or msg.content.animation or msg.content.video) then
local result = msg
local num = math.random(99999)
if result.content.photo then 
if result.content.photo.sizes[3] then
idPhoto = result.content.photo.sizes[3].photo.remote.id
idd =  result.content.photo.sizes[3].photo.id
elseif result.content.photo.sizes[2] then
idPhoto = result.content.photo.sizes[2].photo.remote.id
idd =  result.content.photo.sizes[2].photo.id
elseif result.content.photo.sizes[1]  then
idPhoto = result.content.photo.sizes[1].photo.remote.id
idd = result.content.photo.sizes[1].photo.id
end
typeee = "jpg"
elseif result.content.sticker then
idPhoto = result.content.sticker.sticker.remote.id
idd = msg.content.sticker.sticker.id
typeee = "jpg"
elseif result.content.animation then
idPhoto = result.content.animation.animation.remote.id
idd = msg.content.animation.animation.id
typeee = "mp4"
elseif msg.content.video then
idPhoto = result.content.video.video.remote.id
idd = msg.content.video.video.id
typeee = "mp4"
end
if Redis:sismember("sex_ids",idd) then
os.remove(""..num.."."..typeee.."")
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if Redis:sismember("not_sex_ids",idd) then
os.remove(""..num.."."..typeee.."")
return false
else

local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..idPhoto)) 
local dw = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,""..num.."."..typeee.."") 
local out = io.popen("python3.8 ./sex.py '"..dw.."'"):read('*a')
print(out)
if out == "" then 
os.remove(""..num.."."..typeee.."")
return false 
end
if string.find(out, "NONPORN") then
Redis:sadd("not_sex_ids",idd)
os.remove(""..num.."."..typeee.."")
else
Redis:sadd("sex_ids",idd) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
os.remove(""..num.."."..typeee.."")
end
os.remove(""..num.."."..typeee.."")
end
end

if text == "مسح البورنو" and msg.Manger then
Redis:del("sex_ids")
Redis:del("not_sex_ids")
send(msg.chat_id,msg.id,"• تم ✅")
end


end
return {Fast = porn_d}