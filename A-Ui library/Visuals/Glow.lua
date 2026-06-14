local Glow = {}

function Glow.Apply(frame)

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Transparency = 0.4
    stroke.Color = Color3.fromRGB(0,170,255)
    stroke.Parent = frame

    task.spawn(function()
        while true do
            stroke.Transparency = math.random(2,6) / 10
            task.wait(0.2)
        end
    end)
end

return Glow