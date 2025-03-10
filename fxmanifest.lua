fx_version 'cerulean'
game 'gta5'

description 'QB-AdminMenu Converted to ESX By PulseScripts'
version '1.2.1'

ui_page 'html/index.html'

shared_scripts {
    'locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

client_scripts {
    '@menuv/menuv.lua',
    'client/noclip.lua',
    'client/entity_view.lua',
    'client/blipsnames.lua',
    'client/client.lua',
    'client/events.lua',
    'entityhashes/entity.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

files { -- Credits to https://github.com/LVRP-BEN/bl_coords for clipboard copy method
    'html/index.html',
    'html/index.js'
}

dependency 'menuv'

lua54 'yes'
