function neda(msg)
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
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end


if text == "تفعيل النداء" or text == "تفعيل الندا" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*•  هذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
Redis:set(Fast..'tag_mem'..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n • تم تفعيل النداء')
end
if text == "تعطيل النداء" or text == "تفعيل الالنداء" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*•  هذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
Redis:del(Fast..'tag_mem'..msg.chat_id)
send(msg.chat_id,msg.id,'\n • تم تعطيل النداء')
end
if Redis:ttl(Fast.."tag_mem:"..msg_chat_id) < 1 then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "•  مشرفنا بحضورك ياغالي - 🥰 : \n ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ~ \n"
Redis:setex(Fast.."tag_mem:"..msg_chat_id,600,true)
return send(msg.chat_id,0,listTow,"md",true)  
end

if text == "نداء" then
if not Redis:get(Fast.."tag_mem"..msg_chat_id) then
return bot.sendText(msg_chat_id,msg_id,"* النداء معطل*","md",true)  
end
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "•  مشرفنا بحضورك ياغالي - 🥰 : \n ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ~ \n"
return send(msg.chat_id,0,listTow,"md",true)  
end
end

return {Fast = neda}