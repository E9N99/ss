function all(msg)
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
if text == "تعطيل @all" or text == "تعطيل all" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:set(Fast.."lockalllll"..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n• تم تعطيل امر @all ',"md",true)  
end
if text == "تفعيل @all" or text == "تفعيل all" then
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
Redis:del(Fast.."lockalllll"..msg.chat_id)
send(msg.chat_id,msg.id,'\n• تم تفعيل امر @all ',"md",true)  
end
if text then
if text:match("^all (.*)$") or text:match("^@all (.*)$") or text == "@all" or text == "all" then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not msg.Manger then
send(msg.chat_id,msg.id,'\n*• هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
return false 
end
if Redis:get(Fast.."lockalllll"..msg.chat_id) then
send(msg.chat_id,msg.id,'*• تم تعطيل @all من قبل المدراء*',"md",true)  
return false 
end
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local data = bot.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
if ttag then
t = "#all "..ttag.."" 
else
t = "#all "
end
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t..", ["..tagname.."](tg://user?id="..v.member_id.user_id..")" 
if x == 5 or x == tags or k == 0 then 
if ttag then
Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
send(msg.chat_id,0,Text,'md') 
end 
end 
end 
end

end

return {Fast = all}