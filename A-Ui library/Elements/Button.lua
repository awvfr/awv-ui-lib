local Button = {}

function Button.new(section, text, callback)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Text = text
    btn.Parent = section.Frame

    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)

    return btn
end

return Button