
local ESX = exports['es_extended']:getSharedObject()
StaffGroups = {
	'superadmin',
	'admin',
	'mod',
}
local frozen = false
local permissions = {
    ['kill'] = 'admin',
    ['ban'] = 'admin',
    ['noclip'] = 'admin',
    ['kickall'] = 'admin',
    ['kick'] = 'admin',
    ["revive"] = "admin",
    ["freeze"] = "admin",
    ["goto"] = "admin",
    ["spectate"] = "admin",
    ["intovehicle"] = "admin",
    ["bring"] = "admin",
    ["inventory"] = "admin",
    ["clothing"] = "admin"
}
local players = {}




-- Get Players
ESX.RegisterServerCallback('adminmenu:getplayers', function(_, cb) -- WORKS
    cb(players)
end)


ESX.RegisterServerCallback('adminmenu:retrievevehicles', function(source, cb)
    local vehicles = {}

    MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(result)
        for _, vehicle in ipairs(result) do
            local category = vehicle.category
            if vehicles[category] == nil then
                vehicles[category] = {}
            end
            vehicles[category][vehicle.name] = {
                name = vehicle.name,
                model = vehicle.model,
                category = vehicle.category
            }
        end

        cb(vehicles)
    end)
end)






-- Functions
local function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

local function BanPlayer(src)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        GetPlayerName(src),
        ESX.GetIdentifier(src, 'license'),
        ESX.GetIdentifier(src, 'discord'),
        ESX.GetIdentifier(src, 'ip'),
        "Trying to revive theirselves or other players",
        2147483647,
        'qb-adminmenu'
    })
    TriggerEvent('qb-log:server:CreateLog', 'adminmenu', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(src), 'qb-adminmenu', "Trying to trigger admin options which they dont have permission for"), true)
    DropPlayer(src, 'You were permanently banned by the server for: Exploiting')
end

-- Events
RegisterNetEvent('qb-admin:server:GetPlayersForBlips', function()
    local src = source
    TriggerClientEvent('qb-admin:client:Show', src, players)
end)

RegisterNetEvent('qb-admin:server:kill', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer)  then
        TriggerClientEvent('esx:killPlayer', player.id)
    else
       BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:revive', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = player.id
    if isAdmin(xPlayer)  then
        if GetResourceState('esx_ambulancejob') == 'started' then
		    TriggerClientEvent('esx_ambulancejob:revive',playerId)
        elseif GetResourceState('ars_ambulancejob') == 'started' then
            local data = {}
            data.revive = true
            TriggerClientEvent('ars_ambulancejob:healPlayer',playerId,data)
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:selfrevive', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if isAdmin(xPlayer)  then
        if GetResourceState('esx_ambulancejob') == 'started' then
		    TriggerClientEvent('esx_ambulancejob:revive',xPlayer)
        elseif GetResourceState('ars_ambulancejob') == 'started' then
            local data = {}
            data.revive = true
            TriggerClientEvent('ars_ambulancejob:healPlayer',source,data)
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:kick', function(player, reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        
        DropPlayer(player.id, Lang:t("info.kicked_server") .. ':\n' .. reason .. '\n\n' .. Lang:t("info.check_discord"))
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:ban', function(player, time, reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date('*t', banTime)
        MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            GetPlayerName(player.id),
            ESX.GetIdentifier(player.id, 'license'),
            discord == nil,
            ip == nil,
            reason,
            banTime,
            GetPlayerName(src)
        })
        TriggerClientEvent('chat:addMessage', -1, {
            template = "<div class=chat-message server'><strong>ANNOUNCEMENT | {0} has been banned:</strong> {1}</div>",
            args = {GetPlayerName(player.id), reason}
        })
        
        if banTime >= 2147483647 then
            DropPlayer(player.id, Lang:t("info.banned") .. '\n' .. reason .. Lang:t("info.ban_perm"))
        else
            DropPlayer(player.id, Lang:t("info.banned") .. '\n' .. reason .. Lang:t("info.ban_expires") .. timeTable['day'] .. '/' .. timeTable['month'] .. '/' .. timeTable['year'] .. ' ' .. timeTable['hour'] .. ':' .. timeTable['min'] .. '\n🔸 Check our Discord for more information: ')
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:spectate', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local targetped = GetPlayerPed(player.id)
        local coords = GetEntityCoords(targetped)
        TriggerClientEvent('qb-admin:client:spectate', src, targetped, coords)
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:freeze', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local target = GetPlayerPed(player.id)
        if not frozen then
            frozen = true
            FreezeEntityPosition(target, true)
        else
            frozen = false
            FreezeEntityPosition(target, false)
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:goto', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local admin = GetPlayerPed(src)
        local coords = GetEntityCoords(GetPlayerPed(player.id))
        SetEntityCoords(admin, coords)
    else
       BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:intovehicle', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local admin = GetPlayerPed(src)
        local targetPed = GetPlayerPed(player.id)
        local vehicle = GetVehiclePedIsIn(targetPed,false)
        local seat = -1
        if vehicle ~= 0 then
            for i=0,8,1 do
                if GetPedInVehicleSeat(vehicle,i) == 0 then
                    seat = i
                    break
                end
            end
            if seat ~= -1 then
                SetPedIntoVehicle(admin,vehicle,seat)
                
                TriggerClientEvent('esx:showNotification', src, "Sucessfully Entered Vehicle")
            else
                TriggerClientEvent('esx:showNotification', src, "The vehicle has no free seats")
            end
        end
    else
        BanPlayer(src)
    end
