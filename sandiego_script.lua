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
-- 🔑 KEY SYSTEM GUI (ENGLISH & @Mrootik_bot)
-- ==========================================
local KeyWindow = Instance.new("Frame")
KeyWindow.Name = "KeyWindow"
KeyWindow.Size = UDim2.new(0, 380, 0, 220)
KeyWindow.Position = UDim2.new(0.5, -190, 0.5, -110)
KeyWindow.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
KeyWindow.BorderSizePixel = 0
KeyWindow.Parent = ScreenGui

Instance.new("UICorner", KeyWindow).CornerRadius = UDim.new(0, 6)
local KeyStroke = Instance.new("UIStroke", KeyWindow)
KeyStroke.Thickness = 1
KeyStroke.Color = Color3.fromRGB(40, 40, 45)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "MRoot Beta • Key System"
KeyTitle.TextColor3 = Color3.fromRGB(200, 200, 205)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 14
KeyTitle.Parent = KeyWindow

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 40)
KeyBox.Position = UDim2.new(0, 20, 0, 60)
KeyBox.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
KeyBox.PlaceholderText = "Enter key from bot (@Mrootik_bot)..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 95)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 13
KeyBox.Parent = KeyWindow

Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 4)
local BoxStroke = Instance.new("UIStroke", KeyBox)
BoxStroke.Color = Color3.fromRGB(35, 35, 40)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -40, 0, 36)
SubmitBtn.Position = UDim2.new(0, 20, 0, 115)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(30, 140, 70)
SubmitBtn.Text = "VERIFY KEY"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 13
SubmitBtn.Parent = KeyWindow

Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 4)

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -40, 0, 30)
InfoLabel.Position = UDim2.new(0, 20, 0, 165)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Get your key from bot: @Mrootik_bot"
InfoLabel.TextColor3 = Color3.fromRGB(120, 120, 125)
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 11
InfoLabel.Parent = KeyWindow

-- ==========================================
-- 🎛️ MAIN MENU & INTERFACE
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
OpenBtn.Visible = false
OpenBtn.Parent = ScreenGui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 4)
OpenCorner.Parent = OpenBtn

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Thickness = 1
OpenStroke.Color = Color3.fromRGB(40, 40, 45)
OpenStroke.Parent = OpenBtn

local FpsFrame = Instance.new("Frame")
FpsFrame.Name = "FpsFrame"
FpsFrame.Size = UDim2.new(0, 140, 0, 40)
FpsFrame.Position = UDim2.new(0.5, 60, 0, 11)
FpsFrame.BackgroundTransparency = 1
FpsFrame.BorderSizePixel = 0
FpsFrame.Visible = false
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

local MainWindow = Instance.new("Frame")
MainWindow.Name = "MainWindow"
MainWindow.Size = UDim2.new(0, 520, 0, 340)
MainWindow.Position = UDim2.new(0.5, -260, 0.5, -170)
MainWindow.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
MainWindow.BorderSizePixel = 0
MainWindow.Visible = false
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
Header.Text = "   MRoot Beta (Authorized)"
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
    LockLabel.Text = "All functions can be bought in tg - @Iyd1k"
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
    Btn.Text = state and "ON" or "OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 10
    Btn.Parent = Frame
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)

    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = state and "ON" or "OFF"
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
        
        local bloom = Lighting:FindFirstChildOfClass("BloomEffect") or Instance.new("BloomEffect", Lighting)
        bloom.Name = "MRoot_Bloom"
        bloom.Intensity = 0.6
        bloom.Size = 24
        bloom.Threshold = 0.4
        
        local dof = Lighting:FindFirstChildOfClass("DepthOfFieldEffect") or Instance.new("DepthOfFieldEffect", Lighting)
        dof.Name = "MRoot_DOF"
        dof.FarIntensity = 0.2
        dof.FocusDistance = 30
        dof.InFocusRadius = 40
        dof.NearIntensity = 0
        
        local color = Lighting:FindFirstChildOfClass("ColorCorrectionEffect") or Instance.new("ColorCorrectionEffect", Lighting)
        color.Name = "MRoot_Color"
        color.Contrast = 0.1
        color.Saturation = 0.15
        color.TintColor = Color3.fromRGB(255, 245, 230)
    else
        Lighting.Technology = defaultLighting.Technology
        Lighting.GlobalShadows = defaultLighting.GlobalShadows
        Lighting.EnvironmentDiffuseScale = defaultLighting.EnvironmentDiffuseScale
        Lighting.EnvironmentSpecularScale = defaultLighting.EnvironmentSpecularScale
        Lighting.Brightness = defaultLighting.Brightness
        
        if Lighting:FindFirstChild("MRoot_Bloom") then Lighting.MRoot_Bloom:Destroy() end
        if Lighting:FindFirstChild("MRoot_DOF") then Lighting.MRoot_DOF:Destroy() end
        if Lighting:FindFirstChild("MRoot_Color") then Lighting.MRoot_Color:Destroy() end
    end
end)

