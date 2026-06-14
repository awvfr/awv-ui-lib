local SearchBar = {}

function SearchBar.new(section, elements)

    local box = Instance.new("TextBox")
    box.PlaceholderText = "Search..."
    box.Parent = section.Frame

    box:GetPropertyChangedSignal("Text"):Connect(function()

        local query = box.Text:lower()

        for _, element in pairs(elements) do
            if element.Text and element.Text:lower():find(query) then
                element.Visible = true
            else
                element.Visible = false
            end
        end
    end)

    return box
end

return SearchBar