local PluginLoader = {}

PluginLoader.Plugins = {}

function PluginLoader:Load(func)
    table.insert(self.Plugins, func)
end

function PluginLoader:Init(lib)
    for _, plugin in ipairs(self.Plugins) do
        plugin(lib)
    end
end

return PluginLoader