RegisterNetEvent("robbery:reward")
AddEventHandler("robbery:reward", function()
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(Config.RobberyReward)
end)