local UserInputService = game:GetService("UserInputService")

local Slider = {}

function Slider.new(section, min, max, callback)

    local value = min

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1, -10, 0, 20)
    bar.BackgroundColor3 = Color3.fromRGB(40,40,40)
    bar.Parent = section.Frame

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0,0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(0,170,255)
    fill.Parent = bar

    local dragging = false

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)

    bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end

        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

            local percent = math.clamp(input.Position.X / bar.AbsoluteSize.X, 0, 1)

            value = math.floor(min + (max - min) * percent)
            fill.Size = UDim2.new(percent, 0, 1, 0)

            if callback then callback(value) end
        end
    end)

    return bar
end

return Slider