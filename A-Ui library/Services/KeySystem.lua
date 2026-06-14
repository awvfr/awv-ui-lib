local KeySystem = {}
KeySystem.__index = KeySystem

function KeySystem.new(url)
    local self = setmetatable({}, KeySystem)
    self.URL = url
    return self
end

function KeySystem:Check(key)
    local res = game:HttpGet(self.URL .. "?key=" .. key)
    return res == "VALID"
end

return KeySystem