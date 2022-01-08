ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)






local blacklistweapons = {
    'WEAPON_RPG',
    'WEAPON_DAGGER',
    'WEAPON_BAT',
    'WEAPON_BOTTLE',
    'WEAPON_CROWBAR',
    'WEAPON_FLASHLIGHT',
    'WEAPON_GOLFCLUB',
    'WEAPON_HAMMER',
    'WEAPON_HATCHET',
    'WEAPON_KNUCKLE',
    'WEAPON_knife',
    'WEAPON_MACHETE',
    'WEAPON_SWITCHBLADE',
    'WEAPON_NIGHTSTICK',
    'WEAPONN_WRENCH',
    'WEAPON_BATTLEAXE',
    'WEAPON_POOLCUE',
    'WEAPON_STONE_HATCHET',
    'WEAPON_RAYPISTOL',
    'WEAPON_TAZER',
    'WEAPON_RAYCARBINE',
    'WEAPON_MUSKET',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_PUMPSHOTGUNMK2',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_COMBATSHOTGUN',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_MARKSMANRIFLE_MK2',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_GRANDELAUNCHER_SMOKE',
    'WEAPON_MINIGUN',
    'WEAPON_FIREWORK',
    'WEAPONn_RAILGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_RAYMINIGUN',
    'WEAPON_EMPLAUNCHER',
    'WEAPON_GRNADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_STICKYBOMB',
    'WEAPON_PROXMINE',
    'WEAPON_PIPEBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_FLARE'
}

local webhook = "" --Please fill in with your webhook here


RegisterServerEvent('fuego:checkblacklistedweapon')
AddEventHandler('fuego:checkblacklistedweapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if checkforweapon() then
        removeWeapon()
    end
end)

function removeWeapon()
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in pairs (blacklistweapons) do
        if xPlayer.hasWeapon(v) then
            xPlayer.removeWeapon(v)
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds={{title="Fuego Black Listed Weapons System",description="\n **"..xPlayer.name.."** had a blacklisted weapon \nThe weapon was : **<<"..v..">>**",color=7419530}}}), { ['Content-Type'] = 'application/json' })
            xPlayer.removeWeapon(v)
      end
  end 
end

function checkforweapon()                           --I Check before actualy removing for thread reasons, feel free to experiment 
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in pairs (blacklistweapons) do
        if xPlayer.hasWeapon(v) then
            return true
    end
  end 
  return false
end
