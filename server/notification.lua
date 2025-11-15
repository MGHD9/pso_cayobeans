RegisterNetEvent('pso_cayobeans::OuvertureCayoBeans')
AddEventHandler('pso_cayobeans::OuvertureCayoBeans', function()
    TriggerClientEvent('CayoBeans::AnnonceOuverture', -1)
end)

RegisterNetEvent('pso_cayobeans::FermetureCayoBeans')
AddEventHandler('pso_cayobeans::FermetureCayoBeans', function()
    TriggerClientEvent('CayoBeans::AnnonceFermeture', -1)
end)