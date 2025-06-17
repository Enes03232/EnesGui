local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EnesGUIv07"
screenGui.ResetOnSpawn = false
screenGui.Parent = localPlayer:WaitForChild("PlayerGui")

-- Main Panel
local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 500, 0, 350)
panel.Position = UDim2.new(0.5, -250, 0.5, -175)
panel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
panel.BackgroundTransparency = 0.4
panel.BorderSizePixel = 0
panel.Visible = false
panel.Parent = screenGui
Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)

-- Title
local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundTransparency = 1
titleBar.Text = "ENES GUI"
titleBar.Font = Enum.Font.GothamBlack
titleBar.TextSize = 28
titleBar.TextColor3 = Color3.fromRGB(255, 0, 255)
titleBar.TextStrokeTransparency = 0.7
titleBar.Parent = panel

-- RGB Title Effect
spawn(function()
    while true do
        titleBar.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
end)

-- Tab Menu
local tabMenu = Instance.new("Frame")
tabMenu.Size = UDim2.new(0, 120, 1, -40)
tabMenu.Position = UDim2.new(0, 0, 0, 40)
tabMenu.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tabMenu.BackgroundTransparency = 0.3
tabMenu.Parent = panel
Instance.new("UICorner", tabMenu).CornerRadius = UDim.new(0, 8)

local tabLayout = Instance.new("UIListLayout")
tabLayout.Padding = UDim.new(0, 6)
tabLayout.FillDirection = Enum.FillDirection.Vertical
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
tabLayout.VerticalAlignment = Enum.VerticalAlignment.Top
tabLayout.Parent = tabMenu

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -130, 1, -40)
contentArea.Position = UDim2.new(0, 130, 0, 40)
contentArea.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
contentArea.BackgroundTransparency = 0.2
contentArea.Parent = panel
Instance.new("UICorner", contentArea).CornerRadius = UDim.new(0, 8)

-- Tabs
local tabButtons = {}
local contentFrames = {}

local tabs = {"Troll", "Players"}

for _, tabName in ipairs(tabs) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -12, 0, 40)
    button.Text = tabName
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    button.BackgroundTransparency = 0.5
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamSemibold
    button.TextSize = 18
    button.Parent = tabMenu
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 1, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Visible = false
    contentFrame.Parent = contentArea

    tabButtons[tabName] = button
    contentFrames[tabName] = contentFrame

    button.MouseButton1Click:Connect(function()
        for name, frame in pairs(contentFrames) do
            frame.Visible = (name == tabName)
        end
    end)
end

-- Default to Troll tab
contentFrames["Troll"].Visible = true

-- Troll Tab Content
local trollButton = Instance.new("TextButton")
trollButton.Name = "JerkOffButton"
trollButton.Size = UDim2.new(0.8, 0, 0.15, 0)
trollButton.Position = UDim2.new(0.1, 0, 0.1, 0)
trollButton.Text = "Jerk Off R6"
trollButton.Font = Enum.Font.GothamBold
trollButton.TextSize = 20
trollButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
trollButton.BackgroundTransparency = 0.3
trollButton.TextColor3 = Color3.fromRGB(255, 50, 50)
trollButton.Parent = contentFrames["Troll"]
Instance.new("UICorner", trollButton).CornerRadius = UDim.new(0, 8)

-- Button effects
trollButton.MouseEnter:Connect(function()
    trollButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    trollButton.TextColor3 = Color3.fromRGB(255, 80, 80)
end)

trollButton.MouseLeave:Connect(function()
    trollButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    trollButton.TextColor3 = Color3.fromRGB(255, 50, 50)
end)

