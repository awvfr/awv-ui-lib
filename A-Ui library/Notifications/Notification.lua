local TweenService = game:GetService("TweenService")

local Notification = {}

function Notification.new(text, queue)

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    frame.Parent = game.Players.LocalPlayer.PlayerGui

    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Parent = frame

    local self = {}
    self.Frame = frame

    TweenService:Create(frame, TweenInfo.new(0.3), {
        Position = UDim2.new(1, -220, 0, 0)
    }):Play()

    queue:Add(self)

    task.delay(3, function()
        frame:Destroy()
    end)

    return self
end

return Notification