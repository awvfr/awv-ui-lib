local HttpService = game:GetService("HttpService")

local ConfigAPI = {}

function ConfigAPI.Save(data)
    writefile("ui_config.json", HttpService:JSONEncode(data))
end

function ConfigAPI.Load()
    if isfile("ui_config.json") then
        return HttpService:JSONDecode(readfile("ui_config.json"))
    end
end

return ConfigAPI