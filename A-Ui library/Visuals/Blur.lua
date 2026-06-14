local Blur = {}

function Blur.Apply(frame)

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1,0,1,0)
    bg.BackgroundTransparency = 0.5
    bg.BackgroundColor3 = Color3.fromRGB(255,255,255)
    bg.Parent = frame

    Instance.new("UICorner", bg).CornerRadius = UDim.new(0,12)

    return bg
end

return Blur