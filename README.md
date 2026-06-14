🧠 UILibrary (Full Documentation)
A modular Roblox UI framework with advanced window system, elements library, services architecture, themes, branding system, and minimize bubble UI.
🚀 Features
🪟 Window / Tab / Section system
🔘 Full UI Elements system
Button
Toggle
Slider
Input
Dropdown
Label
Paragraph
Keybind
Color Picker
Image
🧩 Service-based architecture
🎨 Theme system
✨ Effects system (Tween, Hover, Acrylic)
🧩 Plugin system
🫧 Minimize → draggable bubble system
🧩 Brand tag system
local Window = lib:Window({
    Name = "AWV Hub",
    Icon = 0,

    LoadingTitle = "AWV Interface Suite",
    LoadingSubtitle = "by AWV",

    ShowText = "AWV",

    Theme = "Neon",

    ToggleUIKeybind = "K",

    DisablePrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AWV_Hub",
        FileName = "Config"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = {
        Enabled = false,
        Title = "Key System",
        Subtitle = "Enter Key",
        Note = "Get key from Discord",
        FileName = "AWVKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"AWV123"}
    }
})
💾 Config saving system
🔑 Key system
📱 Mobile + PC support
🪟 Window System
📦 Usage
Lua
🫧 Minimize System (Bubble Mode)
Lua
Window:EnableMinimizeSystem()
🧩 Brand Tag System
Lua
Window:CreateBrandTag({
    Text = "AWV Hub",
    Icon = "sparkles",
    Radius = 10
})
📑 Tabs System
Lua
local Main = Window:CreateTab("Main")
local Misc = Window:CreateTab("Misc")
🔘 UI Elements System
🔘 Button
Lua
Main:AddButton({
    Name = "Click Me",
    Callback = function()
        print("Button clicked!")
    end
})
🔁 Toggle
Lua
Main:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(state)
        print("Toggle:", state)
    end
})
🎚 Slider
Lua
Main:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
⌨️ Input Box
Lua
Main:AddInput({
    Name = "Enter Text",
    Placeholder = "Type here...",
    Callback = function(text)
        print(text)
    end
})
📜 Label
Lua
Main:AddLabel("This is a label")
📄 Paragraph
Lua
Main:AddParagraph("Title", "This is a paragraph description")
📂 Dropdown
Lua
Main:AddDropdown({
    Name = "Select Option",
    Options = {"One", "Two", "Three"},
    Callback = function(value)
        print(value)
    end
})
🔑 Keybind
Lua
Main:AddKeybind({
    Name = "Toggle UI",
    Default = Enum.KeyCode.K,
    Callback = function()
        print("Key pressed")
    end
})
🎨 Color Picker
Lua
Main:AddColorPicker({
    Name = "Pick Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(color)
        print(color)
    end
})
🖼 Image
Lua
Main:AddImage({
    Asset = "rbxassetid://123456789",
    Size = UDim2.new(0, 100, 0, 100)
})
local Window = lib:Window({
    Name = "AWV Hub",
    Theme = "Neon"
})

Window:EnableMinimizeSystem()

Window:CreateBrandTag({
    Text = "AWV Hub",
    Icon = "sparkles",
    Radius = 10
})

local Main = Window:CreateTab("Main")

Main:AddButton({
    Name = "Test Button",
    Callback = function()
        print("Working!")
    end
})

Main:AddToggle({
    Name = "Auto Print",
    Default = false,
    Callback = function(v)
        print(v)
    end
})
⚡ Full Example Script
Lua# awv-ui-lib
