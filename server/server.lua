local recolteZone = vector3(5375.16, -5248.59, 33.43)
local garageZone = vec3(5388.16, -5189.08, 31.31)

RegisterNetEvent("pso_cayobeans::give_bean")
AddEventHandler("pso_cayobeans::give_bean", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local pedcoords = xPlayer.getCoords(true)
    if #(pedcoords - recolteZone) > 15.0 then
        print(("[CayoBeans] [Anti-Cheat] Le joueur %s a tenté de tricher (give hors zone)."):format(src))
        --DropPlayer(src, 'Tentative de triche détectée.')
        return
    end

    if xPlayer and xPlayer.job.name == "cayobeans" then
        xPlayer.addInventoryItem("coffee_bean", 5)
    else
        print(("[CayoBeans] [Anti-Cheat] Le joueur %s sans job cayobeans a tenté la récolte."):format(src))
        --DropPlayer(src, 'Tentative de triche détectée.')
    end
end)

RegisterNetEvent("pso_cayobeans::process_bean")
AddEventHandler("pso_cayobeans::process_bean", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and xPlayer.job.name == "cayobeans" then
        local beans = xPlayer.getInventoryItem("coffee_bean").count

        if beans >= 5 then
            xPlayer.removeInventoryItem("coffee_bean", 5)
            xPlayer.addInventoryItem("cm_coffee", 1)
            xPlayer.showNotification("~g~Vous avez transformé 5 graines de café en 1 café.")
        else
            xPlayer.showNotification("~r~Vous n'avez pas assez de graines de café (5 nécessaires).")
        end
    end
end)

RegisterNetEvent("pso_cayobeans::take_mule")
AddEventHandler("pso_cayobeans::take_mule", function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local ped = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(ped)
    if #(playerCoords - garageZone) > 20.0 then
        print(("[CayoBeans] [Anti-Cheat] Le joueur %s a tenté d'ouvrir le garage'"):format(src))
        --DropPlayer(src, 'Tentative de trigger')
        return
    end
    if xPlayer and xPlayer.job.name == "cayobeans" then
        TriggerClientEvent("pso_cayobeans::take_mule", src)
    end
end)

RegisterNetEvent("pso_cayobeans::deleteVehicle")
AddEventHandler("pso_cayobeans::deleteVehicle", function(netId)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or xPlayer.job.name ~= "cayobeans" then
        print(("[CayoBeans] [Anti-Cheat] Le joueur %s a tenté de supprimer un véhicule sans job valide !"):format(GetPlayerName(src)))
        return
    end
    local veh = NetworkGetEntityFromNetworkId(netId)
    if veh and DoesEntityExist(veh) then
        DeleteEntity(veh)
        TriggerClientEvent('esx:showNotification', src, "Le véhicule a été rangé")
        print(("[CayoBeans] %s (%s) a rangé un son véhicule de service."):format(GetPlayerName(src), src))
    else
        TriggerClientEvent('esx:showNotification', src, "~r~Aucun véhicule trouvé.")
    end
end)