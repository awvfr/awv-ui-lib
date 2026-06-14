local Slider = {}

function Slider.new(section, min, max, callback)
    local value = min

    local btn = Instance.new("TextButton")
    btn.Text = "Value: " .. value
    btn.Parent = section.Frame

    btn.MouseButton1Click:Connect(function()
        value = math.clamp(value + 1, min, max)
        btn.Text = "Value: " .. value
        if callback then callback(value) end
    end)

    return btn
end

return Slider