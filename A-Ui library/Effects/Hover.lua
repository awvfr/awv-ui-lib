local TweenService = game:GetService("TweenService")

local Hover = {}

function Hover.Apply(button)
    local normalSize = button.Size

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            Size = UDim2.new(normalSize.X.Scale, normalSize.X.Offset + 3,
                             normalSize.Y.Scale, normalSize.Y.Offset + 3)
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            Size = normalSize
        }):Play()
    end)
end

return Hover