-- Button function
trollButton.MouseButton1Click:Connect(function()
    trollButton.Text = "Loading..."
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character or not character.Parent then
        character = player.CharacterAdded:Wait()
    end
    
    local humanoid = character:WaitForChild("Humanoid")
    
    if humanoid.RigType == Enum.HumanoidRigType.R6 then
        local anim1 = Instance.new("Animation")
        anim1.AnimationId = "rbxassetid://148840371"
        local anim2 = Instance.new("Animation")
        anim2.AnimationId = "rbxassetid://148840423"
        local anim3 = Instance.new("Animation")
        anim3.AnimationId = "rbxassetid://148840456"
        
        local animationTrack1 = humanoid:LoadAnimation(anim1)
        local animationTrack2 = humanoid:LoadAnimation(anim2)
        local animationTrack3 = humanoid:LoadAnimation(anim3)
        
        trollButton.Text = "ACTIVE!"
        trollButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        spawn(function()
            while trollButton.Text == "ACTIVE!" do
                animationTrack1:Play()
                wait(animationTrack1.Length)
                animationTrack2:Play()
                wait(animationTrack2.Length)
                animationTrack3:Play()
                wait(animationTrack3.Length)
            end
        end)
    else
        trollButton.Text = "R6 ONLY!"
        trollButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        wait(2)
        trollButton.Text = "Jerk Off R6"
        trollButton.TextColor3 = Color3.fromRGB(255, 50, 50)
    end
end)

-- Players Tab Content
local selectedPlayer = nil
local playerButtons = {}

-- Troll Button at Top (BEYAZ METİN)
local trollPlayerButton = Instance.new("TextButton")
trollPlayerButton.Name = "TrollPlayerButton"
trollPlayerButton.Size = UDim2.new(1, -20, 0, 40)
trollPlayerButton.Position = UDim2.new(0, 10, 0, 10)
trollPlayerButton.Text = "TROLL"
trollPlayerButton.Font = Enum.Font.GothamBold
trollPlayerButton.TextSize = 18
trollPlayerButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
trollPlayerButton.BackgroundTransparency = 0.3
trollPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- BEYAZ RENK
trollPlayerButton.Parent = contentFrames["Players"]
Instance.new("UICorner", trollPlayerButton).CornerRadius = UDim.new(0, 6)

-- Player List Below
local playersList = Instance.new("ScrollingFrame")
playersList.Size = UDim2.new(1, -20, 1, -60)
playersList.Position = UDim2.new(0, 10, 0, 60)
playersList.CanvasSize = UDim2.new(0, 0, 0, 0)
playersList.BackgroundTransparency = 1
playersList.ScrollBarThickness = 6
playersList.Parent = contentFrames["Players"]

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = playersList
listLayout.SortOrder = Enum.SortOrder.Name
listLayout.Padding = UDim.new(0, 5)

-- Troll Sub Panel
local trollSubPanel = Instance.new("Frame")
trollSubPanel.Size = UDim2.new(0, 200, 0, 150)
trollSubPanel.Position = UDim2.new(1, 10, 0, 60)
trollSubPanel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
trollSubPanel.BackgroundTransparency = 0.2
trollSubPanel.BorderSizePixel = 0
trollSubPanel.Visible = false
trollSubPanel.Parent = panel
Instance.new("UICorner", trollSubPanel).CornerRadius = UDim.new(0, 8)

local subPanelTitle = Instance.new("TextLabel")
subPanelTitle.Size = UDim2.new(1, 0, 0, 30)
subPanelTitle.Text = "TROLL MENÜSÜ"
subPanelTitle.Font = Enum.Font.GothamBold
subPanelTitle.TextSize = 16
subPanelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subPanelTitle.BackgroundTransparency = 1
subPanelTitle.Parent = trollSubPanel

-- Follow Button
local followButton = Instance.new("TextButton")
followButton.Size = UDim2.new(0.8, 0, 0, 30)
followButton.Position = UDim2.new(0.1, 0, 0.3, 0)
followButton.Text = "TAKİP ET"
followButton.Font = Enum.Font.Gotham
followButton.TextSize = 14
followButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
followButton.BackgroundTransparency = 0.3
followButton.TextColor3 = Color3.fromRGB(255, 255, 255)
followButton.Parent = trollSubPanel
Instance.new("UICorner", followButton).CornerRadius = UDim.new(0, 4)

