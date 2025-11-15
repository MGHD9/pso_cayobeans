local ESX = exports['es_extended']:getSharedObject()

---------------------------------------------------

local npcModel = "a_m_y_business_03"
local npcCoords = vec3(5385.05, -5194.23, 30.53)
local npcHeading = 52.51

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
                name = 'cayobeans_employe',
                label = 'Gérer les employés',
                icon = 'fa-solid fa-users',
                onSelect = function()
                    lib.showContext('')
                end
            },
            {
                name = 'cayobeans_salaire',
                label = 'Gérer les salaires',
                icon = 'fa-solid fa-money-check-dollar',
                onSelect = function()
                    lib.showContext('')
                end
            },
            {
                name = 'cayobeans_finance',
                label = 'Gérer les finances',
                icon = 'fa-solid fa-chart-line',
                onSelect = function()
                    lib.showContext('')
                end
            }
        }
    })
    end
end)
