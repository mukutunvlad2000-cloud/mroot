-- [[ ULTRA-MINIMAL STEALTH HUD XL • MROOT BETA FINAL RELEASE ]] --
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local parentObject = (syn and syn.protect_gui and CoreGui) or CoreGui:FindFirstChild("RobloxGui") or LocalPlayer:WaitForChild("PlayerGui")

if parentObject:FindFirstChild("StealthHubXL") then 
    parentObject.StealthHubXL:Destroy() 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "StealthHubXL"
ScreenGui.Parent = parentObject
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- ⏺️ КНОПКА ОТКРЫТИЯ (Menu)
-- ==========================================
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenBtn"
OpenBtn.Size = UDim2.new(0, 95, 0, 32)
OpenBtn.Position = UDim2.new(0.5, -47, 0, 15)
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
OpenBtn.Text = "Menu"
OpenBtn.TextColor3 = Color3.fromRGB(160, 160, 165)
OpenBtn.Font = Enum.Font.RobotoMono
OpenBtn.TextSize = 13
OpenBtn.AutoButtonColor = false
OpenBtn.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 4)
OpenCorner.Parent = OpenBtn

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Thickness = 1
OpenStroke.Color = Color3.fromRGB(40, 40, 45)
OpenStroke.Parent = OpenBtn

-- ==========================================
-- 📊 СЧЕТЧИК FPS
-- ==========================================
local FpsFrame = Instance.new("Frame")
FpsFrame.Name = "FpsFrame"
FpsFrame.Size = UDim2.new(0, 140, 0, 40)
FpsFrame.Position = UDim2.new(0.5, 60, 0, 11)
FpsFrame.BackgroundTransparency = 1
FpsFrame.BorderSizePixel = 0
FpsFrame.Parent = ScreenGui

local FpsLabel = Instance.new("TextLabel")
FpsLabel.Size = UDim2.new(1, 0, 1, 0)
FpsLabel.BackgroundTransparency = 1
FpsLabel.Text = "FPS: --"
FpsLabel.TextColor3 = Color3.fromRGB(0, 255, 130)
FpsLabel.Font = Enum.Font.GothamBold
FpsLabel.TextSize = 24
FpsLabel.Parent = FpsFrame

local TextStroke = Instance.new("UIStroke", FpsLabel)
TextStroke.Thickness = 2
TextStroke.Color = Color3.fromRGB(0, 0, 0)
TextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

local fpsCount = 0
RunService.RenderStepped:Connect(function() 
    fpsCount = fpsCount + 1 
end)

task.spawn(function()
    while true do
        FpsLabel.Text = "FPS: " .. tostring(fpsCount)
        fpsCount = 0
        task.wait(1)
    end
end)

-- ==========================================
-- 🔳 ГЛАВНОЕ ОКНО MROOT BETA
-- ==========================================
local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(0, 520, 0, 340)
MainWindow.Position = UDim2.new(0.5, -260, 0.5, -170)
MainWindow.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainWindow.BorderSizePixel = 0
MainWindow.Visible = true
MainWindow.Parent = ScreenGui

local WindowCorner = Instance.new("UICorner")
WindowCorner.CornerRadius = UDim.new(0, 6)
WindowCorner.Parent = MainWindow

local WindowStroke = Instance.new("UIStroke")
WindowStroke.Thickness = 1
WindowStroke.Color = Color3.fromRGB(30, 30, 32)
WindowStroke.Parent = MainWindow

local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundTransparency = 1
Header.Text = "   MRoot Beta"
Header.TextColor3 = Color3.fromRGB(140, 140, 145)
Header.Font = Enum.Font.Gotham
Header.TextSize = 14
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.Parent = MainWindow

local Dot = Instance.new("Frame")
Dot.Size = UDim2.new(0, 6, 0, 6)
Dot.Position = UDim2.new(1, -22, 0, 19)
Dot.BackgroundColor3 = Color3.fromRGB(0, 220, 120)
Dot.Parent = MainWindow
Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

local HeaderLine = Instance.new("Frame")
HeaderLine.Size = UDim2.new(1, -30, 0, 1)
HeaderLine.Position = UDim2.new(0, 15, 0, 45)
HeaderLine.BackgroundColor3 = Color3.fromRGB(22, 22, 24)
HeaderLine.BorderSizePixel = 0
HeaderLine.Parent = MainWindow

-- ==========================================
-- 📑 ВКЛАДКИ И САЙДБАР
-- ==========================================
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 120, 1, -60)
Sidebar.Position = UDim2.new(0, 15, 0, 55)
Sidebar.BackgroundTransparency = 1
Sidebar.Parent = MainWindow

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 4)
SidebarLayout.Parent = Sidebar

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -155, 1, -60)
ContentArea.Position = UDim2.new(0, 140, 0, 55)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainWindow

local pages = {}
local tabButtons = {}

