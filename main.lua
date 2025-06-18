-- GİRİŞ EKRANI (RGB efektli, takılarak ve akışkan ilerleyen bar)
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local loadingGui = Instance.new("ScreenGui")
loadingGui.Name = "LoadingScreen"
loadingGui.IgnoreGuiInset = true
loadingGui.Parent = localPlayer:WaitForChild("PlayerGui")

local loadingFrame = Instance.new("Frame")
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.BackgroundTransparency = 0
loadingFrame.ZIndex = 10
loadingFrame.Parent = loadingGui

for i = 1, 4 do
    local border = Instance.new("Frame")
    border.BackgroundTransparency = 0.2
    border.BorderSizePixel = 0
    border.ZIndex = 11
    border.Parent = loadingFrame
    if i == 1 then
        border.Size = UDim2.new(1, 0, 0, 8)
        border.Position = UDim2.new(0, 0, 0, 0)
    elseif i == 2 then
        border.Size = UDim2.new(1, 0, 0, 8)
        border.Position = UDim2.new(0, 0, 1, -8)
    elseif i == 3 then
        border.Size = UDim2.new(0, 8, 1, 0)
        border.Position = UDim2.new(0, 0, 0, 0)
    else
        border.Size = UDim2.new(0, 8, 1, 0)
        border.Position = UDim2.new(1, -8, 0, 0)
    end
    spawn(function()
        while loadingGui.Parent do
            border.BackgroundColor3 = Color3.fromHSV((tick() + i) % 1, 1, 1)
            wait(0.02)
        end
    end)
end

local loadingLabel = Instance.new("TextLabel")
loadingLabel.Size = UDim2.new(0, 400, 0, 60)
loadingLabel.Position = UDim2.new(0.5, -200, 0.5, 40)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "ENES GUI YÜKLENİYOR..."
loadingLabel.Font = Enum.Font.GothamBlack
loadingLabel.TextSize = 36
loadingLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
loadingLabel.ZIndex = 13
loadingLabel.Parent = loadingFrame

spawn(function()
    while loadingGui.Parent do
        loadingLabel.TextColor3 = Color3.fromHSV(tick() % 1, 1, 1)
        wait(0.05)
    end
end)

local progressBarBack = Instance.new("Frame")
progressBarBack.Size = UDim2.new(0, 320, 0, 18)
progressBarBack.Position = UDim2.new(0.5, -160, 0.5, 100)
progressBarBack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
progressBarBack.BorderSizePixel = 0
progressBarBack.ZIndex = 12
progressBarBack.Parent = loadingFrame
Instance.new("UICorner", progressBarBack).CornerRadius = UDim.new(0, 9)

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 13
progressBar.Parent = progressBarBack
Instance.new("UICorner", progressBar).CornerRadius = UDim.new(0, 9)

spawn(function()
    local steps = {0.10, 0.37, 0.63, 0.72, 0.86, 1.0}
    local delays = {1.2, 1.1, 1.5, 1.0, 1.0, 1.2}
    local prev = 0
    for i = 1, #steps do
        local t0 = tick()
        local duration = delays[i]
        local start = prev
        local finish = steps[i]
        while tick() - t0 < duration do
            local alpha = (tick() - t0) / duration
            local value = start + (finish - start) * alpha
            progressBar.Size = UDim2.new(value, 0, 1, 0)
            progressBar.BackgroundColor3 = Color3.fromHSV(value, 1, 1)
            wait()
        end
        progressBar.Size = UDim2.new(finish, 0, 1, 0)
        progressBar.BackgroundColor3 = Color3.fromHSV(finish, 1, 1)
        prev = finish
    end
end)

wait(7)
loadingGui:Destroy()

-- ANA PANEL
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EnesGUIv07"
screenGui.ResetOnSpawn = false
screenGui.Parent = localPlayer:WaitForChild("PlayerGui")

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 500, 0, 350)
panel.Position = UDim2.new(0.5, -250, 0.5, -175)
panel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
panel.BackgroundTransparency = 0.4
panel.BorderSizePixel = 0
panel.Visible = true
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

-- Sekmeler: Players, Scripts, Admin
local tabs = {"Players", "Scripts", "Admin"}
local tabButtons = {}
local contentFrames = {}

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
        for name, btn in pairs(tabButtons) do
            if name == tabName then
                spawn(function()
                    while contentFrames[name].Visible do
                        btn.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                        wait(0.05)
                    end
                    btn.TextColor3 = Color3.fromRGB(255,255,255)
                end)
            else
                btn.TextColor3 = Color3.fromRGB(255,255,255)
            end
        end
    end)
end

-- Varsayılan olarak Players sekmesi açık ve RGB
contentFrames["Players"].Visible = true
spawn(function()
    while contentFrames["Players"].Visible do
        tabButtons["Players"].TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
    tabButtons["Players"].TextColor3 = Color3.fromRGB(255,255,255)
end)

-- Players Tab Content + Troll Butonu ve Troll Menüsü
local selectedPlayer = nil
local playerButtons = {}
local isTrollButtonActive = false

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

local function updateTrollPanelPosition()
    if panel and trollSubPanel then
        trollSubPanel.Position = UDim2.new(1, 15, 0, 0)
    end
end

panel:GetPropertyChangedSignal("Position"):Connect(updateTrollPanelPosition)
panel:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateTrollPanelPosition)

local function updateTrollButtonColor()
    while isTrollButtonActive do
        trollPlayerButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
    trollPlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end

trollPlayerButton.MouseEnter:Connect(function()
    trollPlayerButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
end)

