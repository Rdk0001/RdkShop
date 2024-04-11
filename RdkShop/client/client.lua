
ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

CreateThread(function()
    while true do
        local InZone = false
        local playerPos = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.shopPos) do
            local distance = GetDistanceBetweenCoords(playerPos, v.x, v.y, v.z, true)
            if distance < 10 then
                DrawMarker(25, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 200, 0, 1, 2, 0, nil, nil, 0)
                InZone = true
                if distance < 2 then
                    if IsControlJustPressed(1, 38) then
                        OpenShop()
                    end
                end
            end
        end
        if not InZone then
            Wait(500)
        else
            Wait(1)
        end
    end
end)

print("RdkShop - Chargement du script")

function OpenShop()
    ESX.TriggerServerCallback("rdk:getPlayerCash", function(result)
        ESX.TriggerServerCallback("rdk:getPlayerName", function(playerName)
            ESX.TriggerServerCallback("rdk:getDate", function(date)
                SendNUIMessage({
                    action = "showui",
                    cash = result.."$",
                    name = playerName,
                    date = date
                })
                SetNuiFocus(true, true)
            end)
        end)
    end)
end



RegisterNUICallback('closemenu', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("water", function(data)
    TriggerServerEvent("rdk:buyWater")
    OpenShop()
end)

RegisterNUICallback("bread", function(data)
    TriggerServerEvent("rdk:buyBread")
    OpenShop()
end)

