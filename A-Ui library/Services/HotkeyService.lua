local UserInputService = game:GetService("UserInputService")

local HotkeyService = {}
HotkeyService.Bindings = {}

function HotkeyService:Bind(key, callback)
    self.Bindings[key] = callback
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end

    for key, callback in pairs(HotkeyService.Bindings) do
        if input.KeyCode == key then
            callback()
        end
    end
end)

return HotkeyService