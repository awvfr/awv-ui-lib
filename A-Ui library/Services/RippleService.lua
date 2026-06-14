local TweenService = game:GetService("TweenService")

local RippleService = {}

function RippleService:Create(button)
    button.ClipsDescendants = true

    button.MouseButton1Click:Connect(function()
        local ripple = Instance.new("Frame")
        ripple.Size = UDim2.new(0,0,0,0)
        ripple.Position = UDim2.new(0.5,0,0.5,0)
        ripple.AnchorPoint = Vector2.new(0.5,0.5)
        ripple.BackgroundColor3 = Color3.fromRGB(255,255,255)
        ripple.BackgroundTransparency = 0.5
        ripple.Parent = button

        Instance.new("UICorner", ripple).CornerRadius = UDim.new(1,0)

        TweenService:Create(ripple, TweenInfo.new(0.4), {
            Size = UDim2.new(2,0,2,0),
            BackgroundTransparency = 1
        }):Play()

        task.delay(0.4, function()
            ripple:Destroy()
        end)
    end)
end

return RippleService