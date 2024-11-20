Config = {}

Config.Debug = false -- Dont make true on Live Server

Config.WeaponBlacklist = true
Config.BlacklistWeapons = {`Weapon_Revolver_Navy_Crossover`, `Weapon_Revolver_Cattleman_Mexican`}

Config.HorseBlacklist = true
Config.BlacklistHorses = {`A_C_Horse_Arabian_Black`}

Config.VehicleBlacklist = true
Config.BlacklistVehicles = {`warwagon2`, `breach_cannon`, `hotchkiss_cannon`, `gatling_gun`, `gatlingmaxim02`, `handcart`, `smuggler02`}

Config.Notification = {
    Enable = true,
    TitleColor = {255, 0, 0}, -- Default Red
    Title = "[Server]",
    WeaponText = "You can't use this weapon",
    HorseText = "You can't ride this horse",
    VehicleText = "You can't ride this vehicle"
}

Config.AuthorizedSteamHex = {
	"steam:1000000000a0000"
}