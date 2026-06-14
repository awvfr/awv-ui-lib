local Config = {}

function Config.Save(data)
    writefile("config.txt", game:GetService("HttpService"):JSONEncode(data))
end

function Config.Load()
    if readfile and isfile("config.txt") then
        return game:GetService("HttpService"):JSONDecode(readfile("config.txt"))
    end
end

return Config