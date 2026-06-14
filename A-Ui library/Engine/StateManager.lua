local StateManager = {}

StateManager.States = {}

function StateManager:Set(id, value)
    self.States[id] = value
end

function StateManager:Get(id)
    return self.States[id]
end

return StateManager