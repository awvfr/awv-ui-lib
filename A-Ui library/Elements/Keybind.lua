local UserInputService = game:GetService("UserInputService")

local Keybind = {}

function Keybind.new(section, defaultKey, callback)
    local key = defaultKey

    local btn = Instance.new("TextButton")
    btn.Text = "Key: " .. tostring(key)
    btn.Parent = section.Frame

    btn.MouseButton1Click:Connect(function()
        local conn
        conn = UserInputService.InputBegan:Connect(function(input)
            key = input.KeyCode
            btn.Text = "Key: " .. tostring(key)

            conn:Disconnect()
            if callback then callback(key) end
        end)
    end)

    return btn
end

return Keybind