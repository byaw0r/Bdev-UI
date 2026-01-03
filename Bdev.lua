local BdevLib = {}

-- Основная функция для создания интерфейса
function BdevLib:CreateWindow(options)
    local window = {}
    local elements = {}
    
    -- Создаем основной GUI
    local BdevUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Dev = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Window = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Open = Instance.new("TextButton")
    local UICorner_7 = Instance.new("UICorner")

    -- Настройка свойств
    BdevUI.Name = "Bdev UI"
    BdevUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    BdevUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = BdevUI
    Main.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.373697907, 0, 0.240938172, 0)
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
    TextLabel.Size = UDim2.new(0, 86, 0, 37)
    TextLabel.Font = Enum.Font.Unknown
    TextLabel.Text = options.Name or "Bdev Library"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 14.000
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left

    Window.Name = "Window"
    Window.Parent = Main
    Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window.BackgroundTransparency = 1.000
    Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 0, 0.15289256, 0)
    Window.Size = UDim2.new(0, 193, 0, 205)

    UIListLayout.Parent = Window
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    UIPadding.Parent = Window
    UIPadding.PaddingTop = UDim.new(0, 5)
    UIPadding.PaddingLeft = UDim.new(0, 10)

    Open.Name = "Open"
    Open.Parent = BdevUI
    Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Open.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Open.BorderSizePixel = 0
    Open.Position = UDim2.new(0.17578125, 0, 0.213219613, 0)
    Open.Size = UDim2.new(0, 51, 0, 50)
    Open.Font = Enum.Font.SourceSans
    Open.Text = ""
    Open.TextColor3 = Color3.fromRGB(0, 0, 0)
    Open.TextSize = 14.000

    UICorner_7.CornerRadius = UDim.new(1.5, 0)
    UICorner_7.Parent = Open

    -- Функционал открытия/закрытия
    local isOpen = false
    
    Open.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        Main.Visible = isOpen
    end)

    -- Функция для создания кнопки
    function window:CreateButton(options)
        local button = {}
        
        local Button = Instance.new("Frame")
        local ClickBtn = Instance.new("TextButton")
        local UICorner_6 = Instance.new("UICorner")
        local FunText = Instance.new("TextLabel")
        
        Button.Name = "Button"
        Button.Parent = Window
        Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Button.BackgroundTransparency = 1.000
        Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Button.BorderSizePixel = 0
        Button.Size = UDim2.new(0, 172, 0, 27)

        ClickBtn.Name = "ClickBtn"
        ClickBtn.Parent = Button
        ClickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.BorderSizePixel = 0
        ClickBtn.Position = UDim2.new(0.604651153, 0, 0.111111112, 0)
        ClickBtn.Size = UDim2.new(0, 38, 0, 22)
        ClickBtn.Font = Enum.Font.SourceSans
        ClickBtn.Text = ""
        ClickBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.TextSize = 14.000

        UICorner_6.CornerRadius = UDim.new(1, 0)
        UICorner_6.Parent = ClickBtn

        FunText.Name = "FunText"
        FunText.Parent = Button
        FunText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FunText.BackgroundTransparency = 1.000
        FunText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FunText.BorderSizePixel = 0
        FunText.Position = UDim2.new(0, 0, 0.111111112, 0)
        FunText.Size = UDim2.new(0, 100, 0, 20)
        FunText.Font = Enum.Font.SourceSansBold
        FunText.Text = options.Name or "Button"
        FunText.TextColor3 = Color3.fromRGB(255, 255, 255)
        FunText.TextScaled = true
        FunText.TextSize = 16.000
        FunText.TextWrapped = true
        FunText.TextXAlignment = Enum.TextXAlignment.Left

        -- Callback функция
        ClickBtn.MouseButton1Click:Connect(function()
            if options.Callback then
                options.Callback()
            end
        end)

        -- Функции для управления кнопкой
        function button:SetText(text)
            FunText.Text = text
        end

        table.insert(elements, Button)
        return button
    end

    -- Функция для создания переключателя
    function window:CreateToggle(options)
        local toggle = {}
        local toggled = options.Default or false
        
        local Tbutton = Instance.new("Frame")
        local ToggleBtn = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local Background = Instance.new("Frame")
        local UICorner_4 = Instance.new("UICorner")
        local Circle = Instance.new("Frame")
        local UICorner_5 = Instance.new("UICorner")
        local NameFunction = Instance.new("TextLabel")

        Tbutton.Name = "Tbutton"
        Tbutton.Parent = Window
        Tbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tbutton.BackgroundTransparency = 1.000
        Tbutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tbutton.BorderSizePixel = 0
        Tbutton.Size = UDim2.new(0, 172, 0, 17)

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = Tbutton
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.BorderSizePixel = 0
        ToggleBtn.Position = UDim2.new(0.604651153, 0, 0, 0)
        ToggleBtn.Size = UDim2.new(0, 39, 0, 16)
        ToggleBtn.Font = Enum.Font.SourceSans
        ToggleBtn.Text = ""
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.TextSize = 14.000

        UICorner_3.CornerRadius = UDim.new(1, 2)
        UICorner_3.Parent = ToggleBtn

        Background.Name = "Background"
        Background.Parent = ToggleBtn
        Background.BackgroundColor3 = toggled and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(0, 0, 0)
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
        Circle.Position = toggled and UDim2.new(1.44 - 1, 0, 0, 0) or UDim2.new(0, 0, 0, 0)
        Circle.Size = UDim2.new(0, 16, 0, 16)

        UICorner_5.CornerRadius = UDim.new(1, 2)
        UICorner_5.Parent = Circle

        NameFunction.Name = "NameFunction"
        NameFunction.Parent = Tbutton
        NameFunction.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.BackgroundTransparency = 1.000
        NameFunction.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameFunction.BorderSizePixel = 0
        NameFunction.Position = UDim2.new(0, 0, 0, 0)
        NameFunction.Size = UDim2.new(0, 100, 0, 16)
        NameFunction.Font = Enum.Font.SourceSansBold
        NameFunction.Text = options.Name or "Toggle"
        NameFunction.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.TextScaled = true
        NameFunction.TextSize = 16.000
        NameFunction.TextWrapped = true
        NameFunction.TextXAlignment = Enum.TextXAlignment.Left

        -- Функция переключения
        local function updateToggle()
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
            
            if toggled then
                local tween = game:GetService("TweenService"):Create(Circle, tweenInfo, {Position = UDim2.new(1.44 - 1, 0, 0, 0)})
                tween:Play()
                Background.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            else
                local tween = game:GetService("TweenService"):Create(Circle, tweenInfo, {Position = UDim2.new(0, 0, 0, 0)})
                tween:Play()
                Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            end
            
            if options.Callback then
                options.Callback(toggled)
            end
        end

        ToggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
        end)

        -- Функции для управления переключателем
        function toggle:SetValue(value)
            toggled = value
            updateToggle()
        end

        function toggle:GetValue()
            return toggled
        end

        table.insert(elements, Tbutton)
        return toggle
    end

    -- Функция для создания слайдера
    function window:CreateSlider(options)
        local slider = {}
        local value = options.Default or options.Min or 0
        
        local SliderFrame = Instance.new("Frame")
        local SliderName = Instance.new("TextLabel")
        local SliderBackground = Instance.new("Frame")
        local UICorner_8 = Instance.new("UICorner")
        local SliderFill = Instance.new("Frame")
        local UICorner_9 = Instance.new("UICorner")
        local SliderButton = Instance.new("TextButton")
        local ValueLabel = Instance.new("TextLabel")

        SliderFrame.Name = "SliderFrame"
        SliderFrame.Parent = Window
        SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderFrame.BackgroundTransparency = 1.000
        SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderFrame.BorderSizePixel = 0
        SliderFrame.Size = UDim2.new(0, 172, 0, 40)

        SliderName.Name = "SliderName"
        SliderName.Parent = SliderFrame
        SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderName.BackgroundTransparency = 1.000
        SliderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderName.BorderSizePixel = 0
        SliderName.Position = UDim2.new(0, 0, 0, 0)
        SliderName.Size = UDim2.new(0, 172, 0, 15)
        SliderName.Font = Enum.Font.SourceSansBold
        SliderName.Text = options.Name or "Slider"
        SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderName.TextSize = 14.000
        SliderName.TextXAlignment = Enum.TextXAlignment.Left

        SliderBackground.Name = "SliderBackground"
        SliderBackground.Parent = SliderFrame
        SliderBackground.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        SliderBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderBackground.BorderSizePixel = 0
        SliderBackground.Position = UDim2.new(0, 0, 0.5, 0)
        SliderBackground.Size = UDim2.new(0, 172, 0, 5)

        UICorner_8.CornerRadius = UDim.new(1, 0)
        UICorner_8.Parent = SliderBackground

        SliderFill.Name = "SliderFill"
        SliderFill.Parent = SliderBackground
        SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        SliderFill.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderFill.BorderSizePixel = 0
        SliderFill.Size = UDim2.new((value - (options.Min or 0)) / ((options.Max or 100) - (options.Min or 0)), 0, 1, 0)

        UICorner_9.CornerRadius = UDim.new(1, 0)
        UICorner_9.Parent = SliderFill

        SliderButton.Name = "SliderButton"
        SliderButton.Parent = SliderBackground
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        SliderButton.BorderSizePixel = 0
        SliderButton.Position = UDim2.new((value - (options.Min or 0)) / ((options.Max or 100) - (options.Min or 0)), -8, -1.5, 0)
        SliderButton.Size = UDim2.new(0, 16, 0, 16)
        SliderButton.Font = Enum.Font.SourceSans
        SliderButton.Text = ""
        SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        SliderButton.TextSize = 14.000

        UICorner_9:Clone().Parent = SliderButton

        ValueLabel.Name = "ValueLabel"
        ValueLabel.Parent = SliderFrame
        ValueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ValueLabel.BackgroundTransparency = 1.000
        ValueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ValueLabel.BorderSizePixel = 0
        ValueLabel.Position = UDim2.new(0, 0, 0.75, 0)
        ValueLabel.Size = UDim2.new(0, 172, 0, 15)
        ValueLabel.Font = Enum.Font.SourceSans
        ValueLabel.Text = tostring(value)
        ValueLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        ValueLabel.TextSize = 12.000
        ValueLabel.TextXAlignment = Enum.TextXAlignment.Left

        -- Функция обновления слайдера
        local function updateSlider()
            local min = options.Min or 0
            local max = options.Max or 100
            local percentage = (value - min) / (max - min)
            
            SliderFill.Size = UDim2.new(percentage, 0, 1, 0)
            SliderButton.Position = UDim2.new(percentage, -8, -1.5, 0)
            ValueLabel.Text = tostring(math.floor(value * 100) / 100)
            
            if options.Callback then
                options.Callback(value)
            end
        end

        -- Drag логика
        local dragging = false
        
        SliderButton.MouseButton1Down:Connect(function()
            dragging = true
        end)
        
        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        game:GetService("UserInputService").InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local min = options.Min or 0
                local max = options.Max or 100
                local relativeX = input.Position.X - SliderBackground.AbsolutePosition.X
                local percentage = math.clamp(relativeX / SliderBackground.AbsoluteSize.X, 0, 1)
                
                value = min + (max - min) * percentage
                if options.Precise then
                    value = math.floor(value)
                end
                
                updateSlider()
            end
        end)

        -- Функции для управления слайдером
        function slider:SetValue(newValue)
            local min = options.Min or 0
            local max = options.Max or 100
            value = math.clamp(newValue, min, max)
            updateSlider()
        end

        function slider:GetValue()
            return value
        end

        table.insert(elements, SliderFrame)
        return slider
    end

    -- Функция для создания метки
    function window:CreateLabel(options)
        local label = {}
        
        local LabelFrame = Instance.new("Frame")
        local LabelText = Instance.new("TextLabel")

        LabelFrame.Name = "LabelFrame"
        LabelFrame.Parent = Window
        LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelFrame.BackgroundTransparency = 1.000
        LabelFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
        LabelFrame.BorderSizePixel = 0
        LabelFrame.Size = UDim2.new(0, 172, 0, 20)

        LabelText.Name = "LabelText"
        LabelText.Parent = LabelFrame
        LabelText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        LabelText.BackgroundTransparency = 1.000
        LabelText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        LabelText.BorderSizePixel = 0
        LabelText.Size = UDim2.new(1, 0, 1, 0)
        LabelText.Font = Enum.Font.SourceSansBold
        LabelText.Text = options.Text or "Label"
        LabelText.TextColor3 = Color3.fromRGB(255, 255, 255)
        LabelText.TextSize = 14.000
        LabelText.TextXAlignment = Enum.TextXAlignment.Left

        function label:SetText(text)
            LabelText.Text = text
        end

        table.insert(elements, LabelFrame)
        return label
    end

    -- Функция для очистки всех элементов
    function window:Clear()
        for _, element in pairs(elements) do
            element:Destroy()
        end
        elements = {}
    end

    return window
end

return BdevLib
