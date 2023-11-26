function Callback(data)
ChatId = data.chat_id
function requesst(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
if data.Fastbots == "updateChatMember" then
if tonumber(data.new_chat_member.member_id.user_id) == tonumber(Fast) then
if data.new_chat_member.status and data.new_chat_member.status and data.new_chat_member.status.can_delete_messages == true then
local chat_id = data.chat_id
local who_promot = data.actor_user_id

--code start
local Info_Chats = bot.getSupergroupFullInfo(chat_id) ---check if count is true
if not Redis:sismember(Fast.."ChekBotAdd",chat_id) then ---done active
local Get_Chat = bot.getChat(chat_id)
local UserInfo = bot.getUser(who_promot)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n• تم تفعيل جروب جديد \n• بواسطه : *['..UserInfo.first_name..'](tg://user?id='..who_promot..')*\n• معلومات الجروب :\n• عدد الاعضاء ↤ '..Info_Chats.member_count..'\n• عدد الادمنيه ↤ '..Info_Chats.administrator_count..'\n• عدد المطرودين ↤ '..Info_Chats.banned_count..'\n• عدد المقيدين ↤ '..Info_Chats.restricted_count..'\n• الرابط\n : '..Info_Chats.invite_link.invite_link..'*',"md", true, false, false, false, reply_markup)
local Info_Members = bot.getSupergroupMembers(chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
Redis:sadd(Fast.."ChekBotAdd",chat_id)
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..chat_id,v.member_id.user_id) 
else
local lisstt = {
' ما هو الشيء الذي تكرهه بشدة؟ ولماذا؟',
'  هل من الممكن نسيان شخص ظلمك؟',
'  هل تقبل الزواج بشخص غني لكنه متعدد العلاقات؟',
'  شهر من أشهر العام له ذكرى جميلة معك؟',
'  لو خيروك بين البقاء ليوم كامل في بيت مهجور أو في غابة موحشة.',
'  ما هي الصفة التي تود تغييرها في الشخص الآخر؟ وهل حاولت ذلك من قبل؟ وما النتيجة التي حصلت عليها؟',
'  هل وقعت في حب شخص من مواقع التواصل الإجتماعي؟',
'  هل تملك صديق كأخ؟ أو هل تملك أخ كالصديق؟ وهل يعرف جميع أسرارك؟',
'  ما هو الشخص الذي لا تستطيع أن ترفض له أي طلب؟',
'  هل تشعر أن هنالك مَن يُحبك؟',
'  هل يمكنك أن تتولى أمر الأعمال المنزلية أم أنك سوف تفشل في ذلك؟',
'  هل كذبت على أحد والديك؟',
'  هل يمكنك أن تكون صريح تمامًا اتجاه حبيبك / حبيبتك؟ أم لا بد من الكثير من المجاملات؟',
'  متى اخر مره حدث خلاف بينكما؟ وعلى ماذا كان هذا الخلاف؟ وهل تم حله بشكل تام؟',
'  هل تُؤمن بضرب الأطفال في التربية؟',
'  هل تعتقد أن حبيبتك / حبيبك يفكر بك الآن؟ أم هل تظن أنه منشغل بأمر آخر  .ام انك سنكل؟',
'  كيف تُعبر عن فرحتك عندما تكون لوحدك؟',
'  إذا خيروك أن تُعيد تسمية نفسك فهل تقبل باسمك أم تقوم بتغييره؟',
'  هل حاربت من أجل شخص ما من قبل؟',
'  ما هي هوايتك في الحياة؟',
'  هل تقبل الارتباط بشخص فقير لكنه شديد الجمال؟',
'  كم من الوقت تستغرق قبل الخروج من المنزل ؟',
'  من هو الشخص الذي يُمثل نقطة ضعفك؟',
'  لماذا انتهت أول قصة حب في حياتك؟',
'  ‏ ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  متى كانت المرة الأخيرة التي كذبت فيها؟',
'  ما هي أجمل سنة عشتها بحياتك؟',
'  كنت السبب في أذى شخص ما؟',
'  هل رأي الآخرين مهم بالنسبة لك؟',
'  هل تملك صديق يتقن الغناء؟',
'  ما هي اللعبة المفضلة لديك؟',
'  ما هي مواصفات شريك حياتك؟',
'  هل يُمكن أن تكذب كذبة كبيرة للخروج من مأزق؟',
'  إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقتها؟',
'  هل أنت شخص غيور؟',
'  هل انت تدرس؟',
'  ‏ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  هل ما زلت تعتقد ان هنالك حب حقيقي؟',
'  هل أنت من الأشخاص المحظوظين أم أن سوء الحظ يرافقك؟',
"هل أنت محبوب من زملائك في العمل؟",
"هل يمكن لك التخلي عن حبك أمام كرامتك؟",
"إذا وجدت ورقة بيضاء فماذا ترسم لتعبر عن حالتك النفسية؟",
"لو تم وضعك أما ثلاث خيارات ( المال، الصحة، الرضا) أيهما تختار؟",
"هل شعرتي بالندم من قبل بسبب ثقتك في أحد الأشخاص؟",
"هل أنت مع الخطبة عن حب أم مع الخطبة عن طريق الأهل؟",
"من وجهة نظرك هل يأتي الحب بعد الزواج؟",
"ماذا لو كنت ستختار بين رحلة إلى الغابات والجبال أو رحلة إلى البحر؟",
"هل يمكنك الوقوع في الحب عبر الإنترنت؟,",
"هل سبق ورسبت في المدرسة؟ وكم عدد المرات؟",
"هل لديك فوبيا من شيء معين؟",
"إذا دخلت مُسابقة وكسبت 5 مليون دولار ماذا تفعل بهم؟",
"هل يمكن أن تكره شخص كنت تحبه؟ أو تحب شخص كنت تكرهه؟",
"من هم أصدقائك المقربين منك؟",
"كم ساعة تنام في اليوم؟",
"لماذا تتمنى أن يعود الزمن؟ هل تفتقد أي شيء أو أي شخص هناك؟",
"هل يمكن لكي أن تكتفي قبل النزول من المنزل بغسيل الوجه فقط دون وضع الميكاب؟",
"هل كنت تخفي المعلومات المهمة عن زملائك في الدراسة؟",
"هل تستطيع أن تعيش بدون أصدقاء؟",
"ماذا تختار حبيبك أم صديقك؟",
"من هو الشخص الذي تستطيع أن تحكي له أي مشكلة بدون خجل؟",
"إذا تركك من تحب، هل تعود إليه مرة أخرى أم تتركهُ وتنتظر وقت عودته؟",
"هل سبق وأن تعرضت للسرقة من أحد قريب لك؟",
"هل من الممكن أن تضر شخصاً لمجرد أنك تكرهه؟",
"ما هو الحيوان الذي تحب العناية به؟,",
"اسم اغنية قريبة على قلبك؟",
"هل تستطيع اخبارنا معلومة هامة عنك لم يعرفها أحد من المتواجدين هنا؟",
"هل تستطيع التنازل عن شيء تفضله من أجل إسعاد الآخرين؟",
"أغمض عينيك ما هو المكان الذي تخيلت نفسك فيه؟",
"هل من الممكن أن ترتكب جريمة ضد شخص حتى لا يكشف سرك؟",
"هل يمكنك التخلي عن هدفك في سبيل شخص؟",
"ما هو البرج الخاص بك؟",
"لو كان هناك أمامك اختيارين أحدهما الزواج والإستقرار معي هنا والآخر السفر والعمل بالخارج، أيهما تختار؟",
"هل سبق وضربت أحدهم؟ ولماذا فعلت ذلك؟"
}
for k,v in pairs(lisstt) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
Redis:set(Fast..'lock_chengname'..chat_id,true)  
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:sadd(Fast.."Admin:Group"..chat_id,v.member_id.user_id) 
Redis:set(Fast.."smsme"..chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..chat_id,true) 
Redis:set(Fast.."Status:Reply"..chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:Welcome"..chat_id,true) 
Redis:set(Fast.."Status:Link"..chat_id,true) 
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:set(Fast..'tagallgroup'..chat_id,'open') 
Redis:set(Fast..'tagall@all'..chat_id,'open') 
Redis:del(Fast.."knele"..chat_id)
Redis:set(Fast.."Status:Link"..chat_id,true) 
Redis:set(Fast.."Status:Welcome"..chat_id,true) 
Redis:set(Fast.."Status:BanId"..chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..chat_id,true) 
Redis:set(Fast.."Status:Reply"..chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
Redis:set(Fast.."Status:SetId"..chat_id,true) 
Redis:set(Fast.."Status:KickMe"..chat_id,true) 
Redis:set(Fast.."replayallbot"..chat_id,true)
Redis:del(Fast.."amrthshesh"..chat_id)
Redis:del(Fast.."spammkick"..chat_id)
Redis:del(Fast.."intg"..chat_id)
Redis:del(Fast.."kadmeat"..chat_id)
Redis:del(Fast.."zhrfa"..chat_id)
Redis:del(Fast.."brjj"..chat_id)
Redis:del(Fast.."idnotmembio"..chat_id)
Redis:del(Fast.."idnotmem"..chat_id)
Redis:del(Fast..'lock_geamsAudio1'..chat_id) 
Redis:del(Fast..'lock_geamsAudio'..chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..chat_id)    
end
end
end
end
local txt = '• بواسطه 「 ['..UserInfo.first_name..'](tg://user?id='..who_promot..')⁪⁬‌‌‌‌ 」\n•  تم تفعيل الجروب ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..') تلقائياً\n✦'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
send(chat_id, 0 , txt, 'md', false, false, false, false, reply_markup)
end ---end done active
--code end
end
end
end
if data and data.Fastbots and data.Fastbots == "updateNewInlineCallbackQuery" then
local Text = bot.base64_decode(data.payload.data)
if Text and Text:match('/Hmsa1@(%d+)@(%d+)/(%d+)') then
local ramsesadd = {string.match(Text,"^/Hmsa1@(%d+)@(%d+)/(%d+)$")}
if tonumber(data.sender_user_id) == tonumber(ramsesadd[1]) or tonumber(ramsesadd[2]) == tonumber(data.sender_user_id) then
local inget = Redis:get(Fast..'hmsabots'..ramsesadd[3]..data.sender_user_id)
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape(inget)..'&show_alert=true')
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذه الهمسه ليست لك')..'&show_alert=true')
end
end
end
if data and data.Fastbots and data.Fastbots == "updateNewInlineQuery" then
local Text = data.query
if Text and Text:match("^(.*) @(.*)$")  then
local username = {string.match(Text,"^(.*) @(.*)$")}
local UserId_Info = bot.searchPublicChat(username[2])
if UserId_Info.id then
local idnum = math.random(1,64)
local input_message_content = {message_text = 'هذي الهمسة للحلو ( [@'..username[2]..'] ) هو اللي يقدر يشوفها 💖🔐', parse_mode = 'Markdown'}	
local reply_markup = {inline_keyboard={{{text = 'عرض الهمسه ♡ ', callback_data = '/Hmsa1@'..data.sender_user_id..'@'..UserId_Info.id..'/'..idnum}}}}	
local resuult = {{type = 'article', id = idnum, title = 'هذه همسه سريه الى [@'..username[2]..']', input_message_content = input_message_content, reply_markup = reply_markup}}	
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&results='..JSON.encode(resuult))
Redis:set(Fast..'hmsabots'..idnum..UserId_Info.id,username[1])
Redis:set(Fast..'hmsabots'..idnum..data.sender_user_id,username[1])
end
end
end

if data and data.Fastbots and data.Fastbots == "updateSupergroup" then
local Get_Chat = bot.getChat('-100'..data.supergroup.id)
if data.supergroup.status.Fastbots == "chatMemberStatusBanned" then
Redis:srem(Fast.."ChekBotAdd",'-100'..data.supergroup.id)
for k,v in pairs(Redis:keys("*")) do
if v:match(data.supergroup.id) then
Redis:del(v)
end
end
return send(Sudo_Id,0,'*\n• تم طرد البوت من جروب جديده \n• اسم الجروب : '..Get_Chat.title..'\n• ايدي الجروب :*`-100'..data.supergroup.id..'`\n• تم مسح جميع البيانات المتعلقه بالجروب',"md")
end
elseif data and data.Fastbots and data.Fastbots == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
end

elseif data and data.Fastbots and data.Fastbots == "updateNewMessage" then
if data.message.content.Fastbots == "messageChatDeleteMember" or data.message.content.Fastbots == "messageChatAddMembers" or data.message.content.Fastbots == "messagePinMessage" or data.message.content.Fastbots == "messageChatChangeTitle" or data.message.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:tagservr"..data.message.chat_id) then
bot.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender_user_id) == tonumber(Fast) then
return false
end
File_Bot_Run(data.message,data.message)


elseif data and data.Fastbots and data.Fastbots == "updateMessageEdited" then
-- data.chat_id -- data.message_id
--var(data)
local Message_Edit = bot.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Fast then

return false
end
if Message_Edit.sender_id.Fastbots == "messageSenderChat" then

return false
end

File_Bot_Run(Message_Edit,Message_Edit)

if tonumber(Message_Edit.sender_id.user_id) == 1121532100 then
data.The_Controller = 1
elseif tonumber(Message_Edit.sender_id.user_id) == 1121532100 then
data.The_Controller = 1
elseif The_ControllerAll(Message_Edit.sender_id.user_id) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 8
elseif tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end
local UserInfo = bot.getUser(Message_Edit.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..data.chat_id) 
Redis:incr(Fast..'Num:Message:Edit'..data.chat_id..Message_Edit.sender_id.user_id)
if not data.Creator then
if Message_Edit.content.Fastbots == "messageContact" or Message_Edit.content.Fastbots == "messageVideoNote" or Message_Edit.content.Fastbots == "messageDocument" or Message_Edit.content.Fastbots == "messageAudio" or Message_Edit.content.Fastbots == "messageVideo" or Message_Edit.content.Fastbots == "messageVoiceNote" or Message_Edit.content.Fastbots == "messageAnimation" or Message_Edit.content.Fastbots == "messagePhoto" then
if tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
return false 
end
if Redis:get(Fast.."Lock:edit"..data.chat_id) then
if #monsha ~= 0 then 
local ListMembers = '\n*• تاك للمالكين  \n ⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
 
local tecxt = ListMembers.."\n\n".."\n• المستخدم  {["..names.." ](tg://user?id="..Message_Edit.sender_id.user_id..")}"..
"\n• قام بتعديل الميديا"
send(data.chat_id,0,tecxt,"md")
end
bot.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
end
elseif data and data.Fastbots and data.Fastbots == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = bot.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id
user_id = data.sender_user_id
chat_id = data.chat_id
msg_id = data.message_id
--
-- like id 
if Text and Text:match('(%d+)/likeId/(%d+)') then
local Data = {Text:match('(%d+)/likeId/(%d+)')}
local UserId = Data[1]
if Redis:sismember(Fast.."like:users:"..UserId, IdUser) then
return bot.answerCallbackQuery(data.id,"\n⦁ لقد قمت بالتصويت من قبل", true)
end
Redis:sadd(Fast.."like:users:"..UserId, IdUser)
local num = tonumber(#Redis:smembers(Fast.."like:users:"..UserId))
local Msg = bot.getMessage(ChatId, Msg_id).content
local emo =  Redis:get(Fast.."like:id:emo:"..ChatId) or '🤍'
local Id_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = num.." "..emo , data = UserId.."/likeId/"..num}, 
},
}
}
if Msg.caption then
ID_text = Msg.caption.text
else
ID_text = Msg.text.text
return bot.editMessageText(ChatId,Msg_id,ID_text, 'html', false, false, Id_markup)
end
return bot.editMessageCaption(ChatId,Msg_id, ID_text, 'html', Id_markup)
end
--- meza callback
if Text and Text:match('(%d+)/meza_photo') then
local UserId = Text:match('(%d+)/meza_photo')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(Fast.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(Fast.."meza:type"..meza_name, "photo")
Redis:sadd(Fast.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "تم حفظ الميزه بنجاح.","md",false)
end end

if Text and Text:match('(%d+)/meza_video') then
local UserId = Text:match('(%d+)/meza_video')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(Fast.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(Fast.."meza:type"..meza_name, "video")
Redis:sadd(Fast.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "تم حفظ الميزه بنجاح.","md",false)
end end

if Text and Text:match('(%d+)/meza_audio') then
local UserId = Text:match('(%d+)/meza_audio')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(Fast.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(Fast.."meza:type"..meza_name, "audio")
Redis:sadd(Fast.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "تم حفظ الميزه بنجاح.","md",false)
end end

if Text and Text:match('(%d+)/meza_animation') then
local UserId = Text:match('(%d+)/meza_animation')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(Fast.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(Fast.."meza:type"..meza_name, "animation")
Redis:sadd(Fast.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "تم حفظ الميزه بنجاح.","md",false)
end end

if Text and Text:match('(%d+)/meza_sticker') then
local UserId = Text:match('(%d+)/meza_sticker')
if tonumber(IdUser) == tonumber(UserId) then
local meza_name = Redis:get(Fast.."add_meza:name:"..ChatId..":"..IdUser)
Redis:set(Fast.."meza:type"..meza_name, "sticker")
Redis:sadd(Fast.."meza:names:", meza_name)
return edit(ChatId, Msg_id, "تم حفظ الميزه بنجاح.","md",false)
end end

-- azan 
if Text and Text:match('(%d+)/azan/(.*)') then
local Data = {Text:match('(%d+)/azan/(.*)')}
if tonumber(IdUser) == tonumber(Data[1]) then
local list = {
    cairo = 'القاهره 🇪🇬',
    Makkah = 'مكه 🇸🇦',
    Baghdad = 'بغداد 🇮🇶'
}
local api = json:decode(request("https://api.aladhan.com/v1/timingsByAddress?address="..Data[2]))
local timings = api.data.timings
local date = api.data.date.hijri
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'القاهره 🇪🇬', data = IdUser..'/azan/cairo'},{text = 'مكه 🇸🇦', data = IdUser..'/azan/Makkah'},{text = 'بغداد 🇮🇶', data = IdUser..'/azan/Baghdad'},},
{{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄', url = "https://t.me/SOURCEROZA"}},
}
}
local Msg_text = "مواقيت الصلاه حسب التوقيت المحلي لمدينه "..list[Data[2]].."\n=================\n- الفجر : "..timings.Fajr.."\n- الظهر : "..timings.Dhuhr.."\n- العصر : "..timings.Asr.."\n- المغرب : "..timings.Maghrib.."\n- العشاء : "..timings.Isha.."\n=================\n"..date.weekday.ar.." ,"..date.day.." من "..date.month.ar.." "..date.year
return edit(ChatId, Msg_id,Msg_text ,"md",true, false, reply_markup) 
end end

-- 7azer call back
if Text and Text:match('(%d+)/add7azer') then
local Game_king = tonumber(Text:match('(%d+)/add7azer'))
if tonumber(Game_king) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id,"\n⦁ هتلعب معاهم ازاي وانت صاحب السؤال", true)
end
if Redis:sismember(Fast..":7azer:mem:"..ChatId, IdUser) then
return bot.answerCallbackQuery(data.id,"\n⦁ انت منضم اصلا", true)
end
if tonumber(Redis:get(Fast..":7azer:"..ChatId)) ~= tonumber(Game_king) then
return bot.answerCallbackQuery(data.id,"\n⦁ انتهت اللعبه", true)
end
Redis:sadd(Fast..":7azer:mem:"..ChatId, IdUser)
local list = ""
for k,v in pairs(Redis:smembers(Fast..":7azer:mem:"..ChatId)) do 
list = list.."- ["..bot.getUser(v).first_name.."](tg://user?id="..v..")\n"
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'انضم ➕', data = Game_king..'/add7azer'}, 
},
{
{text = '🙋🏼 اضغط هنا لارسال السؤال', url = 't.me/'..UserBot..'?start=7azer'..ChatId..'from_id'..Game_king}, 
},
}
}
send(ChatId, 0, "- ["..bot.getUser(IdUser).first_name.."](tg://user?id="..IdUser..")\n\n⦁ انضم للعب 🥳", 'md')
return bot.editMessageText(ChatId,Msg_id,'⦁ اضغط انضمام للانضمام للعبه 👥\n\n⦁ اللاعبين :\n'..list, 'md', false, false, reply_markup)
end

if Text and Text:match('(%d+)/del7azer') then
local UserId = Text:match('(%d+)/del7azer')
if tonumber(IdUser) == tonumber(UserId) or data.ControllerBot then
Redis:del(Fast..":7azer:mem:"..ChatId)
Redis:del(Fast..":7azer:"..ChatId)
return bot.editMessageText(ChatId,Msg_id,'⦁ تم مسح اللعبه الجاريه بنجاح', 'md', false, false)
else
return bot.answerCallbackQuery(data.id,"\n⦁ الامر ليس لك", true)
end
end
-- zkrfa
if Text and Text:match('(%d+)/normal_zk') then
  local UserId = Text:match('(%d+)/normal_zk')
  if tonumber(UserId) == tonumber(IdUser) then
    Redis:set(Fast.."zhrfa"..IdUser,"sendzh") 
    edit(ChatId, Msg_id, "*※︙ارسل الكلمه لزخرفتها عربي او انجلش*", "md",false)
  end
  end
if Text and Text:match('(%d+)/inline_zk') then
  local UserId = Text:match('(%d+)/inline_zk')
  if tonumber(UserId) == tonumber(IdUser) then
    local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = {
      {
      {text = '𝙀𝙉𝙂 ▴ زخࢪفھـۃ انجليزي', data = IdUser..'/zeng'},
      },
      {
        {text = '𝘼𝙍 ▴ زخࢪفھـۃ عربي', data = IdUser..'/zar'},
        },
      }
      }
      bot.editMessageText(ChatId, Msg_id, "*※︙مرحبا بك في الزخرفه الانلاين*", "md",true,false,reply_markup)
  end
  end
-- zeng call back
if Text and Text:match('(%d+)/zeng') then
  local UserId = Text:match('(%d+)/zeng')
  if tonumber(UserId) == tonumber(IdUser) then
    Redis:set(Fast..ChatId..IdUser.."zkrf:", "zeng")
    edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
  end
  end
if Text and Text:match('(.*)/az(.*)') then
    local anubis = {Text:match('(.*)/az(.*)')}
    local UserId = anubis[1]
    local z_num = anubis[2]
    local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
    Redis:set(Fast..ChatId..IdUser.."zkrf:num", z_num)
    if tonumber(UserId) == tonumber(IdUser) then
      local api = request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
      local zkrf = JSON.decode(api)
      local zk = zkrf['anubis'][z_num]
      local zk_list = Redis:smembers(Fast.."zk_list:")
      local inline_anubis = {data = {{text = "▴ زخࢪفھـۃ بالايموجي ▴" , data = UserId..'/emo'}}}
  for k,v in pairs(zk_list) do
    zk_by_anubis = v:gsub("###",zk)
    inline_anubis[k] = {{text = zk_by_anubis , data = UserId.."/bz"..k}}
    end
    local reply_markup = bot.replyMarkup{
        type = 'inline',
        data = inline_anubis
        }
    edit(ChatId, Msg_id, "▾\n★ لقد اختࢪت \n▷ "..zk, "md",true,false,reply_markup)
    end
    end
if Text and Text:match('(.*)/bz(.*)') then
local anubis = {Text:match('(.*)/bz(.*)')}
local UserId = anubis[1]
local z_num = tonumber(anubis[2])
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
if tonumber(UserId) == tonumber(IdUser) then
local api = request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_save]
local zk_list = Redis:smembers(Fast.."zk_list:")
local zk_anubis = zk_list[z_num]:gsub("###",zk)
edit(ChatId, Msg_id, "▾\n★ لقد اختࢪت \n▷ `"..zk_anubis.."`", "md",false)
Redis:del(Fast..ChatId..IdUser.."zkrf:text")
Redis:del(Fast..ChatId..IdUser.."zkrf:num")
end
end
if Text and Text:match('(.*)/delz(.*)') then
local anubis = {Text:match('(.*)/delz(.*)')}
local UserId = anubis[1]
local z_num = tonumber(anubis[2])
if tonumber(UserId) == tonumber(IdUser) then
local zk_list = Redis:smembers(Fast.."zk_list:")
Redis:srem(Fast.."zk_list:", zk_list[z_num])
local reply_markup = bot.replyMarkup{
    type = 'inline',
    data = {
        {{text = 'رجوع', data = UserId..'/home_z'}}
    }
}
edit(ChatId, Msg_id, "※︙لقد قمت بحذف "..zk_list[z_num].."\n※︙من قائمه الزخارف", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/home_z') then
local UserId = Text:match('(%d+)/home_z')
if tonumber(UserId) == tonumber(IdUser) then
local zk_list = Redis:smembers(Fast.."zk_list:")
local inline_anubis = {data = {}}
for k,v in pairs(zk_list) do
inline_anubis[k] = {{text = v , data = UserId.."/delz"..k}}
end
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = inline_anubis
  }
