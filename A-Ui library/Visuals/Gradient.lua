local TweenService = game:GetService("TweenService")

local Gradient = {}

function Gradient.Animate(frame)

    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,170,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,200))
    }
    grad.Parent = frame

    task.spawn(function()
        while true do
            TweenService:Create(grad, TweenInfo.new(2), {
                Rotation = grad.Rotation + 180
            }):Play()
            task.wait(2)
        end
    end)
end

return Gradient