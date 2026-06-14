local Tab = {}
Tab.__index = Tab

function Tab.new(name, window)
    local self = setmetatable({}, Tab)

    self.Name = name
    self.Window = window

    self.Frame = Instance.new("Frame")
    self.Frame.Size = UDim2.new(1,0,1,0)
    self.Frame.BackgroundTransparency = 1
    self.Frame.Parent = window.Main

    return self
end

function Tab:CreateSection(name)
    local Section = require(script.Parent.Section).new(name, self)
    return Section
end

return Tab