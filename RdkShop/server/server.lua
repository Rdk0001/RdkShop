
ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterServerCallback("rdk:getPlayerCash", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getMoney())
end)

ESX.RegisterServerCallback("rdk:getPlayerName", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.getName())
end)

ESX.RegisterServerCallback("rdk:getDate", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(os.date("%X"))
end)

RegisterNetEvent("rdk:buyWater")
AddEventHandler("rdk:buyWater", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = Config.waterPrice
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem("water", 1)
        TriggerClientEvent("esx:showNotification", _source, "Vous avez acheter une bouteille d'eau.")
    else
        TriggerClientEvent("esx:showNotification", _source, "~~r~Vous n'avez pas assez d'argent")
    end
end)

RegisterNetEvent("rdk:buyBread")
AddEventHandler("rdk:buyBread", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local price = Config.breadPrice
    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem("bread", 1)
        TriggerClientEvent("esx:showNotification", _source, "Vous avez acheter un pain.")
    else
        TriggerClientEvent("esx:showNotification", _source, "~~r~Vous n'avez pas assez d'argent")
    end
end)

