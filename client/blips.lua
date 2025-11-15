Citizen.CreateThread(function()
    local blip = AddBlipForCoord(5404.0317382812, -5213.150390625, 34.013698577881)
    SetBlipSprite(blip, 89)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 31)

    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("~y~Cayo Beans~s~")
    EndTextCommandSetBlipName(blip)
end)


-------------------------

function SetRecolteBlip()
    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(Config.Blip.RecolteCoords)
        SetBlipSprite(blip, 89)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 30)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~b~Récolte~s~ | ~y~Cayo Beans~s~")
        EndTextCommandSetBlipName(blip)
    end)
end

function SetTraitementBlip()
    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(Config.Blip.TraitementCoords)
        SetBlipSprite(blip, 89)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 30)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("~b~Traitement~s~ | ~y~Cayo Beans~s~")
        EndTextCommandSetBlipName(blip)
    end)
end


