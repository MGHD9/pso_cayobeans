function Facturation()
    local input = lib.inputDialog('Facturation', {'Montant de la facture'})
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if not input or not input[1] then
        return
    end

    local amount = tonumber(input[1])

    if not amount or amount <= 0 then
        ErrorNotify("Facturation", "Veuillez entrer un montant valide")
        -- ESX.ShowNotification('Veuillez entrer un montant valide')
        return
    end

    if closestPlayer == -1 or closestDistance > 3.0 then
        ErrorNotify("Facturation", "Aucun joueur à proximité !")
        -- ESX.ShowNotification('~r~Aucun joueur à proximité !~s~')
    else
        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_cayobeans', 'Cayo Beans', amount)
        -- Vous pouvez modifiez le système de facture si vous utilisez un script que esx_billing.

        SuccessNotify("Facturation", "Facture envoyée à la personne la plus proche.")
        -- ESX.ShowNotification(('Facture de ~g~$%s~s~ envoyée'):format(amount))
    end
end

