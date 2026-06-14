local UI = {}

function UI.Create(onSubmit)
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.Players.LocalPlayer.PlayerGui

    local box = Instance.new("TextBox")
    box.PlaceholderText = "Enter Key"
    box.Parent = gui

    local btn = Instance.new("TextButton")
    btn.Text = "Submit"
    btn.Parent = gui

    btn.MouseButton1Click:Connect(function()
        onSubmit(box.Text)
    end)

    return gui
end

return UI