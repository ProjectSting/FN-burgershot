local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "burgershot" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
      Wait(100)
   end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    Blip = AddBlipForCoord(-1180.54, -882.29, 13.84)
    SetBlipSprite (Blip, 106)
    SetBlipDisplay(Blip, 4)
    SetBlipScale  (Blip, 0.5)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BurgerShot")
    EndTextCommandSetBlipName(Blip)
end) 

RegisterNetEvent("FN-burgershot:entrar_servico")
AddEventHandler("FN-burgershot:entrar_servico", function()
    if onDuty ~= true then
        QBCore.Functions.Progressbar('entrar_servico', 'Entering service...', 1500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            onDuty = not onDuty
            TriggerServerEvent("QBCore:ToggleDuty")
        end, function ()
        end)
    else
        QBCore.Functions.Progressbar('sair_serviço', 'Leaving service...', 1500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            onDuty = not onDuty
            TriggerServerEvent("QBCore:ToggleDuty")
        end, function ()
        end)
    end
end)

RegisterNetEvent("FN-burgershot:tabuleiro1")
AddEventHandler("FN-burgershot:tabuleiro1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Tabuleiro1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tabuleiro1", {
        maxweight = 20000,
        slots = 6,
    })
end)

RegisterNetEvent("FN-burgershot:tabuleiro2")
AddEventHandler("FN-burgershot:tabuleiro2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Tabuleiro2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tabuleiro2", {
        maxweight = 20000,
        slots = 6,
    })
end)

RegisterNetEvent("FN-burgershot:tabuleiro3")
AddEventHandler("FN-burgershot:tabuleiro3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Tabuleiro3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tabuleiro3", {
        maxweight = 20000,
        slots = 6,
    })
end)