end)


RegisterNetEvent('qb-admin:server:bring', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local admin = GetPlayerPed(src)
        local coords = GetEntityCoords(admin)
        local target = GetPlayerPed(player.id)
        SetEntityCoords(target, coords)
    else
       BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:inventory', function(player)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if isAdmin(xPlayer) then
        if GetResourceState('ox_inventory') == 'started' then
            exports.ox_inventory:forceOpenInventory(source, 'player', tonumber(player.id))
        else
            --Add Your Own Inventory
        end
    else
        BanPlayer(src)
    end
end)

RegisterNetEvent('qb-admin:server:cloth', function(player)
    local src = source
    if GetResourceState('illenium-appearance') == 'started' then
        TriggerClientEvent("illenium-appearance:client:openClothingShopMenu", player.id, true)
    elseif GetResourceState('fivem-appearance') == 'started' then
        exports['fivem-appearance']:startPlayerCustomization(player.id)
    elseif GetResourceState('esx_skin') == 'started' then
        TriggerClientEvent("esx_skin:openSaveableMenu",player.id)
    end
end)


RegisterNetEvent('qb-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        if ESX.Functions.IsOptin(src) then
            TriggerClientEvent('chat:addMessage', src, {
                color = {255, 0, 0},
                multiline = true,
                args = {Lang:t("info.admin_report")..name..' ('..targetSrc..')', msg}
            })
        end
    end
end)

RegisterServerEvent('adminmenu:giveWeapon', function(weapon)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        exports.ox_inventory:AddItem(src, weapon, 1)
    else
        BanPlayer(src)
    end
end)

RegisterServerEvent('adminmenu:dvspawn', function()
    local ped = GetPlayerPed(source)
    local pedVehicle = GetVehiclePedIsIn(ped, false)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        if DoesEntityExist(pedVehicle) then
            DeleteEntity(pedVehicle)
            TriggerClientEvent('esx:showNotification', source, 'Vehicle deleted')
        else
            TriggerClientEvent('esx:showNotification', source, 'No vehicle to delete')
        end
    else
        BanPlayer(source)
    end
end)

RegisterServerEvent('adminmenu:maxmods', function()
    local ped = GetPlayerPed(source)
    local pedVehicle = GetVehiclePedIsIn(ped, false)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        if DoesEntityExist(pedVehicle) then
            local src = source
            xPlayer.triggerEvent('qb-admin:client:maxmodVehicle', src)
        else
            TriggerClientEvent('esx:showNotification', source, 'No vehicle to max mod')
        end
    else
        BanPlayer(source)
    end
end)

RegisterServerEvent('adminmenu:kickall', function(args)
    local ped = GetPlayerPed(source)
    local pedVehicle = GetVehiclePedIsIn(ped, false)
    local xPlayer = ESX.GetPlayerFromId(source)
    local reason = table.concat(args, ' ')
    if isAdmin(xPlayer) then
        if reason and reason ~= '' then
            for _, v in pairs(ESX.GetPlayers()) do
                local Player = ESX.GetPlayerFromId(v)
                if Player then
                    DropPlayer(Player.source, reason)
                end
            end
        else
            TriggerClientEvent('esx:showNotification', source, "No reason specified")
        end
    else
        BanPlayer(source)
    end
end)

RegisterServerEvent('adminmenu:announce', function(args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local msg = table.concat(args, ' ')
        if msg == '' then return end
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Announcement", msg}
        })
    else
        BanPlayer(source)
    end
end)

RegisterServerEvent('qb-admin:setownership')
AddEventHandler('qb-admin:setownership', function (vehicleProps, playerID, vehicleType)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
        MySQL.Async.execute(
            'INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type) VALUES (@owner, @plate, @vehicle, @stored, @type)',
            {
                ['@owner'] = xPlayer.identifier,
                ['@plate'] = vehicleProps.plate,
                ['@vehicle'] = json.encode(vehicleProps),
                ['@stored'] = 1,
                ['@type'] = 'car'
            },
            function ()
                TriggerClientEvent('esx:showNotification', playerID, 'You received a car with the plate: ' .. string.upper(vehicleProps.plate))

            end)
end)


CreateThread(function()
    while true do
        local tempPlayers = {}
        for _, v in ipairs(GetPlayers()) do
            local targetped = GetPlayerPed(v)
            local ped = ESX.GetPlayerFromId(v)
            tempPlayers[#tempPlayers + 1] = {
                name = GetPlayerName(v),
                id = v,
                coords = GetEntityCoords(targetped),
                cid = v,
                citizenid = 'ABC123',
                sources = GetPlayerPed(v),
                sourceplayer = v
            }
        end
        table.sort(tempPlayers, function(a, b)
            return a.id < b.id
        end)
        players = tempPlayers
        Wait(1000)
    end
end)


ESX.RegisterServerCallback('adminmenu:GetPlayerPermissions', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local isAdmin = isAdmin(xPlayer)
    cb(isAdmin)
end)

function isAdmin(xPlayer)
	for k,v in ipairs(StaffGroups) do
		if xPlayer.getGroup() == v then
			return true 
		end
	end
	return false
end

local WaterMark = function()
    SetTimeout(1500, function()
        print('^1[qb-adminmenu] ^2This Script was converted by PulseScripts^0')
        print('^1[qb-adminmenu] ^2If you encounter any issues please Join the discord https://discord.gg/c6gXmtEf3H to get support..^0')

    end)
end
WaterMark()