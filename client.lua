local ESX = exports.es_extended:getSharedObject()
local scoreboardOpen = false

CreateThread(function()
    while true do
        Wait(0)
        if not scoreboardOpen and IsControlJustReleased(0, 57) then -- F10
            OpenScoreboard()
        end
    end
end)

function OpenScoreboard()
    scoreboardOpen = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        action = 'open'
    })

    TriggerServerEvent('wyvern_scoreboard:requestData')
end

function CloseScoreboard()
    scoreboardOpen = false
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = 'close'
    })
end

RegisterNetEvent('wyvern_scoreboard:update', function(data)
    SendNUIMessage({
        action = 'update',
        data = data
    })
end)

RegisterNUICallback('close', function(_, cb)
    CloseScoreboard()
    cb('ok')
end)
