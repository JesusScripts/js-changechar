RegisterCommand('changechar', function(source, args)
    local ped = PlayerPedId()
    
    SetEntityInvincible(ped, true)

    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SUNBATHE_BACK", 0, true)
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if not IsPedUsingScenario(ped, "WORLD_HUMAN_SUNBATHE_BACK") then
                TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SUNBATHE_BACK", 0, true)
            end
        end
    end)


    ExecuteCommand('me Falling asleep')

    ExecuteCommand('doc 30')
    Citizen.Wait(30000)

    ClearPedTasksImmediately(ped)
    SetEntityInvincible(ped, false)


    TriggerServerEvent('esx_multicharacter:relog')
end, false)
