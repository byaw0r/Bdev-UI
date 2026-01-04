-- Bdev.lua
local BdevLib = {}

function BdevLib:CreateWindow(options)
    local window = {}
    
    local BdevUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Dev = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Window = Instance.new("Frame")
    local Open = Instance.new("TextButton")
    local UICorner_7 = Instance.new("UICorner")

    -- Настройка свойств
    BdevUI.Name = "Bdev UI"
    BdevUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    BdevUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = BdevUI
    Main.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, -96.5, 0.5, -121)
    Main.Size = UDim2.new(0, 193, 0, 242)
    Main.Visible = false

    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Main

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(0, 193, 0, 37)

    UICorner_2.CornerRadius = UDim.new(0, 9)
    UICorner_2.Parent = TopBar

    Dev.Name = "Dev"
    Dev.Parent = TopBar
    Dev.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dev.BackgroundTransparency = 1.000
    Dev.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Dev.BorderSizePixel = 0
    Dev.Size = UDim2.new(0, 96, 0, 37)

    TextLabel.Parent = Dev
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.0729166642, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, 186, 0, 37)
    TextLabel.Font = Enum.Font.Jura
    TextLabel.Text = options.Name or "Bdev"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 30.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    Window.Name = "Window"
    Window.Parent = Main
    Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window.BackgroundTransparency = 1.000
    Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 0, 0.15289256, 0)
    Window.Size = UDim2.new(0, 193, 0, 205)

    Open.Name = "Open"
    Open.Parent = BdevUI
    Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Open.BorderSizePixel = 0
    Open.Position = UDim2.new(0.17578125, 0, 0.213219613, 0)
    Open.Size = UDim2.new(0, 51, 0, 50)
    Open.Font = Enum.Font.Jura
    Open.Text = ""
    Open.TextColor3 = Color3.fromRGB(0, 0, 0)
    Open.TextSize = 14.000

    UICorner_7.CornerRadius = UDim.new(1.5, 0)
    UICorner_7.Parent = Open

    -- Перетаскивание главного окна
    local draggingMain
    local dragInputMain
    local dragStartMain
    local startPosMain
    
    local function updateMain(input)
        local delta = input.Position - dragStartMain
        Main.Position = UDim2.new(startPosMain.X.Scale, startPosMain.X.Offset + delta.X, startPosMain.Y.Scale, startPosMain.Y.Offset + delta.Y)
    end
    
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingMain = true
            dragStartMain = input.Position
            startPosMain = Main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingMain = false
                end
            end)
        end
    end)
    
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInputMain = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInputMain and draggingMain then
            updateMain(input)
        end
    end)

    -- Перетаскивание кнопки Open
    local draggingOpen
    local dragInputOpen
    local dragStartOpen
    local startPosOpen
    
    local function updateOpen(input)
        local delta = input.Position - dragStartOpen
        Open.Position = UDim2.new(startPosOpen.X.Scale, startPosOpen.X.Offset + delta.X, startPosOpen.Y.Scale, startPosOpen.Y.Offset + delta.Y)
    end
    
    Open.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingOpen = true
            dragStartOpen = input.Position
            startPosOpen = Open.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingOpen = false
                end
            end)
        end
    end)
    
    Open.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInputOpen = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInputOpen and draggingOpen then
            updateOpen(input)
        end
    end)

    -- Открытие/закрытие
    local isOpen = false
    
    Open.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        Main.Visible = isOpen
    end)

    -- Функция создания кнопки
    function window:CreateButton(options)
        local Button = Instance.new("Frame")
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIPadding_2 = Instance.new("UIPadding")
        local ClickBtn = Instance.new("TextButton")
        local UICorner_6 = Instance.new("UICorner")
        local FunText = Instance.new("TextLabel")
        
        Button.Name = "Button"
        Button.Parent = Window
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Button.BorderSizePixel = 0
        Button.Position = UDim2.new(0.00420162221, 0, 0.222046345, 0)
        Button.Size = UDim2.new(0, 192, 0, 27)

        UIListLayout_2.Parent = Button
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 12)

        UIPadding_2.Parent = Button
        UIPadding_2.PaddingLeft = UDim.new(0.800000012, -12)

        ClickBtn.Name = "ClickBtn"
        ClickBtn.Parent = Button
        ClickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.BorderSizePixel = 0
        ClickBtn.Position = UDim2.new(-6.0550758e-07, 0, 0, 0)
        ClickBtn.Size = UDim2.new(0, 38, 0, 22)
        ClickBtn.Font = Enum.Font.Jura
        ClickBtn.Text = ""
        ClickBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.TextSize = 14.000

        UICorner_6.CornerRadius = UDim.new(1, 0)
        UICorner_6.Parent = ClickBtn

        FunText.Name = "FunText"
        FunText.Parent = ClickBtn
        FunText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FunText.BackgroundTransparency = 1.000
        FunText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FunText.BorderSizePixel = 0
        FunText.Position = UDim2.new(-3.75347257, 0, -0.0389612354, 0)
        FunText.Size = UDim2.new(0, 72, 0, 20)
        FunText.Font = Enum.Font.Jura
        FunText.Text = options.Name or "Click"
        FunText.TextColor3 = Color3.fromRGB(255, 255, 255)
        FunText.TextScaled = true
        FunText.TextSize = 16.000
        FunText.TextWrapped = true

        ClickBtn.MouseButton1Click:Connect(function()
            if options.Callback then
                options.Callback()
            end
        end)
    end

    -- Функция создания переключателя
    function window:CreateToggle(options)
        local Tbutton = Instance.new("Frame")
        local UIPadding_3 = Instance.new("UIPadding")
        local UIListLayout_3 = Instance.new("UIListLayout")
        local ToggleBtn = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local Background = Instance.new("Frame")
        local UICorner_4 = Instance.new("UICorner")
        local Circle = Instance.new("Frame")
        local UICorner_5 = Instance.new("UICorner")
        local NameFunction = Instance.new("TextLabel")

        local toggled = options.Default or false

        Tbutton.Name = "Tbutton"
        Tbutton.Parent = Window
        Tbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tbutton.BackgroundTransparency = 1.000
        Tbutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tbutton.BorderSizePixel = 0
        Tbutton.Position = UDim2.new(0, 0, 0.0648648888, 0)
        Tbutton.Size = UDim2.new(0, 192, 0, 17)

        UIPadding_3.Parent = Tbutton
        UIPadding_3.PaddingLeft = UDim.new(0.800000012, -12)

        UIListLayout_3.Parent = Tbutton
        UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_3.Padding = UDim.new(0, 12)

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = Tbutton
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.BorderSizePixel = 0
        ToggleBtn.Position = UDim2.new(1.19108284, 0, 0, 0)
        ToggleBtn.Size = UDim2.new(0, 39, 0, 16)
        ToggleBtn.Font = Enum.Font.Jura
        ToggleBtn.Text = ""
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.TextSize = 14.000

        UICorner_3.CornerRadius = UDim.new(1, 2)
        UICorner_3.Parent = ToggleBtn

        Background.Name = "Background"
        Background.Parent = ToggleBtn
        Background.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(60, 60, 60)
        Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Background.BorderSizePixel = 0
        Background.Position = UDim2.new(-0.00180601457, 0, 0, 0)
        Background.Size = UDim2.new(0, 39, 0, 16)

        UICorner_4.CornerRadius = UDim.new(1, 2)
        UICorner_4.Parent = Background

        Circle.Name = "Circle"
        Circle.Parent = Background
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Circle.BorderSizePixel = 0
        -- Круг полностью перемещается вправо: (39 - 16) / 39
        Circle.Position = toggled and UDim2.new((39 - 16) / 39, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
        Circle.Size = UDim2.new(0, 16, 0, 16)

        UICorner_5.CornerRadius = UDim.new(1, 2)
        UICorner_5.Parent = Circle

        NameFunction.Name = "NameFunction"
        NameFunction.Parent = ToggleBtn
        NameFunction.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.BackgroundTransparency = 1.000
        NameFunction.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameFunction.BorderSizePixel = 0
        NameFunction.Position = UDim2.new(-3.63162947, 0, -0.125, 0)
        NameFunction.Size = UDim2.new(0, 72, 0, 20)
        NameFunction.Font = Enum.Font.Jura
        NameFunction.Text = options.Name or "Toggle"
        NameFunction.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.TextScaled = true
        NameFunction.TextSize = 16.000
        NameFunction.TextWrapped = true

        local function updateToggle()
            if toggled then
                -- Круг полностью вправо: (39 - 16) / 39 = 23/39 ≈ 0.5897
                Circle.Position = UDim2.new((39 - 16) / 39, 0, 0, 0)
                Background.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            else
                Circle.Position = UDim2.new(0, 0, 0, 0)
                Background.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            end
            
            if options.Callback then
                options.Callback(toggled)
            end
        end

        ToggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
        end)
    end

    return window
end

return BdevLib
