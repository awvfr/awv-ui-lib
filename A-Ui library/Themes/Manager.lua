local Themes = require(game.ReplicatedStorage.UILibrary.Assets.Themes)

local Manager = {}

Manager.Current = "Dark"

function Manager:SetTheme(name, uiRoot)
    local theme = Themes[name]
    if not theme then return end

    self.Current = name

    -- apply recursively
    for _, obj in ipairs(uiRoot:GetDescendants()) do

        if obj:IsA("Frame") then
            obj.BackgroundColor3 = theme.Background
        end

        if obj:IsA("TextButton") or obj:IsA("TextLabel") then
            obj.TextColor3 = theme.Text
            obj.BackgroundColor3 = theme.Background
        end

        if obj:IsA("UIStroke") then
            obj.Color = theme.Stroke
        end

        if obj:IsA("UIGradient") then
            obj.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, theme.Accent),
                ColorSequenceKeypoint.new(1, theme.Background)
            })
        end
    end
end

function Manager:GetTheme()
    return Themes[self.Current]
end

return Manager