edit(ChatId, Msg_id, "※︙اضغط علي الزخرفه لحذفها", "md",true,false,reply_markup)
end
end
-- zk emo
if Text and Text:match('(%d+)/emo') then
  local UserId = Text:match('(%d+)/emo')
  local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
  local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
  if tonumber(UserId) == tonumber(IdUser) then
    local api = request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
    local zkrf = JSON.decode(api)
    local zk = zkrf['anubis'][z_save]
    edit(ChatId, Msg_id, "★ تمت الزخࢪفھـۃ بنجاح\n\n▷ `"..zk.." ¦✨❤️` \n\n▷ `"..zk.." “̯ 🐼💗`\n\n▷ `"..zk.." 🦋“`\n\n▷ `"..zk.."ّ ❥̚͢₎ 🐣`\n\n▷ `"..zk.." ℡ ̇ ✨🐯⇣✦`\n\n▷ `"..zk.." 😴🌸✿⇣`\n\n▷ `"..zk.." 🙊💙`\n\n▷ `"..zk.." ❥┊⁽ ℡🦁🌸`\n\n▷ `"..zk.." ※︙💚“`\n\n▷ `"..zk.." ⚡️♛ֆ₎`\n\n▷ `"..zk.." ⁞♩⁽💎🌩₎⇣✿`\n\n▷ `"..zk.." 〄💖‘`\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!", "md",false)
    Redis:del(Fast..ChatId..IdUser.."zkrf:text")
    Redis:del(Fast..ChatId..IdUser.."zkrf:num")
  end
  end
-- zar call back
if Text and Text:match('(%d+)/zar') then
    local UserId = Text:match('(%d+)/zar')
    if tonumber(UserId) == tonumber(IdUser) then
      Redis:set(Fast..ChatId..IdUser.."zkrf:", "zar")
      edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
    end
    end
