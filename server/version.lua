CreateThread(function()
	Wait(4000)
	local resource_name = GetCurrentResourceName()
	local current_version = GetResourceMetadata(resource_name, 'version', 0)

	PerformHttpRequest('https://raw.githubusercontent.com/Re1ease/'..resource_name..'/main/version.json', function(errors, result, header)
		if not result then print('^1Version check disabled.^0') return end
		result = json.decode(result)

		if current_version < result.version then
			print("[^4NEW UPDATE^0] ["..current_version.."] -> [^4"..result.version.."^0]")
			print("[^4INFO^0] "..result.note)
		elseif current_version > result.version then
			print("[^4ERROR^0] ["..current_version.."] -> [^4"..result.version.."^0]")
			print("[^4INFO^0] ".."Incorrect Version")
		end
	end, 'GET')
end)