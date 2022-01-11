local blips = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        if not blips then
            generateBlips()
            blips = true
        else
            Citizen.Wait(10000)
        end
    end
end)

function generateBlips()
    if PL.ActivateSingle then
        for k, v in pairs(PL.BlipsSingle) do
            x = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipDisplay(x, 4)
            SetBlipSprite(x, v.sprite)
            SetBlipColour(x, v.color)
            SetBlipScale(x, v.scale)
            SetBlipAsShortRange(x, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.name)
            EndTextCommandSetBlipName(x)
        end
    end

    if PL.ActivateRadius then
        for k, v in pairs(PL.BlipsRadius) do
            x = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
            SetBlipSprite(x, v.sprite)
            SetBlipColour(x, v.color)
            SetBlipAlpha(x, v.transparency)
        end
    end
end