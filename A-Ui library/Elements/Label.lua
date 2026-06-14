local Label = {}

function Label.new(section, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 25)
    label.Text = text
    label.BackgroundTransparency = 1
    label.Parent = section.Frame

    return label
end

return Label