--
if Text and Text:match('(%d+)/normal_zk') then
local UserId = Text:match('(%d+)/normal_zk')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'عربـــــي', data = UserId..'/Zhrfaar'},{text = 'انجليــــزي', data = UserId..'/Zhrfaen'},
},
}
}
edit(ChatId,Msg_id,"※︙اختر لغه الزخرفه :", 'md', true, false, reply_markup)
end
end
if Text == "/kill_the_ant" then
local from_name = bot.getUser(IdUser).first_name
local tag = "["..from_name.."](tg://user?id="..IdUser..")"
local media ={
type = "photo",
media = "https://te.legra.ph/file/adb1c649693a9abb5cc8f.jpg",
caption = 'العرص دا '..tag..' هو الي قتلها',
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'google', url="www.google.com"}
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:ar"..UserId,500,true)
edit(ChatId,Msg_id,"※︙ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:en"..UserId,500,true)
edit(ChatId,Msg_id,"※︙ارسل الاسم بالانكليزي", 'md', false)
end
end
-- bank call back
----------
if Text and Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)') then
local Data = {Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رأيك نزوجك بدالهم ؟", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(Fast.."zwag_request:"..Data[1]) then
local zwga_id = tonumber(Data[1])
local zwg_id = tonumber(Data[2])
local coniss = Data[3]
local zwg = bot.getUser(zwg_id)
local zwga = bot.getUser(zwga_id)
local zwg_tag = '['..zwg.first_name.."](tg://user?id="..zwg_id..")"
local zwga_tag = '['..zwga.first_name.."](tg://user?id="..zwga_id..")"
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) - ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get(Fast.."boob"..zwg_id) or 0
ballanceea = Redis:get(Fast.."boob"..zwga_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee - tonumber(coniss)
Redis:set(Fast.."boob"..zwg_id , math.floor(zeugh))
Redis:sadd(Fast.."roogg1",zwg_id)
Redis:sadd(Fast.."roogga1",zwga_id)
Redis:set(Fast.."roog1"..zwg_id,zwg_id)
Redis:set(Fast.."rooga1"..zwg_id,zwga_id)
Redis:set(Fast.."roogte1"..zwga_id,zwga_id)
Redis:set(Fast.."rahr1"..zwg_id,tonumber(coniss))
Redis:set(Fast.."rahr1"..zwga_id,tonumber(coniss))
Redis:set(Fast.."roog1"..zwga_id,zwg_id)
Redis:set(Fast.."rahrr1"..zwg_id,math.floor(ballanceekkk))
Redis:set(Fast.."rooga1"..zwga_id,zwga_id)
Redis:set(Fast.."rahrr1"..zwga_id,math.floor(ballanceekkk))
return edit(ChatId,Msg_id,"كولولولولويششش\nاليوم عقدنا قران :\n\nالزوج "..zwg_tag.." 🤵🏻\n   💗\nالزوجة "..zwga_tag.." 👰🏻‍♀️\nالمهر : "..convert_mony.." جنيه بعد الضريبة 15%\nعشان تشوفون وثيقة زواجكم اكتبوا : زواجي", 'md', false)
else
return edit(ChatId,Msg_id,"انتهى الطلب وين كنتي لما طلب ايدك", 'md', false)
end
end
end
if Text and Text:match('(%d+)/zwag_no/(%d+)') then
local UserId = {Text:match('(%d+)/zwag_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رأيك نزوجك بدالهم ؟", true)
else
Redis:del(Fast.."zwag_request:"..UserId[1])
Redis:del(Fast.."zwag_request:"..UserId[2])
return edit(ChatId,Msg_id,"خليكي عانس ؟؟", 'md', false)
end
end
----
if Text and Text:match('(%d+)/company_yes/(%d+)') then
local Data = {Text:match('(%d+)/company_yes/(%d+)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(Fast.."company_request:"..Data[1]) then
local Cname = Redis:get(Fast.."companys_name:"..Data[2])
Redis:sadd(Fast.."company:mem:"..Cname, IdUser)
Redis:sadd(Fast.."in_company:", IdUser)
Redis:set(Fast.."in_company:name:"..IdUser, Cname)
local mem_tag = "["..bot.getUser(IdUser).first_name.."](tg://user?id="..IdUser..")"
send(Data[2],0, "اللاعب "..mem_tag.." وافق على الانضمام الى شركتك","md",true)
return edit(ChatId,Msg_id,"تم قبول الطلب بنجاح",'md',false)
else
return edit(ChatId,Msg_id,"انتهى الطلب للاسف", 'md', false)
end
end
end
if Text and Text:match('(%d+)/company_no/(%d+)') then
local UserId = {Text:match('(%d+)/company_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
else
Redis:del(Fast.."company_request:"..UserId[1])
local mem_tag = "["..bot.getUser(IdUser).first_name.."](tg://user?id="..IdUser..")"
send(Data[2],0, "اللاعب "..mem_tag.." رفض العمل في شركتك","md",true)
return edit(ChatId,Msg_id,"تم رفض الطلب بنجاح", 'md', false)
end
end
if Text and Text:match('(%d+)/happywheel') then
  local UserId = Text:match('(%d+)/happywheel')
  if tonumber(data.sender_user_id) == tonumber(UserId) then
  local media = "https://t.me/c_r_o_z_a/11"
  local msg_media = {
  type = "video",
  media = media,
  caption = '',
  parse_mode = "Markdown"                    
  }     
  local keyboard = {} 
  keyboard.inline_keyboard = {
  {
  {text = '• توقف •', callback_data=data.sender_user_id.."/play_wheel"}
  },
  }
  local msg_reply = msg_id/2097152/0.5
  Redis:set(Fast.."happywheel:st:"..UserId..":"..chat_id, true)
  https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..chat_id.."&message_id="..msg_reply.."&media="..JSON.encode(msg_media).."&reply_markup="..JSON.encode(keyboard))
  end 
  end
  
if Text and Text:match('(%d+)/play_wheel') then
  local UserId = Text:match('(%d+)/play_wheel')
  if tonumber(data.sender_user_id) == tonumber(UserId) and Redis:get(Fast.."happywheel:st:"..UserId..":"..chat_id) then
  Redis:del(Fast.."happywheel:st:"..UserId..":"..chat_id)
  local media = {
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 10000000 جنيه 💵","10000000"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 5000000 جنيه 💵","5000000"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 1000000 جنيه 💵","1000000"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت 100000 جنيه 💵","100000"
    },
    {
      "https://t.me/c_r_o_z_a/4","مبروك ربحت 4 قصور","4"
    },
    {
      "https://t.me/c_r_o_z_a/5","مبروك ربحت 8 فيلات","8"
    },
    {
      "https://t.me/c_r_o_z_a/6","مبروك ربحت 15 منزل","15"
    },
    {
      "https://t.me/c_r_o_z_a/7","مبروك ربحت 5 ماسات","5"
    },
    {
      "https://t.me/c_r_o_z_a/8","مبروك ربحت 6 قلادات","6"
    },
    {
      "https://t.me/c_r_o_z_a/9","مبروك ربحت 10 اساور","10"
    },
    {
      "https://t.me/c_r_o_z_a/10","مبروك ربحت 20 خاتم","20"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك ربحت مضاعفة نصف الفلوس","1"
    },
    {
      "https://t.me/c_r_o_z_a/3","مبروك خسرت ربع فلوسك","1"
    },
  }
  local rand = math.random(1,11)
  local msg_media = {
  type = "photo",
  media = media[rand][1],
  caption = media[rand][2],
  parse_mode = "Markdown"                    
  }     
  local keyboard = {} 
  keyboard.inline_keyboard = {
  {
  {text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦',url="t.me/SOURCEROZA"}, 
  },
  }
  local msg_reply = msg_id/2097152/0.5
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if rand == 1 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 2 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 3 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 4 then
ballancek = ballance + media[rand][3]
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancek))
elseif rand == 5 then
local akrksrnumm = Redis:get(Fast.."akrksrnum"..data.sender_user_id) or 0
local akrksrnoww = tonumber(akrksrnumm) + media[rand][3]
Redis:set(Fast.."akrksrnum"..data.sender_user_id , math.floor(akrksrnoww))
ksrnamed = "قصر"
Redis:set(Fast.."akrksrname"..data.sender_user_id,ksrnamed)
elseif rand == 6 then
local akrfelnumm = Redis:get(Fast.."akrfelnum"..data.sender_user_id) or 0
local akrfelnoww = tonumber(akrfelnumm) + media[rand][3]
Redis:set(Fast.."akrfelnum"..data.sender_user_id , math.floor(akrfelnoww))
felnamed = "فيلا"
Redis:set(Fast.."akrfelname"..data.sender_user_id,felnamed)
elseif rand == 7 then
local akrmnznumm = Redis:get(Fast.."akrmnznum"..data.sender_user_id) or 0
local akrmnznoww = tonumber(akrmnznumm) + media[rand][3]
Redis:set(Fast.."akrmnznum"..data.sender_user_id , math.floor(akrmnznoww))
mnznamed = "منزل"
Redis:set(Fast.."akrmnzname"..data.sender_user_id,mnznamed)
elseif rand == 8 then
local mgrmasnumm = Redis:get(Fast.."mgrmasnum"..data.sender_user_id) or 0
local mgrmasnoww = tonumber(mgrmasnumm) + media[rand][3]
Redis:set(Fast.."mgrmasnum"..data.sender_user_id , math.floor(mgrmasnoww))
masnamed = "ماسه"
Redis:set(Fast.."mgrmasname"..data.sender_user_id,masnamed)
elseif rand == 9 then
local mgrkldnumm = Redis:get(Fast.."mgrkldnum"..data.sender_user_id) or 0
local mgrkldnoww = tonumber(mgrkldnumm) + media[rand][3]
Redis:set(Fast.."mgrkldnum"..data.sender_user_id , math.floor(mgrkldnoww))
kldnamed = "قلاده"
Redis:set(Fast.."mgrkldname"..data.sender_user_id,kldnamed)
elseif rand == 10 then
local mgrswrnumm = Redis:get(Fast.."mgrswrnum"..data.sender_user_id) or 0
local mgrswrnoww = tonumber(mgrswrnumm) + media[rand][3]
Redis:set(Fast.."mgrswrnum"..data.sender_user_id , math.floor(mgrswrnoww))
swrnamed = "سوار"
Redis:set(Fast.."mgrswrname"..data.sender_user_id,swrnamed)
elseif rand == 11 then
local mgrktmnumm = Redis:get(Fast.."mgrktmnum"..data.sender_user_id) or 0
local mgrktmnoww = tonumber(mgrktmnumm) + media[rand][3]
Redis:set(Fast.."mgrktmnum"..data.sender_user_id , math.floor(mgrktmnoww))
ktmnamed = "خاتم"
Redis:set(Fast.."mgrktmname"..data.sender_user_id,ktmnamed)
elseif rand == 12 then
ballancek = ballance / 2
ballancekk = math.floor(ballancek) + ballance
Redis:set(Fast.."boob"..data.sender_user_id , ballancekk)
else
ballancek = ballance / 4
ballancekk = ballance - math.floor(ballancek)
Redis:set(Fast.."boob"..data.sender_user_id , math.floor(ballancekk))
end
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..chat_id.."&message_id="..msg_reply.."&media="..JSON.encode(msg_media).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/toptop') then
local UserId = Text:match('(%d+)/toptop')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local toptop = "⇜ اهلين فيك في قوائم التوب\nللمزيد من التفاصيل - [@SOURCEROZA]\n𔔁"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'النوادي', data = data.sender_user_id..'/topnade'},{text = 'الزرف', data = data.sender_user_id..'/topzrf'},{text = 'الفلوس', data = data.sender_user_id..'/topmon'},{text = 'زواجات', data = data.sender_user_id..'/zoztee'},
},
{
{text = 'المتبرعين', data = data.sender_user_id..'/motbra'},{text = 'الشركات', data = data.sender_user_id..'/shrkatt'},{text = 'المزارع', data = data.sender_user_id..'/mazratee'},
},
{
{text = 'اخفاء', data = data.sender_user_id..'/delAmr'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄', url="t.me/SOURCEROZA"},
},
}
}
edit(ChatId,Msg_id,toptop, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topnade') then
local UserId = Text:match('(%d+)/topnade')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(Fast.."ownernade")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد نوادي","md",true)
end
top_monyd = "⇜ توب اعلى 10 نوادي :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."nokatnade"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(Fast.."lkbnade"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local mony = v[1]
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,top_monyd..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/mazratee') then
local UserId = Text:match('(%d+)/mazratee')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local bank_users = Redis:smembers(Fast.."ownerfram")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد مزارع","md",true)
end
top_monyd = "توب اعلى 10 مزارع :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."toplvfarm"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(Fast.."namefram"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,top_monyd..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/shrkatt') then
local UserId = Text:match('(%d+)/shrkatt')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local companys = Redis:smembers(Fast.."companys:")
if #companys == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد شركات","md",true)
end
local top_company = {}
for A,N in pairs(companys) do
local Cmony = 0
for k,v in pairs(Redis:smembers(Fast.."company:mem:"..N)) do
local mem_mony = tonumber(Redis:get(Fast.."boob"..v)) or 0
Cmony = Cmony + mem_mony
end
local owner_id = Redis:get(Fast.."companys_owner:"..N)
local Cid = Redis:get(Fast.."companys_id:"..N)
table.insert(top_company, {tonumber(Cmony) , owner_id , N , Cid})
end
table.sort(top_company, function(a, b) return a[1] > b[1] end)
local num = 1
local emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
local msg_text = "توب اعلى 20 شركة : \n"
for k,v in pairs(top_company) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local Cname = v[3]
local Cid = v[4]
local mony = v[1]
gflous = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
local emoo = emoji[k]
num = num + 1
msg_text = msg_text..emoo.." "..gflous.."  💵 l "..Cname.."\n"
gg = "━━━━━━━━━\n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msg_text..gg, 'html', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/motbra') then
local UserId = Text:match('(%d+)/motbra')
if tonumber(data.sender_user_id) == tonumber(UserId) then
  local F_Name = bot.getUser(data.sender_user_id).first_name
Redis:set(Fast..data.sender_user_id.."first_name:", F_Name)
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = "["..ban.first_name.."]"
else
news = " لا يوجد"
end
ballancee = Redis:get(Fast.."tabbroat"..data.sender_user_id) or 0
local bank_users = Redis:smembers(Fast.."taza")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اعلى 20 شخص بالتبرعات :\n\n"
tabr_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."tabbroat"..v)
table.insert(tabr_list, {tonumber(mony) , v})
end
table.sort(tabr_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(tabr_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("????",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/zoztee') then
local UserId = Text:match('(%d+)/zoztee')
if tonumber(data.sender_user_id) == tonumber(UserId) then
  local zwag_users = Redis:smembers(Fast.."roogg1")
  if #zwag_users == 0 then
  return edit(ChatId,Msg_id,"⇜ مافي زواجات حاليا","md",true)
  end
  top_zwag = "توب 30 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(Fast.."rahr1"..v)
  local zwga = Redis:get(Fast.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(Fast..v[3].."first_name:") or "لا يوجد اسم"
tt =  "["..zwg_name.."]("..zwg_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
kk = "["..zwga_name.."]("..zwga_name..")"
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local doltebankz = Redis:get(Fast.."doltebank"..v[3])
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = zwag_emoji[k]
znum = znum + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_zwag = top_zwag..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.." 👫 "..kk.." "..doltebankz.."\n"
gg = "\n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
  end
  end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,top_zwag..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topzrf') then
local UserId = Text:match('(%d+)/topzrf')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = "["..ban.first_name.."]"
else
news = " لا يوجد"
end
zrfee = Redis:get(Fast.."rrfff"..data.sender_user_id) or 0
local ty_users = Redis:smembers(Fast.."rrfffid")
if #ty_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(Fast.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Fast.."doltebank"..v[2])
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
ty_anubis = ty_anubis..emoo.." "..gflos.." 💵 l "..tt.." "..doltebank.."\n"
gflous = string.format("%.0f", zrfee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = "\n━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\nملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,ty_anubis..gg, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/topmon') then
local UserId = Text:match('(%d+)/topmon')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local F_Name = bot.getUser(data.sender_user_id).first_name
Redis:set(Fast..data.sender_user_id.."first_name:", F_Name)
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = "["..ban.first_name.."]"
else
news = " لا يوجد"
end
if Redis:ttl(Fast.."deletbank" .. 111) >= 518400 then
local day = "7 ايام"
elseif Redis:ttl(Fast.."deletbank" .. 111) >= 432000 then
local day = "6 ايام"
elseif Redis:ttl(Fast.."deletbank" .. 111) >= 345600 then
local day = "5 ايام"
elseif Redis:ttl(Fast.."deletbank" .. 111) >= 259200 then
local day = "4 ايام"
elseif Redis:ttl(Fast.."deletbank" .. 111) >= 172800 then
local day = "3 ايام"
elseif Redis:ttl(Fast.."deletbank" .. 111) >= 86400 then
local day = "يومان"
else
local day = "يوم واحد"
end
ballancee = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local bank_users = Redis:smembers(Fast.."booob")
if #bank_users == 0 then
return send(ChatId,Msg_id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩??️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Fast.."doltebank"..v[2]) or "🏳️"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.."\n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\nyou ) "..gflous.." 💵 l "..news.." \n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه\n\n⇜ تتصفر اللعبة بعد : "..day..""
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• رجوع •', data = data.sender_user_id..'/toptop'}, 
},
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,top_mony..gg, 'html', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/syria') then
local UserId = Text:match('(%d+)/syria')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇸🇾"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇸🇾"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
------------------------------------------------------------------------
if Text and Text:match('(%d+)/sudia') then
local UserId = Text:match('(%d+)/sudia')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇸🇦"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇸🇦"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/iraqq') then
local UserId = Text:match('(%d+)/iraqq')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇮🇶"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇮🇶"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/yemen') then
local UserId = Text:match('(%d+)/yemen')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇾🇪"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇾🇪"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/tunsia') then
local UserId = Text:match('(%d+)/tunsia')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇹🇳"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇹🇳"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/qatar') then
local UserId = Text:match('(%d+)/qatar')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇶🇦"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇶🇦"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/sudan') then
local UserId = Text:match('(%d+)/sudan')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇸🇩"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇸🇩"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/plastin') then
local UserId = Text:match('(%d+)/plastin')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇵🇸"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇵🇸"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/moroco') then
local UserId = Text:match('(%d+)/moroco')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇲🇦"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇲🇦"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/oman') then
local UserId = Text:match('(%d+)/oman')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇴🇲"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇴🇲"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/libya') then
local UserId = Text:match('(%d+)/libya')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇱🇾"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇱🇾"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/kuwit') then
local UserId = Text:match('(%d+)/kuwit')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇰🇼"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇰🇼"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lebanon') then
local UserId = Text:match('(%d+)/lebanon')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇱🇧"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇱🇧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/jordan') then
local UserId = Text:match('(%d+)/jordan')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇯🇴"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇯🇴"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/bahren') then
local UserId = Text:match('(%d+)/bahren')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇧🇭"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇧🇭"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/egypt') then
local UserId = Text:match('(%d+)/egypt')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇪🇬"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇪🇬"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/algeria') then
local UserId = Text:match('(%d+)/algeria')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇩🇿"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇩🇿"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/emarite') then
local UserId = Text:match('(%d+)/emarite')
if tonumber(data.sender_user_id) == tonumber(UserId) then
doltebank = "🇦🇪"
Redis:set(Fast.."doltebank"..data.sender_user_id,doltebank)
cccall = Redis:get(Fast.."boobb"..data.sender_user_id)
ccctype = Redis:get(Fast.."bbobb"..data.sender_user_id)
shakse = Redis:get(Fast.."shakse"..data.sender_user_id)
if shakse == "طيبة" then
shakseshakse = "طيبة 😇"
else
shakseshakse = "شريرة 😈"
end
msalm = "• وسوينا لك حساب في بنك روزا 🏦\n• وشحنالك 50 جنيه 💵 هدية\n\n⇜ رقم حسابك ↢ ( `"..cccall.."` )\n⇜ نوع البطاقة ↢ ( "..ccctype.." )\n⇜ فلوسك ↢ ( 50 جنيه 💵 )\n⇜ شخصيتك : "..shakseshakse.."\n⇜ دولتك : 🇦🇪"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end
end
------------------------------------------------------------------------
if Text and Text:match('(%d+)/msalm') then
local UserId = Text:match('(%d+)/msalm')
if tonumber(data.sender_user_id) == tonumber(UserId) then
shakse = "طيبة"
Redis:set(Fast.."shkse"..data.sender_user_id,shakse)
ttshakse = '⇜ اختر دولتك :\n𔔁'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '🇸🇾', data = data.sender_user_id..'/syria'},{text = '🇸🇦', data = data.sender_user_id..'/sudia'},{text = '🇮🇶', data = data.sender_user_id..'/iraqq'},
},{
{text = '🇾🇪', data = data.sender_user_id..'/yemen'},{text = '🇹🇳', data = data.sender_user_id..'/tunsia'},{text = '🇶🇦', data = data.sender_user_id..'/qatar'},
},{
{text = '🇸🇩', data = data.sender_user_id..'/sudan'},{text = '🇵🇸', data = data.sender_user_id..'/plastin'},{text = '🇲🇦', data = data.sender_user_id..'/moroco'},
},{
{text = '🇴🇲', data = data.sender_user_id..'/oman'},{text = '🇱🇾', data = data.sender_user_id..'/libya'},{text = '🇰🇼', data = data.sender_user_id..'/kuwit'},
},{
{text = '🇱🇧', data = data.sender_user_id..'/lebanon'},{text = '🇯🇴', data = data.sender_user_id..'/jordan'},{text = '🇧🇭', data = data.sender_user_id..'/bahren'},
},{
{text = '🇪🇬', data = data.sender_user_id..'/egypt'},{text = '🇩🇿', data = data.sender_user_id..'/algeria'},{text = '🇦🇪', data = data.sender_user_id..'/emarite'},
},
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/shrer') then
local UserId = Text:match('(%d+)/shrer')
if tonumber(data.sender_user_id) == tonumber(UserId) then
shakse = "شريرة"
Redis:set(Fast.."shkse"..data.sender_user_id,shakse)
ttshakse = '⇜ اختر دولتك :\n𔔁'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '🇸🇾', data = data.sender_user_id..'/syria'},{text = '🇸🇦', data = data.sender_user_id..'/sudia'},{text = '🇮🇶', data = data.sender_user_id..'/iraqq'},
},{
{text = '🇾🇪', data = data.sender_user_id..'/yemen'},{text = '🇹🇳', data = data.sender_user_id..'/tunsia'},{text = '🇶🇦', data = data.sender_user_id..'/qatar'},
},{
{text = '🇸🇩', data = data.sender_user_id..'/sudan'},{text = '🇵🇸', data = data.sender_user_id..'/plastin'},{text = '🇲🇦', data = data.sender_user_id..'/moroco'},
},{
{text = '🇴🇲', data = data.sender_user_id..'/oman'},{text = '🇱🇾', data = data.sender_user_id..'/libya'},{text = '🇰🇼', data = data.sender_user_id..'/kuwit'},
},{
{text = '🇱🇧', data = data.sender_user_id..'/lebanon'},{text = '🇯🇴', data = data.sender_user_id..'/jordan'},{text = '🇧🇭', data = data.sender_user_id..'/bahren'},
},{
{text = '🇪🇬', data = data.sender_user_id..'/egypt'},{text = '🇩🇿', data = data.sender_user_id..'/algeria'},{text = '🇦🇪', data = data.sender_user_id..'/emarite'},
},
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/master') then
local UserId = Text:match('(%d+)/master')
if tonumber(data.sender_user_id) == tonumber(UserId) then
creditcc = math.random(5000000000000000,5999999999999999);
mast = "ماستر"
balas = 50
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = data.sender_user_id
Redis:set(Fast.."bobna"..data.sender_user_id,news)
Redis:set(Fast.."boob"..data.sender_user_id,balas)
Redis:set(Fast.."boobb"..data.sender_user_id,creditcc)
Redis:set(Fast.."bbobb"..data.sender_user_id,mast)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,mast)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",data.sender_user_id)
ttshakse = '⇜ اختر شخصيتك في اللعبة :\n𔔁'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شخصية طيبة 😇', data = data.sender_user_id..'/msalm'},{text = 'شخصية شريرة 😈', data = data.sender_user_id..'/shrer'},
},
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/visaa') then
local UserId = Text:match('(%d+)/visaa')
if tonumber(data.sender_user_id) == tonumber(UserId) then
creditvi = math.random(4000000000000000,4999999999999999);
visssa = "فيزا"
balas = 50
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = data.sender_user_id
Redis:set(Fast.."bobna"..data.sender_user_id,news)
Redis:set(Fast.."boob"..data.sender_user_id,balas)
Redis:set(Fast.."boobb"..data.sender_user_id,creditvi)
Redis:set(Fast.."bbobb"..data.sender_user_id,visssa)
Redis:set(Fast.."boballname"..creditvi,news)
Redis:set(Fast.."boballbalc"..creditvi,balas)
Redis:set(Fast.."boballcc"..creditvi,creditvi)
Redis:set(Fast.."boballban"..creditvi,visssa)
Redis:set(Fast.."boballid"..creditvi,banid)
Redis:sadd(Fast.."booob",data.sender_user_id)
ttshakse = '⇜ اختر شخصيتك في اللعبة :\n𔔁'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شخصية طيبة 😇', data = data.sender_user_id..'/msalm'},{text = 'شخصية شريرة 😈', data = data.sender_user_id..'/shrer'},
},
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/express') then
local UserId = Text:match('(%d+)/express')
if tonumber(data.sender_user_id) == tonumber(UserId) then
creditex = math.random(6000000000000000,6999999999999999);
exprs = "اكسبرس"
balas = 50
local ban = bot.getUser(data.sender_user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = data.sender_user_id
Redis:set(Fast.."bobna"..data.sender_user_id,news)
Redis:set(Fast.."boob"..data.sender_user_id,balas)
Redis:set(Fast.."boobb"..data.sender_user_id,creditex)
Redis:set(Fast.."bbobb"..data.sender_user_id,exprs)
Redis:set(Fast.."boballname"..creditex,news)
Redis:set(Fast.."boballbalc"..creditex,balas)
Redis:set(Fast.."boballcc"..creditex,creditex)
Redis:set(Fast.."boballban"..creditex,exprs)
Redis:set(Fast.."boballid"..creditex,banid)
Redis:sadd(Fast.."booob",data.sender_user_id)
ttshakse = '⇜ اختر شخصيتك في اللعبة :\n𔔁'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'شخصية طيبة 😇', data = data.sender_user_id..'/msalm'},{text = 'شخصية شريرة 😈', data = data.sender_user_id..'/shrer'},
},
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
}
}
edit(ChatId,Msg_id,ttshakse, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/sahb') then
local UserId = Text:match('(%d+)/sahb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
cccall = Redis:get(Fast.."tdbelballance"..data.sender_user_id) or 0
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(cccall) then
return edit(ChatId,Msg_id, "⇜ فلوسك ماتكفي","md",true)
end
Redis:setex(Fast.."iioood" .. data.sender_user_id,920, true)
local list = {"1", "2", "3"}
local rand = list[math.random(#list)]
if rand == "1" then -- 1 con
cccallcc = tonumber(ballance) + tonumber(cccall)
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
Redis:del(Fast.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",cccallcc)
msalm = "⌯ مبروك ربحت بالسحب\n\n⇜ المبلغ : "..convert_mony.."\nرصيدك الان : `"..convert_monyy.."`\n𔔁"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 1 con
if rand == "2" then -- 2 con
Redis:del(Fast.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",ballance)
msalm = "⌯ حظ اوفر ماربحت شي\n\n⇜ المبلغ : "..convert_mony.."\n⇜ رصيدك الان : `"..convert_monyy.."`\n𔔁"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 2 con
if rand == "3" then -- 3 con
cccallcc = tonumber(ballance) - tonumber(cccall)
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
cccall = Redis:get(Fast.."tdbelballance"..data.sender_user_id)
Redis:del(Fast.."tdbelballance"..data.sender_user_id)
local convert_mony = string.format("%.0f",cccall)
local convert_monyy = string.format("%.0f",cccallcc)
msalm = "⌯ خسرت بالسحب ☹️\n\n⇜ المبلغ : "..convert_mony.."\nرصيدك الان : `"..convert_monyy.."`\n𔔁"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐑𝐙 • 𝐒𝐎𝐔𝐑𝐂𝐄',url="t.me/SOURCEROZA"}, 
},
}
}
return edit(ChatId,Msg_id,msalm, 'md', true, false, reply_markup)
end -- 3 con 
end
end
--Bank
if Text and Text:match('(%d+)/4×4') then
local UserId = Text:match('(%d+)/4×4')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(1000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 1000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,1000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعة : '..namefram..'\n⇠ قياس المزرعة : 4×4\n⇠ السعر : 1000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/6×6') then
local UserId = Text:match('(%d+)/6×6')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(2000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 2000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,5000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعة : '..namefram..'\n⇠ قياس المزرعة : 6×6\n⇠ السعر : 2000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/8×8') then
local UserId = Text:match('(%d+)/8×8')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(3000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 3000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,10000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعة : '..namefram..'\n⇠ قياس المزرعة : 8×8\n⇠ السعر : 3000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/12×12') then
local UserId = Text:match('(%d+)/12×12')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(4000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 4000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,100000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعة : '..namefram..'\n⇠ قياس المزرعة : 12×12\n⇠ السعر : 4000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/16×16') then
local UserId = Text:match('(%d+)/16×16')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(5000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 5000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,1000000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعة : '..namefram..'\n⇠ قياس المزرعة : 16×16\n⇠ السعر : 5000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/32×32') then
local UserId = Text:match('(%d+)/32×32')
if tonumber(data.sender_user_id) == tonumber(UserId) then
local banid = data.sender_user_id
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(6000) then
return bot.editMessageText(chat_id,msg_id, "⇠ مينفعش تشتري فلوسك مش مكفيه","md",true)
end
cccallcc = tonumber(ballance) - 6000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
namefram = Redis:get(Fast.."namefram"..data.sender_user_id)
Redis:sadd(Fast.."farmarname", namefram)
Redis:set(Fast.."sizefram"..data.sender_user_id,10000000)
Redis:sadd(Fast.."ownerfram",data.sender_user_id)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '✬︙ تم بناء مزرعتك 🏕\n\n⇠ اسم المزرعة : '..namefram..'\n⇠ قياس المزرعة : 32×32\n⇠ السعر : 6000 جنيه 💵\n⇠ رصيدك الان : '..convert_mony..' جنيه 💵\nϟ'
bot.editMessageText(chat_id,msg_id,ttshakse, 'md', true)
end
end
--------------------------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/luisyes') then
local UserId = Text:match('(%d+)/luisyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(39000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 39000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "لويس سواريز"
energyplayer = "83"
mrkzplayer = "مهاجم"
cityplayer = "🇺🇦 اوكرانيا"
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,39000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : لويس سواريز\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : اوكرانيا 🇺🇦\n⇜ السعر : 39000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/luisno') then
local UserId = Text:match('(%d+)/luisno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب لويس سواريز ", 'md', true)
end
end
if Text and Text:match('(%d+)/danyes') then
local UserId = Text:match('(%d+)/danyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(50000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 50000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "داني الفيش"
energyplayer = "83"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷"
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,50000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : داني الفيش\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ السعر : 50000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/danno') then
local UserId = Text:match('(%d+)/danno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب داني الفيش", 'md', true)
end
end
if Text and Text:match('(%d+)/fdnyes') then
local UserId = Text:match('(%d+)/fdnyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فيل فودن"
energyplayer = "87"
mrkzplayer = "وسط"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فيل فودن\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿  \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fdnno') then
local UserId = Text:match('(%d+)/fdnno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب داني الفيش", 'md', true)
end
end
if Text and Text:match('(%d+)/rafyes') then
local UserId = Text:match('(%d+)/rafyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رافيل فاران"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,40000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رافيل فاران\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : فرنسا 🇫🇷 \n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rafno') then
local UserId = Text:match('(%d+)/rafno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رافيل فاران", 'md', true)
end
end
if Text and Text:match('(%d+)/Kuanyes') then
local UserId = Text:match('(%d+)/Kuanyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "خوان ماتا"
energyplayer = "81"
mrkzplayer = "وسط"
cityplayer = "إسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : خوان ماتا\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : إسبانيا 🇪🇸 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kuanno') then
local UserId = Text:match('(%d+)/kuanno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب خوان ماتا", 'md', true)
end
end
if Text and Text:match('(%d+)/hariyes') then
local UserId = Text:match('(%d+)/hariyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(15000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 15000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "هاري ماجواير"
energyplayer = "80"
mrkzplayer = "مدافع"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,15000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : هاري ماجواير\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 80\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 15000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/harino') then
local UserId = Text:match('(%d+)/harino')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب هاري ماجواير", 'md', true)
end
end
if Text and Text:match('(%d+)/romoyes') then
local UserId = Text:match('(%d+)/romoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روميلو لوكاكو"
energyplayer = "91"
mrkzplayer = "مهاجم"
cityplayer = "بلجيكا 🇧🇪 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,100000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : روميلو لوكاكو\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : بلجيكا 🇧🇪 \n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/romono') then
local UserId = Text:match('(%d+)/romono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روميلو لوكاكو", 'md', true)
end
end
if Text and Text:match('(%d+)/tiagoyes') then
local UserId = Text:match('(%d+)/tiagoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "تياجو سيلفا"
energyplayer = "81"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : تياجو سيلفا\n⇜ مركزه : دفاع\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/tiagono') then
local UserId = Text:match('(%d+)/tiagono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب تياجو سيلفا", 'md', true)
end
end
if Text and Text:match('(%d+)/gerardyes') then
local UserId = Text:match('(%d+)/gerardyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(30000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 30000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جيرارد بيكيه"
energyplayer = "83"
mrkzplayer = "مدافع"
cityplayer = "إسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,30000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جيرارد بيكيه\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : إسبانيا 🇪🇸 \n⇜ السعر : 30000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/gerardno') then
local UserId = Text:match('(%d+)/gerardno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جيرارد بيكه", 'md', true)
end
end
if Text and Text:match('(%d+)/tyryes') then
local UserId = Text:match('(%d+)/tyryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(110000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 110000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "تير شتيجن"
energyplayer = "91"
mrkzplayer = "حارس"
cityplayer = "ألمانيا 🇩🇪 "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,110000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : تير شتيجن\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : ألمانيا 🇩🇪 \n⇜ السعر : 110000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/tyrno') then
local UserId = Text:match('(%d+)/tyrno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب تير شتيجن", 'md', true)
end
end
if Text and Text:match('(%d+)/osmanyes') then
local UserId = Text:match('(%d+)/osmanyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(45000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 45000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "عثمان ديمبلي"
energyplayer = "84"
mrkzplayer = "جناح"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,45000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : عثمان ديمبلي\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : فرنسا 🇫🇷 \n⇜ السعر : 45000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/osmanno') then
local UserId = Text:match('(%d+)/osmanno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب عثمان ديمبلي", 'md', true)
end
end
if Text and Text:match('(%d+)/rodrigoyes') then
local UserId = Text:match('(%d+)/rodrigoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(78000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 78000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روزريغو"
energyplayer = "87"
mrkzplayer = "جناح"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,78000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رودريغو\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ السعر : 78000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rodrigono') then
local UserId = Text:match('(%d+)/rodrigono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رودريغو", 'md', true)
end
end
if Text and Text:match('(%d+)/milyes') then
local UserId = Text:match('(%d+)/milyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(65000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 65000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ميليتاو"
energyplayer = "87"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,65000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ميليتاو\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ السعر : 65000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/milno') then
local UserId = Text:match('(%d+)/milno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ميليتاو", 'md', true)
end
end
if Text and Text:match('(%d+)/albayes') then
local UserId = Text:match('(%d+)/albayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(73000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 73000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "الابا"
energyplayer = "87"
mrkzplayer = "مدافع"
cityplayer = "النمسا 🇦🇹 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,73000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : الابا\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : النمسا 🇦🇹 \n⇜ السعر : 73000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/albano') then
local UserId = Text:match('(%d+)/albano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب الابا", 'md', true)
end
end
if Text and Text:match('(%d+)/fenesyes') then
local UserId = Text:match('(%d+)/fenesyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(180000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 180000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فينيسيوس"
energyplayer = "94"
mrkzplayer = "جناح"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,180000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فينيسيوس \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 94\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 180000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fenesno') then
local UserId = Text:match('(%d+)/fenesno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فينيسيوس ", 'md', true)
end
end
if Text and Text:match('(%d+)/demayes') then
local UserId = Text:match('(%d+)/demayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دي ماريا"
energyplayer = "85"
mrkzplayer = "جناح"
cityplayer = "الأرجنتين 🇦🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,55000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دي ماريا \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : الأرجنتين 🇦🇷 \n⇜ السعر : 55000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/demano') then
local UserId = Text:match('(%d+)/demano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دي ماريا ", 'md', true)
end
end
if Text and Text:match('(%d+)/danilyes') then
local UserId = Text:match('(%d+)/danilyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دانيلو"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دانيلو \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/danilno') then
local UserId = Text:match('(%d+)/danilno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دانيلو ", 'md', true)
end
end
if Text and Text:match('(%d+)/daneleyes') then
local UserId = Text:match('(%d+)/daneleyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(38000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 38000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دانييلي"
energyplayer = "84"
mrkzplayer = "مدافع"
cityplayer = "إيطاليا 🇮🇹 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,38000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دانييلي \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : إيطاليا 🇮🇹 \n⇜ السعر : 38000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/daneleno') then
local UserId = Text:match('(%d+)/daneleno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دانييلي ", 'md', true)
end
end
if Text and Text:match('(%d+)/ibrahyes') then
local UserId = Text:match('(%d+)/ibrahyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "إبراهيموفيتش"
energyplayer = "85"
mrkzplayer = "مهاجم"
cityplayer = "السويد 🇸🇪 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,55000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : إبراهيموفيتش \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : السويد 🇸🇪 \n⇜ السعر : 55000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/ibrahno') then
local UserId = Text:match('(%d+)/ibrahno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب إبراهيموفيتش", 'md', true)
end
end
if Text and Text:match('(%d+)/donaryes') then
local UserId = Text:match('(%d+)/donaryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(99000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 99000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دوناروما"
energyplayer = "89"
mrkzplayer = "حارس"
cityplayer = "إيطاليا 🇮🇹 "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,99000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دوناروما \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 89\n⇜ الجنسية : إيطاليا 🇮🇹 \n⇜ السعر : 99000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/donarno') then
local UserId = Text:match('(%d+)/donarno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دوناروما ", 'md', true)
end
end
if Text and Text:match('(%d+)/ashrfyes') then
local UserId = Text:match('(%d+)/ashrfyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(55000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 55000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اشرف حكيمي"
energyplayer = "85"
mrkzplayer = "مدافع"
cityplayer = "المغرب 🇲🇦 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,55000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : اشرف حكيمي \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : المغرب 🇲🇦 \n⇜ السعر : 55000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/ashrfno') then
local UserId = Text:match('(%d+)/ashrfno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب اشرف حكيمي ", 'md', true)
end
end
if Text and Text:match('(%d+)/idenyes') then
local UserId = Text:match('(%d+)/idenyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(59000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 59000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ايدن ازارد"
energyplayer = "86"
mrkzplayer = "جناح"
cityplayer = "بلجيكا 🇧🇪 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,59000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ايدن ازارد \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : بلجيكا 🇧🇪 \n⇜ السعر : 59000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/idenno') then
local UserId = Text:match('(%d+)/idenno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ايدن ازارد ", 'md', true)
end
end
if Text and Text:match('(%d+)/sergyes') then
local UserId = Text:match('(%d+)/sergyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(170000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."4"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز دفاع\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 170000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "سيرجو راموس"
energyplayer = "93"
mrkzplayer = "مدافع"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."4"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."4"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."4"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."4"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."4"..data.sender_user_id,170000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ايدن ازارد \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 93\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 170000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sergno') then
local UserId = Text:match('(%d+)/sergno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب سيرجيو راموس ", 'md', true)
end
end
if Text and Text:match('(%d+)/fermyes') then
local UserId = Text:match('(%d+)/fermyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(60000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 60000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فرمينو"
energyplayer = "86"
mrkzplayer = "مهاجم"
cityplayer = "البرازيل 🇧🇷 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,60000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فرمينو \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 60000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fermno') then
local UserId = Text:match('(%d+)/fermno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فرمينو ", 'md', true)
end
end
if Text and Text:match('(%d+)/jackyes') then
local UserId = Text:match('(%d+)/jackyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(19000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 19000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جاك كلارك"
energyplayer = "81"
mrkzplayer = "مهاجم"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,19000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جاك كلارك \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 19000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/jackno') then
local UserId = Text:match('(%d+)/jackno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جاك كلارك ", 'md', true)
end
end
if Text and Text:match('(%d+)/ansloyes') then
local UserId = Text:match('(%d+)/ansloyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(53000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 53000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "انسلو فاتي"
energyplayer = "84"
mrkzplayer = "مهاجم"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,53000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : انسلو فاتي \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 53000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/anslono') then
local UserId = Text:match('(%d+)/anslono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب انسلو فاتي ", 'md', true)
end
end
if Text and Text:match('(%d+)/toresyes') then
local UserId = Text:match('(%d+)/toresyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(41000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 41000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "توريس"
energyplayer = "84"
mrkzplayer = "مهاجم"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,41000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : توريس \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 41000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/toresno') then
local UserId = Text:match('(%d+)/toresno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب توريس ", 'md', true)
end
end
if Text and Text:match('(%d+)/muleryes') then
local UserId = Text:match('(%d+)/muleryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "توماس مولر"
energyplayer = "87"
mrkzplayer = "وسط"
cityplayer = "ألمانيا 🇩🇪"
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,41000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : توماس مولر \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : ألمانيا 🇩🇪 \n⇜ السعر : 41000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/mulerno') then
local UserId = Text:match('(%d+)/mulerno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب توماس مولر ", 'md', true)
end
end
if Text and Text:match('(%d+)/brunoyes') then
local UserId = Text:match('(%d+)/brunoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(74000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 74000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "برونو فيرنانديز"
energyplayer = "86"
mrkzplayer = "وسط"
cityplayer = "البرتغال 🇵🇹"
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,74000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : برونو فيرنانديز \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرتغال 🇵🇹 \n⇜ السعر : 74000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/brunono') then
local UserId = Text:match('(%d+)/brunono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب برونو فيرنانديز", 'md', true)
end
end
if Text and Text:match('(%d+)/paulyes') then
local UserId = Text:match('(%d+)/paulyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(78000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 78000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "بول بوجبا"
energyplayer = "88"
mrkzplayer = "وسط"
cityplayer = "فرنسا 🇫🇷 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,78000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بول بوجبا \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : فرنسا 🇫🇷 \n⇜ السعر : 78000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/paulno') then
local UserId = Text:match('(%d+)/paulno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بول بوجبا", 'md', true)
end
end
if Text and Text:match('(%d+)/modricyes') then
local UserId = Text:match('(%d+)/modricyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "لوكا مودريتش"
energyplayer = "90"
mrkzplayer = "وسط"
cityplayer = "كرواتيا 🇭🇷 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,90000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : لوكا مودريتش \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : كرواتيا 🇭🇷 \n⇜ السعر : 90000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/modricno') then
local UserId = Text:match('(%d+)/modricno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب لوكا مودريتش", 'md', true)
end
end
if Text and Text:match('(%d+)/iscoyes') then
local UserId = Text:match('(%d+)/iscoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(41000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 41000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "إيسكو"
energyplayer = "84"
mrkzplayer = "وسط"
cityplayer = "اسبانيا 🇪🇸 "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,41000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : إيسكو \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 41000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/iscono') then
local UserId = Text:match('(%d+)/iscono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب إيسكو ", 'md', true)
end
end
if Text and Text:match('(%d+)/fabinyes') then
local UserId = Text:match('(%d+)/fabinyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "فابينهو"
energyplayer = "81"
mrkzplayer = "وسط"
cityplayer = "البرازيل 🇧🇷  "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : فابينهو \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/fabinno') then
local UserId = Text:match('(%d+)/fabinno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب فابينهو ", 'md', true)
end
end
if Text and Text:match('(%d+)/hinsonyes') then
local UserId = Text:match('(%d+)/hinsonyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."3"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز وسط\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "هيندرسون"
energyplayer = "86"
mrkzplayer = "وسط"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿  "
Redis:set(Fast.."nameplayer".."3"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."3"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."3"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."3"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."3"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : هيندرسون \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/hinsonyno') then
local UserId = Text:match('(%d+)/hinsonyno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب هيندرسون", 'md', true)
end
end
if Text and Text:match('(%d+)/janyes') then
local UserId = Text:match('(%d+)/janyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جان اوبلاك"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "رومانيا 🇹🇩  "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جان اوبلاك \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : رومانيا 🇹🇩 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/janno') then
local UserId = Text:match('(%d+)/janno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جان اوبلاك ", 'md', true)
end
end
if Text and Text:match('(%d+)/kayloryes') then
local UserId = Text:match('(%d+)/kayloryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "كيلور نافاس"
energyplayer = "87"
mrkzplayer = "حارس"
cityplayer = "كوستا ريكا🇨🇷"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : كيلور نافاس \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : كوستا ريكا🇨🇷 \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kaylorno') then
local UserId = Text:match('(%d+)/kaylorno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب كيلور نافاس ", 'md', true)
end
end
if Text and Text:match('(%d+)/sommeryes') then
local UserId = Text:match('(%d+)/sommeryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "يان سومر"
energyplayer = "87"
mrkzplayer = "حارس"
cityplayer = "سويسرا 🇨🇭"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,70000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يان سومر \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : سويسرا 🇨🇭 \n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sommerno') then
local UserId = Text:match('(%d+)/sommerno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب يان سومر ", 'md', true)
end
end
if Text and Text:match('(%d+)/brendyes') then
local UserId = Text:match('(%d+)/brendyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(52000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 52000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "بيرند لينو"
energyplayer = "85"
mrkzplayer = "حارس"
cityplayer = "المانيا🇩🇪"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,52000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : بريند لينو \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : المانيا🇩🇪 \n⇜ السعر : 52000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/brendno') then
local UserId = Text:match('(%d+)/brendnp')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب بريند لينو ", 'md', true)
end
end
if Text and Text:match('(%d+)/mendyyes') then
local UserId = Text:match('(%d+)/mendyyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ميندي"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "غانا 🇬🇭"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : ميندي \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : غانا 🇬🇭 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/mendyno') then
local UserId = Text:match('(%d+)/mendyno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ميندي ", 'md', true)
end
end
if Text and Text:match('(%d+)/onanayes') then
local UserId = Text:match('(%d+)/onanayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "اندريه اونانا"
energyplayer = "83"
mrkzplayer = "حارس"
cityplayer = "غانا 🇬🇭"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : اندريه اونانا \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : غانا 🇬🇭 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/onanano') then
local UserId = Text:match('(%d+)/onanano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب اندريه اونانا ", 'md', true)
end
end
if Text and Text:match('(%d+)/royyes') then
local UserId = Text:match('(%d+)/royyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "روي باتريكو"
energyplayer = "84"
mrkzplayer = "حارس"
cityplayer = "البرتغال 🇵🇹 "
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,40000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : روي باتريكو \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : البرتغال 🇵🇹 \n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/royno') then
local UserId = Text:match('(%d+)/royno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روي باتريكو ", 'md', true)
end
end
if Text and Text:match('(%d+)/kasperyes') then
local UserId = Text:match('(%d+)/kasperyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "كاسبر"
energyplayer = "84"
mrkzplayer = "حارس"
cityplayer = "الدنمارك🇩🇰"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,40000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : كاسبر \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : الدنمارك🇩🇰 \n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/kasperno') then
local UserId = Text:match('(%d+)/kasperno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب روي كاسبر ", 'md', true)
end
end
if Text and Text:match('(%d+)/geayes') then
local UserId = Text:match('(%d+)/geayes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."5"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك حارس\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "دافيد"
energyplayer = "88"
mrkzplayer = "حارس"
cityplayer = "اسبانيا 🇪🇸"
Redis:set(Fast.."nameplayer".."5"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."5"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."5"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."5"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."5"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : دافيد \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/geano') then
local UserId = Text:match('(%d+)/geano')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب دافيد ", 'md', true)
end
end
if Text and Text:match('(%d+)/felixyes') then
local UserId = Text:match('(%d+)/felixyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."1"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز هجوم\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "جواو فليكس"
energyplayer = "82"
mrkzplayer = "مهاجم"
cityplayer = "البرتغال 🇵🇹"
Redis:set(Fast.."nameplayer".."1"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."1"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."1"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."1"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."1"..data.sender_user_id,20000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : جواو فليكس \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : البرتغال 🇵🇹 \n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/felixno') then
local UserId = Text:match('(%d+)/felixno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب جواو فليكس ", 'md', true)
end
end
if Text and Text:match('(%d+)/salahyes') then
local UserId = Text:match('(%d+)/salahyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "محمد صلاح"
energyplayer = "91"
mrkzplayer = "جناح"
cityplayer = "مصر 🇪🇬 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,100000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : محمد صلاح\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : مصر 🇪🇬 \n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/salahno') then
local UserId = Text:match('(%d+)/salahno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب محمد صلاح", 'md', true)
end
end
if Text and Text:match('(%d+)/neymaryes') then
local UserId = Text:match('(%d+)/neymaryes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "نيمار"
energyplayer = "91"
mrkzplayer = "جناح"
cityplayer = "البرازيل🇧🇷 "
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,100000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : نيمار\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : البرازيل🇧🇷 \n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/neymarno') then
local UserId = Text:match('(%d+)/neymarno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب نيمار", 'md', true)
end
end
if Text and Text:match('(%d+)/sadioyes') then
local UserId = Text:match('(%d+)/sadioyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "ساديو ماني"
energyplayer = "90"
mrkzplayer = "جناح"
cityplayer = "السنغال 🇸🇳"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,90000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : نيمار\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : السنغال 🇸🇳 \n⇜ السعر : 90000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sadiono') then
local UserId = Text:match('(%d+)/sadiono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب ساديو ماني", 'md', true)
end
end
if Text and Text:match('(%d+)/rehimyes') then
local UserId = Text:match('(%d+)/rehimyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "رحيم ستيرلينغ"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : رحيم ستيرلينغ\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/rehimno') then
local UserId = Text:match('(%d+)/rehimno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب رحيم ستيرلين", 'md', true)
end
end
if Text and Text:match('(%d+)/sanchoyes') then
local UserId = Text:match('(%d+)/sanchoyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "يادون سانشو"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يادون سانشو\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sanchono') then
local UserId = Text:match('(%d+)/sanchono')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب يادون سانشو", 'md', true)
end
end
if Text and Text:match('(%d+)/sonyes') then
local UserId = Text:match('(%d+)/sonyes')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(80000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري اللاعب فلوسك ماتكفي","md",true)
end
if Redis:get(Fast.."mrkzplayer".."2"..data.sender_user_id) then
return edit(ChatId,Msg_id, "⇜ لديك لاعب مركز جناح\n⇜ ابحث عن لاعب اخر\n𔔁","md",true)
end
cccallcc = tonumber(ballance) - 80000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
nameplayer = "سون"
energyplayer = "88"
mrkzplayer = "جناح"
cityplayer = "كوريه الجنوبيه 🇰🇷"
Redis:set(Fast.."nameplayer".."2"..data.sender_user_id,nameplayer)
Redis:set(Fast.."energyplayer".."2"..data.sender_user_id,energyplayer)
Redis:set(Fast.."mrkzplayer".."2"..data.sender_user_id,mrkzplayer)
Redis:set(Fast.."cityplayer".."2"..data.sender_user_id,cityplayer)
Redis:set(Fast.."priceplayer".."2"..data.sender_user_id,80000)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم شراء لاعب 🏃‍♂️️\n\n⇜ اسم الاعب : يادون سانشو\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿 \n⇜ السعر : 80000 جنيه 💵\n⇜ رصيدك الان : '..convert_mony..' جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/sonno') then
local UserId = Text:match('(%d+)/sonno')
if tonumber(data.sender_user_id) == tonumber(UserId) then
edit(ChatId,Msg_id,"⇜ تم الغاء شراء اللاعب سون", 'md', true)
end
end

if Text and Text:match('(%d+)/realm') then
local UserId = Text:match('(%d+)/realm')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(200000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 200000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "ريال مدريد"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,50)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : ريال مدريد\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 200000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/barca') then
local UserId = Text:match('(%d+)/barca')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(150000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 150000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "برشلونة"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,45)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : برشلونة\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 150000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/chels') then
local UserId = Text:match('(%d+)/chels')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(90000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 90000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "تشيلسي"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,40)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : تشيلسي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 90000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/manun') then
local UserId = Text:match('(%d+)/manun')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(70000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 70000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "مانشستر يونايتد"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,35)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : مانشستر يونايتد\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 70000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/livb') then
local UserId = Text:match('(%d+)/livb')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(120000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 120000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "ليفربول"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,30)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : ليفربول\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 120000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/intmi') then
local UserId = Text:match('(%d+)/intmi')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(30000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 30000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "انتر ميلان"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,25)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : انتر ميلان\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 30000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/manci') then
local UserId = Text:match('(%d+)/manci')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(100000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 100000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "مانشستر سيتي"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,20)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : مانشستر سيتي\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 100000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/juvin') then
local UserId = Text:match('(%d+)/juvin')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(40000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 40000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "يوفنتوس"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,15)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : يوفنتوس\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 40000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/arsi') then
local UserId = Text:match('(%d+)/arsi')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < tonumber(20000) then
return edit(ChatId,Msg_id, "⇜ مينفعش تشتري فلوسك ماتكفي","md",true)
end
cccallcc = tonumber(ballance) - 20000
Redis:set(Fast.."boob"..data.sender_user_id,cccallcc)
lkbnade = Redis:get(Fast.."lkbnade"..data.sender_user_id)
Redis:sadd(Fast.."lkbnadesadd", lkbnade)
namenade = "ارسنال"
Redis:set(Fast.."namenade"..data.sender_user_id,namenade)
Redis:set(Fast.."nokatnade"..data.sender_user_id,0)
Redis:sadd(Fast.."ownernade",data.sender_user_id)
Redis:set(Fast.."energynade"..data.sender_user_id,10)
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballance)
ttshakse = '⌯ تم انشاء النادي ⚽️\n\n⇜ اسم النادي : ارسنال\n⇜ لقب النادي : '..lkbnade..'\n⇜ السعر : 20000 جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n\n⇜ اكتب ( `ناديي` ) لمعلومات اكثر \n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
---------------------------------------------------------------------------------------------------------
if Text and Text:match('(%d+)/dmanrobo') then
local UserId = Text:match('(%d+)/dmanrobo')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < 1000 then
return edit(ChatId,Msg_id, "⇜ فلوسك قليلة مينفعش تضمن\n𔔁","md",true)
elseif tonumber(ballance) < 0 then
return edit(ChatId,Msg_id, "⇜ ماعندك فلوس 😑\n𔔁","md",true)
end
dmanrobo = tonumber(ballance) / 100 * 25
dmanrobosl = tonumber(ballance) - math.floor(dmanrobo)
Redis:set(Fast.."boob"..data.sender_user_id,dmanrobosl)
Redis:set(Fast.."dmanrobo"..data.sender_user_id,dmanrobo)
Redis:sadd(Fast.."iddaman",data.sender_user_id)
ballancedaman = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballancedaman)
local convert_monyy = string.format("%.0f",math.floor(dmanrobo))
ttshakse = '⌯ وصل ضمان 25%\n\n⇜ مبلغ الضمان : '..convert_monyy..' جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/damannos') then
local UserId = Text:match('(%d+)/damannos')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < 1000 then
return edit(ChatId,Msg_id, "⇜ فلوسك قليلة مينفعش تضمن\n??","md",true)
elseif tonumber(ballance) < 0 then
return edit(ChatId,Msg_id, "⇜ ماعندك فلوس 😑\n𔔁","md",true)
end
damannos = tonumber(ballance) / 100 * 50
damannossl = tonumber(ballance) - math.floor(damannos)
Redis:set(Fast.."boob"..data.sender_user_id,damannossl)
Redis:set(Fast.."dmanrobo"..data.sender_user_id,damannos)
Redis:sadd(Fast.."iddaman",data.sender_user_id)
ballancedaman = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballancedaman)
local convert_monyy = string.format("%.0f",math.floor(damannos))
ttshakse = '⌯ وصل ضمان 50%\n\n⇜ مبلغ الضمان : '..convert_monyy..' جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
if Text and Text:match('(%d+)/damankl') then
local UserId = Text:match('(%d+)/damankl')
if tonumber(data.sender_user_id) == tonumber(UserId) then
ballance = Redis:get(Fast.."boob"..data.sender_user_id) or 0
if tonumber(ballance) < 1000 then
return edit(ChatId,Msg_id, "⇜ فلوسك قليلة مينفعش تضمن\n𔔁","md",true)
elseif tonumber(ballance) < 0 then
return edit(ChatId,Msg_id, "⇜ ماعندك فلوس 😑\n𔔁","md",true)
end
damankl = tonumber(ballance)
damanklsl = tonumber(ballance) - math.floor(damankl)
Redis:set(Fast.."boob"..data.sender_user_id,damanklsl)
Redis:set(Fast.."dmanrobo"..data.sender_user_id,damankl)
Redis:sadd(Fast.."iddaman",data.sender_user_id)
ballancedaman = Redis:get(Fast.."boob"..data.sender_user_id) or 0
local convert_mony = string.format("%.0f",ballancedaman)
local convert_monyy = string.format("%.0f",math.floor(damankl))
ttshakse = '⌯ وصل ضمان 100%\n\n⇜ مبلغ الضمان : '..convert_monyy..' جنيه 💵\n⇜ رصيدك الان : `'..convert_mony..'` جنيه 💵\n𔔁'
edit(ChatId,Msg_id,ttshakse, 'md', true)
end
end
-- end bank call back
-----
calc_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},{text = 'DEL', data = IdUser..'DEL'},{text = 'AC', data = IdUser..'rest'},{text = 'OFF', data = IdUser..'OFF'},
},
{
{text = '^', data = IdUser..'calc&^'},{text = '√', data = IdUser..'calc&√'},{text = '(', data = IdUser..'calc&('},{text = ')', data = IdUser..'calc&)'},
},
{
{text = '7', data = IdUser..'calc&7'},{text = '8', data = IdUser..'calc&8'},{text = '9', data = IdUser..'calc&9'},{text = '÷', data = IdUser..'calc&/'},
},
{
{text = '4', data = IdUser..'calc&4'},{text = '5', data = IdUser..'calc&5'},{text = '6', data = IdUser..'calc&6'},{text = 'x', data = IdUser..'calc&*'},
},
{
{text = '1', data = IdUser..'calc&1'},{text = '2', data = IdUser..'calc&2'},{text = '3', data = IdUser..'calc&3'},{text = '-', data = IdUser..'calc&-'},
},
{
{text = '0', data = IdUser..'calc&0'},{text = '.', data = IdUser..'calc&.'},{text = '+', data = IdUser..'calc&+'},{text = '=', data = IdUser..'equal'},
},
{
{text = 'مطور الملف', url = 'http://t.me/FPFFG'},
},
}
}
if Text and Text:match('(%d+)calc&(.*)') then
local result = {Text:match('(%d+)calc&(.*)')}
local num = result[2]
local sendrr = result[1]
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(Fast..IdUser..ChatId.."num")
if get then
tf = get 
else
tf = "" 
end
local txx = tf..num
Redis:set(Fast..IdUser..ChatId.."num",txx)
edit(ChatId,Msg_id,"• اجراء عمليه حسابيه \n• "..txx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)equal') then
local sendrr = Text:match('(%d+)equal')
if tonumber(IdUser) == tonumber(sendrr) then
local math = Redis:get(Fast..IdUser..ChatId.."num")
if math then
xxx = io.popen("gcalccmd '"..math.."'"):read('*a')
res = "• ناتج "..math.." هو \n• "..xxx
else
res = "• لا يوجد ما يمكن حسابه"
end
edit(ChatId,Msg_id,res , 'html', false, false, calc_markup)
Redis:del(Fast..IdUser..ChatId.."num")
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)DEL') then
local sendrr = Text:match('(%d+)DEL')
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(Fast..IdUser..ChatId.."num")
if get then
gxx = ""
for a = 1, string.len(get)-1 do  
gxx = gxx..(string.sub(get, a,a)) 
end
Redis:set(Fast..IdUser..ChatId.."num",gxx)
edit(ChatId,Msg_id,"• اجراء عمليه حسابيه \n• "..gxx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• لا يوجد مايمكن حذفه", true)
end
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)ON') then
local sendrr = Text:match('(%d+)ON') 
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
edit(ChatId,Msg_id,"• تم تشغيل الحاسبه بنجاح ✅\n• restarted ✅" , 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)OFF') then
local sendrr = Text:match('(%d+)OFF')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},
},
}
}
edit(ChatId,Msg_id,"• تم تعطيل الحاسبه بنجاح \n• اضغط ON لتشغيلها " , 'html', false, false, reply_markupp)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)rest') then
local sendrr = Text:match('(%d+)rest')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
edit(ChatId,Msg_id,"• اهلا بك في بوت الحاسبه\n• welcome to calculator" , 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "• الامر لا يخصك", true)
end
end
-- DEv Source

if Text and Text:match('(.*)/DevShow@(.*)') then
local Anubis = {Text:match('(.*)/DevShow@(.*)')}
if tonumber(IdUser) == tonumber(Anubis[1]) then
local UserId_Info = bot.getUser(Anubis[2])
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local name = UserInfo.first_name.." "..UserInfo.last_name
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
local photo = bot.getUserProfilePhotos(UserId_Info.id)
local caption = "- معلومات مطور السورس : \n\n- ["..FlterBio(name).."](tg://user?id="..UserId_Info.id..")\n\n ["..(InfoUser.bio or "").."]"
if photo.total_count > 0 then
local media ={
type = "photo",
media = photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
caption = caption,
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '👑 راسل المطور 👑' , url = "tg://user?id="..UserId_Info.id }
},
{
{text = '📍 قناه السورس 📍', url='http://t.me/'..chsource }
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
else
local media ={
type = "photo",
media = 'http://t.me/'..chsource,
caption = caption,
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = '👑 راسل المطور 👑' , url = "tg://user?id="..UserId_Info.id }
},
{
{text = '📍 قناه السورس 📍', url='http://t.me/'..chsource }
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
end end end
-- Sections callback_data
if Text and Text:match('(%d+)/cancelSection') then
local UserId = Text:match('(%d+)/cancelSection')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
},
}
}
Redis:del(Fast.."Set:Sections:inline"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"تم حفظ القسم بنجاح", 'md', true, false, reply_markup)
end
end

if Text and Text:match('(.*)/Anubis/(.*)&(.*)') then
local Anubis = {Text:match('(.*)/Anubis/(.*)&(.*)')}
if tonumber(IdUser) == tonumber(Anubis[1]) then
local section_type = Redis:get(Fast.."Button:Sections:Text:Type"..Anubis[2])
local caption = Redis:get(Fast.."/Anubis/Caption"..Anubis[2]) or " "
local MSG = Redis:get(Fast.."/Anubis/"..Anubis[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data =Anubis[1].."/Home/"..Anubis[3]}, 
},
}
}
if section_type == "text" then
edit(ChatId,Msg_id,MSG, 'md', true, false, reply_markup)
else
local media ={
type = section_type,
media = MSG,
caption = caption,
parse_mode = "Markdown"
}
local keyboard = {}
keyboard.inline_keyboard = {
{
{text = 'رجوع' , callback_data= Anubis[1].."/Home/"..Anubis[3] }
},
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))
end
end
end

if Text and Text:match('(.*)/Home/(.*)') then
local Anubie = {Text:match('(.*)/Home/(.*)')} 
if tonumber(IdUser) == tonumber(Anubie[1]) then 
local button = Redis:smembers(Fast.."Sections:inline:text"..Anubie[2])    
local MSG = Redis:get(Fast.."Add:Sections:Text:inline"..Anubie[2])
local section_type = Redis:get(Fast.."Add:Sections:Text:Type"..Anubie[2])
if section_type == "text" then
local inline_anubis = {data = {}}
for k,v in pairs(button) do
inline_anubis[k] = {{text = v , data = Anubie[1]..Redis:get(Fast.."in_inline_button:"..v).."&"..Anubie[2]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = inline_anubis
}
local UserInfo = bot.getUser(Anubie[1])
local Status_Gps = Controller(ChatId,Anubie[1])
local Texingt = MSG
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',Anubie[1])
local Texingt = Texingt:gsub('#stast',Status_Gps)
edit(ChatId,Msg_id,Texingt,"md",true, false, reply_markup)
else
local keyboard = {inline_keyboard={}}
for k,v in pairs(button) do
table.insert(keyboard.inline_keyboard, {{text = URL.escape(v) , callback_data = URL.escape(Anubie[1]..Redis:get(Fast.."in_inline_button:"..v).."&"..Anubie[2]) }} )
end
local media ={
type = section_type,
media = MSG,
caption = caption,
parse_mode = "Markdown"
}
local msg_rep = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..msg_rep.."&media="..JSON.encode(media).."&reply_markup="..JSON.encode(keyboard))

end end end

-- Ahkam callback
Ahkam_list = {
  "احذف حسابك",
  "اشتم نفسك",
  "صور نفسك وانت بتلعب 20 ضغط",
  "قول انا مرا",
}
if Text and Text:match('Ahkam/(%d+)') then
local Anubis = Text:match('Ahkam/(%d+)')
local numN = Redis:smembers(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId)
print(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId)
if not Redis:sismember(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId, IdUser) then
if #numN < 10 then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
  {{text = "انضم" , data = "Ahkam/"..Anubis}}
      }
      }
Redis:sadd(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId, IdUser)
Redis:set(Fast.."in_game:"..IdUser, Anubis)
local list = "اللاعبين :\n"
for k,v in pairs(Redis:smembers(Fast.."Ahkam:"..Anubis..":chat_id:"..ChatId)) do 
list = list.."- ["..bot.getUser(v).first_name.."](tg://user?id="..v..")\n"
end
edit(ChatId,Msg_id,"اهلا بك في لعبه الاحكام\nللانضمام اضغط انضم واستحمل بقا وهيتم تشغيل اللعبه عند الوصول ل10 افراد او عند موافقه كل اعضاء اللعبه ع البدء عن طريق ( بدء )\n============\n"..list, 'md', true, false, reply_markup)
end
if #numN == 10 then
local Ahkam = {}
for k,v in pairs(Ahkam_list) do
table.insert(Ahkam, v)
end
local Redis_Ahkam = Redis:smembers(Fast.."Ahkam_list:")
for k,v in pairs(Redis_Ahkam) do
table.insert(Ahkam, v)
end
local loser_id = numN[math.random(#numN)]
local loser_tag = "["..bor.getUser(loser_id).first_name.."](tg://user?id="..loser_id..")"
return send(ChatId, 0, loser_tag.." محكوم عليك بـ\n".. Ahkam[math.random(#Ahkam)])
end
end
end

---
-- inline callback_data
if Text and Text:match('(%d+)/cancelinline') then
  local UserId = Text:match('(%d+)/cancelinline')
  if tonumber(IdUser) == tonumber(UserId) then
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
      {
      {text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/SOURCEROZA'}, 
      },
      }
      }
  Redis:del(Fast.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
  Redis:del(Fast.."Set:Manager:rd:inline:sudo"..IdUser..":"..ChatId)
  edit(ChatId,Msg_id,"تم حفظ الرد بنجاح", 'md', true, false, reply_markup)
  end
  end

if Text and Text:match('(.*)hms(.*)') then
local testhms = {Text:match('(.*)hms(.*)')}
if tonumber(IdUser) == tonumber(testhms[1]) then
local chat_id = Redis:get(Fast.."hms:"..testhms[2].."chat_id")
local to_id = Redis:get(Fast.."hms:"..testhms[2].."to")
local msg_id = Redis:get(Fast.."hms:"..testhms[2].."msg_id")
local sender_name = bot.getUser(testhms[1]).first_name
local to_name = bot.getUser(to_id).first_name
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'عرض الهمسة', data = "sender:"..testhms[1].."to:"..to_id.."hmsa:"..testhms[2]}
},
}
}
send(chat_id,msg_id,"• المستحدم » ["..to_name.."](tg://user?id="..to_id..") \n• لديك همسه من »  ["..sender_name.."](tg://user?id="..testhms[1]..") \n• اضغط لرؤيتها","md",true,false,false,false,reply_markup)
edit(ChatId,Msg_id,"تم ارسال الهمسه", 'md',false)
Redis:del(Fast.."hms:"..testhms[1])
end
end
if Text and Text:match('(.*)nn_hnss(.*)') then
local testhms = {Text:match('(.*)nn_hnss(.*)')}
Redis:del(Fast.."hms:"..testhms[2].."chat_id")
Redis:del(Fast.."hms:"..testhms[2].."to")
Redis:del(Fast.."hms:"..testhms[2].."msg_id")
Redis:del(Fast.."hms:"..testhms[1])
edit(ChatId,Msg_id,"• تم الغاء ارسال الهمسه", 'md',false)
end 
if Text and Text:match("sender:(.*)to:(.*)hmsa:(.*)") then
local testhms = {Text:match("sender:(.*)to:(.*)hmsa:(.*)")}
if tonumber(IdUser) == tonumber(testhms[1]) or tonumber(IdUser) == tonumber(testhms[2]) then
local hmsa = Redis:get(Fast.."hms:"..testhms[3].."text:")
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape(hmsa).."&show_alert=true")
else
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape("• الهمسه ليست لك").."&show_alert=true")
end
end
if tonumber(IdUser) == 1121532100 then
data.The_Controller = 1
elseif tonumber(IdUser) == 1121532100 then
data.The_Controller = 1
elseif The_ControllerAll(IdUser) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",IdUser) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",IdUser) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..ChatId,IdUser) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..ChatId,IdUser) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..ChatId,IdUser) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..ChatId,IdUser) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..ChatId,IdUser) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..ChatId,IdUser) == true then
data.The_Controller = 8
elseif tonumber(IdUser) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end

if Text and Text:match("(%d+)/idomery/(%d+)") then
local UserId = {Text:match("(%d+)/idomery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
var(UserId)
Redis:set(Fast.."zogte"..ChatId..UserId[1],UserId[2])
Redis:set(Fast.."zogte"..ChatId..UserId[2],UserId[1])
Redis:sadd(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"• لقد قبل : "..Teext.."\n• بالزواج من : "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/idonotmery/(%d+)") then
local UserId = {Text:match("(%d+)/idonotmery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."zogte"..ChatId..UserId[1])
Redis:del(Fast.."zogte"..ChatId..UserId[2])
Redis:srem(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"• لم يقبل : "..Teext.."\n• بالزواج من : "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/tlakkk/(%d+)") then
local UserId = {Text:match("(%d+)/tlakkk/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."zogte"..ChatId..UserId[1])
Redis:del(Fast.."zogte"..ChatId..UserId[2])
Redis:srem(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = "- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = "- ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"• تم طلاق : "..Teext.."\n• من الزوج : "..Teext2, "md")
end
end

if Text and Text:match('(%d+)/Nzlne') then
local UserId = Text:match('(%d+)/Nzlne')
if tonumber(IdUser) == tonumber(UserId) then
Redis:srem(Fast.."Special:Group"..ChatId,IdUser)
Redis:srem(Fast.."Admin:Group"..ChatId,IdUser)
Redis:srem(Fast.."Manger:Group"..ChatId,IdUser)
Redis:srem(Fast.."Creator:Group"..ChatId,IdUser)
Redis:srem(Fast.."SuperCreator:Group"..ChatId,IdUser)
Redis:srem(Fast.."Dev:Groups",IdUser) 
Redis:srem(Fast.."Ownerss:Group"..ChatId,IdUser)
return edit(ChatId,Msg_id,"\n• تم تنزيلك من جميع الرتب", 'md')
end
end
if Text and Text:match('(%d+)/noNzlne') then
local UserId = Text:match('(%d+)/noNzlne')
if tonumber(IdUser) == tonumber(UserId) then
return edit(ChatId,Msg_id,"\n• تم الغاء عمليه التنزيل", 'md')
end
end

if Text and Text:match('(%d+)/statusSuperCreatorz/(%d+)') and data.Ownerss then
local UserId = {Text:match('(%d+)/statusSuperCreatorz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."SuperCreator:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusCreatorz/(%d+)') and data.SuperCreator then
local UserId = {Text:match('(%d+)/statusCreatorz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then 
if Redis:sismember(Fast.."Creator:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Creator:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Creator:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusMangerz/(%d+)') and data.Creator then
local UserId = {Text:match('(%d+)/statusMangerz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Manger:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Manger:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Manger:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusAdminz/(%d+)') and data.Manger then
local UserId = {Text:match('(%d+)/statusAdminz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Admin:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Admin:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Admin:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusSpecialz/(%d+)') and data.Admin then
local UserId = {Text:match('(%d+)/statusSpecialz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Special:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Special:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Special:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end

if Text and Text:match('(%d+)/statusmem/(%d+)') and data.Ownerss then
local UserId ={ Text:match('(%d+)/statusmem/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."Special:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Admin:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Manger:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Creator:Group"..ChatId,UserId[2])
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserId[2])
Redis:srem(Fast.."SilentGroup:Group"..ChatId,UserId[2])
Redis:srem(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusban/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/statusban/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusCanOrNotCan(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id,"\n• عذرآ لا تستطيع استخدام الامر على { "..Controller(ChatId,UserId[2]).." } ", true)
end
if Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
else
Redis:sadd(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'banned',0)
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusktm/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/statusktm/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusSilent(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id, "\n• عذرآ لا تستطيع استخدام الامر على { "..Controller(ChatId,UserId[2]).." } ", true)
end
if Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."SilentGroup:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('/delAmr1') then
local UserId = Text:match('/delAmr1')
if data.Admin then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/cancelamr') and data.Admin then
local UserId = Text:match('(%d+)/cancelamr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Command:Reids:Group:Del"..ChatId..":"..IdUser)
Redis:del(Fast.."Command:Reids:Group"..ChatId..":"..IdUser)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On"..IdUser..":"..ChatId)
return edit(ChatId,Msg_id,"• تم الغاء الامر بنجاح", 'md')
end
end


if Text and Text:match('(%d+)/mute_thshesh') and data.Creator then
local UserId = Text:match('(%d+)/mute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."amrthshesh"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kicknum') and data.SuperCreator then
local UserId = Text:match('(%d+)/mute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."spammkick"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر منع التصفيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_seck') and data.Creator then
local UserId = Text:match('(%d+)/mute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."kadmeat"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_knile') and data.Manger then
local UserId = Text:match('(%d+)/mute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."knele"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_brj') and data.Manger then
local UserId = Text:match('(%d+)/mute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."brjj"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audio') and data.Manger then
local UserId = Text:match('(%d+)/mute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_geamsAudio1'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audioall') and data.Manger then
local UserId = Text:match('(%d+)/mute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_geamsAudio'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الصوتيات العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_takall') and data.Creator then
local UserId = Text:match('(%d+)/mute_takall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tagall@all'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر التاك عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_namemy') and data.Manger then
local UserId = Text:match('(%d+)/mute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_chengname'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر تنبيه الاسماء").unLock, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/unmute_thshesh') and data.Creator then
local UserId = Text:match('(%d+)/unmute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."amrthshesh"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kicknum') and data.Creator then
local UserId = Text:match('(%d+)/unmute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."spammkick"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر منع التصفيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_seck') and data.Creator then
local UserId = Text:match('(%d+)/unmute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."kadmeat"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_knile') and data.Manger then
local UserId = Text:match('(%d+)/unmute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."knele"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_brj') and data.Manger then
local UserId = Text:match('(%d+)/unmute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."brjj"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audio') and data.Manger then
local UserId = Text:match('(%d+)/unmute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_geamsAudio1'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audioall') and data.Creator then
local UserId = Text:match('(%d+)/unmute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_geamsAudio'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الصوتيات العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_takall') and data.Creator then
local UserId = Text:match('(%d+)/unmute_takall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tagall@all'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر التاك عام").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_namemy') and data.Manger then
local UserId = Text:match('(%d+)/unmute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_chengname'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر تنبيه الاسماء").unLock, 'md', true, false, reply_markup)
end
end

 
if Text == 'صحيح' then
local UserInfo = bot.getUser(IdUser)
local Teext = '- [*'..FlterBio(UserInfo.first_name)..'*](tg://user?id='..IdUser..') \n*• احسنت اجابتك صحيحه تم اضافه لك 3 نقطه*'
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'غلط' then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n• للاسف اجابتك خاطئه !!'
return edit(ChatId,Msg_id,Teext, 'md')
end
if Text == 'صحيح1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '- [*'..FlterBio(UserInfo.first_name)..'*](tg://user?id='..IdUser..') \n*• احسنت اجابتك صحيحه تم اضافه لك 3 نقطه*'
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'غلط1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n• للاسف اجابتك خاطئه !!'
return edit(ChatId,Msg_id,Teext, 'md')
end

if Text == '/startjoinerolet' then
local list = Redis:smembers(Fast..'rolet:list'..ChatId)
name = list[math.random(#list)]
local UserInfo = bot.getUser(name)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..name..')'
Redis:srem(Fast..'rolet:list'..ChatId,name)
if #list == 1 then
Redis:srem(Fast..'rolet:list'..ChatId,name)
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,10)  
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?ChatId='..ChatId..'&text='..URL.escape('• الف مبروك لقد فاز : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..name..') ب10 نقاط مكافئه')..'&reply_to_message_id='..Msg_id..'&parse_mode=markdown') 
return edit(ChatId,Msg_id,'• الف مبروك لقد فاز : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..name..') ب10 نقاط مكافئه', 'md')
end
local xxffxx = '• لقد خسر : '..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• بدء الروليت ', data = '/startjoinerolet'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end

if Text == '/joinerolet' then
if not Redis:sismember(Fast..'rolet:list'..ChatId,IdUser) then 
Redis:sadd(Fast..'rolet:list'..ChatId,IdUser)
local list = Redis:smembers(Fast..'rolet:list'..ChatId) 
if #list == 3 then
local message = '• المشتركين في اللعبه : ' 
for k,v in pairs(list) do
local UserInfo = bot.getUser(IdUser)
if k == 1 then
id = 'tg://user?id='..v
name1 = FlterBio(UserInfo.first_name)
end
if k == 2 then
id1 = 'tg://user?id='..v
name2 = FlterBio(UserInfo.first_name)
end
if k == 3 then
id2 = 'tg://user?id='..v
name3 = FlterBio(UserInfo.first_name)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = name1, url = id}, 
},
{
{text = name2, url = id1}, 
},
{
{text = name3, url = id2}, 
},
{
{text = '• اضغط لبدء اللعبه', data = '/startjoinerolet'},
},
}
}
return edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
else
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local xxffxx = 'عدد الاعبين : '..#list..' \nلقد انضم للروليت : \n'..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• اضغط للانضمام في اللعبه', data = '/joinerolet'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('لقد انضممت مسبقا')..'&show_alert=true')
end
end
if Text and Text:match('(%d+)/cancelrdd') then
local UserId = Text:match('(%d+)/cancelrdd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
Redis:del(Fast.."Set:array:Ssd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:array:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:array"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On:mz"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd:mz"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"تم الغاء الامر بنجاح", 'md', true, false, reply_markup)
end
end
if Text == 'EndAddarray'..IdUser then  
if Redis:get(Fast..'Set:array'..IdUser..':'..ChatId) == 'true1' then
Redis:del(Fast..'Set:array'..IdUser..':'..ChatId)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناه السورس',url='http://t.me/'..chsource..''}},
}
local msg_idd = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&text='..URL.escape(" *• تم حفظ الردود بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناه السورس',url='http://t.me/'..chsource..''}},
}
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..ChatId..'&text='..URL.escape(" *• تم تنفيذ الامر سابقا*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
--------
if Text and Text:match('(.*)/yes_z/(.*)') then
local anubis = {Text:match('(.*)/yes_z/(.*)')}
local zwga_id = anubis[1]
local zwg_id = anubis[2]
if tonumber(zwga_id) == tonumber(IdUser) then
local zwga_name = bot.getUser(zwga_id).first_name
local zwg_name = bot.getUser(zwg_id).first_name
Redis:set(Fast..ChatId..zwga_id.."mtzwga:", zwg_id)
Redis:set(Fast..ChatId..zwg_id.."mtzwga:", zwga_id)
return edit(ChatId, Msg_id, "باركو لاختكم ["..zwga_name.."](tg://user?id="..zwga_id..")\nوافقت تتجوز المحروص ["..zwg_name.."](tg://user?id="..zwg_id..")","md",false)
end
end
if Text and Text:match('(.*)/no_z/(.*)') then
local anubis = {Text:match('(.*)/no_z/(.*)')}
local zwga_id = anubis[1]
local zwg_id = anubis[2]
if tonumber(zwga_id) == tonumber(IdUser) then
return edit(ChatId, Msg_id, "امال هتتجوزي امتي يا موكوسه ؟؟","md",false)
end
end
if Text and Text:match('(%d+)/zeng') then
local UserId = Text:match('(%d+)/zeng')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast..ChatId..IdUser.."zkrf:", "zeng")
edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
end
end
if Text and Text:match('(.*)/zkhrfaa(.*)') then
local anubis = {Text:match('(.*)/zkhrfaa(.*)')}
local UserId = anubis[1]
local z_num = anubis[2]
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
Redis:set(Fast..ChatId..IdUser.."zkrf:num", z_num)
if tonumber(UserId) == tonumber(IdUser) then
local api = https.request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_num]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = zk , data = IdUser.."/zkhbx1"}},
{{text = "𓂄𓆩 "..zk.." 𓆪𓂁", data = IdUser.."/zkhbx2"}},
{{text = "𓆩⸤"..zk.."⸥𓆪", data = IdUser.."/zkhbx3"}},
{{text = "𓆩"..zk.."𓆪", data = IdUser.."/zkhbx4"}},
{{text = "⌁ "..zk.." ’♥ " , data = IdUser.."/zkhbx5"}},
{{text = "ꔷ"..zk.." 🧸💕 ˝♥›." , data = IdUser.."/zkhbx6"}},
{{text = "➹"..zk.." 𓂄𓆩♥𓆪‌‌𓂁", data = IdUser.."/zkhbx7"}},
{{text = "• ⃝➼"..zk.." ꗛ", data = IdUser.."/zkhbx8"}},
{{text ="⋆⃟➼"..zk.." ꕸ", data = IdUser.."/zkhbx9"}},
{{text = "⸢"..zk.."⸥", data = IdUser.."/zkhbx10"}},
{{text = "ꞏ"..zk.." ｢♥｣", data = IdUser.."/zkhbx11"}},
{{text = "⋆"..zk.." ’🧸💕›", data = IdUser.."/zkhbx12"}},
{{text = " ᯓ 𓆩 ˹ "..zk.." ˼ 𓆪 𓆃", data = IdUser.."/zkhbx13"}},
{{text = "𓆩 "..zk.."ｌ➝ ˛⁽♥₎ 𓆪", data = IdUser.."/zkhbx14"}},
{{text = "𒅒• !! "..zk.."ᵛ͢ᵎᵖ 𒅒", data = IdUser.."/zkhbx15"}},
{{text = "˚₊· ͟͟͞͞➳❥❬ "..zk.." ❭• °", data = IdUser.."/zkhbx16"}},
{{text = "زخࢪفـــھـۃ بالايمۅجي 🎀..!", data = IdUser.."/emo"}},
}
}
edit(ChatId, Msg_id, "▾\n• لقد اختࢪت \n▷ "..zk, "md",true,false,reply_markup)
end
end
if Text and Text:match('(.*)/zkhbx(.*)') then
local anubis = {Text:match('(.*)/zkhbx(.*)')}
local UserId = anubis[1]
local z_num = tonumber(anubis[2])
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
if tonumber(UserId) == tonumber(IdUser) then
local api = https.request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_save]
local zk_list = {
zk,
"𓂄𓆩"..zk.."𓆪𓂁",
"𓆩⸤"..zk.."⸥𓆪",
"𓆩"..zk.."??",
"⌁ "..zk.." ’♥ ", 
"ꔷ"..zk.." 🧸💕 ˝♥›.", 
"➹"..zk.." 𓂄𓆩♥𓆪‌‌𓂁", 
"• ⃝➼"..zk.." ꗛ", 
"⋆⃟➼"..zk.." ꕸ",
"⸢"..zk.."⸥",
"ꞏ"..zk.." ｢♥｣",
"⋆"..zk.." ’🧸💕›",
" ᯓ 𓆩 ˹ "..zk.." ˼ 𓆪 𓆃",
"𓆩 "..zk.."ｌ➝ ˛⁽♥₎ 𓆪",
"𒅒• !! "..zk.."ᵛ͢ᵎᵖ 𒅒",
"˚₊· ͟͟͞͞➳❥❬ "..zk.." ❭• °",
}
edit(ChatId, Msg_id, "▾\n• لقد اختࢪت \n▷ `"..zk_list[z_num].."`", "md",false)
Redis:del(Fast..ChatId..IdUser.."zkrf:text")
Redis:del(Fast..ChatId..IdUser.."zkrf:num")
end
end
-- Anubis zk
if Text and Text:match('(%d+)/anubis_zk') then
local UserId = Text:match('(%d+)/anubis_zk')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast..ChatId..IdUser.."zkrf:", "zAnubis")
edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
end
end
if Text and Text:match('(%d+)/AnubisZnext') then
local UserId = Text:match('(%d+)/AnubisZnext')
if tonumber(UserId) == tonumber(IdUser) then
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa-pro.php?text='..URL.escape(z_text)..'"'):read('*a')
local zkrf = JSON.decode(api)
local anubis = ""
for k,v in pairs(zkrf.Anubis) do
if tonumber(k) > 25 then
anubis = anubis.."📍: `"..v.."`\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = "السابق" , data = UserId.."/AnubisZback"}}}
}
return edit(ChatId, Msg_id, "※ اختࢪ الزخࢪفھـۃ التي تࢪيدها:\n\n"..anubis,"md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/AnubisZback') then
local UserId = Text:match('(%d+)/AnubisZback')
if tonumber(UserId) == tonumber(IdUser) then
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local api = io.popen('curl -s "https://anubis.fun/api/zkhrfa-pro.php?text='..URL.escape(z_text)..'"'):read('*a')
local zkrf = JSON.decode(api)
local anubis = ""
for k,v in pairs(zkrf.Anubis) do
if tonumber(k) < 25 then
anubis = anubis.."📍: `"..v.."`\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = "التالي" , data = UserId.."/AnubisZnext"}}}
}
return edit(ChatId, Msg_id, "※ اختࢪ الزخࢪفھـۃ التي تࢪيدها:\n\n"..anubis,"md",true,false,reply_markup)
end
end
-- zemo
if Text and Text:match('(%d+)/emo') then
local UserId = Text:match('(%d+)/emo')
local z_text = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
local z_save = Redis:get(Fast..ChatId..IdUser.."zkrf:num")
if tonumber(UserId) == tonumber(IdUser) then
local api = https.request("https://anubis.fun/api/zkhrfa.php?text="..URL.escape(z_text))
local zkrf = JSON.decode(api)
local zk = zkrf['anubis'][z_save]
edit(ChatId, Msg_id, "• تمت الزخࢪفھـۃ بنجاح\n\n▷ `"..zk.." ¦✨❤️` \n\n▷ `"..zk.." “̯ 🐼💗`\n\n▷ `"..zk.." 🦋“`\n\n▷ `"..zk.."ّ ❥̚͢₎ 🐣`\n\n▷ `"..zk.." ℡ ̇ ✨🐯⇣✦`\n\n▷ `"..zk.." 😴🌸✿⇣`\n\n▷ `"..zk.." •🙊💙`\n\n▷ `"..zk.." ❥┊⁽ ℡🦁🌸`\n\n▷ `"..zk.." •💚“`\n\n▷ `"..zk.." ⚡️♛ֆ₎`\n\n▷ `"..zk.." ⁞♩⁽💎🌩₎⇣✿`\n\n▷ `"..zk.." 〄💖‘`\n\nاضغط علي الزخࢪفھـۃ للنسخ 🎀..!", "md",false)
Redis:del(Fast..ChatId..IdUser.."zkrf:text")
Redis:del(Fast..ChatId..IdUser.."zkrf:num")
end
end
-- zar call back
if Text and Text:match('(%d+)/zar') then
local UserId = Text:match('(%d+)/zar')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast..ChatId..IdUser.."zkrf:", "zar")
edit(ChatId, Msg_id, "▾ 𝙎𝙀𝙉𝘿 𝙐𝙍 𝙉𝘼𝙈𝙀 🎀..! \n \n✴ اࢪسل الاسم لتتم زخࢪفتھـۃ الان 🎀..!", "md",false)
end
end
if Text and Text:match('(.*)/yes_zw/(.*)') then
local anubis = {Text:match('(.*)/yes_zw/(.*)')}
local zwga_id = anubis[1]
local zwg_id = anubis[2]
if tonumber(zwga_id) == tonumber(IdUser) then
local zwga_name = bot.getUser(zwga_id).first_name
local zwg_name = bot.getUser(zwg_id).first_name
Redis:set(Fast..ChatId..zwga_id.."mtzwga:", zwg_id)
Redis:set(Fast..ChatId..zwg_id.."mtzwga:", zwga_id)
return edit(ChatId, Msg_id, "باركو ل ["..zwga_name.."](tg://user?id="..zwga_id..")\nوافق يتجوز ["..zwg_name.."](tg://user?id="..zwg_id..")","md",false)
end
end
if Text and Text:match('(.*)/no_zw/(.*)') then
local anubis = {Text:match('(.*)/no_zw/(.*)')}
local zwga_id = anubis[1]
local zwg_id = anubis[2]
if tonumber(zwga_id) == tonumber(IdUser) then
return edit(ChatId, Msg_id, "امال عاوزني اجبلك مين تتجوزو ؟؟","md",false)
end
end
------
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = Teext..'\n*• الف مبروك حظك حلو اليوم\n• فزت ويانه وطلعت المحيبس  باليد رقم {'..NumMahibes..'}*'
else
MahibesText = Teext..'\n*• للاسف لقد خسرت المحيبس باليد رقم {'..NumMahibes..'}\n• جرب حضك ويانه مره اخره*'
end
return edit(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/marim1') then
local UserId = Text:match('(%d+)/marim1')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "يلا بنا نبحث عن منزل",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'هيا بنا', callback_data=IdUser..'/marim2'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/zxhaut') then
local UserId = Text:match('(%d+)/zxhaut')
local photo = bot.getUserProfilePhotos(Fast)
local ph = photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id
if tonumber(IdUser) == tonumber(UserId) then
pph ={
type = "photo",
media = ph,
caption = '*  *[آهــلٓآ بَٰــڪ فٍُــيَ س๋͜‏ــۄرس๋͜‏ ࢪوزا 🕷️🔥](t.me/SOURCEROZA)*\n\n*[ آقٍُـۄيَ مــصَٰـآنــعَِٰ س๋͜‏ــۄࢪس๋͜‏ــآټِٖ عَِٰــلٓيَ آلٓټِٖـلٓيَـج ـࢪآم](t.me/SOURCEROZA) *\n\n*[ س๋͜‏ؤࢪس๋͜‏ روزا عَِٰلٓيَ منعَِٰ ټِٖصَٰفٍُيَه آلٓمج ـمۄعَِٰآټِٖ ۄح ـمآيَټِٖهآ](t.me/SOURCEROZA)*\n\n*[ لٓــديَــنــآ ټِٖـنصَٰيَــبَٰ بَٰـۄټِٖــآټِٖ مــيَـۄزڪ آيَــضَِٖـآ](t.me/SOURCEROZA)*\n\n*[لٓديَــنآ ټِٖنـصَٰيَــبَٰ ح ـس๋͜‏ــآبَٰــآټِٖ ټِٖــلٓيَــثُِٖــۄن](t.me/SOURCEROZA) *\n\n*[آلٓس๋͜‏ۄࢪس๋͜‏ مزۄد بَٰج ـميَعَِٰ آلآلٓعَِٰآبَٰ ۄآلٓمميَزآټِٖ آلٓمټِٖطِٖۄࢪه](t.me/SOURCEROZA) *\n\n*[ټِٖآبَٰعَِٰ قٍُنآه آلٓټِٖح ـديثُِٖآټِٖ ۄآلٓټِٖطِٖۄيَࢪآټِٖ لٓيَصَٰلٓڪ ڪلٓ ج ـديَد لٓديَنآ](t.me/MohamedHelal_l) *\n\n*',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '‹ ٰ☬ ⇣ اصنع بوتك الان ⇣ ☬ › .', url = "https://t.me/@M_HeMaYa_RoZa_bot"}
},
{
{text = '⸢ 𝒃𝒂𝒄𝒌 ⸥', callback_data=IdUser..'/halo'},
},
{
{text = '✅ - اضف البوت إلي مجموعتك - ✅', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(pph).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/lhaui') then
local UserId = Text:match('(%d+)/lhaui')
local photo = bot.getUserProfilePhotos(Fast)
local ph = photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id
if tonumber(IdUser) == tonumber(UserId) then
pph ={
type = "photo",
media = ph,
caption = '[ 𖥔━═━═━═━ٰٰ𓆩⸤𝙍𝙕⸥𓆪═━═━═━𖥔 ](t.me/SOURCEROZA) \n [ 🤖┇⌯ ⋆⃟➼𝙍𝙕 𝙎𝙊𝙐𝙍𝘾𝙀 ꕸ ˹🕷️🔥˼⁩](t.me/SOURCEROZA) \n [ ⚙️┇⌯ sᴜᴘᴘᴏʀᴛ ɢʀᴏᴜᴘ ](t.me/G_H_U_SDU) \n [ 🏑┇⌯ [˚₊· ͟͟͞͞➳❥❬ ғɪʟᴇs 𝚁𝚉 𝚂𝙾𝚄𝚁𝙲𝙴 ❭• °](t.me/SOURCEROZA) \n [ 🏅┇⌯ • !! 𝙳𝙴𝚅 𝚂𝙾𝚄𝚁𝙲𝙴ᵛ͢ᵎᵖ ](t.me/MohamedHelal_l) \n [𖥔━═━═━═━ٰٰ𓆩⸤𝙍𝙕⸥𓆪═━═━═━𖥔](t.me/SOURCEROZA) \n [𖥔 𝑻𝑯𝑬 𝑩𝑬𝑺𝑻  𝑺𝑶𝑼𝑹𝑪𝑬 ⏎](t.me/SOURCEROZA) \n\n',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '‹ ٰ☬ ⇣ اصنع بوتك الان ⇣ ☬ › .', url = "https://t.me/@M_HeMaYa_RoZa_bot"}
},
{
{text = '⸢ 𝒃??𝒄𝒌 ⸥', callback_data=IdUser..'/halo'},
},
{
{text = '✅ - اضف البوت إلي مجموعتك - ✅', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(pph).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/halo') then
local UserId = Text:match('(%d+)/halo')
local photo = bot.getUserProfilePhotos(Fast)
local UserInfo = bot.getUser(Fast)
local Name_User = UserInfo.first_name
local Name_dev = bot.getUser(Sudo_Id).first_name
local UName_dev = bot.getUser(Sudo_Id).username
local ph = photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id
if tonumber(IdUser) == tonumber(UserId) then
pph ={
type = "photo",
media = ph,
caption = '*  *[ 🎧╢• لأستخدام البوت اغاني وفيديو كول](t.me/SOURCEROZA)*\n*[ 🎥╢• اكتب » /music ثم أضغط الأوامر](t.me/SOURCEROZA) *\n*[ 🕹╢اكتب /key لاظهار كيبورد الاعضاء](t.me/SOURCEROZA)*\n*[ 🌐╢• وظيفتي حماية المجموعات](t.me/SOURCEROZA)*\n*[ ✅╢• لتفعيل البوت عليك اتباع مايلي](t.me/SOURCEROZA) *\n*[ 🔘╢• أضِف البوت إلى مجموعتك](t.me/SOURCEROZA) *\n*[ ⚡️╢• ارفعهُ » مشرف + اكتب تفعيل](t.me/MohamedHelal_l) *\n*[ ⬆️╢• سيتم ترقيتك مالك في البوت](t.me/MohamedHelal_l) *\n*[ 🚨╢• لكي أعمل معك بشكل صحيح](t.me/MohamedHelal_l) *\n*[ 📣╢• تأكد » من اعطائي حذف الرسائل](t.me/MohamedHelal_l) *\n*[ 📣╢• تأكد » من تفعيل الألعاب](t.me/MohamedHelal_l) *\n*[ 📣╢• تأكد » من تفعيل الرفع](t.me/MohamedHelal_l) *\n*[ 📣╢• تأكد » من تفعيل ردود السورس](t.me/MohamedHelal_l) *\n\n*',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '📚 معلومات ', callback_data=IdUser..'/zxhaut'},{text = '🎀 حول ',  callback_data=IdUser..'/lhaui'},
},
{
{text = Name_dev, url = "t.me/"..UName_dev},
},
{
{text = Name_User, url = "t.me/"..UserInfo.username},
},
{
{text = '✅ - اضف البوت إلي مجموعتك - ✅', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(pph).."&reply_markup="..JSON.encode(keyboard))
end
end

if Text and Text:match('(%d+)/marim2') then
local UserId = Text:match('(%d+)/marim2')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• في صوت هل صدر من الامام ام الخلف🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'من الخلف', callback_data=IdUser..'/marim3'}
},
{
{text = 'من الامام', callback_data=IdUser..'/marim4'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/marim4') then
local UserId = Text:match('(%d+)/marim4')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• هيا بنا نذهب الي الامام لنرا المنزل🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'هيا', callback_data=IdUser..'/marim5'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim3') then
local UserId = Text:match('(%d+)/marim3')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "هيا بنا نذهب الي الخلف لنري المنزل",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'هيا', callback_data=IdUser..'/marim5'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim5') then
local UserId = Text:match('(%d+)/marim5')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• لقد وصلنا الى المنزل شكراَ جزيلَ انتطرني ثواني وسوف اعود🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'منتظر', callback_data=IdUser..'/marim6'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim6') then
local UserId = Text:match('(%d+)/marim6')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• لقد عودت إليك ظهر شيئ🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'احد ما خرج من المنزل', callback_data=IdUser..'/marim7'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim7') then
local UserId = Text:match('(%d+)/marim7')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• • هيا نذهب داخل المنزل🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'هيا', callback_data=IdUser..'/marim8'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim8') then
local UserId = Text:match('(%d+)/marim8')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• نحن سنتوه في هذا المكان",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'تعالي نذهب الي الضوء', callback_data=IdUser..'/marim9'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim9') then
local UserId = Text:match('(%d+)/marim9')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "لا يوجد ضواء في هذا المكان🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'ياالهي كان هناك', callback_data=IdUser..'/marim10'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim10') then
local UserId = Text:match('(%d+)/marim10')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "تعالى نذهب الي الباب الرئيسي🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'انه مغلق', callback_data=IdUser..'/marim11'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim11') then
local UserId = Text:match('(%d+)/marim11')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "انها النهاية هتكمل ولا لا🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'هكمل', callback_data=IdUser..'/marim12'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim12') then
local UserId = Text:match('(%d+)/marim12')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "انها النهاية هتكمل ولا لا🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'هكمل', callback_data=IdUser..'/marim13'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end


if Text and Text:match('(%d+)/marim13') then
local UserId = Text:match('(%d+)/marim13')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "*\n*[• سارسل اليك  سوال مع اختيارت لو حليت صح ستنجو من العقاب لو خطأ سيقوم عليك العقاب🧟‍♀️](t.me/GB_THOR) *\n*[السوال هوا - شيء لا يتأثر بالماء حتى عندما يمر من خلالها فمن يكون؟](t.me/GB_THOR) *\n*",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'السمك', callback_data=IdUser..'/marim14'},{text = 'المركب', callback_data=IdUser..'/marim15'},
},
{
{text = 'الضوء', callback_data=IdUser..'/marim16'},{text = 'الحوت', callback_data=IdUser..'/marim17'},
},
{
{text = 'الخضار', callback_data=IdUser..'/marim18'},{text = 'الموت', callback_data=IdUser..'/marim19'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim14') then
local UserId = Text:match('(%d+)/marim14')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• غلط القاب هوا-    تتصل على الوالده  و تقول لها تزوجت با سر•",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '❌❌❌❌❌', callback_data=IdUser..'/marim100'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim15') then
local UserId = Text:match('(%d+)/marim15')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• غلط القاب هوا-    روح المطبخ و اكسر صحن او كوب•",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '❌❌❌❌❌', callback_data=IdUser..'/marim100'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim16') then
local UserId = Text:match('(%d+)/marim16')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "•مبروك لقد فوزت ونجيت من العقاب•",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '✅✅✅✅✅', callback_data=IdUser..'/marim100'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim17') then
local UserId = Text:match('(%d+)/marim17')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• غلط القاب هوا-    اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '❌❌❌❌❌', callback_data=IdUser..'/marim100'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim18') then
local UserId = Text:match('(%d+)/marim18')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• غلط القاب هوا-   خلاص سامحتك🧟‍♀️",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '❌❌❌❌❌', callback_data=IdUser..'/marim100'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/marim19') then
local UserId = Text:match('(%d+)/marim19')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/15", caption = "• غلط القاب هوا-    سكر خشمك و قول كلمة من اختيار الاعبين الي معك•",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '❌❌❌❌❌', callback_data=IdUser..'/marim100'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/guitar') then
local UserId = Text:match('(%d+)/guitar')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "شيء لا يمشي إلا بالضرب فمن يكون؟",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'الحمار', callback_data=IdUser..'/WTT'},{text = 'الكلب', callback_data=IdUser..'/WTT'},
},
{
{text = 'المسمار', callback_data=IdUser..'/Karen'},{text = 'انت', callback_data=IdUser..'/WTT'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/WTT') then
local UserId = Text:match('(%d+)/WTT')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "اوه لقد خسرت يمكنك العب مجدادآ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'العب مجددآ', callback_data=IdUser..'/ahakaka'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/ahakaka') then
local UserId = Text:match('(%d+)/ahakaka')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "هل انت جاهز للعب مره اخري ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'نعم ', callback_data=IdUser..'/guitar'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/Karen') then
local UserId = Text:match('(%d+)/Karen')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "لقد كسبت مبروك √🎊 ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'سؤال اخر ', callback_data=IdUser..'/whoa'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Karen') then
local UserId = Text:match('(%d+)/Karen')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "شخص توجد قدماه في الأرض ورأسه عند النجوم فمن يكون؟ ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'الكوكب', callback_data=IdUser..'/WTT'},{text = 'برج خليفه', callback_data=IdUser..'/WTT'},
},
{
{text = 'القمر', callback_data=IdUser..'/WTT'},{text = 'الظابط', callback_data=IdUser..'/fighting'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/fighting') then
local UserId = Text:match('(%d+)/fighting')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "لقد كسبت مبروك √🎊 ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'سؤال اخر ', callback_data=IdUser..'/aliquots'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/aliquots') then
local UserId = Text:match('(%d+)/aliquots')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "شيء كلما ذبحته بكيت عليه فمن هو؟ ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'الخروف', callback_data=IdUser..'/WTT'},{text = 'البصل', callback_data=IdUser..'/trait'},
},
{
{text = 'ابي', callback_data=IdUser..'/WTT'},{text = 'الثوم', callback_data=IdUser..'/fighting'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/trait') then
local UserId = Text:match('(%d+)/trait')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "لقد كسبت مبروك √🎊 ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'سؤال اخر ', callback_data=IdUser..'/qqpi'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/aliquots') then
local UserId = Text:match('(%d+)/aliquots')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "شيء يتحرك أمامك ولكن لم تشاهده فمن هو؟ ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'الجن', callback_data=IdUser..'/WTT'},{text = 'الفهد', callback_data=IdUser..'/WTT'},
},
{
{text = 'النمله', callback_data=IdUser..'/WTT'},{text = 'الهواء', callback_data=IdUser..'/duio'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/duio') then
local UserId = Text:match('(%d+)/duio')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "لقد كسبت مبروك √🎊 ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'سؤال اخر ', callback_data=IdUser..'/yyuu'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/yyuu') then
local UserId = Text:match('(%d+)/yyuu')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "شيء يوجد في الليل ثلاث مرات وفي النهار مرة واحدة فمن هو؟ ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'النجوم', callback_data=IdUser..'/WTT'},{text = 'القمر', callback_data=IdUser..'/WTT'},
},
{
{text = 'حرف الام', callback_data=IdUser..'/WTT'},{text = 'حرف الالف', callback_data=IdUser..'/your'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/your') then
local UserId = Text:match('(%d+)/your')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "لقد كسبت مبروك √🎊 ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'سؤال اخر ', callback_data=IdUser..'/oppp'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/oppp') then
local UserId = Text:match('(%d+)/oppp')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "يتحرك بلا أقدام ولا يدخل إلى بالأذنين فما هو؟ ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'منظف الاذنين', callback_data=IdUser..'/WTT'},{text = 'الهواء', callback_data=IdUser..'/WTT'},
},
{
{text = 'التراب', callback_data=IdUser..'/WTT'},{text = 'الصوت', callback_data=IdUser..'/plma'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/plma') then
local UserId = Text:match('(%d+)/plma')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "لقد كسبت مبروك √🎊 ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'سؤال اخر ', callback_data=IdUser..'/fusion'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/fusion') then
local UserId = Text:match('(%d+)/fusion')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = "نشأ القانون الدولي....؟ ",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'في الحرب العالميه', callback_data=IdUser..'/WTT'},{text = 'قبل الحرب العالميه', callback_data=IdUser..'/WTT'},
},
{
{text = 'بعد الحرب العالميه', callback_data=IdUser..'/akkakak'},{text = 'في حرب فيتنام', callback_data=IdUser..'/WTT'},
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/akkakak') then
local UserId = Text:match('(%d+)/akkakak')
if tonumber(IdUser) == tonumber(UserId) then
bann = {type = "photo", media = "https://t.me/c_r_o_z_a/16", caption = " لقد كسبت مبروك √🎊  نسبه الذكاء 100%",parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = 'العب مره اخري ', callback_data=IdUser..'/guitar'}
},
}
local ban = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..ban.."&media="..JSON.encode(bann).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/songg') then
local UserId = Text:match('(%d+)/songg')
if tonumber(IdUser) == tonumber(UserId) then
Num = math.random(8,83)
Mhm = math.random(108,143)
Mhhm = math.random(166,179)
Mmhm = math.random(198,216)
Mhmm = math.random(257,626)
local Texting = {Num,Mhm,Mhhm,Mmhm,Mhmm}
local Rrr = Texting[math.random(#Texting)]
au ={
type = "audio",
media = "https://t.me/mmsst13/"..Rrr.."",
caption = '٭ اليك اغنيه عشوائيه من البوت\n',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اغنيه اخري', callback_data=IdUser.."/songg"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Haiw5') then
local UserId = Text:match('(%d+)/Haiw5')
if tonumber(IdUser) == tonumber(UserId) then
local texting = {"اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞", 
"االلَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ , وَشُكْرِكَ , وَحُسْنِ عِبَادَتِكَ🎈💞 ",
"اا6-قول : سبحان الله وبحمده سبحان العظيم مئة مرة في اليوم قارئها غفرت له ذنوبه وأن كانت مثل زبد البحر .",
"من الأدعية النبوية المأثورة:اللهمَّ زَيِّنا بزينة الإيمان",
"اااللهم يا من رويت الأرض مطرا أمطر قلوبنا فرحا.🍂",
"اا‏اللَّهُـمَّ لَڪَ الحَمْـدُ مِنْ قَـا؏ِ الفُـؤَادِ إلىٰ ؏َـرشِڪَ المُقـدَّس حَمْـدَاً يُوَافِي نِـ؏ـمَڪ 💙🌸",
"﴿وَاذْكُرِ اسْمَ رَبِّكَ وَتَبَتَّلْ إِلَيْهِ تَبْتِيلًا﴾🌿✨",
"﴿وَمَن يَتَّقِ اللهَ يُكَفِّرْ عَنْهُ سَيِّئَاتِهِ وَيُعْظِمْ لَهُ أَجْرًا﴾«",
"«سُبْحَانَ اللهِ ، وَالحَمْدُ للهِ ، وَلَا إلَهَ إلَّا اللهُ ، وَاللهُ أكْبَرُ ، وَلَا حَوْلَ وَلَا قُوَّةَ إلَّا بِاللهِ»🍃",
"وذُنُوبًا شوَّهتْ طُهْرَ قُلوبِنا؛ اغفِرها يا ربّ واعفُ عنَّا ❤️",
"«اللَّهُمَّ اتِ نُفُوسَنَا تَقْوَاهَا ، وَزَكِّهَا أنْتَ خَيْرُ مَنْ زَكَّاهَا ، أنْتَ وَلِيُّهَا وَمَوْلَاهَا»🌹",
"۝‏﷽إن اللَّه وملائكته يُصلُّون على النبي ياأيُّها الذين امنوا صلُّوا عليه وسلِّموا تسليما۝",
"فُسِبًحً بًحًمًدٍ ربًکْ وٌکْنِ مًنِ الَسِاجّدٍيَنِ 🌿✨",
"اأقُمً الَصّلَاةّ لَدٍلَوٌکْ الَشُمًسِ إلَيَ غُسِقُ الَلَيَلَ🥀🌺",
"نِسِتٌغُفُرکْ ربًيَ حًيَتٌ تٌلَهّيَنِا الَدٍنِيَا عٌنِ ذِکْرکْ🥺😢",
"وٌمًنِ أعٌرض عٌنِ ذِکْريَ فُإنِ لَهّ مًعٌيَشُةّ ضنِکْا 😢",
"وٌقُرأنِ الَفُجّر إنِ قُرانِ الَفُجّر کْانِ مًشُهّوٌدٍا🎀🌲",
"اأّذّأّ أّلَدِنِيِّأّ نَِّستّګوِ أّصٌلَګوِ زِّوِروِ أّلَمَقِأّبِر💔",
"حًتٌيَ لَوٌ لَمًتٌتٌقُنِ الَخِفُظُ فُمًصّاحًبًتٌ لَلَقُرانِ تٌجّعٌلَکْ مًنِ اهّلَ الَلَهّ وٌخِاصّتٌهّ❤🌱",
"وٌإذِا رضيَتٌ وٌصّبًرتٌ فُهّوٌ إرتٌقُاء وٌنِعٌمًةّ✨🌺",
"«ربً اجّعٌلَنِيَ مًقُيَمً الَصّلَاةّ وٌمًنِ ذِريَتٌيَ ربًنِا وٌتٌقُبًلَ دٍعٌاء 🤲",
"ااعٌلَمً انِ رحًلَةّ صّبًرکْ لَهّا نِهّايَهّ عٌظُيَمًهّ مًحًمًلَهّ بًجّوٌائزٍ ربًانِيَهّ مًدٍهّشُهّ🌚☺️",
"اإيَاکْ وٌدٍعٌوٌةّ الَمًظُلَوٌمً فُ إنِهّا تٌصّعٌدٍ الَيَ الَلَهّ کْأنِهّا شُرارهّ مًنِ نِار 🔥🥺",
"االَلَهّمً انِقُذِ صّدٍوٌرنِا مًنِ هّيَمًنِهّ الَقُلَقُ وٌصّبً عٌلَيَهّا فُيَضا مًنِ الَطِمًأنِيَنِهّ✨🌺",
"يَابًنِيَ إنِ صّلَاح الَحًيَاةّ فُ أتٌجّاهّ الَقُبًلَهّ 🥀🌿",
"«الَلَهّمً ردٍنِا إلَيَکْ ردٍا جّمًيَلَا💔🥺",
}
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '🔻• أذكار أخري •🔺️', data = IdUser..'/Haiw5'}, },}}
bot.editMessageText(ChatId,Msg_id,texting[math.random(#texting)], 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Haiw7') then
local UserId = Text:match('(%d+)/Haiw7')
if tonumber(IdUser) == tonumber(UserId) then
local texting = {"اخر افلام شاهدتها", 
"مرتبط؟ ", 
" هل بتكراش ع حد في حياتك؟", 
" ينفع نرتبط؟", 
" ممكن توريني صوره بتحبها؟", 
" ممكن نبقي صحااب ع الفيس؟", 
" هل لسه بتحب الاكس؟", 
"عندك كام اكس في حياتك؟ ", 
"ينفع تبعتلي رقمك؟ ", 
" ما تيجي اعزمني ع حاجه بحبها؟", 
"ينفع احضنك؟ ", 
"قولي ع اكبر غلطه ندمان عليهاا؟ ", 
"عندك كام سنه؟ ", 
" عامل بلوك لكام واحد عندك؟", 
" قولي سر محدش يعرفه؟", 
" عندك كام اكس في حياتك؟", 
"بتعرف تقلش وتهزر؟ ", 
" لونك المفضل هو؟", 
" مين أقرب حد ليك الفتره دي ؟", 
" قولي ع اكبر غلطه ندمان عليهاا؟", 
" مين مغنيك المفضل؟", 
" حابب تبقي اي في المستقبل؟", 
"راضي عن حياتك بنسبه كام؟ ", 
"اكتر حاجه بتلفت انتباهك في البنت او الولد؟ ", 
"اي رأيك في صوره البروفايل بتاعتي؟ ", 
" هل باين عليا اني شخص لطيف؟", 
" توافق ترجع للاكس؟", 
"ممكن تضحي بحياتك لمين؟ ", 
"سافرت بلاد برا مصر واي هي؟ ", 
" اي رأيك في صوره البروفايل بتاعتي؟", 
" هل بتعتبر نفسك حلو وبتحب شكلك؟", 
" نفسك تزور انهي بلد في العالم؟", 
" شخصيه ع السوشيال شايف انها مميزه؟", 
"عندك فوبيا من اي؟ ", 
" ممكن تورينا لينك الصراحه؟", 
"عمرك عيطت ع حاجه؟ ", 
" شايف اي أسوأ صفه فيك؟", 
"هل شلت مواد قبل كد وعدت السنه؟ ", 
"بتغير ع الل بتحبهم وبيبان عليك لو غيرت؟ ", 
"معاك كام فلوس دلوقتي؟ ", 
" بتفضل صحابك البنات ولا الولاد؟", 
" مسامح الل ظلمك؟", 
" ممثلك الافضل؟", 
" ممكن تقول رساله لحد مش هيشوفها؟", 
"انت اهلاوي ولا زملكاوي؟ ", 
" اي حيوانك المفضل؟", 
"اخر افلام شاهدتها", 
"بتعرف تكلم لغه تانيه واي هي؟ ", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"ما هيا عيوب سورس هلال ؟ ", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليه هلال جدع؟ ", 
 "ليه هلال جدع؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" هل يعجبك سورس هلال ؟؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"اي رايك في سورس هلال ؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
  "تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت هلال؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب هلال؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل هلال لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '🔻• أضغط لسؤال أخر •🔺️', IdUser..'/Haiw7'}, },}}
bot.editMessageText(ChatId,Msg_id,texting[math.random(#texting)], 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mp3(.*)') then
local UserId = {Text:match('(%d+)/mp3(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• ارسل ما تريد تحميله
*]]
Redis:set(Fast.."youtube"..IdUser..ChatId,'mp3')
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mp4(.*)') then
local UserId = {Text:match('(%d+)/mp4(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• ارسل ما تريد تحميله
*]]
Redis:set(Fast.."youtube"..IdUser..ChatId,'mp4')
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/sorty(%d+)') then
local UserId = {Text:match('(%d+)/sorty(%d+)')}
local current = math.floor(tonumber(UserId[2]))
local next = math.floor(tonumber(UserId[2]) + 1)
local prev = math.floor(tonumber(UserId[2]) - 1)

if tonumber(IdUser) == tonumber(UserId[1]) then
local photo = bot.getUserProfilePhotos(IdUser)
local ph = photo.photos[tonumber(current)]
if ph then
local pho = ph.sizes[#photo.photos[1].sizes].photo.remote.id
pph ={
type = "photo",
media = pho,
caption = '٭ عدد صورك هو '..photo.total_count..'\n٭ وهذه صورتك رقم '..current..'\n',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=IdUser.."/sorty"..next..""},{text = 'صورتك السابقه', callback_data=IdUser.."/sorty"..prev..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(pph).."&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "• لم يتم العثور علي رقم الصوره المطلوبه ", true)
end
end 
end
if Text and Text:match('(%d+)dl/(.*)') then
local xd = {Text:match('(%d+)dl/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local json = json:decode(https.request("https://anubis.fun/api/video_info.php?id="..id))
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تحميل صوت', data = IdUser..'sound/'..id}, {text = 'تحميل فيديو', data = IdUser..'video/'..id}, 
},
}
}
local txx = "["..json.title.."](http://youtu.be/"..id..""
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
else
bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)sound/(.*)') then
local xd = {Text:match('(%d+)sound/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local u = bot.getUser(IdUser)
bot.answerCallbackQuery(data.id, "• انتظر يتم التحميل ", true)
local json = json:decode(https.request("https://anubis.fun/api/video_info.php?id="..id))
local link = id
local title = json.title
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
local time = json.t
local p = json.a
local p = p:gsub("/","-") 
local p = p:gsub("\n","-") 
local p = p:gsub("|","-") 
local p = p:gsub("'","-") 
local p = p:gsub('"',"-") 
bot.deleteMessages(ChatId,{[1]= Msg_id})
os.execute("yt-dlp "..link.." -f 251 -o '"..title..".mp3'")
bot.sendAudio(ChatId,0,'./'..title..'.mp3',"• ["..title.."]("..link..")\n• حسب طلب ["..u.first_name.."](tg://user?id="..IdUser..")","md",tostring(time),title,p) 
sleep(2)
os.remove(""..title..".mp3")
else
bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)video/(.*)') then
local xd = {Text:match('(%d+)video/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local u = bot.getUser(IdUser)
bot.answerCallbackQuery(data.id, "• انتظر يتم التحميل ", true)
local json = json:decode(https.request("https://ayad-12.xyz/apies/inf.php?id="..id))
local link = id
local title = json.title
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
bot.deleteMessages(ChatId,{[1]= Msg_id})
os.execute("yt-dlp "..link.." -f 18 -o '"..title..".mp4'")
bot.sendVideo(ChatId,0,'./'..title..'.mp4',"• ["..title.."]("..link..")\n• حسب طلب ["..u.first_name.."](tg://user?id="..IdUser..")","md") 
sleep(4)
os.remove(""..title..".mp4")
else
bot.answerCallbackQuery(data.id, "• هذا الامر لا يخصك ", true)
end
end

if Text and Text:match('(%d+)/brg/(.*)') then
local get = {Text:match('(%d+)/brg/(.*)')}
local UserId = get[1]
local brg = get[2]
if tonumber(IdUser) ~= tonumber(UserId) then
return bot.answerCallbackQuery(data.id, "• هذه الاوامر لا تخصك ", true)
end
local api = https.request('https://anubis.fun/api/Abrag.php?brg='..URL.escape(brg))
local decode = JSON.decode(api)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
if decode.ok.state == true then
local msg_text = "📍: *برج* "..brg.." :"..
"\nحظك اليوم `"..decode['Luck today percentage'].."` - التوافق مع "..decode['Compatibility'].." - حظك بالحب `"..decode['Luck with love'].."`"..
"\nرقم حظك : `"..decode['Luck num'].."` - يوم حظك : "..decode['Luck day']..
"\n\n- *برجك اليوم* :\n"..decode['Luck today']['Horoscope today']..
"\n\n- *علي الصعيد العاطفي* :\n"..decode['Luck today']['On an emotional level']..
"\n\n- *علي الصعيد المهني* :\n"..decode['Luck today']['On a professional level']..
"\n\n- *علي الصعيد الصحي* :\n"..decode['Luck today']['On the health leve'].."\n✬"
return edit(ChatId,Msg_id,msg_text, 'md', true, false, reply_markup)
else
return edit(ChatId,Msg_id,"حدث خطأ تاكد من كتابه البرج بشكل صحيح.", 'md', true, false, reply_markup)
end
end

--[[if Text and Text:match('(%d+)/get_brg/(.*)/(.*)') then
local get = {Text:match('(%d+)/get_brg/(.*)/(.*)')}
local UserId = get[1]
local q = get[2]
local js = get[3]
if tonumber(IdUser) ~= tonumber(UserId) then
return bot.answerCallbackQuery(data.id, "• هذه الاوامر لا تخصك ", true)
end
local json = JSON.decode(requesst("https://xnxx.fastbots.ml/apies/abrag.php?q="..q))
local txx = json[js]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'حب', data = IdUser..'/get_brg/'..q..'/عاطفياً'}, {text = 'مهنة', data = IdUser..'/get_brg/'..q..'/مهنياً'},{text = 'صحة', data = IdUser..'/get_brg/'..q..'/صحياً'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end]]
if Text and Text:match('(%d+)mute(%d+)') then
local UserId = {Text:match('(%d+)mute(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:sadd(Fast.."SilentGroup:Group"..ChatId,replyy) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء كتم', data = IdUser..'unmute'..replyy}, 
},
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"※ تم كتمه في الجروب  ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)unmute(%d+)') then
local UserId = {Text:match('(%d+)unmute(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,replyy) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"※ تم الغاء كتمه في الجروب ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)ban(%d+)') then
local UserId = {Text:match('(%d+)ban(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:sadd(Fast.."BanGroup:Group"..ChatId,replyy) 
bot.setChatMemberStatus(ChatId,replyy,'banned',0)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء حظر', data = IdUser..'unban'..replyy}, 
},
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"※ تم حظر من الجروب  ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)unban(%d+)') then
local UserId = {Text:match('(%d+)unban(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."BanGroup:Group"..ChatId,replyy) 
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,1,1,1,1,1,1,1,1})
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"※ تم الغاء حظره من الجروب ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)kid(%d+)') then
local UserId = {Text:match('(%d+)kid(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,0,0,0,0,0,0,0,0})
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء تقييد', data = IdUser..'unkid'..replyy}, 
},
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"※ تم تقييده في الجروب  ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)unkid(%d+)') then
local UserId = {Text:match('(%d+)unkid(%d+)')}
local replyy = tonumber(UserId[2])
print(replyy)
if tonumber(IdUser) == tonumber(UserId[1]) then
bot.setChatMemberStatus(ChatId,replyy,'restricted',{1,1,1,1,1,1,1,1})
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = Reply_Status(replyy,"※ تم الغاء تقييده في الجروب ").Reply
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر الحمايه كالاتي ...
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• قفل ، فتح ← الامر 
• تستطيع قفل حمايه كما يلي ...
• ← { بالتقييد ، بالطرد ، بالكتم }
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• الكل ~ الدخول
• الروابط ~ المعرف
• التاك ~ الشارحه
• التعديل ~ تعديل الميديا
• المتحركه ~ الملفات
• الصور ~ الفيديو 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• الماركداون ~ البوتات
• التكرار ~ الكلايش
• السيلفي ~ الملصقات
• الانلاين ~  الدردشه
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• التوجيه ~ الاغاني
• الصوت ~ الجهات
• الاشعارات ~ التثبيت 
• الوسائط ~ التفليش
• وسائط المميزين
• الفشار ~ الفارسيه
• الإنكليزيه
• الكفر ~ الاباحي
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر ادمنية الجروب ...
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع، تنزيل ← مميز
• المميزين ← مسح المميزين 
• رفع الادمنيه
• تاك ، تاك للكل ، الجروب
• منع ، الغاء منع
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• الاوامر التالية ← {بالرد ، بالمعرف}
• حظر ، طرد ← الغاء حظر 
• كتم ← الغاء كتم
• تقييد ← الغاء تقييد
• كشف ، رفع ← القيود
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• عرض القوائم كما يلي ...
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• المنشئين الاساسيين ، المنشئين 
• المدراء ، الادمنيه ، المميزين
• المشرفين ، المكتومين
• قائمه المنع
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تثبيت ، الغاء تثبيت
• الرابط ، الاعدادات ، الحمايه
• الترحيب ، القوانين
• ضع رتبه  ← { اسم الرتبه } 
• تحكم ← {بالرد ، بالمعرف}
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل ، تعطيل ← الاوامر التاليه :
• الترحيب ، الرابط
• ردود البوت ، الالعاب
• اطردني ، التسليه
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• مسح ← الاوامر التاليه
• القوائم ، قائمه المنع ، المميزين
• الرابط ، القوانين ، الصوره
• مسح ← { عدد }
• مسح ← { بالرد }
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اوامر الاعضاء والادمنيه 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• ايدي ، ايدي بالرد ، رسائلي
• تفاعلي ، لقبي ، بايو ، ترند
• جهاتي ، تعديلاتي ، نقاطي
• بيع نقاطي + العدد
• مسح نقاطي
• قول + الكلمه
• زواج ، ثنائي اليوم
• الوقت ، الساعه ، التاريخ
• الصوتيات ، الصوتيات العامه
• زخرفه ، تحويل الصيغ ، غنيلي
• همسه ، اسم برجك ، صورتي
• صلاحياتي ، رتبتي ، نزلني 
• صلاحياته ← {بالرد ، بالمعرف}
• الرتبه ← {بالرد ، بالمعرف}
• التفاعل ← {بالرد ، بالمعرف}
• كشف ← {بالرد ، بالمعرف}
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toar') then
local UserId = Text:match('(%d+)toar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
❍ ارسل النص لترجمته الي العربيه
*]]
Redis:set(Fast.."toar"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toen') then
local UserId = Text:match('(%d+)toen')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
❍ ارسل النص لترجمته الي الانجليزيه
*]]
Redis:set(Fast.."toen"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر المدراء في الجروب
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع ، تنزيل ← ادمن
• الادمنيه ← مسح الادمنيه 
• تنزيل الكل ← {بالرد ، بالمعرف}
• ️︙كشف ، طرد ، قفل ← البوتات
• قفل البوتات ← بالطرد
• فحص ← البوت
• طرد ← المحذوفين 
• قفل فتح ← ارسال القناة
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• لتغيير رد الرتب في البوت
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تغيير رد ← {اسم الرتبه والنص} 
• المطور ، المالك ، المنشئ الاساسي
• المنشئ ، المدير ، الادمن
• المميز ، العضو
• مسح رد ← { اسم الرتبه }
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• وضع الرتب ← { بالرد , بالمعرف}
• ضع رتبه ← { اسم الرتبه }
• مسح رتبه ← { بالرد ، بالمعرف}
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• وضع ، ضع ← الاوامر التاليه
• اسم + اسم الجروب
• رابط ، صوره
• قوانين ، وصف ،الترحيب 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل ، تعطيل ← الاوامر التاليه :
• الايدي ، الايدي بالصوره 
• ايدي العضو ، البايو
• صورتي ، اسمي
• الردود ، الابراج 
• غنيلي ، الصيغ ، قول
• تنبيه الاسماء ، الصوتيات 
• الصوتيات العامه
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• مسح ← + { الامر } 
• المحظورين ، المطرودين
• المكتومين ← المقيدين
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• ترتيب الاوامر ← استعاده الاوامر
• اضف ، مسح ← { رد }
• الردود ، مسح الردود
• اضف ، مسح ← { رد متعدد}
• الردود المتعدده
• مسح الردود المتعدده
• تاك عام ، all 
• الميديا ← امسح ، مسح الميديا
• اضف رسائل + العدد {بالرد}
• اضف نقاط + العدد {بالرد}
• اضف تعديلات + العدد {بالرد}
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر المنشئ الاساسي
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع ، تنزيل ←{ منشئ }
• المنشئين ، مسح المنشئين
• رفع ، تنزيل ←{ مشرف }
• ضع لقب + اللقب ← { بالرد }
• صلاحيات الجروب
• مسح نقاطه ، رسائله ← {بالرد}
• تفعيل ، تعطيل ← منع التصفيه
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اوامر المنشئ الجروب
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع ، تنزيل ← { مدير }
• المدراء ، مسح المدراء
• تغيير ، مسح ←{ الايدي }
• تعيين ، مسح ←{ الايدي }
• اضف ، مسح ← { امر }
• الاوامر المضافه ، مسح الاوامر المضافه
• ضع التكرار ← { عدد }
• تفعيل الاوامر ← { اوامر اساسيه }
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل ، تعطيل ← الاوامر التاليه :
• الردود العامه ، الطرد ، الحظر
• الرفع ، التاك ، نزلني ، ضع رتبه 
• تاك عام ، المسح التلقائي
• ضع عدد المسح + { عدد }
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
︙اوامر مالك الجروب 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع ، تنزيل ←{ مالك }
• المالكين ، مسح المالكين
 •تنزيل جميع الرتب 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اوامر المالكين 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع ، تنزيل ← { منشئ اساسي }
• المنشئين الاساسيين،
• مسح المنشئين الاساسيين 
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/bnback') then
local UserId = Text:match('(%d+)/bnback')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ' الحــۢ͜ـٰ̲رامــۢ͜ـٰ̲يـۢ͜ـٰ̲ه ', data = IdUser..'/topzrf'},{text = ' الفــۢ͜ـٰ̲لــۢ͜ـٰ̲وس ', data = IdUser..'/topmon'},
},
{
{text = ' المــۢ͜ـٰ̲تــۢ͜ـٰ̲زوجيــۢ͜ـٰ̲ن ', data = IdUser..'/topzwag'},
},
{
{text = ' ⸢ 𝒖𝒑𝒅𝒂𝒕𝒆 • 𝒃𝒐𝒕 ⸥ ', url="t.me/SOURCEROZA"},
},
}
}
local TextHelp = [[*
🥇╎ مرحبا بك عزيزي مره اخري • ~
🥇╎ اختار اوامر التوب الي انت عايزها • ~
🥇╎ من خلال الأزرار بالأسفل 👇 • ~
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'العاب السورس ™️', data = IdUser..'/normgm'}, {text = 'العاب متطورة 🎳', data = IdUser..'/degm'}, 
},
{
{text = '💸-💲[- بنك الحظ -]💲-💸', data = IdUser..'/mounybank'}, 
},
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
🔺️╎ اهلا بك في { قسم } العاب السورس •
🔻╎ اختار اللعبه الي انت عايزها • ~
🔺️╎ من خلال الأزرار بالأسفل 👇 • ~
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/degm') then
local UserId = Text:match('(%d+)/degm')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- فلابي بيرد', url = 'http://t.me/awesomebot?game=FlappyBird'}, 
},
{
{text = '- تبديل النجوم ', url = 'http://t.me/gamee?game=Switchy'}, {text = '- موتسيكلات', url = 'http://t.me/gamee?game=motofx'}, 
},
{
{text = '- اطلاق النار ', url = 'http://t.me/gamee?game=NeonBlaster'}, {text = '- كره القدم', url = 'http://t.me/gamee?game=Footballstar'}, 
},
{
{text = '- تجميع الوان ', url = 'http://t.me/awesomebot?game=Hextris'}, {text = '- المجوهرات', url = 'http://t.me/gamee?game=DiamondRows'}, 
},
{
{text = '- ركل الكرة ', url = 'http://t.me/gamee?game=KeepitUP'}, {text = '- بطولة السحق', url = 'http://t.me/gamee?game=SmashRoyale'}, 
},
{
{text = '- 2048', url = 'http://t.me/awesomebot?game=g2048'}, 
},
{
{text = '- كرة السلة ', url = 'http://t.me/gamee?game=BasketBoy'}, {text = '- القط المجنون', url = 'http://t.me/gamee?game=CrazyCat'}, 
},
{
{text = '❍ •✠| - 𝙱𝙰𝙲𝙺 - |✠• ❍', data = IdUser..'/help6'},
},
{
{text = 'اضغط لعرض اوامر السورس', data = IdUser..'/helpall'},
},
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
🔺️╎ اهلا بك في { قسم } الألعاب المتطوره •
🔻╎ اختار اللعبه الي انت عايزها • ~
🔺️╎أختر اللعبة ثم اختار المحادثه • ~
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/normgm') then
local UserId = Text:match('(%d+)/normgm')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❍ •✠| - 𝙱𝙰𝙲𝙺 - |✠• ❍', data = IdUser..'/help6'},
},
{
{text = 'اضغط لعرض اوامر السورس', data = IdUser..'/helpall'},
},
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
🔺️╎ اهلا بك في { قسم } ألعاب البوت •
🔻╎ اختار اللعبه الي انت عايزها • ~
— — — — — — — — —
• لعبة البنك » بنك الحظ
• لعبة مريم » رعب
• لعبه ترجمه » ترجمه عربي وانجليزي
• لعبة اختبار الذكاء » شغل عقلك
• لعبة نسبه الذكاء »
• لعبة نسبه الغباء »
• لعبة نسبه الحب »
• لعبة نسبه الكره »
• لعبة نسبه الرجوله »
• لعبة نسبه الانوثه »
• لعبة المختلف » المختلف
• لعبة الامثله » امثله
• لعبة العكس » العكس
• لعبة الحزوره » حزوره
• لعبة المعاني » معاني
• لعبة البات » بات
• لعبة التخمين » خمن
• لعبه الاسرع » الاسرع، ترتيب
• لعبة السمايلات » سمايلات
• اسئله » اسئله منوعه
• اسالني » اسئله عامه متجدده
• لغز  » الغاز الذكاء متجدده
• روليت » الروليت بالمعرفات 
• الروليت » الروليت بالانضمام
• رياضيات » مسائل رياضيه 
• انكليزي » معاني الكلمات 
• كت تويت ،كت » اسئله ترفيهيه
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• نقاطي ← لعرض عدد النقاط 
• بيع نقاطي + { العدد } 
لبيع كل نقطه مقابل {50} رساله
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mounybank') then
local UserId = Text:match('(%d+)/mounybank')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❍ •✠| - 𝙱𝙰𝙲𝙺 - |✠• ❍', data = IdUser..'/help6'},
},
{
{text = 'اضغط لعرض اوامر السورس', data = IdUser..'/helpall'},
},
{
{text = '✦ َ𝙍َِ𝙕َِ• 𝙎َِ𝙊َِ𝙐َِ𝙍َِ𝘾َِ𝙀ِ ✦', url = 't.me/'..chsource..''}, 
},
{
{text = '✈ • أضف البوت إلي مجموعتك • ✈', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
local TextHelp = [[*
— — — — — — — — —— — 
•🔻•— BANK GAME —•🔺️•
— — — — — — — — —— — 
⌯ انشاء حساب بنكي  ↢ تعمل حساب وتقدر تحول فلوس 

⌯ مسح حساب بنكي  ↢ تلغي حسابك البنكي

⌯ تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس

⌯ حسابي  ↢ يطلع لك رقم حسابك 

⌯ فلوسي ↢ يعلمك كم فلوسك

⌯ كنز ↢ البحث عن كنزك

⌯ زواج بالمهر ↢ مثال • اعمل ريبلاي علي الزوجه《زواج 1000》 كحد اقصي 1000ج

《 طلقها 》 للأزواج -🤵
《 اخلعو 》 للزوجات - 👰

⌯ راتبي ↢ يعطيك راتبك كل ٢٠ دقيقة

⌯ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق

⌯ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق

⌯ سلفني او استلاف ↢ البوت بيديك استلاف 

⌯ استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

⌯ حظ ↢ تلعبها بأي مبلغ ياتكسب يا تخسر

⌯ شراء رتبه ↢ / شراء رتبه في البوت بالفلوس

⌯ مضاربه ↢ تضارب بأي مبلغ انت عاوزو والنسبة من ٩٠٪؜ الى -٩٠٪؜ انت وحظك

🕹↜( أوامر التوب )↝🕹

⌯ ترند ↢ يطلع لك اكتر ناس متفاعلين في الجروب

⌯ توب الحراميه ↢ يطلع لك اكتر ناس سارقين

⌯ توب الفلوس ↢ يطلع لك اكتر ناس اثرياء بالبوت

⌯ توب المتزوجين ↢ يطلع لك اغني 10 ازواج بالجروب
— — — — — — — — —— — —
● —•🔻•— Enjoy —•🔺️•— ●
— — — — — — — — —— — —
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpp6') then
local UserId = Text:match('(%d+)/helpp6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامر التسلية
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع ، تنزيل ← الاوامر التاليه ↓
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• غبي 
• سمب
• حمار
• خول
• قرد 
• عره
• متوحد
• متوحده
• كلب 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اوامر التاك 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• الاغبياء
• الحمير
• الخولات
• السمب
• المتوحدين
• الكلاب
• العرر
• القرود
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اوامر الترفيه 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• زخرفه + النص
• مثال زخرفه محمود
• احسب + عمرك
• مثال احسب 2001/8/5
• معني + الاسم 
• مثال معني محمود
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• نسبه الحب/ الكره
• نسبه الرجوله/ الانوثه 
• نسبه الذكـــــاء/ الغباء 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• الاوامــر بالـــرد  ⇣ 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• زواج ~ طلاك 

*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القفل / الفتح }', data = IdUser..'/NoNextSeting'}, {text = '{ التعطيل / التفعيل }', data = IdUser..'/listallAddorrem'}, 
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• اوامــر البــوت الرئيسيـة 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• { م1 } ← اوامر الحمايه
• { م2 } ← اوامر الادمنيه
• { م3 } ← اوامر المدراء
• { م4 } ← اوامر المنشئين
• { م5 } ← اوامر المالكين
• { م6 } ← اوامر التسليه
• { م المطور } ← اوامر المطور
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpsudo') and data.Dev then
local UserId = Text:match('(%d+)/helpsudo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القفل / الفتح }', data = IdUser..'/NoNextSeting'}, {text = '{ التعطيل / التفعيل }', data = IdUser..'/listallAddorrem'}, 
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
اوامر المطور الاساسي  
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل  ←  تعطيل
• رفع  تنزيل ← مطور اساسي
• المطورين الاساسيين
• مسح المطورين الاساسيين
• رفع  تنزيل ← مطور ثانوي
• المطورين الثانويين  
• مسح المطورين الثانويين
• رفع  تنزيل ← مطور
• المطورين ← مسح المطورين
• تغيير المطور الاساسي
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل الوضع المدفوع + الايدي 
• الغاء الوضع المدفوع + الايدي
• حظر جروب + { الايدي }
• غادر ← + { الايدي }
• اسم بوتك + غادر بالجروب
• تفعيل تعطيل الاشتراك الاجباري
• الاشتراك الاجباري
• تغيير الاشتراك الاجباري
• تفعيل تعطيل الاشتراك الاجباري للجروب
• الاشتراك الاجباري للجروب
• تعيين عدد الاعضاء + {العدد}
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• حظر عام ، الغاء العام
• قائمه العام ، مسح قائمه العام
• كتم عام ، الغاء كتم عام
• المكتومين عام
• مسح المكتومين عام
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تغيير ، مسح ←{ اسم البوت }
• ضع صوره للترحيب 
• الاحصائيات
• ذيع + ايدي الجروب بالرد
• اذاعه ، اذاعه خاص
• اذاعه بالتوجيه ، اذاعه بالتثبيت
• اذاعه خاص بالتوجيه
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل تعطيل جلب النسخه التلقائيه
• جلب نسخه احتياطيه
• رفع النسخه الاحتياطيه بالرد
• رفع نسخه تشاكي بالرد
• جلب نسخه الردود 
• رفع نسخه الردود بالرد
• معلومات التنصيب
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تعيين ، مسح ← { الايدي عام }
• اضف ، مسح ← {رد عام}
• اضف ، مسح ← {رد عام متعدد}
• ضع ، مسح ← { الترحيب عام } 
• ضع ، مسح ← { كليشه المطور }
• الردود العامه ، مسح الردود العامه
• اضف مسح صوت عام
• الصوتيات العامه 
• مسح الصوتيات العامه
• منع عام ، الغاء منع عام
• قائمه المنع عام
• مسح قائمه المنع عام
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اضف مسح ← سؤال
• الاسئله المضافه
• مسح الاسئله المضافه
• اضف مسح ← لغز 
• الالغاز ~ مسح الالغاز
• اضف مسح ← سؤال كت 
• اسئله كت
• اضف اسئله كت
• مسح اسئله كت
• اضف موسيقى 
• مسح موسيقى بالرد 
• قائمة الموسيقى 
• مسح قائمه الموسيقى
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• تفعيل ، تعطيل ← الاوامر التاليه↓
• البوت الخدمي ، المغادرة ، الاذاعه
• التواصل ، الاحصائيات
• ملف ← { اسم الملف }
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• مسح جميع الملفات 
• المتجر ، الملفات
• تحديث ، تحديث السورس 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• اوامر المطور في البوت
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• رفع، تنزيل ← { مالك }
• المالكين ، مسح المالكين
• تنزيل جميع الرتب
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpts') then
local UserId = Text:match('(%d+)/helpts')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '{ 𝟏 }', data = IdUser..'/help1'}, {text = '{ 𝟐 }', data = IdUser..'/help2'}, 
},
{
{text = '{ 𝟑 }', data = IdUser..'/help3'}, {text = '{ 𝟒 }', data = IdUser..'/help4'}, 
},
{
{text = '{ 𝟓 }', data = IdUser..'/help5'}, {text = '{ 𝟔 }', data = IdUser..'/helpp6'}, 
},
{
{text = '{ م المطور }', data = IdUser..'/helpsudo'},{text = '{ الالعاب }', data = IdUser..'/help6'}, 
},
{
{text = '{ اوامر التسليه }', data = IdUser..'/helpts'},
},
{
{text = '{ القفل / الفتح }', data = IdUser..'/NoNextSeting'}, {text = '{ التعطيل / التفعيل }', data = IdUser..'/listallAddorrem'}, 
},
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
︙اوامر التسليه كالاتي: 
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
• الامر ، تفعيل ، تعطيل ← { الامر }
• غنيلي ، ريمكس ، اغنيه ، شعر
• صوره ،  متحركه
• انمي ، ميمز
• مسلسل ، فلم
• حساب العمر( احسب + تاريخ الميلاد)
• معنى اسم + الاسم
⎈•━⊶𐂡• 𝙎𝙊𝙐𝙍𝘾𝞝☥𝙍𝙕 •𐂡⊷━•⎈
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Bot:kick"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Join"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:AddMempar"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."lockpin"..ChatId,(bot.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:tagservr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') and data.Creator then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:edit"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").Lock, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفـل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Link"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Welcome"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Id"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Reply"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:ReplySudo"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:SetId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:BanId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Games"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:KickMe"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Link"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Welcome"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Id"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:IdPhoto"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Reply"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:ReplySudo"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:SetId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:BanId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Games"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:KickMe"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = bot.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(Fast.."Admin:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
bot.answerCallbackQuery(data.id, "• تم ترقيه {"..y.."} ادمنيه \n• تم ترقية المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(Fast.."Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..UserId[2],"del")    
end
bot.answerCallbackQuery(data.id, "• تم قفل جميع الاوامر بنجاح  ", true)
end
end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
bot.answerCallbackQuery(data.id, "• تم مغادره البوت من الجروب", true)
bot.leaveChat(UserId)
end
if Text and Text:match('(%d+)/trtep@(.*)') then
local UserId = {Text:match('(%d+)/trtep@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'امر','اضف امر')
bot.answerCallbackQuery(data.id, "• تم ترتيب الاوامر  ", true)
end
end

if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ❌ ❭',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ✔️ ❭',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ❌ ❭',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ✔️ ❭',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ❌ ❭',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ✔️ ❭',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ❌ ❭',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ✔️ ❭',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ❌ ❭',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ✔️ ❭',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
bot.answerCallbackQuery(data.id, "• تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ❌ ❭')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
bot.answerCallbackQuery(data.id, "• تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ✔️ ❭')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
bot.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = IdUser..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = IdUser..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = IdUser..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = IdUser..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = IdUser..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = IdUser..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = IdUser..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = IdUser..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = IdUser..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = IdUser..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = IdUser..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = IdUser..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = IdUser..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = IdUser..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = IdUser..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = IdUser..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = IdUser..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = IdUser..'/'.. 'mute_namemy'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return edit(ChatId,Msg_id,'• اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n• اعدادات الجروب ".."\n🔏︙علامة ال (✔️) تعني مقفول".."\n🔓︙علامة ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
},
{
{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
},
{
{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
},
{
{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
},
{
{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
},
{
{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
},
{
{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '- الرجوع ... ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n• اعدادات الجروب ".."\n🔏︙علامة ال (✔️) تعني مقفول".."\n• علامة ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
},
{
{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},
},
{
{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(ChatId).farsia, data = '&'},{text = 'الفارسيه : ', data =IdUser..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(ChatId).tphlesh, data = '&'},{text = 'التفليش : ', data =IdUser..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(ChatId).alkfr, data = '&'},{text = 'الكفر : ', data =IdUser..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(ChatId).alphsar, data = '&'},{text = 'الفشار : ', data =IdUser..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي ... ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end  

if Text and Text:match('/delAmr') then
local UserId = Text:match('/delAmr')
if data.Manger then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_farsia') then
local UserId = Text:match('(%d+)/Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفارسيه', data =UserId..'/'.. 'lock_Status_farsia'},
},
{
{text = 'فتح الفارسيه', data =UserId..'/'.. 'unlock_Status_farsia'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفارسيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tphlesh') then
local UserId = Text:match('(%d+)/Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التفليش', data =UserId..'/'.. 'lock_Status_tphlesh'},
},
{
{text = 'فتح التفليش', data =UserId..'/'.. 'unlock_Status_tphlesh'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التفليش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alkfr') then
local UserId = Text:match('(%d+)/Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكفر', data =UserId..'/'.. 'lock_Status_alkfr'},
},
{
{text = 'فتح الكفر', data =UserId..'/'.. 'unlock_Status_alkfr'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكفر", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alphsar') then
local UserId = Text:match('(%d+)/Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفشار', data =UserId..'/'.. 'lock_Status_alphsar'},
},
{
{text = 'فتح الفشار', data =UserId..'/'.. 'unlock_Status_alphsar'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفشار", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"• عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Link"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_farsia') then
local UserId = Text:match('(%d+)/unlock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:farsia"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفارسيخ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_tphlesh') then
local UserId = Text:match('(%d+)/unlock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:tphlesh"..ChatId)  
Redis:del(Fast.."Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التفليش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alkfr') then
local UserId = Text:match('(%d+)/unlock_Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:alkfr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكفر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alphsar') then
local UserId = Text:match('(%d+)/unlock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:phshar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفشار").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_farsia') then
local UserId = Text:match('(%d+)/lock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:farsia"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل الفارسيخ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_tphlesh') and data.Manger then
local UserId = Text:match('(%d+)/lock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:tphlesh"..ChatId,true)
Redis:set(Fast.."Status:IdPhoto"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل التفليش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alkfr') then
local UserId = Text:match('(%d+)/lock_Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:alkfr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل الكفر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alphsar') then
local UserId = Text:match('(%d+)/lock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:phshar"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم قفل الفشار").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Spam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Keyboard"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:vico"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Animation"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Document"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Video"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Photo"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:User:Name"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:hashtak"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Bot:kick"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:forward"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Audio"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Sticker"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Contact"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Join"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:AddMempar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Unsupported"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."lockpin"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:tagservr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Markdaun"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:edit"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:geam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(Fast.."Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"• تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:ar"..UserId,500,true)
edit(ChatId,Msg_id,"• ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:en"..UserId,500,true)
edit(ChatId,Msg_id,"• ارسل الاسم بالانكليزي", 'md', false)
end
end
if Text and Text:match('^(%d+)/back_lists$') then
local UserId = Text:match('^(%d+)/back_lists$')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=UserId..'/redis:Devall'},
},
{
{text="المكتومين عام",data=UserId..'/KtmAll'},{text="المحظورين عام",data=UserId..'/BanAll'},
},
{
{text="المطورين الثانويين",data=UserId..'/Devss'},{text="المطورين",data=UserId..'/Dev'},
},
{
{text="المالكين",data=UserId..'/Ownerss'},{text="المنشئين الاساسيين",data=UserId..'/SuperCreator'},
},
{
{text="المنشئين",data=UserId..'/Creator'},{text="المدراء",data=UserId..'/Manger'},
},
{
{text="الادمنيه",data=UserId..'/Admin'},{text="المميزين",data=UserId..'/DelSpecial'},
},
{
{text="المكتومين",data=UserId..'/SilentGroupGroup'},{text="المحظورين",data=UserId..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =UserId.."/delAmr"}
},
}
}
return edit(ChatId,Msg_id,"*⌯︙اختر احدى القوائم لمسحها*", "md",true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Devss') and data.ControllerBot then
local UserId = Text:match('(%d+)/Devss')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Devss:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح مطورين الثانوين من البوت", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Dev') and data.Devss then
local UserId = Text:match('(%d+)/Dev')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Dev:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح مطورين البوت", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/redis:Devall') and data.ControllerBot then
local UserId = Text:match('(%d+)/redis:Devall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."ControlAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح مطورين الاساسيين", "md",true, false, reply_markup)
end

elseif Text and Text:match('(%d+)/Ownerss') and data.Dev then
local UserId = Text:match('(%d+)/Ownerss')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Ownerss:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح االمالكين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SuperCreator') and data.Ownerss then
local UserId = Text:match('(%d+)/SuperCreator')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."SuperCreator:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المنشئين الاساسيين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Creator') and data.SuperCreator then
local UserId = Text:match('(%d+)/Creator')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Creator:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح منشئين الجروب", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Manger') and data.Creator then
local UserId = Text:match('(%d+)/Manger')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Manger:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المدراء", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Admin') and data.Manger then
local UserId = Text:match('(%d+)/Admin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Admin:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح ادمنيه الجروب", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/DelSpecial') then
local UserId = Text:match('(%d+)/DelSpecial')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Special:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المميزين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/KtmAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/KtmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."KtmAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المكتومين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Delkholat') then
local UserId = Text:match('(%d+)/Delkholat')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."kholat:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع خولات المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delwtk') then
local UserId = Text:match('(%d+)/Delwtk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."wtka:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع وتكات المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Deltwhd') then
local UserId = Text:match('(%d+)/Deltwhd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."twhd:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع متوحدين المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delklb') then
local UserId = Text:match('(%d+)/Delklb')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."klb:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع الكلاب المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delmar') then
local UserId = Text:match('(%d+)/Delmar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."mar:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع حمير المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delsmb') then
local UserId = Text:match('(%d+)/Delsmb')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."smb:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع السمب الي هنا ف المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Del2rd') then
local UserId = Text:match('(%d+)/Del2rd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."2rd:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع القرود", 'md', false)
end
elseif Text and Text:match('(%d+)/Del3ra') then
local UserId = Text:match('(%d+)/Del3ra')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."3ra:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع العرر", 'md', false)
end
elseif Text and Text:match('(%d+)/Wrong') then
local UserId = Text:match('(%d+)/Wrong')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعادة اللعبه', data = IdUser..'Ml'},},}}
local TextHelp = [[*•  للأسف خطأ يا صديقي حظ اوفر المره القادمه *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Mlhelp/(.*)') then
local dataa = {Text:match('(%d+)/Mlhelp/(.*)')}
local UserId , q = dataa[1] , dataa[2]
if tonumber(IdUser) == tonumber(UserId) then
local qq = Redis:get(Fast..ChatId..'Milion:help'..UserId) or 0
if tonumber(qq) < 3 then
Redis:incrby(Fast..ChatId..'Milion:help'..UserId,1)
return bot.answerCallbackQuery(data.id, "• الاجابه الصحيحه هي "..q, true)
else
return bot.answerCallbackQuery(data.id, "• نأسف لقد انتهت مساعداتك ", true)
end
end
elseif Text and Text:match('(%d+)Ml') then
local UserId = Text:match('(%d+)Ml')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..ChatId..'Milion:help'..UserId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'ابدء المستوي الاول من اللعبة', data = IdUser..'R1'},},}}
local TextHelp = [[*• اللعبة 3 مستويات عبارة عن اسئلة عامة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R1') then
local UserId = Text:match('(%d+)R1')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..ChatId..'Milion:help'..UserId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الجنيه', data = IdUser..'/Wrong'},},
{{text = 'الزلوط', data = IdUser..'R2'},},
{{text = 'اليورو', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الزلوط'},},
}}
local TextHelp = [[*• ما هي عملة دولة بولاندا ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R2') then
local UserId = Text:match('(%d+)R2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R3'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R3') then
local UserId = Text:match('(%d+)R3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '24 ساعه', data = IdUser..'R4'},},
{{text = '23 ساعه', data = IdUser..'/Wrong'},},
{{text = '22 ساعه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/24 ساعه'},},
}}
local TextHelp = [[*•  كم ساعة في اليوم ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R4') then
local UserId = Text:match('(%d+)R4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R5'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R5') then
local UserId = Text:match('(%d+)R5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الخلية ', data = IdUser..'R6'},},
{{text = 'الشجرة', data = IdUser..'/Wrong'},},
{{text = 'الكهف', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الخلية'},},
}}
local TextHelp = [[*•  ما هو اسم المكان الذي يعيش فيه النحل ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R6') then
local UserId = Text:match('(%d+)R6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R7'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R7') then
local UserId = Text:match('(%d+)R7')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'اطعمته', data = IdUser..'/Wrong'},},
{{text = 'استضفته', data = IdUser..'/Wrong'},},
{{text = 'اكرمته ', data = IdUser..'R8'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/اكرمته'},},
}}
local TextHelp = [[*•  اكمل المثل :- احذر من اللئيم اذا ...؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R8') then
local UserId = Text:match('(%d+)R8')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R9'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R9') then
local UserId = Text:match('(%d+)R9')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'قبرص', data = IdUser..'/Wrong'},},
{{text = 'باريس', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'RR10'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/لندن'},},
}}
local TextHelp = [[*•  ما هي أكبر مدينة في قارة اوروبا ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)RR10') then
local UserId = Text:match('(%d+)RR10')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X11'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X11') then
local UserId = Text:match('(%d+)X11')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'العربيه ', data = IdUser..'X12'},},
{{text = 'الانجليزيه', data = IdUser..'/Wrong'},},
{{text = 'الفرنسيه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/العربيه'},},
}}
local TextHelp = [[*•  ما هي اللغة التي تحتل المركز الخامس كأكثر اللغات المتحدث بها*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X12') then
local UserId = Text:match('(%d+)X12')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X13'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X13') then
local UserId = Text:match('(%d+)X13')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مدريد', data = IdUser..'/Wrong'},},
{{text = 'اسطنبول ', data = IdUser..'X14'},},
{{text = 'انقرا', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/انقرا'},},
}}
local TextHelp = [[*•  ما هو الاسم الحالي لمدينه القسطنطينيه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X14') then
local UserId = Text:match('(%d+)X14')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X15'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X15') then
local UserId = Text:match('(%d+)X15')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '6 جيب', data = IdUser..'/Wrong'},},
{{text = '8 جيب', data = IdUser..'Z16'},},
{{text = '4 جيب', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/8 جيب'},},
}}
local TextHelp = [[*•  كم عدد الجيوب الانفية داخل جسم الانسان ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z16') then
local UserId = Text:match('(%d+)Z16')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'Z17'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z17') then
local UserId = Text:match('(%d+)Z17')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'فرنسا', data = IdUser..'/Wrong'},},
{{text = 'امريكا', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'Z18'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/لندن'},},
}}
local TextHelp = [[*•  في أي مدينه تقع ساعة بيج بين الشهيرة ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z18') then
local UserId = Text:match('(%d+)Z18')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'Z19'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z19') then
local UserId = Text:match('(%d+)Z19')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 فصول', data = IdUser..'/Wrong'},},
{{text = '4 فصول', data = IdUser..'Z20'},},
{{text = '5 فصول', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/4 فصول'},},
}}
local TextHelp = [[*•  كم عدد فصول السنة ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z20') then
local UserId = Text:match('(%d+)Z20')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل للمستوي الثاني ', data = IdUser..'C21'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه ونجحت في تخطي المستوي الاول يا بطل  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C21') then
local UserId = Text:match('(%d+)C21')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفحم', data = IdUser..'/Wrong'},},
{{text = 'المنجنيز', data = IdUser..'/Wrong'},},
{{text = 'البترول ', data = IdUser..'C22'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/البترول'},},
}}
local TextHelp = [[*•  إلي ماذا يشير مصطلح الذهب الاسود ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C22') then
local UserId = Text:match('(%d+)C22')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'C23'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C23') then
local UserId = Text:match('(%d+)C23')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصقر ', data = IdUser..'/Wrong'},},
{{text = 'الشعلة', data = IdUser..'/Wrong'},},
{{text = 'النسر ', data = IdUser..'C24'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/النسر'},},
}}
local TextHelp = [[*•  الولايات المتحدة الامريكية دولة مميزة وفريدة فما هو شعارها؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C24') then
local UserId = Text:match('(%d+)C24')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'C25'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C25') then
local UserId = Text:match('(%d+)C25')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '20 سن ', data = IdUser..'/Wrong'},},
{{text = '40 سن', data = IdUser..'V26'},},
{{text = '60 سن', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/40 سن'},},
}}
local TextHelp = [[*•  كم عدد أسنان القط ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end

elseif Text and Text:match('(%d+)V26') then
local UserId = Text:match('(%d+)V26')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'V27'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V27') then
local UserId = Text:match('(%d+)V27')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 قلوب ', data = IdUser..'V28'},},
{{text = '4 قلوب  ', data = IdUser..'/Wrong'},},
{{text = '5 قلوب', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/3 قلوب'},},
}}
local TextHelp = [[*•  كم قلب للاخطبوط ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V28') then
local UserId = Text:match('(%d+)V28')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'V29'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V29') then
local UserId = Text:match('(%d+)V29')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مصر ', data = IdUser..'V30'},},
{{text = 'انجلترا ', data = IdUser..'/Wrong'},},
{{text = 'فرنسا', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/مصر'},},
}}
local TextHelp = [[*•  أين أفتتح اول متحف في العالم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V30') then
local UserId = Text:match('(%d+)V30')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B31'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B31') then
local UserId = Text:match('(%d+)B31')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفرنسية ', data = IdUser..'/Wrong'},},
{{text = 'الإسبانية ', data = IdUser..'B32'},},
{{text = 'الانجليزية', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الإسبانية'},},
}}
local TextHelp = [[*•  ماهي اللغة الرسمية للارجنتين؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B32') then
local UserId = Text:match('(%d+)B32')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B33'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B33') then
local UserId = Text:match('(%d+)B33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الهادي ', data = IdUser..'B34'},},
{{text = 'الهندي ', data = IdUser..'/Wrong'},},
{{text = 'الاطلنطي', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الهادي'},},
}}
local TextHelp = [[*•  ما هو أكبر محيط في العالم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B34') then
local UserId = Text:match('(%d+)B34')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B35'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B35') then
local UserId = Text:match('(%d+)B35')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'القوة ', data = IdUser..'N36'},},
{{text = 'الغرور ', data = IdUser..'/Wrong'},},
{{text = 'الكبرياء', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/القوة'},},
}}
local TextHelp = [[*•  ماذا تعني كلمة جنكيزخان ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N36') then
local UserId = Text:match('(%d+)N36')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'N37'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N37') then
local UserId = Text:match('(%d+)N37')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '4 لترات ', data = IdUser..'/Wrong'},},
{{text = '5 لترات', data = IdUser..'/Wrong'},},
{{text = '6 لترات ', data = IdUser..'N38'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/6 لترات'},},
}}
local TextHelp = [[*•  ما سعة جسم الانسان من الدم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N38') then
local UserId = Text:match('(%d+)N38')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'N39'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N39') then
local UserId = Text:match('(%d+)N39')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السعوديه ', data = IdUser..'/Wrong'},},
{{text = 'اليمن', data = IdUser..'/Wrong'},},
{{text = 'عمان ', data = IdUser..'N40'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/عمان'},},
}}
local TextHelp = [[*•  اين يوجد الجبل الاخضر؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N40') then
local UserId = Text:match('(%d+)N40')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل إلي المستوي الأخير ', data = IdUser..'M41'},},}}
local TextHelp = [[*•  احسنت يا بطل الأبطال لقد تخطيت المستوي الثاني وهو المتوسط انتقل لأخر المستويات الان   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M41') then
local UserId = Text:match('(%d+)M41')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'طه ', data = IdUser..'M42'},},
{{text = 'المطففين ', data = IdUser..'/Wrong'},},
{{text = 'العمران', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/طه'},},
}}
local TextHelp = [[*•  ما هي السورة التي كانت سببا في إسلام عمر بن الخطاب رضي الله عنه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M42') then
local UserId = Text:match('(%d+)M42')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'M43'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M43') then
local UserId = Text:match('(%d+)M43')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصومال ', data = IdUser..'M44'},},
{{text = 'ماليزيا ', data = IdUser..'/Wrong'},},
{{text = 'السودان', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الصومال'},},
}}
local TextHelp = [[*•  ما هي الدولة العربية التي يمر بها خط الاستواء ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M44') then
local UserId = Text:match('(%d+)M44')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'M45'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M45') then
local UserId = Text:match('(%d+)M45')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الورق ', data = IdUser..'/Wrong'},},
{{text = 'الاموال', data = IdUser..'/Wrong'},},
{{text = 'الطوابع ', data = IdUser..'A46'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الطوابع'},},
}}
local TextHelp = [[*•  انجلترا لا تضع إسمها على؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A46') then
local UserId = Text:match('(%d+)A46')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'A47'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A47') then
local UserId = Text:match('(%d+)A47')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '126 غرفة', data = IdUser..'/Wrong'},},
{{text = '110 غرفة', data = IdUser..'/Wrong'},},
{{text = '143 غرفة ', data = IdUser..'A48'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/غرفة 143'},},
}}
local TextHelp = [[*•  عدد غرف البيت الأبيض؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A48') then
local UserId = Text:match('(%d+)A48')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'A49'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A49') then
local UserId = Text:match('(%d+)A49')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الدب', data = IdUser..'/Wrong'},},
{{text = 'حصان البحر ', data = IdUser..'A50'},},
{{text = 'فرس النهر', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/حصان البحر'},},
}}
local TextHelp = [[*•  الحيوان الذي يقوم ذكرة بمهمة الحمل بدلاً من الأنثى هو ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A50') then
local UserId = Text:match('(%d+)A50')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S51'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد قربت تكسب   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S51') then
local UserId = Text:match('(%d+)S51')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '11 عام', data = IdUser..'/Wrong'},},
{{text = '22 عام ', data = IdUser..'S52'},},
{{text = '33 عام', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/عام 33'},},
}}
local TextHelp = [[*•  القرامطة سرقوا الحجر الأسود من مكة المكرمة وأعادوه بعد؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S52') then
local UserId = Text:match('(%d+)S52')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S53'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S53') then
local UserId = Text:match('(%d+)S53')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الإغريق', data = IdUser..'/Wrong'},},
{{text = 'اليونانيين', data = IdUser..'/Wrong'},},
{{text = 'المصريين القدماء ', data = IdUser..'S54'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/القدماء المصريين'},},
}}
local TextHelp = [[*من الشعب الذي ابتكر التقويم الشمسي؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S54') then
local UserId = Text:match('(%d+)S54')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S55'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S55') then
local UserId = Text:match('(%d+)S55')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الثعبان', data = IdUser..'D56'},},
{{text = 'التمساح', data = IdUser..'/Wrong'},},
{{text = 'السمك', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الثعبان'},},
}}
local TextHelp = [[*مما هو الحيوان الذي يتنفس بلسانه؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D56') then
local UserId = Text:match('(%d+)D56')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'D57'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D57') then
local UserId = Text:match('(%d+)D57')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '206', data = IdUser..'/Wrong'},},
{{text = '406', data = IdUser..'/Wrong'},},
{{text = '706', data = IdUser..'D58'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/706'},},
}}
local TextHelp = [[*كم عدد الناجين من سفينة التايتنك؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D58') then
local UserId = Text:match('(%d+)D58')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'D59'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D59') then
local UserId = Text:match('(%d+)D59')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السلحفاه', data = IdUser..'/Wrong'},},
{{text = 'الضفدع', data = IdUser..'D60'},},
{{text = 'السحليه', data = IdUser..'/Wrong'},},
{{text = 'مساعده', data = IdUser..'/Mlhelp/الضفدع'},},
}}
local TextHelp = [[*من هو الحيوان الذي لا يعد من الزواحف من قائمة الحيوانات الآتية ؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D60') then
local UserId = Text:match('(%d+)D60')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعادة اللعبة ', data = IdUser..'Ml'},},}}
local TextHelp = [[*•  تم الانتهاء من جميع الاسئله بنجاح عاش يا بطل 💕😂*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Del8by') then
local UserId = Text:match('(%d+)/Del8by')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."8by:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"• تم مسح جميع الأغبياء", 'md', false)
end
elseif Text and Text:match('(%d+)/BanAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BanAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المحظورين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BanGroup') and data.Admin then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BanGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المحظورين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') and data.Admin then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."SilentGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"• تم مسح المكتومين", "md",true, false, reply_markup)
end
end

end

end 

return {Fast = Callback}
