local Toggle = {}

function Toggle.new(section, text, callback)
    local state = false

    local btn = Instance.new("TextButton")
    btn.Text = text .. ": OFF"
    btn.Parent = section.Frame

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. (state and ": ON" or ": OFF")
        if callback then callback(state) end
    end)

    return btn
end

return Toggle