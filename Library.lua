-- Library.lua (Mobile Red Linoria Style)
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local Library = {}
Library.Toggles = {}
Library.Flags = {}

local Colors = {
    Main = Color3.fromRGB(18, 18, 18),
    Accent = Color3.fromRGB(220, 35, 35),
    Background = Color3.fromRGB(24, 24, 24),
    Outline = Color3.fromRGB(45, 45, 45),
    Text = Color3.fromRGB(235, 235, 235),
    DarkText = Color3.fromRGB(140, 140, 140)
}

function Library:CreateWindow(config)
    local titleText = config.Title or "Linoria Mobile"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LinoriaRedMobile"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 450, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -225, 0.5, -225)
    MainFrame.BackgroundColor3 = Colors.Main
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 5)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Colors.Outline
    MainStroke.Thickness = 1
    MainStroke.Parent = MainFrame

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 32)
    TopBar.BackgroundColor3 = Colors.Background
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame

    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 5)
    TopCorner.Parent = TopBar

    local AccentLine = Instance.new("Frame")
    AccentLine.Size = UDim2.new(1, 0, 0, 2)
    AccentLine.Position = UDim2.new(0, 0, 1, -2)
    AccentLine.BackgroundColor3 = Colors.Accent
    AccentLine.BorderSizePixel = 0
    AccentLine.Parent = TopBar

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -15, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextColor3 = Colors.Text
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar

    local Container = Instance.new("ScrollingFrame")
    Container.Size = UDim2.new(1, -16, 1, -44)
    Container.Position = UDim2.new(0, 8, 0, 38)
    Container.BackgroundTransparency = 1
    Container.BorderSizePixel = 0
    Container.ScrollBarThickness = 2
    Container.ScrollBarImageColor3 = Colors.Accent
    Container.Parent = MainFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 10)
    UIListLayout.Parent = Container

    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)

    local WindowObj = {}

    function WindowObj:AddGroupbox(boxTitle)
        local GroupFrame = Instance.new("Frame")
        GroupFrame.Size = UDim2.new(1, 0, 0, 40)
        GroupFrame.BackgroundColor3 = Colors.Background
        GroupFrame.BorderSizePixel = 0
        GroupFrame.Parent = Container

        local GroupCorner = Instance.new("UICorner")
        GroupCorner.CornerRadius = UDim.new(0, 4)
        GroupCorner.Parent = GroupFrame

        local GroupStroke = Instance.new("UIStroke")
        GroupStroke.Color = Colors.Outline
        GroupStroke.Thickness = 1
        GroupStroke.Parent = GroupFrame

        local GroupTitle = Instance.new("TextLabel")
        GroupTitle.Size = UDim2.new(1, -16, 0, 24)
        GroupTitle.Position = UDim2.new(0, 10, 0, 2)
        GroupTitle.BackgroundTransparency = 1
        GroupTitle.Text = boxTitle or "Groupbox"
        GroupTitle.TextColor3 = Colors.Accent
        GroupTitle.TextSize = 13
        GroupTitle.Font = Enum.Font.GothamBold
        GroupTitle.TextXAlignment = Enum.TextXAlignment.Left
        GroupTitle.Parent = GroupFrame

        local InnerContainer = Instance.new("Frame")
        InnerContainer.Size = UDim2.new(1, -12, 1, -28)
        InnerContainer.Position = UDim2.new(0, 6, 0, 26)
        InnerContainer.BackgroundTransparency = 1
        InnerContainer.Parent = GroupFrame

        local InnerLayout = Instance.new("UIListLayout")
        InnerLayout.SortOrder = Enum.SortOrder.LayoutOrder
        InnerLayout.Padding = UDim.new(0, 6)
        InnerLayout.Parent = InnerContainer

        InnerLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            local contentHeight = InnerLayout.AbsoluteContentSize.Y + 34
            GroupFrame.Size = UDim2.new(1, 0, 0, contentHeight)
        end)

        local GroupObj = {}

        function GroupObj:AddToggle(flag, configTable)
            local text = configTable.Text or "Toggle"
            local default = configTable.Default or false
            local callback = configTable.Callback or function() end

            local state = default
            Library.Flags[flag] = state

            local ToggleBtn = Instance.new("TextButton")
            ToggleBtn.Size = UDim2.new(1, 0, 0, 28)
            ToggleBtn.BackgroundTransparency = 1
            ToggleBtn.AutoButtonColor = false
            ToggleBtn.Text = ""
            ToggleBtn.Parent = InnerContainer

            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -30, 1, 0)
            Label.Position = UDim2.new(0, 4, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = state and Colors.Text or Colors.DarkText
            Label.TextSize = 13
            Label.Font = Enum.Font.Gotham
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = ToggleBtn

            local Box = Instance.new("Frame")
            Box.Size = UDim2.new(0, 16, 0, 16)
            Box.Position = UDim2.new(1, -18, 0.5, -8)
            Box.BackgroundColor3 = state and Colors.Accent or Colors.Main
            Box.BorderSizePixel = 0
            Box.Parent = ToggleBtn

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 3)
            BoxCorner.Parent = Box

            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = state and Colors.Accent or Colors.Outline
            BoxStroke.Thickness = 1
            BoxStroke.Parent = Box

            local function Update()
                state = not state
                TweenService:Create(Box, TweenInfo.new(0.12), {
                    BackgroundColor3 = state and Colors.Accent or Colors.Main
                }):Play()
                TweenService:Create(BoxStroke, TweenInfo.new(0.12), {
                    Color = state and Colors.Accent or Colors.Outline
                }):Play()
                Label.TextColor3 = state and Colors.Text or Colors.DarkText
                Library.Flags[flag] = state
                Library.Toggles[flag] = state
                callback(state)
            end

            ToggleBtn.MouseButton1Click:Connect(Update)
            Library.Toggles[flag] = state
        end

        return GroupObj
    end

    return WindowObj
end

return Library
