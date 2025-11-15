local ESX = exports["es_extended"]:getSharedObject()

lib.registerContext({
    id = 'F6:CayoBeans',
    title = 'Menu Cayo Beans',
    options = {
        {
            title = 'Gestion des annonces',
            icon = 'fa-regular fa-bell',
            description = 'Permet de gérer les annonces de l\'entreprise.',
            arrow = true,
            onSelect = function()
                lib.showContext('F6:CayoBeans_GA')
            end
        },
        {
            title = 'Afficher les blips',
            icon = 'fa-solid fa-circle-exclamation',
            description = 'Permet d\'afficher les points sur la carte',
            onSelect = function()
                SetRecolteBlip()
                SetTraitementBlip()
            end
        },
        {
            title = 'Donner une facture',
            icon = 'fa-solid fa-file-invoice',
            description = 'Permet de facturer une personne.',
            onSelect = function()
                Facturation()
            end
        },
    }
})

lib.registerContext({
    id = 'F6:CayoBeans_GA',
    title = 'Gestion des annonces',
    menu = 'F6:CayoBeans',
    options = {
        {
            title = 'Annonce d\'ouverture',
            description = 'Annoncer l\'ouverture de Cayo Beans dans toute la ville.',
            icon = 'fa-regular fa-bell',
            iconColor = 'green',
            onSelect = function()
                TriggerServerEvent('pso_cayobeans::OuvertureCayoBeans')
            end
        },
        {
            title = 'Annonce de fermeture',
            description = 'Annoncer la fermeture de Cayo Beans dans toute la ville.',
            icon = 'fa-regular fa-bell',
            iconColor = 'red',
            onSelect = function()
                TriggerServerEvent('pso_cayobeans::FermetureCayoBeans')
            end
        },
    }
})