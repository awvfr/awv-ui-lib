local Registry = {}

Registry.Elements = {}

function Registry:Register(name, module)
    self.Elements[name] = module
end

function Registry:Get(name)
    return self.Elements[name]
end

return Registry