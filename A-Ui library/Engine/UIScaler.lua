local UIScaler = {}

function UIScaler.Apply(gui)
    local scale = Instance.new("UIScale")
    scale.Scale = 1
    scale.Parent = gui

    local camera = workspace.CurrentCamera

    local function update()
        local size = camera.ViewportSize

        if size.X < 600 then
            scale.Scale = 0.85
        elseif size.X < 900 then
            scale.Scale = 0.95
        else
            scale.Scale = 1
        end
    end

    camera:GetPropertyChangedSignal("ViewportSize"):Connect(update)
    update()
end

return UIScaler