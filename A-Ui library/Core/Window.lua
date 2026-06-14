local Window = {}
Window.__index = Window

------------------------------------------------
-- CREATE WINDOW
------------------------------------------------
function Window.new(config)
    local self = setmetatable({}, Window)

    config = config or {}

    self.Name = config.Name or "UI Window"
    self.Theme = config.Theme or "Neon"
    self.Tabs = {}

    -- SCREEN GUI
    self.ScreenGui = Instance.new("ScreenGui")
    self.ScreenGui.Name = self.Name
    self.ScreenGui.ResetOnSpawn = false
    self.ScreenGui.Parent = game:GetService("CoreGui")

    -- MAIN FRAME
    self.MainFrame = Instance.new("Frame")
    self.MainFrame.Size = UDim2.new(0, 520, 0, 360)
    self.MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
    self.MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    self.MainFrame.BorderSizePixel = 0
    self.MainFrame.Parent = self.ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = self.MainFrame

    -- HEADER
    self.Header = Instance.new("Frame")
    self.Header.Size = UDim2.new(1, 0, 0, 35)
    self.Header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.Header.BorderSizePixel = 0
    self.Header.Parent = self.MainFrame

    Instance.new("UICorner", self.Header).CornerRadius = UDim.new(0, 10)

    return self
end

------------------------------------------------
-- TAB SYSTEM (basic container)
------------------------------------------------
function Window:CreateTab(name)
    local tab = {
        Name = name,
        Elements = {}
    }

    table.insert(self.Tabs, tab)
    return tab
end

------------------------------------------------
-- 🧩 BRAND TAG SYSTEM
------------------------------------------------
function Window:CreateBrandTag(config)
    config = config or {}

    local text = config.Text or "AWV UI"
    local icon = config.Icon or "sparkles"
    local radius = config.Radius or 10

    local colors = {
        Color3.fromRGB(0, 170, 255),
        Color3.fromRGB(255, 140, 0),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(255, 105, 180),
        Color3.fromRGB(170, 0, 255),
        Color3.fromRGB(255, 255, 0)
    }

    local tag = Instance.new("Frame")
    tag.Size = UDim2.new(0, 230, 0, 34)
    tag.Position = UDim2.new(0, 10, 0, 10)
    tag.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    tag.BorderSizePixel = 0
    tag.Parent = self.ScreenGui

    Instance.new("UICorner", tag).CornerRadius = UDim.new(0, radius)

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = colors[1]
    stroke.Parent = tag

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 40, 1, 0)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = "[" .. icon .. "]"
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 14
    iconLabel.Parent = tag

    local label = Instance.new("TextLabel")
    label.Position = UDim2.new(0, 40, 0, 0)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = tag

    -- 🌈 NEON PULSE
    task.spawn(function()
        local i = 1
        while tag.Parent do
            stroke.Color = colors[i]
            i += 1
            if i > #colors then i = 1 end
            task.wait(0.35)
        end
    end)

    return tag
end

------------------------------------------------
-- 🫧 MINIMIZE SYSTEM (BUBBLE)
------------------------------------------------
function Window:EnableMinimizeSystem()
    local main = self.MainFrame
    local root = self.ScreenGui

    -- MINIMIZE BUTTON
    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 30, 0, 30)
    minBtn.Position = UDim2.new(1, -35, 0, 3)
    minBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    minBtn.Text = "-"
    minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 18
    minBtn.BorderSizePixel = 0
    minBtn.Parent = self.Header

    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

    -- BUBBLE
    local bubble = Instance.new("TextButton")
    bubble.Size = UDim2.new(0, 55, 0, 55)
    bubble.Position = UDim2.new(0.5, 0, 0.5, 0)
    bubble.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    bubble.Text = "UI"
    bubble.TextColor3 = Color3.fromRGB(255, 255, 255)
    bubble.Font = Enum.Font.GothamBold
    bubble.TextSize = 12
    bubble.Visible = false
    bubble.Parent = root

    Instance.new("UICorner", bubble).CornerRadius = UDim.new(1, 0)

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0, 170, 255)
    stroke.Parent = bubble

    -- DRAG SYSTEM
    local dragging = false
    local dragStart
    local startPos
    local UIS = game:GetService("UserInputService")

    local function update(input)
        local delta = input.Position - dragStart
        bubble.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end

    bubble.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = bubble.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    bubble.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local dragInput = input

            UIS.InputChanged:Connect(function(i)
                if i == dragInput and dragging then
                    update(i)
                end
            end)
        end
    end)

    -- TOGGLE LOGIC
    minBtn.MouseButton1Click:Connect(function()
        main.Visible = false
        bubble.Visible = true
    end)

    bubble.MouseButton1Click:Connect(function()
        main.Visible = true
        bubble.Visible = false
    end)
end

return Window