local function InitializeBlips()
	for i = 1, #Config.BlipsRadius do
		local v = Config.BlipsRadius[i]
		local blip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
		SetBlipSprite(blip, v.sprite)
		SetBlipColour(blip, v.color)
		SetBlipAlpha(blip, v.transparency)
	end

	for i = 1, #Config.BlipsSingle do
		local v = Config.BlipsSingle[i]
		blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
		SetBlipDisplay(blip, 4)
		SetBlipSprite(blip, v.sprite)
		SetBlipColour(blip, v.color)
		SetBlipScale(blip, v.scale)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.name)
		EndTextCommandSetBlipName(blip)
	end
end

local function NewBlip(data)
	if not data then return false end

	local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
	SetBlipDisplay(blip, 4)
	SetBlipSprite(blip, data.sprite or 16)
	SetBlipColour(blip, data.color or 1)
	SetBlipScale(blip, data.scale or 0.7)
	SetBlipAsShortRange(blip, data.shortRange or true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(data.name or "Blip")
	EndTextCommandSetBlipName(blip)

	return blip
end exports("NewBlip", NewBlip)

CreateThread(function()
    InitializeBlips()
end)
