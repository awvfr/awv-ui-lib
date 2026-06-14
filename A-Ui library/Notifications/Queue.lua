local Queue = {}

Queue.List = {}

function Queue:Add(notification)
    table.insert(self.List, notification)
    self:Update()
end

function Queue:Update()
    for i, notif in ipairs(self.List) do
        notif.Frame.Position = UDim2.new(1, -220, 0, (i - 1) * 60)
    end
end

return Queue