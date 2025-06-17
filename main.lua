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
local isTrollButtonActive = false

-- Troll Button at Top
local trollPlayerButton = Instance.new("TextButton")
trollPlayerButton.Name = "TrollPlayerButton"
trollPlayerButton.Size = UDim2.new(1, -20, 0, 40)
trollPlayerButton.Position = UDim2.new(0, 10, 0, 10)
trollPlayerButton.Text = "TROLL"
trollPlayerButton.Font = Enum.Font.GothamBold
trollPlayerButton.TextSize = 18
trollPlayerButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
trollPlayerButton.BackgroundTransparency = 0.3
trollPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
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
trollSubPanel.Size = UDim2.new(0, 200, 0, 350)
trollSubPanel.Position = UDim2.new(1, 15, 0, 0)
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
spawn(function()
    while true do
        subPanelTitle.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
end)
subPanelTitle.BackgroundTransparency = 1
subPanelTitle.Parent = trollSubPanel

-- Panel ve troll menüsü pozisyon güncelleme
local function updateTrollPanelPosition()
    if panel and trollSubPanel then
        local panelSize = panel.AbsoluteSize.X
        trollSubPanel.Position = UDim2.new(1, 15, 0, 0)
    end
end

panel:GetPropertyChangedSignal("Position"):Connect(updateTrollPanelPosition)
panel:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTrollPanelPosition)

-- RGB efekti fonksiyonu
local function updateTrollButtonColor()
    while isTrollButtonActive do
        trollPlayerButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
    trollPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end

-- Button effects
trollPlayerButton.MouseEnter:Connect(function()
    trollPlayerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

trollPlayerButton.MouseLeave:Connect(function()
    trollPlayerButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

-- Troll button click
trollPlayerButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        trollSubPanel.Visible = not trollSubPanel.Visible
        isTrollButtonActive = trollSubPanel.Visible
        
        if isTrollButtonActive then
            spawn(updateTrollButtonColor)
        end
    else
        trollPlayerButton.Text = "ÖNCE OYUNCU SEÇ!"
        wait(2)
        trollPlayerButton.Text = "TROLL"
    end
end)

-- İZLE (SPECTATE) BUTONU (RGB efekti eklendi)
local spectating = false
local oldCameraSubject = nil

local spectateButton = Instance.new("TextButton")
spectateButton.Size = UDim2.new(0.8, 0, 0, 30)
spectateButton.Position = UDim2.new(0.1, 0, 0.2, 0)
spectateButton.Text = "İZLE"
spectateButton.Font = Enum.Font.Gotham
spectateButton.TextSize = 14
spectateButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
spectateButton.BackgroundTransparency = 0.3
spectateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
spectateButton.Parent = trollSubPanel
Instance.new("UICorner", spectateButton).CornerRadius = UDim.new(0, 4)

local spectateRGB = false

spectateButton.MouseButton1Click:Connect(function()
    if selectedPlayer and selectedPlayer.Character then
        local cam = workspace.CurrentCamera
        if not spectating then
            oldCameraSubject = cam.CameraSubject
            cam.CameraSubject = selectedPlayer.Character:FindFirstChild("Humanoid")
            spectateButton.Text = "İZLEMEYİ BIRAK"
            spectating = true
            spectateRGB = true
            
            -- RGB efekti başlat
            spawn(function()
                while spectateRGB do
                    spectateButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    wait(0.05)
                end
                spectateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            end)
        else
            cam.CameraSubject = oldCameraSubject
            spectateButton.Text = "İZLE"
            spectating = false
            spectateRGB = false
        end
    end
end)

-- TELEPORT BUTONU (RGB efekti eklendi)
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0.8, 0, 0, 30)
teleportButton.Position = UDim2.new(0.1, 0, 0.35, 0)
teleportButton.Text = "TELEPORT"
teleportButton.Font = Enum.Font.Gotham
teleportButton.TextSize = 14
teleportButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
teleportButton.BackgroundTransparency = 0.3
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.Parent = trollSubPanel
Instance.new("UICorner", teleportButton).CornerRadius = UDim.new(0, 4)

