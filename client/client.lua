local player = PlayerPedId()

TriggerServerEvent('CheckSteamHex')

RegisterNetEvent('SteamHexAuthorized')
AddEventHandler('SteamHexAuthorized', function(isAuthorized)
    if isAuthorized then
        Authorize = true
    else
        Authorize = false
    end
end)

CreateThread(function()
    while true do
        Wait(0)

        local _, currentWeapon = GetCurrentPedWeapon(PlayerPedId(), true)

        if Config.WeaponBlacklist then
            local function isWeaponBlackList(model)
                for _, BlacklistWeapon in ipairs(Config.BlacklistWeapons) do
                    if currentWeapon == BlacklistWeapon then
                        return true
                    end
                end
                return false
            end

            if isWeaponBlackList(currentWeapon) and not Authorize then
                SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)

                if Config.Notification.Enable then
                    TriggerEvent("chat:addMessage", {color = Config.Notification.TitleColor, multiline = true, args = {Config.Notification.Title, Config.Notification.WeaponText}})
                end

                if Config.Debug then
                print("Weapon Blacklist")
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)

        if Config.HorseBlacklist then
            local function isHorseBlackList(model)
                for _, BlacklistHorse in ipairs(Config.BlacklistHorses) do
                    if model == BlacklistHorse then
                        return true
                    end
                end
                return false
            end

            if IsPedOnMount(player) then
                local mount = GetMount(player)
                local model = GetEntityModel(mount)

                if isHorseBlackList(model) and not Authorize then
                    TaskDismountAnimal(player, 0, 0, 0, 0, mount)

                    if Config.Notification.Enable then
                        TriggerEvent("chat:addMessage", {color = Config.Notification.TitleColor, multiline = true, args = {Config.Notification.Title, Config.Notification.HorseText}})
                    end

                    if Config.Debug then
                    print("The player was taken down from the horse")
                    end
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)

        if Config.VehicleBlacklist then
            local function isVehicleBlackList(model)
                for _, BlacklistVehicle in ipairs(Config.BlacklistVehicles) do
                    if model == BlacklistVehicle then
                        return true
                    end
                end
                return false
            end

            if IsPedInAnyVehicle(player, false) then
                local vehicle = GetVehiclePedIsIn(player, false)
                local model = GetEntityModel(vehicle)

                if isVehicleBlackList(model) and not Authorize then
                    TaskLeaveVehicle(player, vehicle, 0)

                    if Config.Notification.Enable then
                        TriggerEvent("chat:addMessage", {color = Config.Notification.TitleColor, multiline = true, args = {Config.Notification.Title, Config.Notification.VehicleText}})
                    end

                    if Config.Debug then
                    print("The player was taken down from the vehicle")
                    end
                end
            end
        end
    end
end)