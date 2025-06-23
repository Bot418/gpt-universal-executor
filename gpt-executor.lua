-- Sigma Hub V4 + GPT Universal Executor - Gabungan GUI All-in-One

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "SigmaGPT"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- FRAME UTAMA
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 320)
mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- UICorner
local corner = Instance.new("UICorner", mainFrame)

-- Tabs
local tabFolder = Instance.new("Folder", mainFrame)
tabFolder.Name = "Tabs"

local function createTab(name, position)
    local tab = Instance.new("TextButton")
    tab.Name = name .. "Tab"
    tab.Text = name
    tab.Size = UDim2.new(0, 100, 0, 30)
    tab.Position = UDim2.new(0, position, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(100, 170, 255)
    tab.TextColor3 = Color3.new(1, 1, 1)
    tab.Parent = mainFrame
    return tab
end

local function createPage(name)
    local page = Instance.new("Frame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, -40)
    page.Position = UDim2.new(0, 0, 0, 40)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = mainFrame
    return page
end

local mainTab = createTab("Main", 0)
local exploitTab = createTab("Exploit", 100)
local mainPage = createPage("MainPage")
local exploitPage = createPage("ExploitPage")

-- TAB SWITCH FUNCTION
local function switchTab(tabName)
    mainPage.Visible = false
    exploitPage.Visible = false
    if tabName == "Main" then
        mainPage.Visible = true
    elseif tabName == "Exploit" then
        exploitPage.Visible = true
    end
end

mainTab.MouseButton1Click:Connect(function() switchTab("Main") end)
exploitTab.MouseButton1Click:Connect(function() switchTab("Exploit") end)

switchTab("Main") -- default tab

-- ===== MAIN PAGE: Infinite Yield Loader =====
local infBtn = Instance.new("TextButton", mainPage)
infBtn.Text = "Load Infinite Yield"
infBtn.Size = UDim2.new(0, 200, 0, 40)
infBtn.Position = UDim2.new(0, 150, 0, 50)
infBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
infBtn.TextColor3 = Color3.new(1,1,1)

infBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- ===== EXPLOIT PAGE: Universal Executor =====
local textbox = Instance.new("TextBox", exploitPage)
textbox.Size = UDim2.new(0, 480, 0, 180)
textbox.Position = UDim2.new(0, 10, 0, 10)
textbox.PlaceholderText = "Paste script here"
textbox.ClearTextOnFocus = false
textbox.Text = ""
textbox.TextColor3 = Color3.new(1,1,1)
textbox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textbox.TextWrapped = true
textbox.TextYAlignment = Enum.TextYAlignment.Top
textbox.TextXAlignment = Enum.TextXAlignment.Left
textbox.Font = Enum.Font.Code
textbox.TextSize = 16
textbox.MultiLine = true

local execBtn = Instance.new("TextButton", exploitPage)
execBtn.Text = "Execute"
execBtn.Size = UDim2.new(0, 150, 0, 40)
execBtn.Position = UDim2.new(0.5, -75, 0, 200)
execBtn.BackgroundColor3 = Color3.fromRGB(70, 255, 170)
execBtn.TextColor3 = Color3.new(0,0,0)

execBtn.MouseButton1Click:Connect(function()
    local input = textbox.Text
    if input and input ~= "" then
        local ok, err = pcall(function()
            loadstring(input)()
        end)
        if not ok then
            warn("Executor Error:", err)
        end
    end
end)