teleportButton.MouseButton1Click:Connect(function()
    if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local myChar = localPlayer.Character or localPlayer.CharacterAdded:Wait()
        local myHRP = myChar:FindFirstChild("HumanoidRootPart")
        if myHRP then
            -- RGB efekti başlat (2 saniye)
            spawn(function()
                local startTime = tick()
                while tick() - startTime < 2 do
                    teleportButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    wait(0.05)
                end
                teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            end)
            
            myHRP.CFrame = selectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(2, 0, 0)
        end
    end
end)

-- GELİŞMİŞ FLING BUTONU (Konum Hatırlamalı)
local flingButton = Instance.new("TextButton")
flingButton.Size = UDim2.new(0.8, 0, 0, 30)
flingButton.Position = UDim2.new(0.1, 0, 0.5, 0)
flingButton.Text = "FLING"
flingButton.Font = Enum.Font.Gotham
flingButton.TextSize = 14
flingButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
flingButton.BackgroundTransparency = 0.3
flingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flingButton.Parent = trollSubPanel
Instance.new("UICorner", flingButton).CornerRadius = UDim.new(0, 4)

local flingInProgress = false

flingButton.MouseButton1Click:Connect(function()
    if not selectedPlayer or not selectedPlayer.Character or not selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local myChar = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    
    -- FLING ÖNCESİ KONUMU KAYDET
    local originalPosition = myHRP.CFrame
    local targetHRP = selectedPlayer.Character.HumanoidRootPart
    
    flingInProgress = true
    flingButton.Text = "FLING ATILIYOR..."

    -- RGB efekti başlat
    spawn(function()
        while flingInProgress do
            flingButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            wait(0.05)
        end
        flingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    spawn(function()
        local startTime = tick()
        local spinSpeed = 100 -- Başlangıç dönüş hızı
        local maxForce = 5000 -- Maksimum fırlatma gücü
        
        -- FLING HAZIRLIK
        myHRP.Anchored = true
        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, -2)
        myHRP.Anchored = false
        wait(0.1)
        
        -- FLING ATMA DÖNGÜSÜ
        while flingInProgress and tick() - startTime < 3 do -- Max 3 saniye
            -- HIZLI DÖNÜŞ + FIRLATMA
            spinSpeed = spinSpeed + 20 -- Her döngüde hızı artır
            myHRP.CFrame = myHRP.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
            
            -- GÜÇLÜ FIRLATMA
            myHRP.Velocity = Vector3.new(0, maxForce, 0)
            targetHRP.Velocity = Vector3.new(
                math.random(-maxForce/2, maxForce/2),
                maxForce,
                math.random(-maxForce/2, maxForce/2)
            )
            
            -- HEDEFİ TAKİP ET
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(0, math.rad(spinSpeed), 0)
            
            -- BAŞARI KONTROLÜ (Hedef yeterince yüksekte mi?)
            if targetHRP.Position.Y > 500 then -- Yükseklik kontrolü
                flingInProgress = false
                break
            end
            
            wait()
        end

        -- FLING BİTİŞ İŞLEMLERİ
        flingInProgress = false
        
        -- KARAKTERİ ESKİ KONUMUNA IŞINLA
        myHRP.Anchored = true
        myHRP.CFrame = originalPosition
        myHRP.Anchored = false
        
        -- BUTON DURUM GÜNCELLEME
        if targetHRP.Position.Y > 500 then
            flingButton.Text = "FLING BAŞARILI!"
            flingButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            flingButton.Text = "FLING BAŞARISIZ"
            flingButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
        wait(1.5)
        flingButton.Text = "FLING"
        flingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
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
            isTrollButtonActive = false
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
    if not isVisible then
        trollSubPanel.Visible = false
        isTrollButtonActive = false
    else
        updateTrollPanelPosition()
    end
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

-- İlk pozisyon ayarı
updateTrollPanelPosition()
