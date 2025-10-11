local sampev = require('lib.samp.events')


function sampev.onServerMessage(color, text)
    for nickname in text:gmatch("([A-Z][a-z]+_[A-Z][a-z]+)") do
        if nickname == "Dmitriy_Lothbrok" then
            local id_lobka = sampGetPlayerIdByNickname("Dmitriy_Lothbrok")
            if id_lobka then
                sampSendChat("/t "..id_lobka.." удали игру чмо")
            end
        end
    end
end

function sampGetPlayerIdByNickname(nick)
    local _, myid = sampGetPlayerIdByCharHandle(playerPed)
    if tostring(nick) == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1000 do 
        if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == tostring(nick) then 
            return i 
        end 
    end
end