RegisterNetEvent("FN-burgershot:congelador")
AddEventHandler("FN-burgershot:congelador", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Congelador")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Congelador", {
        maxweight = 100000,
        slots = 10,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:Frigorifico1")
AddEventHandler("FN-burgershot:Frigorifico1", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Frigorifico1")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Frigorifico1", {
        maxweight = 150000,
        slots = 20,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:Frigorifico2")
AddEventHandler("FN-burgershot:Frigorifico2", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Frigorifico2")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Frigorifico2", {
        maxweight = 150000,
        slots = 20,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:Frigorifico3")
AddEventHandler("FN-burgershot:Frigorifico3", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Frigorifico3")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Frigorifico3", {
        maxweight = 150000,
        slots = 20,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent('FN-burgershot:minifridge', function()
    local authorizedItems = {
        label = 'Mini Fridge',
        slots = 30,
        items = {}
    }
    local index = 1
    for _, armoryItem in pairs(config.Items.items) do
        authorizedItems.items[index] = armoryItem
        authorizedItems.items[index].slot = index
        index = index + 1
    end
    QBCore.Functions.Progressbar('mini_fridge', 'Opening the minifridge...', 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", authorizedItems)
    end, function ()
    end)
end)

RegisterNetEvent("FN-burgershot:MoneyShot")
AddEventHandler("FN-burgershot:MoneyShot", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrmoneyshot', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_moneyshot", "Making the moneyshot...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "carne_feita", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "alface", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "pao_hamburger", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tomate_cortado", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "moneyshot", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                exports['mythic_notify']:DoHudText('error ', Lang.dontingr)
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:Torpedo")
AddEventHandler("FN-burgershot:Torpedo", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrtorpedo', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_Torpedo", "Making the Torpedo..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "carne_feita", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "pao_hamburger", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "torpedo", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:heartstopper")
AddEventHandler("FN-burgershot:heartstopper", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrheartstopper', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_heartstopper", "Making the heartstopper...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "pao_hamburger", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tomate_cortado", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "alface", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "carne_feita", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "heartstopper", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end	
    end
end)

RegisterNetEvent("FN-burgershot:bleeder")
AddEventHandler("FN-burgershot:bleeder", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbleeder', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_bleeder", "Making the bleeder...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "pao_hamburger", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tomate_cortado", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "alface", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "carne_feita", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "heartstopper", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:fazerbatatas")
AddEventHandler("FN-burgershot:fazerbatatas", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbatata', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_batatas", "Making fries...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "batata_cortada", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "batatas_fritas", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end	
    end
end)

RegisterNetEvent("FN-burgershot:fazer_hamburgers")
AddEventHandler("FN-burgershot:fazer_hamburgers", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrcarne', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_hamburger", "Making hamburgers...", 5000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerServerEvent('QBCore:Server:RemoveItem', "carne_crua", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "carne_feita", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:cortar_tomates")
AddEventHandler("FN-burgershot:cortar_tomates", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrtomate', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"cozinheiro"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("Cortar_tomates", "Cutting the tomatoes...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "tomate", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "tomate_cortado", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavetomatos, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavetomatos)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)


RegisterNetEvent("FN-burgershot:cortar_batatas")
AddEventHandler("FN-burgershot:cortar_batatas", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbatata_cortar', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"cozinheiro"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("Cortar_batata", "Cutting the potato...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "batata_crua", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "batata_cortada", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavepotatoes, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavepotatoes)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:lavar_merdas")
AddEventHandler("FN-burgershot:lavar_merdas", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbatata_lavar', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"petting"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("lavar_batatas", "Washing the potatoes...", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "batata_suja", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "batata_crua", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.potatoestowash, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.potatoestowash)
                end
			end
		end)
	else
        if config.notify == 'qbcore' then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == 'mythic' then
             exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tamanhobebidas")
AddEventHandler("FN-burgershot:tamanhobebidas", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "• Grande",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:menubebidasgrande",
                }
            },
            {
                header = "• Pequeno",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:menubebidaspequeno",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:menubebidasgrande")
AddEventHandler("FN-burgershot:menubebidasgrande", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "Make drinks",
                isMenuHeader = true,
            },
            {
                header = "• Coca cola",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:fazer_colagrande",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:menubebidaspequeno")
AddEventHandler("FN-burgershot:menubebidaspequeno", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "Make drinks",
                isMenuHeader = true,
            },
            {
                header = "• Coca cola",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:fazer_colapequeno",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)


RegisterNetEvent("FN-burgershot:fazer_colagrande")
AddEventHandler("FN-burgershot:fazer_colagrande", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:copobebida', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"wait6"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_cola", "Making a coca cola...", 3500, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "copogrande", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "bebida_pequena", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavecup, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavecup)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:fazer_colapequeno")
AddEventHandler("FN-burgershot:fazer_colapequeno", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:copobebidapequeno', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"wait6"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_cola", "Making a coca cola...", 3500, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('QBCore:Server:RemoveItem', "copopequeno", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "cocacola", 1)
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavecup, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavecup)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tirarcopos")
AddEventHandler("FN-burgershot:tirarcopos", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "• Grande",
                txt = "Take a big cup",
                params = {
                    event ="FN-burgershot:copogrande",
                }
            },
            {
                header = "• Pequeno",
                txt = "Take a small cup",
                params = {
                    event ="FN-burgershot:copopequeno",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:copogrande")
AddEventHandler("FN-burgershot:copogrande", function()
    if onDuty then
		Working = true
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		TriggerEvent('inventory:client:busy:status', true)
		QBCore.Functions.Progressbar("tirar_copo", "Taking a cup...", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
		}, {
		}, {}, {}, function()
			Working = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			TriggerEvent('inventory:client:busy:status', false)
            TriggerServerEvent('QBCore:Server:AddItem', "copogrande", 1)
		end, function()
			TriggerEvent('inventory:client:busy:status', false)
			Working = false
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:copopequeno")
AddEventHandler("FN-burgershot:copopequeno", function()
    if onDuty then
		Working = true
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		TriggerEvent('inventory:client:busy:status', true)
		QBCore.Functions.Progressbar("tirar_copo", "Taking a cup...", 5000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
		}, {
		}, {}, {}, function()
			Working = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			TriggerEvent('inventory:client:busy:status', false)
            TriggerServerEvent('QBCore:Server:AddItem', "copopequeno", 1)
		end, function()
			TriggerEvent('inventory:client:busy:status', false)
			Working = false
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:fazerhamburguer")
AddEventHandler("FN-burgershot:fazerhamburguer", function()
    if onDuty == true then
        exports['qb-menu']:openMenu({
            {
                header = "Make hamburgers",
                isMenuHeader = true,
            },
            {
                header = "• Moneyshot",
                txt = "Bread, Meat, Tomato, Lettuce",
                params = {
                    event ="FN-burgershot:MoneyShot",
                }
            },
            {
                header = "• Torpedo",
                txt = "bread, meat",
                params = {
                    event ="FN-burgershot:Torpedo",
                }
            },
            {
                header = "• Bleeder",
                txt = "Bread, Tomato, Lettuce, Meat",
                params = {
                    event ="FN-burgershot:bleeder",
                }
            },
            {
                header = "• Heartstopper",
                txt = "Bread, Tomato, Lettuce, Meat",
                params = {
                    event ="FN-burgershot:heartstopper",
                }
            },
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:cortarmerdas")
AddEventHandler("FN-burgershot:cortarmerdas", function()
    if onDuty == true then
        exports['qb-menu']:openMenu({
            {
                header = "Cut shit",
                isMenuHeader = true,
            },
            {
                header = "• Tomato",
                txt = "Cut the tomato",
                params = {
                    event ="FN-burgershot:cortar_tomates",
                }
            },
            {
                header = "• Potatoes",
                txt = "Cut the potatoes",
                params = {
                    event ="FN-burgershot:cortar_batatas",
                }
            },
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:lavarmerdas")
AddEventHandler("FN-burgershot:lavarmerdas", function()
    if onDuty == true then
        exports['qb-menu']:openMenu({
            {
                header = "Wash shit",
                isMenuHeader = true,
            },
            {
                header = "• Potato",
                txt = "Wash the potato",
                params = {
                    event ="FN-burgershot:lavar_merdas",
                }
            },
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent('FN-burgershot:client:dinheiro', function(args)
    local dialog = exports['qb-input']:ShowInput({
        header = "Invoice",
        submitText = "Bill Player",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'paypal id'
            }
        }
    })
    if dialog then
        if args == 1 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[1].preco)
        elseif args == 2 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[2].preco)
        elseif args == 3 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[3].preco)
        elseif args == 4 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[4].preco)
        end
    end
end)

RegisterNetEvent('FN-burgershot:client:dinheiro2', function(args)
    local dialog = exports['qb-input']:ShowInput({
        header = "Invoice",
        submitText = "Bill Player",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'preco',
                text = 'Price'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'Paypal ID'
            }
        }
    })
    if dialog then
        if args == 5 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, dialog.preco)
        end
    end
end)

RegisterNetEvent("FN-burgershot:tirar_donut1")
AddEventHandler("FN-burgershot:tirar_donut1", function()
    if onDuty then
			Working = true
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
			TriggerEvent('inventory:client:busy:status', true)
			QBCore.Functions.Progressbar("tirar_donut", "Taking a donut out", 3500, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
			}, {}, {}, function()
				Working = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
				TriggerEvent('inventory:client:busy:status', false)
                TriggerServerEvent('QBCore:Server:AddItem', "donut1", 1)
			end, function()
				TriggerEvent('inventory:client:busy:status', false)
				Working = false
			end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tirar_donut2")
AddEventHandler("FN-burgershot:tirar_donut2", function()
    if onDuty then
			Working = true
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
			TriggerEvent('inventory:client:busy:status', true)
			QBCore.Functions.Progressbar("tirar_donut", "Taking a donut out", 3500, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
			}, {}, {}, function()
				Working = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
				TriggerEvent('inventory:client:busy:status', false)
                TriggerServerEvent('QBCore:Server:AddItem', "donut2", 1)
			end, function()
				TriggerEvent('inventory:client:busy:status', false)
				Working = false
			end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tirar_donut3")
AddEventHandler("FN-burgershot:tirar_donut3", function()
    if onDuty then
			Working = true
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
			TriggerEvent('inventory:client:busy:status', true)
			QBCore.Functions.Progressbar("tirar_donut", "Taking a donut out", 3500, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
			}, {}, {}, function()
				Working = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
				TriggerEvent('inventory:client:busy:status', false)
                TriggerServerEvent('QBCore:Server:AddItem', "donut3", 1)
			end, function()
				TriggerEvent('inventory:client:busy:status', false)
				Working = false
			end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)
RegisterNetEvent("FN-burgershot:tirardonut")
AddEventHandler("FN-burgershot:tirardonut", function()
    exports['qb-menu']:openMenu({
        {
            header = "Donuts",
            isMenuHeader = true,
        },
        {
            header = "Donut",
            txt = "Normal Donut",
            params = {
                event ="FN-burgershot:tirar_donut1",
            }
        },
        {
            header = "Strawberry donut",
            txt = "Strawberry donut with nuggets",
            params = {
                event ="FN-burgershot:tirar_donut2",
            }
        },
        {
            header = "Chocolate donut",
            txt = "Chocolate donut with nuggets",
            params = {
                event ="FN-burgershot:tirar_donut3",
            }
        },
    })
end)

RegisterNetEvent("FN-burgershot:fatura")
AddEventHandler("FN-burgershot:fatura", function()
    exports['qb-menu']:openMenu({
        {
            header = "Cash Registers",
            isMenuHeader = true,
        },
        {
            header = "HeartStopper Menu",
            txt = "1x Heartstopper, 1x Chips, 1x Drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 1
            }
        },
        {
            header = "Bleeder Menu",
            txt = "1x Bleeder, 1x Chips, 1x Drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 2
            }
        },
        {
            header = "Moneyshot Menu",
            txt = "1x Moneyshot, 1x Chips, 1x drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 3
            }
        },
        {
            header = "Torpedo Menu",
            txt = "1x Torpedo, 1x Chips, 1x Drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 4
            }
        },
        {
            header = "Extra option",
            txt = "If the customer asks for something that is not above",
            params = {
                event ="FN-burgershot:client:dinheiro2",
                args = 5
            }
        },
        {
            header = "Close menu",
            event = "qb-menu:closeMenu",
            icon = "fas fa-times-circle",
        },
    })
end)

RegisterNetEvent("FN-burgershot:tirarfaca")
AddEventHandler("FN-burgershot:tirarfaca", function()
    if onDuty then
            TriggerServerEvent('QBCore:Server:AddItem', "faca_cozinha", 1)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("Burgershot_serviço", vector3(-1195.65, -901.24, 14.5), 0.1, 0.2, {
        name = "Burgershot_serviço",
        heading = 305,
        debugPoly = false,
        minZ=14.40,
        maxZ=14.77,
    }, {
        options = {
            {
                event = "FN-burgershot:entrar_servico",
                icon = "far fa-file",
                label = "Enter/Exit Service",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_congelador", vector3(-1199.77, -903.93, 13.97), 0.6, 1.6, {
        name = "Burgershot_congelador",
        heading = 305,
        debugPoly = false,
        minZ=9.97,
        maxZ=13.97,
    }, {
        options = {
            {
                event = "FN-burgershot:congelador",
                icon = "fa-solid fa-box-archive",
                label = "Freezer",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_frigorifico1", vector3(-1200.77, -902.85, 13.97), 1.0, 1.2, {
        name = "Burgershot_frigorifico1",
        heading = 305,
        debugPoly = false,
        minZ=11.17,
        maxZ=15.17,
    }, {
        options = {
            {
                event = "FN-burgershot:Frigorifico1",
                icon = "fa-solid fa-box-archive",
                label = "Fridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_frigorifico2", vector3(-1201.4, -901.82, 13.97), 1.0, 1.2, {
        name = "Burgershot_frigorifico2",
        heading = 305,
        debugPoly = false,
        minZ=11.17,
        maxZ=15.17,
    }, {
        options = {
            {
                event = "FN-burgershot:Frigorifico2",
                icon = "fa-solid fa-box-archive",
                label = "Fridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_frigorifico3", vector3(-1202.15, -900.83, 13.97), 1, 1.2, {
        name = "Burgershot_frigorifico3",
        heading = 305,
        debugPoly = false,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:Frigorifico3",
                icon = "fa-solid fa-box-archive",
                label = "Fridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tabuleiro1", vector3(-1194.5, -893.76, 14.1), 0.4, 0.4, {
        name = "tabuleiro1",
        heading = 305,
        debugPoly = false,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:tabuleiro1",
                icon = "fa-solid fa-box-archive",
                label = "Board",
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tabuleiro2", vector3(-1193.38, -895.46, 14.1), 0.4, 0.4, {
        name = "tabuleiro2",
        heading = 305,
        debugPoly = false,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:tabuleiro2",
                icon = "fa-solid fa-box-archive",
                label = "Board",
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tabuleiro3", vector3(-1192.38, -896.94, 14.1), 0.4, 0.4, {
        name = "tabuleiro3",
        heading = 305,
        debugPoly = false,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:tabuleiro3",
                icon = "fa-solid fa-box-archive",
                label = "Board",
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("caixa_registradora3", vector3(-1192.93, -896.26, 14.1), 0.4, 0.4, {
        name = "caixa_registradora3",
        heading = 305,
        debugPoly = false,
        minZ=14,
        maxZ=14.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fatura",
                icon = "fas fa-credit-card",
                label = "Cash register",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("caixa_registradora2", vector3(-1193.94, -894.8, 14.1), 0.4, 0.4, {
        name = "caixa_registradora2",
        heading = 305,
        debugPoly = false,
        minZ=14,
        maxZ=14.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fatura",
                icon = "fas fa-credit-card",
                label = "Cash register",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("caixa_registradora1", vector3(-1194.95, -893.18, 14.1), 0.4, 0.4, {
        name = "caixa_registradora1",
        heading = 305,
        debugPoly = false,
        minZ=14,
        maxZ=14.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fatura",
                icon = "fas fa-credit-card",
                label = "Cash register",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_hamburger", vector3(-1196.55, -899.28, 13.89), 1, 0.4, {
        name = "fazer_hamburger",
        heading = 305,
        debugPoly = false,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fazerhamburguer",
                icon = "fas fa-burger",
                label = "Burgers",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_batatas", vector3(-1200.93, -896.76, 13.97), 0.6, 1.6, {
        name = "fazer_batatas",
        heading = 35,
        debugPoly = false,
        minZ=10.17,
        maxZ=14.17,
    }, {
        options = {
            {
                event = "FN-burgershot:fazerbatatas",
                icon = "fas fa-fries",
                label = "Make chips",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_hamburgers", vector3(-1198.25, -895.04, 13.97), 0.8, 1.4, {
        name = "fazer_hamburgers",
        heading = 35,
        debugPoly = false,
        minZ=9.97,
        maxZ=13.97,
    }, {
        options = {
            {
                event = "FN-burgershot:fazer_hamburgers",
                icon = "fas fa-burger",
                label = "Make hamburgers",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("cortarmerdas", vector3(-1197.08, -898.17, 13.97), 0.6, 1.4, {
        name = "cortarmerdas",
        heading = 215,
        debugPoly = false,
        minZ=10.17,
        maxZ=14.17,
    }, {
        options = {
            {
                event = "FN-burgershot:cortarmerdas",
                icon = "fas fa-burger",
                label = "Use counter",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("lavar_merdas", vector3(-1197.58, -902.82, 13.97), 0.6, 0.8, {
        name = "lavar_merdas",
        heading = 215,
        debugPoly = false,
        minZ=9.97,
        maxZ=13.97,
    }, {
        options = {
            {
                event = "FN-burgershot:lavarmerdas",
                icon = "fas fa-water",
                label = "Wash shit",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tirar_copos", vector3(-1196.43, -894.9, 13.97), 0.2, 1, {
        name = "tirar_copos",
        heading = 305,
        debugPoly = false,
        minZ=13.80,
        maxZ=14.17,
    }, {
        options = {
            {
                event = "FN-burgershot:tirarcopos",
                icon = "",
                label = "Take cups",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_bebida", vector3(-1196.92, -894.96, 14.3), 0.5, 0.8, {
        name = "fazer_bebida",
        heading = 300, 
        debugPoly = false,
        minZ=13.77,
        maxZ=14.77
    }, {
        options = {
            {
                event = "FN-burgershot:tamanhobebidas",
                icon = "",
                label = "Make drinks",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tirar_donut", vector3(-1196.39, -895.67, 14.5), 0.2, 0.8, {
        name = "tirar_donut",
        heading = 305, 
        debugPoly = false,
        minZ=13.77,
        maxZ=14.77,
    }, {
        options = {
            {
                event = "FN-burgershot:tirardonut",
                icon = "fas fa-donut",
                label = "Take Donut's",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("minifridge", vector3(-1197.37, -894.4, 14.2), 0.6, 0.6, {
        name = "minifridge",
        heading = 305,
        debugPoly = false,
        minZ=13.77,
        maxZ=14.77,
    }, {
        options = {
            {
                event = "FN-burgershot:minifridge",
                icon = "fa-solid fa-box-archive",
                label = "Open Minifridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddCircleZone("minifridge", vector3(-1200.03, -895.64, 14.42), 0.3, {
        name = "minifridge",
        useZ=true,
    }, {
        options = {
            {
                event = "FN-burgershot:tirarfaca",
                icon = "",
                label = "Take knife",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end)