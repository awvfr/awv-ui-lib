local Library = {}

-- IMPORTANT: replace this with your REAL raw link
local Window = loadstring(game:HttpGet("Phttps://raw.githubusercontent.com/awvfr/awv-ui-lib/refs/heads/main/A-Ui%20library/Core/Window.lua"))()

function Library:Window(config)
    return Window.new(config)
end

return function()
    return Library
end
