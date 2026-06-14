local UserInputService = game:GetService("UserInputService")

local KeyListener = {}

function KeyListener.Bind(key, callback)

    UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end

        if input.KeyCode == key then
            callback()
        end
    end)
end

return KeyListener