trollPlayerButton.MouseLeave:Connect(function()
    trollPlayerButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
end)

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
    local originalPosition = myHRP.CFrame
    local targetHRP = selectedPlayer.Character.HumanoidRootPart
    flingInProgress = true
    flingButton.Text = "FLING ATILIYOR..."
    spawn(function()
        while flingInProgress do
            flingButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            wait(0.05)
        end
        flingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    spawn(function()
        local startTime = tick()
        local spinSpeed = 100
        local maxForce = 5000
        myHRP.Anchored = true
        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, -2)
        myHRP.Anchored = false
        wait(0.1)
        while flingInProgress and tick() - startTime < 3 do
            spinSpeed = spinSpeed + 20
            myHRP.CFrame = myHRP.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
            myHRP.Velocity = Vector3.new(0, maxForce, 0)
            targetHRP.Velocity = Vector3.new(
                math.random(-maxForce/2, maxForce/2),
                maxForce,
                math.random(-maxForce/2, maxForce/2)
            )
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, -2) * CFrame.Angles(0, math.rad(spinSpeed), 0)
            if targetHRP.Position.Y > 500 then
                flingInProgress = false
                break
            end
            wait()
        end
        flingInProgress = false
        myHRP.Anchored = true
        myHRP.CFrame = originalPosition
        myHRP.Anchored = false
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

spawn(function()
    while true do
        if selectedPlayer and playerButtons[selectedPlayer] then
            local hue = tick() % 5 / 5
            playerButtons[selectedPlayer].TextColor3 = Color3.fromHSV(hue, 1, 1)
        end
        wait(0.05)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    createPlayerButton(player)
end

Players.PlayerAdded:Connect(function(player)
    createPlayerButton(player)
end)

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

listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    playersList.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
end)

-- ESP SİSTEMİ (tam vücut Highlight, RGB, şeffaf ve sadece ESP butonu RGB)
local espHighlight = nil
local espActive = false

local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(0.8, 0, 0, 30)
espButton.Position = UDim2.new(0.1, 0, 0.65, 0)
espButton.Text = "ESP"
espButton.Font = Enum.Font.Gotham
espButton.TextSize = 14
espButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
espButton.BackgroundTransparency = 0.3
espButton.TextColor3 = Color3.fromRGB(255, 255, 255)
espButton.Parent = trollSubPanel
Instance.new("UICorner", espButton).CornerRadius = UDim.new(0, 4)

local function removeESP()
    if espHighlight then
        espHighlight:Destroy()
        espHighlight = nil
    end
end

espButton.MouseButton1Click:Connect(function()
    if not selectedPlayer or not selectedPlayer.Character then return end
    if espActive then
        removeESP()
        espActive = false
        espButton.Text = "ESP"
        espButton.TextColor3 = Color3.fromRGB(255,255,255)
    else
        removeESP()
        espActive = true
        espButton.Text = "ESP KAPAT"
        espHighlight = Instance.new("Highlight")
        espHighlight.Adornee = selectedPlayer.Character
        espHighlight.FillTransparency = 0.7
        espHighlight.OutlineTransparency = 0.1
        espHighlight.Parent = selectedPlayer.Character
        spawn(function()
            while espActive and espHighlight and espHighlight.Parent do
                local rgb = Color3.fromHSV((tick() % 5) / 5, 1, 1)
                espHighlight.FillColor = rgb
                espHighlight.OutlineColor = rgb
                espButton.TextColor3 = rgb
                wait(0.05)
            end
            espButton.TextColor3 = Color3.fromRGB(255,255,255)
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player == selectedPlayer then
        removeESP()
        espActive = false
        espButton.Text = "ESP"
        espButton.TextColor3 = Color3.fromRGB(255,255,255)
    end
end)

panel:GetPropertyChangedSignal("Visible"):Connect(function()
    if not panel.Visible then
        removeESP()
        espActive = false
        espButton.Text = "ESP"
        espButton.TextColor3 = Color3.fromRGB(255,255,255)
    end
end)

-- SADECE PROFİL RESMİ VE İSİM (arka plan kutusu yok)
local profileImage = Instance.new("ImageLabel")
profileImage.Size = UDim2.new(0, 20, 0, 20)
profileImage.Position = UDim2.new(0, 10, 1, -30)
profileImage.BackgroundTransparency = 1
profileImage.Parent = panel

local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(0, 90, 0, 20)
nameLabel.Position = UDim2.new(0, 34, 1, -30)
nameLabel.BackgroundTransparency = 1
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 12
nameLabel.TextColor3 = Color3.fromRGB(255,255,0)
nameLabel.TextXAlignment = Enum.TextXAlignment.Left
nameLabel.Text = (#localPlayer.Name > 10 and string.sub(localPlayer.Name, 1, 8) .. "..." or localPlayer.Name)
nameLabel.Parent = panel

spawn(function()
    while true do
        nameLabel.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
end)

spawn(function()
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size48x48
    local content, _ = Players:GetUserThumbnailAsync(localPlayer.UserId, thumbType, thumbSize)
    profileImage.Image = content
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

spawn(function()
    while true do
        toggleButton.TextColor3 = Color3.fromHSV(tick() % 5 / 5, 1, 1)
        wait(0.05)
    end
end)

local isVisible = true
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

local toggleDragging, toggleDragStart, toggleStartPos = false, nil, nil

toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        toggleDragging = true
        toggleDragStart = input.Position
        toggleStartPos = toggleButton.Position
    end
end)

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

updateTrollPanelPosition()
