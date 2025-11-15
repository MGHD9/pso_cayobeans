local ESX = exports['es_extended']:getSharedObject()

--------------------------------------------------------

local coffeeZone = Config.Blip.RecolteCoords
local processZone = Config.Blip.TraitementCoords
local markerDistR = 10.0
local markerDist = 2.0
local interactDist = 7.0
local takeMule = false

---------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local dist = #(playerCoords - coffeeZone)

        if dist < markerDistR then
            sleep = 0
            DrawMarker(1, coffeeZone.x, coffeeZone.y, coffeeZone.z - 1.0, 
                0, 0, 0, 0, 0, 0, 
                10.5, 10.5, 0.5, 
                0, 255, 172, 102, false, true, 2, false, nil, nil, false)

            if dist < interactDist then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour récolter du café")

                if IsControlJustReleased(0, 38) then
                    local xPlayer = ESX.GetPlayerData()
                    if xPlayer.job and xPlayer.job.name == "cayobeans" then
                        TaskStartScenarioInPlace(playerPed, "world_human_gardener_plant", 0, true)
                        Citizen.Wait(6000)
                        ClearPedTasksImmediately(playerPed)
                        TriggerServerEvent("pso_cayobeans::give_bean")
                        -- ESX.ShowNotification("Vous avez récolté ~o~5x~s~ ~b~Graines de café~s~")
                        SuccessNotify("Cayo Beans", "Vous avez récolté des graines de café.")
                    else
                        -- ESX.ShowNotification("~r~Vous n'êtes pas employé chez Cayo Beans.")
                        ErrorNotify("Cayo Beans", "Vous n'êtes pas employé chez Cayo Beans.")
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local dist = #(coords - processZone)

        if dist < markerDist then
            sleep = 0
            DrawMarker(1, processZone.x, processZone.y, processZone.z - 1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.2, 0, 255, 172, 102, false, true, 2, false, nil, nil, false)

            if dist < interactDist then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour traiter les graines")

                if IsControlJustReleased(0, 38) then
                    local xPlayer = ESX.GetPlayerData()
                    if xPlayer.job and xPlayer.job.name == "cayobeans" then
                        TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
                        Citizen.Wait(4000)
                        ClearPedTasksImmediately(playerPed)
                        TriggerServerEvent("pso_cayobeans::process_bean")
                        SuccessNotify("Cayo Beans", "Vous avez traité vos graines de café.")
                        -- ESX.ShowNotification("~g~Vous avez traité vos graines~s~")
                    else
                        ErrorNotify("Cayo Beans", "Vous n'êtes pas employé chez Cayo Beans.")
                        -- ESX.ShowNotification("~r~Vous n'êtes pas employé chez Cayo Beans.")
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

-------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 167) then
            local playerData = ESX.GetPlayerData()
            if playerData.job and playerData.job.name == "cayobeans" then
                lib.showContext('F6:CayoBeans')
            else
                
            end
        end
    end
end)

---------------------------------------------

RegisterNetEvent("pso_cayobeans::take_mule")
AddEventHandler("pso_cayobeans::take_mule", function()
    if takeMule == false then
        takeMule = true
        local vehicleModel = "mule3"
        local spawnCoords = vec4(5384.4672851562, -5185.798828125, 31.051193237305, 137.48374938965)
        local modelHash = GetHashKey(vehicleModel)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end
        local veh = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)
        SetEntityAsMissionEntity(veh, true, true)
        SetVehicleNumberPlateText(veh, "CAYOBEANS")
        SetPedIntoVehicle(PlayerPedId(), veh, -1)

        SetModelAsNoLongerNeeded(modelHash)
    else
        ErrorNotify("Garage", "Vous avez déjà sorti une Mule.")
        -- ESX.ShowNotification("~r~Vous avez déjà sorti une Mule")
    end
end)

----------------------------------------------

local unloadZone = vector3(5384.224609375, -5185.2036132812, 31.061288833618)
local markerDist = 20.0
local interactDist = 3.0

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local dist = #(coords - unloadZone)

        if dist < markerDist then
            sleep = 0
            DrawMarker(1, unloadZone.x, unloadZone.y, unloadZone.z - 1.0,
                0, 0, 0, 0, 0, 0,
                5.5, 5.5, 0.5,
                255, 0, 0, 120, false, true, 2, false, nil, nil, false)

            if dist < interactDist then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ranger votre véhicule de service")

                if IsControlJustReleased(0, 38) then
                    local xPlayer = ESX.GetPlayerData()
                    if xPlayer.job and xPlayer.job.name == "cayobeans" then
                        local veh = GetVehiclePedIsIn(playerPed, false)
                        if veh ~= 0 then
                            if GetPedInVehicleSeat(veh, -1) ~= playerPed then
                                ErrorNotify("Garage", "Vous devez être conducteur du véhicule.")
                                -- ESX.ShowNotification("~r~Vous devez être conducteur du véhicule.")
                                goto continue
                            end
                            if IsVehicleModel(veh, `mule3`) then
                                TaskLeaveVehicle(playerPed, veh, 0)
                                Citizen.Wait(2000)
                                TriggerServerEvent("pso_cayobeans::deleteVehicle", VehToNet(veh))
                                takeMule = false
                            else
                                ErrorNotify("Garage", "Ce n'est pas un véhicule de service")
                                -- ESX.ShowNotification("~r~Ce n'est pas un véhicule de service")
                            end
                        else
                            ErrorNotify("Garage", "Vous devez être dans un véhicule pour effectuer cette action.")
                            -- ESX.ShowNotification("~r~Vous devez être dans un véhicule pour effectuer cette action.")
                        end
                    else
                        ErrorNotify("Garage", "Vous n'êtes pas employé chez Cayo Beans.")
                        -- ESX.ShowNotification("~r~Vous n'êtes pas employé chez Cayo Beans.")
                    end
                end
            end
        end
        ::continue::
        Citizen.Wait(sleep)
    end
end)
