local KeyAuth = {}

function KeyAuth.Check(url, key)

    local success, response = pcall(function()
        return game:HttpGet(url .. "?key=" .. key)
    end)

    if not success then return false end

    return response == "VALID"
end

return KeyAuth