local function CreateTab(tabName)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 32)
    TabBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    TabBtn.Text = "  " .. tabName
    TabBtn.TextColor3 = Color3.fromRGB(130, 130, 135)
    TabBtn.Font = Enum.Font.GothamMedium
    TabBtn.TextSize = 12
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.AutoButtonColor = false
    TabBtn.Parent = Sidebar
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 4)
    local tStroke = Instance.new("UIStroke", TabBtn)
    tStroke.Color = Color3.fromRGB(25, 25, 27)

    local PageFrame = Instance.new("ScrollingFrame")
    PageFrame.Size = UDim2.new(1, 0, 1, 0)
    PageFrame.BackgroundTransparency = 1
    PageFrame.BorderSizePixel = 0
    PageFrame.Visible = false
    PageFrame.ScrollBarThickness = 2
    PageFrame.ScrollBarImageColor3 = Color3.fromRGB(40, 40, 45)
    PageFrame.Parent = ContentArea
    
    local pLayout = Instance.new("UIListLayout")
    pLayout.Padding = UDim.new(0, 6)
    pLayout.Parent = PageFrame
    
    pages[tabName] = PageFrame
    tabButtons[tabName] = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        for _, b in pairs(tabButtons) do 
            b.BackgroundColor3 = Color3.fromRGB(18, 18, 18) 
            b.TextColor3 = Color3.fromRGB(130, 130, 135)
        end
        PageFrame.Visible = true
        TabBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 26)
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

CreateTab("Combat")
CreateTab("Visuals")
CreateTab("Utils")
CreateTab("Settings")
CreateTab("Config")

pages["Combat"].Visible = true
tabButtons["Combat"].BackgroundColor3 = Color3.fromRGB(24, 24, 26)
tabButtons["Combat"].TextColor3 = Color3.fromRGB(255, 255, 255)

local function AddTgLock(pageName)
    local LockLabel = Instance.new("TextLabel")
    LockLabel.Size = UDim2.new(1, -20, 1, -20)
    LockLabel.Position = UDim2.new(0, 10, 0, 10)
    LockLabel.BackgroundTransparency = 1
    LockLabel.Text = "Все функции можно купить в tg - @Iyd1k"
    LockLabel.TextColor3 = Color3.fromRGB(220, 60, 60)
    LockLabel.Font = Enum.Font.GothamBold
    LockLabel.TextSize = 18
    LockLabel.TextWrapped = true
    LockLabel.TextXAlignment = Enum.TextXAlignment.Center
    LockLabel.TextYAlignment = Enum.TextYAlignment.Center
    LockLabel.Parent = pages[pageName]
end

AddTgLock("Combat")
AddTgLock("Utils")
AddTgLock("Settings")
AddTgLock("Config")

local function CreateToggle(text, defaultValue, callback)
    local state = defaultValue
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 36)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
    Frame.Parent = pages["Visuals"]
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 4)
    local fStroke = Instance.new("UIStroke", Frame)
    fStroke.Color = Color3.fromRGB(30, 30, 35)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(180, 180, 185)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 70, 0, 24)
    Btn.Position = UDim2.new(1, -80, 0.5, -12)
    Btn.BackgroundColor3 = state and Color3.fromRGB(30, 140, 70) or Color3.fromRGB(140, 40, 40)
    Btn.Text = state and "ВКЛ" or "ВЫКЛ"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 10
    Btn.Parent = Frame
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = state and "ВКЛ" or "ВЫКЛ"
        Btn.BackgroundColor3 = state and Color3.fromRGB(30, 140, 70) or Color3.fromRGB(140, 40, 40)
        callback(state)
    end)
    return Frame
end

local defaultLighting = {
    Technology = Lighting.Technology,
    GlobalShadows = Lighting.GlobalShadows,
    EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
    Brightness = Lighting.Brightness
}

CreateToggle("Photorealistic Ultra Graphics", false, function(enabled)
    if enabled then
        Lighting.Technology = Enum.Technology.Future
        Lighting.GlobalShadows = true
        Lighting.EnvironmentDiffuseScale = 1
        Lighting.EnvironmentSpecularScale = 1
        Lighting.Brightness = 2.5
    else
        Lighting.Technology = defaultLighting.Technology
        Lighting.GlobalShadows = defaultLighting.GlobalShadows
        Lighting.EnvironmentDiffuseScale = defaultLighting.EnvironmentDiffuseScale
        Lighting.EnvironmentSpecularScale = defaultLighting.EnvironmentSpecularScale
        Lighting.Brightness = defaultLighting.Brightness
    end
end)

-- ==========================================
-- ЛОГИКА ОТКРЫТИЯ/ЗАКРЫТИЯ МЕНЮ
-- ==========================================
local isVisible = true
local function ToggleGui()
    isVisible = not isVisible
    MainWindow.Visible = isVisible
end

OpenBtn.MouseButton1Click:Connect(ToggleGui)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        ToggleGui()
    end
end)

local function ConfigureDrag(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
            dragInput = input 
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

ConfigureDrag(OpenBtn)
ConfigureDrag(FpsFrame)
