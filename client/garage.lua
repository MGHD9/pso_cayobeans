lib.registerContext({
    id = 'cayobeans::garage_menu',
    title = 'Garage',
    options = {
        {
            title = 'Sortir une Mule',
            icon = 'fa-solid fa-truck',
            onSelect = function()
                TriggerServerEvent("pso_cayobeans::take_mule")
            end
        },
    }
})

local npcModel = "a_m_m_hillbilly_01"
local npcCoords = vec3(5388.7661132812, -5189.4604492188, 30.382036209106)
local npcHeading = 50.0

Citizen.CreateThread(function()
    local modelHash = GetHashKey(npcModel)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(10)
    end

    local npc = CreatePed(4, modelHash, npcCoords.x, npcCoords.y, npcCoords.z, npcHeading, false, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetPedFleeAttributes(npc, 0, 0)
    SetPedCombatAttributes(npc, 17, true)
    SetPedCanRagdoll(npc, false)
    SetPedCanEvasiveDive(npc, false)
    TaskStandStill(npc, -1)
    
    if ESX.PlayerData.job.name == "cayobeans" then
        exports.ox_target:addBoxZone({
        coords = npcCoords,
        size = vec3(1, 1, 3),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'cayobeans_garage_pnj',
                label = 'Ouvrir le garage',
                icon = 'fa-solid fa-warehouse',
                onSelect = function()
                    lib.showContext('cayobeans::garage_menu')
                end
            }
        }
    })
    end
end)
