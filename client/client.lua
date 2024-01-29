function loadModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        aiming, npc = GetEntityPlayerIsFreeAimingAt(PlayerId())
        if aiming and not IsPedAPlayer(npc) then
            distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(npc))
            if distance <= 10 then
                TaskSetBlockingOfNonTemporaryEvents(npc, true)
                TaskHandsUp(npc, 1000.0, PlayerPedId(), -1, true)
                if inrob then
                    timer = timer - 1
                    if timer <= 0 then
                        inrob = false
                        ESX.ShowNotification(Locale("finished_robbery"))
                        TriggerServerEvent('robbery:reward')
                        TaskSmartFleePed(npc, PlayerPedId(), 1000.0, -1, true, true)
                        Citizen.Wait(5 * 60)
                        goto restart
                    end
                end
                if inrob == nil or inrob == false then
                    timer = Config.RobberyTime
                    inrob = true
                    ESX.ShowNotification(Locale("started_robbery"))
                    AlertPolice(npc)
                end
                if IsPedDeadOrDying(npc) then
                    inrob = false
                    ESX.ShowNotification(Locale("npc_died"))
                    Citizen.Wait(1000)
                    goto restart
                end
            elseif inrob then
                inrob = false
                ESX.ShowNotification(Locale("stopped_robbery"))
                Citizen.Wait(1000)
                goto restart
            end
        elseif inrob then
            inrob = false
            ESX.ShowNotification("You are now not Robbing..")
            Citizen.Wait(1000)
            goto restart
        end
        ::restart::
    end
end)

function Locale(msg)
    return Translation[Config.Locale or "de"][msg]
end

function SpawnTestNPC()
    local model = "a_m_m_skater_01" -- Adjust this to your NPC model
    loadModel(model)
    ped = CreatePed(4, model, GetEntityCoords(PlayerPedId()), 0, 0, 0)
    --TaskSetBlockingOfNonTemporaryEvents(ped, true)
end

RegisterCommand('testnpc', function(source, args, rawCommand)
    SpawnTestNPC()
end)
