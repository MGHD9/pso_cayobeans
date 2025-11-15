RegisterNetEvent('CayoBeans::AnnonceOuverture')
AddEventHandler('CayoBeans::AnnonceOuverture', function()
    ESX.ShowAdvancedNotification("~y~Cayo Beans~s~", "Annonce", "L'entreprise ~y~Cayo Beans~s~ viens ~g~d'ouvrir~s~ !", "DIA_GARDENING")
    -- Adapter ici a votre façon les notifications
end)

RegisterNetEvent('CayoBeans::AnnonceFermeture')
AddEventHandler('CayoBeans::AnnonceFermeture', function()
    ESX.ShowAdvancedNotification("~y~Cayo Beans~s~", "Annonce", "L'entreprise ~y~Cayo Beans~s~ viens de ~r~fermer~s~ !", "DIA_GARDENING")
    -- Adapter ici a votre façon les notifications
end)




-- Pas toucher
function SuccessNotify(message, description)
    lib.notify({
    title = message,
    description = description,
    type = 'success'
})
end

function ErrorNotify(message, description)
    lib.notify({
    title = message,
    description = description,
    icon = 'ban',
    iconColor = '#C53030'
})
end