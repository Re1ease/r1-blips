CreateThread(function()
	Wait(4000)
	local resource_name = GetCurrentResourceName()
	local current_version = GetResourceMetadata(resource_name, 'version', 0)

	PerformHttpRequest('https://raw.githubusercontent.com/Re1ease/'..resource_name..'/main/version.json', function(errors, result, header)
		if not result then print('^1Version check disabled.^0') return end
		result = json.decode(result)
		if current_version < result.version then
			print("[^2"..resource_name.."^0] [^4NEW UPDATE^0] ["..current_version.."] -> [^4"..result.version.."^0]")
			print("[^2"..resource_name.."^0] ^4Info: ^0"..result.note)
		else
			print("[^1"..resource_name.."^0] [^1ERROR^0] [^1"..current_version.."^0] -> [^2"..result.version.."^0]")
			print("[^1"..resource_name.."^0] ^4Info: ^0Resource version is incorrect.")
		end
	end, 'GET')
end)