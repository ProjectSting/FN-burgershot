local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("FN-burgershot:server:fatura:jogador")
AddEventHandler("FN-burgershot:server:fatura:jogador", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                    ['@citizenid'] = billed.PlayerData.citizenid,
                    ['@amount'] = amount,
                    ['@society'] = biller.PlayerData.job.name,
                    ['@sender'] = biller.PlayerData.charinfo.firstname
                })
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Invoice sent'})
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You receive an invoice')
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You cannot send an invoice to yourself'})
            end
        else
           TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This person is not online'})
        end
end)

RegisterServerEvent("FN-burgershot:server:fatura:jogador2")
AddEventHandler("FN-burgershot:server:fatura:jogador2", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                    ['@citizenid'] = billed.PlayerData.citizenid,
                    ['@amount'] = amount,
                    ['@society'] = biller.PlayerData.job.name,
                    ['@sender'] = biller.PlayerData.charinfo.firstname
                })
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Invoice sent'})
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You receive an invoice')
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You cannot send an invoice to yourself'})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This person is not online'})
        end
end)


QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrmoneyshot', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local lettuce = player.Functions.GetItemByName("alface")
    local meat = player.Functions.GetItemByName("carne_feita")
    local bun = player.Functions.GetItemByName("pao_hamburger")
    local tomato = player.Functions.GetItemByName("tomate_cortado")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrtorpedo', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local meat = player.Functions.GetItemByName("carne_feita")
    local bun = player.Functions.GetItemByName("pao_hamburger")
    if meat ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrheartstopper', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local bun = player.Functions.GetItemByName("pao_hamburger")
    local tomato = player.Functions.GetItemByName("tomate_cortado")
    local meat = player.Functions.GetItemByName("carne_feita")
    local lettuce = player.Functions.GetItemByName("alface")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbleeder', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local bun = player.Functions.GetItemByName("pao_hamburger")
    local tomato = player.Functions.GetItemByName("tomate_cortado")
    local meat = player.Functions.GetItemByName("carne_feita")
    local lettuce = player.Functions.GetItemByName("alface")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbatata', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("batata_cortada")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrcarne', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local carne = player.Functions.GetItemByName("carne_crua")
    if carne ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrtomate', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local tomate = player.Functions.GetItemByName("tomate")
    local faca = player.Functions.GetItemByName("faca_cozinha")
    if tomate ~= nil and faca ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbatata_cortar', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("batata_crua")
    local faca = player.Functions.GetItemByName("faca_cozinha")
    if batata ~= nil and faca ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbatata_lavar', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("batata_suja")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:copobebida', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("copogrande")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:copobebidapequeno', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("copopequeno")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)
