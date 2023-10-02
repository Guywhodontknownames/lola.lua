local highlightPart = script.Parent
local messageTextLabel = game.Workspace.MessageTextLabel -- Replace "MessageTextLabel" with the actual name of your TextLabel

-- Function to highlight a player
local function highlightPlayer(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            -- You can customize the appearance of the highlight here
            local highlight = Instance.new("SelectionBox")
            highlight.Adornee = humanoid.Parent
            highlight.Parent = game.Workspace
            highlight.LineThickness = 0.05
            highlight.Color3 = Color3.new(0, 1, 0) -- Green highlight color
            wait(5) -- Highlight for 5 seconds (you can adjust this)
            highlight:Destroy()
        end
    end
end

-- Function to display a message and highlight a player when they walk through the wall
local function onPlayerTouched(otherPart)
    local character = otherPart.Parent
    if character and character:IsA("Model") and character:IsDescendantOf(game.Players) then
        local player = game.Players:GetPlayerFromCharacter(character)
        if player then
            messageTextLabel.Text = player.Name .. " walked through the wall!"
            highlightPlayer(player)
        end
    end
end

-- Connect the function to the part's Touched event
highlightPart.Touched:Connect(onPlayerTouched)