CreateToggle("Super Potato FPS (Anti-Lag)", false, function(enabled)
    if enabled then
        Lighting.GlobalShadows = false
        Lighting.EnvironmentDiffuseScale = 0
        Lighting.EnvironmentSpecularScale = 0
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
                v.CastShadow = false
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    else
        Lighting.GlobalShadows = defaultLighting.GlobalShadows
        Lighting.EnvironmentDiffuseScale = defaultLighting.EnvironmentDiffuseScale
        Lighting.EnvironmentSpecularScale = defaultLighting.EnvironmentSpecularScale
        settings().Rendering.QualityLevel = Enum.QualityLevel.Default
        
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") or v:IsA("MeshPart") then
                v.CastShadow = true
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = true
            end
        end
    end
end)

local freecamActive = false
local freecamConn = nil
local cam = workspace.CurrentCamera
local savedGuis = {}
local camRotX, camRotY = 0, 0
local freecamSpeed = 1.5

local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(1, -6, 0, 30)
SpeedFrame.BackgroundTransparency = 1
SpeedFrame.Parent = pages["Visuals"]

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(0.4, 0, 1, 0)
SpeedLabel.Position = UDim2.new(0, 10, 0, 0)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "FreeCam Speed: 1.5x"
SpeedLabel.TextColor3 = Color3.fromRGB(120, 120, 125)
SpeedLabel.Font = Enum.Font.Gotham
SpeedLabel.TextSize = 11
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = SpeedFrame

local function CreateSpeedBtn(text, val, posX)
    local sBtn = Instance.new("TextButton")
    sBtn.Size = UDim2.new(0, 40, 0, 22)
    sBtn.Position = UDim2.new(0.4, posX, 0.5, -11)
    sBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    sBtn.Text = text
    sBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    sBtn.Font = Enum.Font.GothamBold
    sBtn.TextSize = 10
    sBtn.Parent = SpeedFrame
    Instance.new("UICorner", sBtn).CornerRadius = UDim.new(0, 4)
    
    sBtn.MouseButton1Click:Connect(function()
        freecamSpeed = val
        SpeedLabel.Text = "FreeCam Speed: " .. text
    end)
end

CreateSpeedBtn("1.5x", 1.5, 0)
CreateSpeedBtn("3.0x", 3.0, 46)
CreateSpeedBtn("5.0x", 5.0, 92)

CreateToggle("Cinematic FreeCam Mode", false, function(enabled)
    freecamActive = enabled
    
    if freecamActive then
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
        MainWindow.Visible = false
        OpenBtn.Visible = false
        
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = true
        end
        
        for _, gui in pairs(Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
            if gui:IsA("ScreenGui") and gui.Name ~= "StealthHubXL" and gui.Enabled then
                table.insert(savedGuis, gui)
                gui.Enabled = false
            end
        end
        
        local _, y, _ = cam.CFrame:ToOrientation()
        camRotX = math.deg(y)
        camRotY = 0
        cam.CameraType = Enum.CameraType.Scriptable
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        
        local inputConn = UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Delta
                camRotX = camRotX - delta.X * 0.2
                camRotY = math.clamp(camRotY - delta.Y * 0.2, -85, 85)
            end
        end)
        table.insert(savedGuis, inputConn)
        
        freecamConn = RunService.RenderStepped:Connect(function()
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
            cam.CFrame = CFrame.new(cam.CFrame.Position) * CFrame.Angles(0, math.rad(camRotX), 0) * CFrame.Angles(math.rad(camRotY), 0, 0)
            local moveVector = Vector3.new(0, 0, 0)
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVector = moveVector + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVector = moveVector - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVector = moveVector - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVector = moveVector + cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.E) then moveVector = moveVector + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Q) then moveVector = moveVector - Vector3.new(0, 1, 0) end
            
            cam.CFrame = cam.CFrame + (moveVector * freecamSpeed)
        end)
    else
        if freecamConn then freecamConn:Disconnect() end
        cam.CameraType = Enum.CameraType.Custom
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = false
        end
        
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
        OpenBtn.Visible = true
        
        for _, obj in pairs(savedGuis) do
            if typeof(obj) == "RBXScriptConnection" then
                obj:Disconnect()
            elseif obj and obj.Parent then 
                obj.Enabled = true 
            end
        end
        savedGuis = {}
    end
end)

-- ==========================================
-- AUTHORIZATION & TOGGLE LOGIC
-- ==========================================
SubmitBtn.MouseButton1Click:Connect(function()
    local enteredText = KeyBox.Text
    if string.sub(enteredText, 1, 6) == "MROOT-" or #enteredText > 5 then
        KeyWindow:Destroy()
        OpenBtn.Visible = true
        FpsFrame.Visible = true
        MainWindow.Visible = true
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "Invalid key! Try again."
        BoxStroke.Color = Color3.fromRGB(180, 40, 40)
    end
end)

local isVisible = true
local function ToggleGui()
    if MainWindow and not freecamActive then
        isVisible = not isVisible
        MainWindow.Visible = isVisible
    end
end

OpenBtn.MouseButton1Click:Connect(ToggleGui)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift and not freecamActive then
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
                if input.UserInputState == Enum.UserInputState.End then 
                    dragging = false 
                end
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
