fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'PSO Scripts'
description 'CayoBeans Job by FTA'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/cl_config.lua'
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
    'shared/sv_config.lua'
}