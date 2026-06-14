local LoaderUI = {}

function LoaderUI.Create()
    local gui = Instance.new("ScreenGui")
    gui.Name = "LoaderUI"
    gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 120)
    frame.Position = UDim2.new(0.5, -150, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    frame.Parent = gui

    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local text = Instance.new("TextLabel")
    text.Text = "Loading UI Library..."
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Parent = frame

    return gui, frame
end

return LoaderUI