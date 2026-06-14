local Input = {}

function Input.new(section, placeholder, callback)
    local box = Instance.new("TextBox")
    box.PlaceholderText = placeholder
    box.Parent = section.Frame

    box.FocusLost:Connect(function()
        if callback then callback(box.Text) end
    end)

    return box
end

return Input