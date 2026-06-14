local Paragraph = {}

function Paragraph.new(section, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 0, 60)
    label.Text = text
    label.TextWrapped = true
    label.BackgroundTransparency = 1
    label.Parent = section.Frame

    return label
end

return Paragraph