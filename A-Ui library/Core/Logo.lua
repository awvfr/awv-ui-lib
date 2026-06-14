local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local Logo = {}

function Logo.Create(parent, imageId, text)

    -- 🟦 Full screen intro layer
    local screen = Instance.new("Frame")
    screen.Size = UDim2.new(1,0,1,0)
    screen.BackgroundColor3 = Color3.fromRGB(0,0,0)
    screen.BackgroundTransparency = 1
    screen.Parent = parent

    -- 🧊 Logo container (center)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 0, 0, 0)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundTransparency = 1
    container.Parent = screen

    -- 🖼 Image logo
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, 80, 0, 80)
    icon.Position = UDim2.new(0.5, 0, 0.4, 0)
    icon.AnchorPoint = Vector2.new(0.5, 0.5)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://" .. tostring(imageId)
    icon.ImageTransparency = 1
    icon.Parent = container

    -- ✨ Glow effect
    local glow = Instance.new("UIStroke")
    glow.Thickness = 2
    glow.Transparency = 1
    glow.Color = Color3.fromRGB(0,170,255)
    glow.Parent = icon

    -- 🏷 Text
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 300, 0, 30)
    label.Position = UDim2.new(0.5, 0, 0.65, 0)
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.BackgroundTransparency = 1
    label.Text = text or "UI Library"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 20
    label.Parent = container

    -- 🌈 INTRO ANIMATION

    -- background fade in
    TweenService:Create(screen, TweenInfo.new(0.4), {
        BackgroundTransparency = 0.3
    }):Play()

    -- scale in container
    container.Size = UDim2.new(0, 0, 0, 0)

    TweenService:Create(container, TweenInfo.new(0.6, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 200, 0, 200)
    }):Play()

    -- icon fade in
    TweenService:Create(icon, TweenInfo.new(0.6), {
        ImageTransparency = 0
    }):Play()

    -- glow fade in
    TweenService:Create(glow, TweenInfo.new(0.6), {
        Transparency = 0.3
    }):Play()

    -- text fade in
    TweenService:Create(label, TweenInfo.new(0.6), {
        TextTransparency = 0
    }):Play()

    -- 🌊 floating animation
    task.spawn(function()
        while screen.Parent do
            TweenService:Create(icon, TweenInfo.new(1), {
                Position = UDim2.new(0.5, 0, 0.4, -5)
            }):Play()
            task.wait(1)

            TweenService:Create(icon, TweenInfo.new(1), {
                Position = UDim2.new(0.5, 0, 0.4, 5)
            }):Play()
            task.wait(1)
        end
    end)

    -- ⏳ exit animation (after 2.5 sec)
    task.delay(2.5, function()

        TweenService:Create(screen, TweenInfo.new(0.5), {
            BackgroundTransparency = 1
        }):Play()

        TweenService:Create(container, TweenInfo.new(0.5), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()

        task.wait(0.5)
        screen:Destroy()
    end)

    return screen
end

return Logo