function alertPolice(npc)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local npcCoords = GetEntityCoords(npc)
    local street1 = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local street2 = GetStreetNameAtCoord(npcCoords.x, npcCoords.y, npcCoords.z)
    local streetLabel1 = GetStreetNameFromHashKey(street1)
    local streetLabel2 = GetStreetNameFromHashKey(street2)
    local msg = "10-31 | Robbery in progress at " .. streetLabel1 .. " and " .. streetLabel2
    TriggerServerEvent("police:alert", msg, playerCoords)
end
