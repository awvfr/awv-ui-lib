local Acrylic = {}

function Acrylic.Apply(frame)
    local blur = Instance.new("Frame")
    blur.Size = UDim2.new(1,0,1,0)
    blur.BackgroundTransparency = 0.4
    blur.BackgroundColor3 = Color3.fromRGB(255,255,255)
    blur.ZIndex = frame.ZIndex - 1
    blur.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = blur

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1
    stroke.Transparency = 0.6
    stroke.Color = Color3.fromRGB(255,255,255)
    stroke.Parent = blur

    return blur
end

return Acrylic