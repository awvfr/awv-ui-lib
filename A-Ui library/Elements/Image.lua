local Image = {}

function Image.new(section, assetId)
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(1, -10, 0, 120)
    img.Image = assetId
    img.BackgroundTransparency = 1
    img.Parent = section.Frame

    return img
end

return Image