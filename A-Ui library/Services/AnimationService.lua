local TweenService = game:GetService("TweenService")

local AnimationService = {}

function AnimationService:FadeIn(frame)
    frame.BackgroundTransparency = 1

    TweenService:Create(frame, TweenInfo.new(0.25), {
        BackgroundTransparency = 0
    }):Play()
end

function AnimationService:Pop(frame)
    frame.Size = frame.Size - UDim2.new(0,10,0,10)

    TweenService:Create(frame, TweenInfo.new(0.2), {
        Size = frame.Size + UDim2.new(0,10,0,10)
    }):Play()
end

return AnimationService