local ColorPicker = {}

function ColorPicker.new(section, callback)
    local btn = Instance.new("TextButton")
    btn.Text = "Pick Color"
    btn.Parent = section.Frame

    local colors = {
        Color3.fromRGB(255,0,0),
        Color3.fromRGB(0,255,0),
        Color3.fromRGB(0,0,255),
        Color3.fromRGB(255,255,0)
    }

    local index = 1

    btn.MouseButton1Click:Connect(function()
        index = index + 1
        if index > #colors then index = 1 end

        btn.BackgroundColor3 = colors[index]
        if callback then callback(colors[index]) end
    end)

    return btn
end

return ColorPicker