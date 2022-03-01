CreateThread(function()
    generateBlips()
end)

function generateBlips()
    if PL.ActivateSingle then
        for _, v in pairs(PL.BlipsSingle) do
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

    if PL.ActivateRadius then
        for _, v in pairs(PL.BlipsRadius) do
            blip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
            SetBlipSprite(blip, v.sprite)
            SetBlipColour(blip, v.color)
            SetBlipAlpha(blip, v.transparency)
        end
    end
end