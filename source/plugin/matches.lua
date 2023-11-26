function matches(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =(Redis:get(Fast.."Name:Bot") or "روزا") 
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
function requesst(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end

---------

if text == "مباريات اليوم" then
os.execute("timedatectl set-timezone Africa/Cairo")

match_get = https.request("https://www.filgoal.com/matches/ajaxlist?date="..os.date("%Y").."-"..os.date("%m").."-"..os.date("%d"))
getMatche = JSON.decode(match_get)
match_text = "مباريات اليوم :\n"
if #getMatche > 10 then
for i = 1 , 15 , 1 do
if getMatche[i]then
fName = getMatche[i]['HomeTeamName']
sName = getMatche[i]['AwayTeamName']
MatchTime = os.date("%I:%M %p",getMatche[i]['Date']:match("(%d+)")/1000) 
if getMatche[i]['HomeScore'] == nil then 
HomeScore = "" 
else 
HomeScore = tonumber(getMatche[i]['HomeScore']) 
end
if getMatche[i]['AwayScore'] == nil then 
AwayScore = "" 
else 
AwayScore = tonumber(getMatche[i]['AwayScore']) 
end
ChampionshipName = getMatche[i]['ChampionshipName']
if getMatche[i]['StadiumName'] == nil then
StadiumName = "غير معروف" 
else 
StadiumName = getMatche[i]['StadiumName'] 
end
MatchStatus = getMatche[i]['MatchStatusHistory'][1]['MatchStatusName']
match_text = match_text.."• "..fName.." "..HomeScore.." vs "..sName.." "..AwayScore.."\n• البطوله : "..ChampionshipName.."\n• -> : "..MatchTime.." ( "..MatchStatus.." )".."\nاستاد : "..StadiumName.."\n=================\n"
end
end
return send(msg.chat_id,msg.id, match_text ,"md")
end
if #getMatche <= 10 then
for i = 1 , #getMatche , 1 do
fName = getMatche[i]['HomeTeamName']
sName = getMatche[i]['AwayTeamName']
if getMatche[i]['HomeScore'] == nil then
HomeScore = "" 
else
HomeScore = tonumber(getMatche[i]['HomeScore']) 
end
if getMatche[i]['AwayScore'] == nil then 
AwayScore = "" 
else 
AwayScore = tonumber(getMatche[i]['AwayScore']) 
end
ChampionshipName = getMatche[i]['ChampionshipName']
if getMatche[i]['StadiumName'] == nil then StadiumName = "غير معروف" else StadiumName = getMatche[i]['StadiumName'] end
MatchStatus = getMatche[i]['MatchStatusHistory'][1]['MatchStatusName']
match_text = match_text.."• "..fName.." "..HomeScore.." vs "..sName.." "..AwayScore.."\nالبطوله : "..ChampionshipName.." • > : "..MatchStatus.."\nاستاد : "..StadiumName.."\n===================\n"
end
return send(msg.chat_id,msg.id, match_text ,"md",true)
end
end


end
return {Fast = matches}