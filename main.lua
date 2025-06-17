local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer

-- Gamepass ID'leri
local PASS_VP = 963009385
local PASS_MEGA = 960038042

-- GUI oluşturma
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "CustomGUI"
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Visible = false
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 0.2

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Text = "V-P Panel"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24

-- Buton 1
local button1 = Instance.new("TextButton", frame)
button1.Size = UDim2.new(0.8, 0, 0, 40)
button1.Position = UDim2.new(0.1, 0, 0.3, 0)
button1.Text = "Buton 1 - V-P özelliği"
button1.BackgroundColor3 = Color3.fromRGB(60, 60, 255)
button1.TextColor3 = Color3.new(1, 1, 1)
button1.Font = Enum.Font.Gotham
button1.TextSize = 18
Instance.new("UICorner", button1).CornerRadius = UDim.new(0, 8)

-- Buton 2
local button2 = Instance.new("TextButton", frame)
button2.Size = UDim2.new(0.8, 0, 0, 40)
button2.Position = UDim2.new(0.1, 0, 0.6, 0)
button2.Text = "Buton 2 - MEGA V-P özelliği"
button2.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
button2.TextColor3 = Color3.new(1, 1, 1)
button2.Font = Enum.Font.Gotham
button2.TextSize = 18
Instance.new("UICorner", button2).CornerRadius = UDim.new(0, 8)

-- Gamepass kontrolü
local function checkAccess()
	local hasVP = false
	local hasMega = false

	local success, err = pcall(function()
		hasVP = MarketplaceService:UserOwnsGamePassAsync(player.UserId, PASS_VP)
		hasMega = MarketplaceService:UserOwnsGamePassAsync(player.UserId, PASS_MEGA)
	end)

	if success and (hasVP or hasMega) then
		frame.Visible = true
		if not hasVP then button1.Visible = false end
		if not hasMega then button2.Visible = false end
	else
		warn("GamePass erişimi yok veya hata oluştu.")
	end
end

-- Açılış efekti
frame.Position = UDim2.new(0.5, -150, 1, 0)
frame.Visible = true
frame:TweenPosition(UDim2.new(0.5, -150, 0.5, -100), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.5, true)

-- Başlat
checkAccess()