-- Button effects
trollPlayerButton.MouseEnter:Connect(function()
    trollPlayerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    trollPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- BEYAZ KALACAK
end)

trollPlayerButton.MouseLeave:Connect(function()
    trollPlayerButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    trollPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- BEYAZ KALACAK
end)

-- Troll button click
trollPlayerButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        trollSubPanel.Visible = not trollSubPanel.Visible
    else
        trollPlayerButton.Text = "ÖNCE OYUNCU SEÇ!"
        wait(2)
        trollPlayerButton.Text = "TROLL"
    end
end)

-- Follow button function
followButton.MouseButton1Click:Connect(function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        humanoidRootPart.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
        followButton.Text = "TAKİP EDİLİYOR!"
        wait(1)
        followButton.Text = "TAKİP ET"
    end
end)

-- Player selection functions
local function createPlayerButton(player)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Text = player.Name
    button.Font = Enum.Font.Gotham
    button.TextSize = 16
    button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    button.BackgroundTransparency = 0.4
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = playersList
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 4)

    button.MouseButton1Click:Connect(function()
        if selectedPlayer == player then
            selectedPlayer = nil
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            if selectedPlayer and playerButtons[selectedPlayer] then
                playerButtons[selectedPlayer].TextColor3 = Color3.fromRGB(255, 255, 255)
            end
            selectedPlayer = player
        end
    end)

    playerButtons[player] = button
end

-- RGB effect for selected player
spawn(function()
    while true do
        if selectedPlayer and playerButtons[selectedPlayer] then
            local hue = tick() % 5 / 5
            playerButtons[selectedPlayer].TextColor3 = Color3.fromHSV(hue, 1, 1)
        end
        wait(0.05)
    end
end)

-- Add existing players
for _, player in ipairs(Players:GetPlayers()) do
    createPlayerButton(player)
end

-- Add new players
Players.PlayerAdded:Connect(function(player)
    createPlayerButton(player)
end)

-- Remove leaving players
Players.PlayerRemoving:Connect(function(player)
    if playerButtons[player] then
        playerButtons[player]:Destroy()
        playerButtons[player] = nil
        
        if selectedPlayer == player then
            selectedPlayer = nil
            trollSubPanel.Visible = false
        end
    end
end)

-- Update canvas size
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    playersList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end)

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0, 10, 0.4, -30)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.BackgroundTransparency = 0.3
toggleButton.Text = "E"
toggleButton.Font = Enum.Font.GothamBlack
toggleButton.TextSize = 30
toggleButton.TextColor3 = Color3.fromRGB(255, 0, 255)
toggleButton.Parent = screenGui
Instance.new("UICorner", toggleButton)

-- RGB Effect (E Button)
spawn(function()
    while true do
        toggleButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
end)

-- Panel Toggle
local isVisible = false
toggleButton.MouseButton1Click:Connect(function()
    isVisible = not isVisible
    panel.Visible = isVisible
end)

-- Draggable Toggle Button
local toggleDragging, toggleDragStart, toggleStartPos = false, nil, nil

toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleDragging = true
        toggleDragStart = input.Position
        toggleStartPos = toggleButton.Position
        input:Disable()
    end
end)

-- Draggable Panel
local dragging, dragStart, startPos = false, nil, nil
panel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = panel.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if toggleDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - toggleDragStart
        toggleButton.Position = UDim2.new(
            toggleStartPos.X.Scale, 
            toggleStartPos.X.Offset + delta.X,
            toggleStartPos.Y.Scale, 
            toggleStartPos.Y.Offset + delta.Y
        )
    elseif dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        panel.Position = UDim2.new(
            startPos.X.Scale, 
            startPos.X.Offset + delta.X,
            startPos.Y.Scale, 
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleDragging = false
        dragging = false
    end
end)
