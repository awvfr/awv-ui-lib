local Section = {}
Section.__index = Section

function Section.new(name, tab)
    local self = setmetatable({}, Section)

    self.Name = name
    self.Tab = tab

    self.Frame = Instance.new("Frame")
    self.Frame.Size = UDim2.new(1, -20, 0, 200)
    self.Frame.BackgroundTransparency = 0.2
    self.Frame.Parent = tab.Frame

    Instance.new("UICorner", self.Frame)

    return self
end

function Section:AddButton(text, callback)
    return require(game.ReplicatedStorage.UI.Elements.Button).new(self, text, callback)
end

return Section