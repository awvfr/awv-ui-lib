local TweenService = game:GetService("TweenService")

local Tween = {}

function Tween.Play(obj, props, time)
    local tween = TweenService:Create(
        obj,
        TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        props
    )

    tween:Play()
    return tween
end

return Tween