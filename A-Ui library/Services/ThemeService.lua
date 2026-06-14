local ThemeService = {}

ThemeService.Themes = {
    Dark = Color3.fromRGB(25,25,25),
    Light = Color3.fromRGB(240,240,240),
    Neon = Color3.fromRGB(0,255,200)
}

function ThemeService:Get(name)
    return self.Themes[name]
end

return ThemeService