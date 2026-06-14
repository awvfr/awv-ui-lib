local Dropdown = {}

function Dropdown.new(section, options, callback)
    local selected = options[1]

    local btn = Instance.new("TextButton")
    btn.Text = selected
    btn.Parent = section.Frame

    btn.MouseButton1Click:Connect(function()
        local i = table.find(options, selected) or 1
        selected = options[(i % #options) + 1]
        btn.Text = selected
        if callback then callback(selected) end
    end)

    return btn
end

return Dropdown