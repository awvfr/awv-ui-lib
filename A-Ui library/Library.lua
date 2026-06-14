local Library = {}

-- 📌 Core modules
Library.Core = script:WaitForChild("Core")
Library.Elements = script:WaitForChild("Elements")
Library.Services = script:WaitForChild("Services")
Library.Engine = script:WaitForChild("Engine")
Library.Input = script:WaitForChild("Input")
Library.Visuals = script:WaitForChild("Visuals")
Library.Themes = script:WaitForChild("Themes")
Library.Plugins = script:WaitForChild("Plugins")
Library.Notifications = script:WaitForChild("Notifications")
Library.Network = script:WaitForChild("Network")

-- 🏷️ Branding (IMPORTANT)
local Branding = require(script.Core:WaitForChild("Branding"))
Library.Branding = Branding

-- 🪟 Create window
function Library:CreateWindow(title)
    return require(self.Core.Window).new(title, self)
end

-- 🔔 Notifications shortcut
function Library:Notify(text)
    return require(self.Notifications.Notification).new(text)
end

-- 🧩 Plugins init
function Library:InitPlugins()
    require(self.Plugins.PluginLoader):Init(self)
end

-- 🏷️ Optional helper (prints info)
function Library:PrintInfo()
    print("📦 " .. self.Branding.Name)
    print("🔢 Version: " .. self.Branding.Version)
    print("👤 Author: " .. self.Branding.Author)
end

return Library