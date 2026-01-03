-- Библиотека SmileUI (вдохновленная Rayfield UI)
local SmileUI = {}

-- Сервисы
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Локальные переменные
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Цветовая палитра
local Theme = {
    Background = Color3.fromRGB(49, 49, 49),
    TopBar = Color3.fromRGB(255, 255, 255),
    Text = Color3.fromRGB(255, 255, 255),
    Accent = Color3.fromRGB(0, 120, 215),
    ToggleOn = Color3.fromRGB(0, 170, 255),
    ToggleOff = Color3.fromRGB(80, 80, 80),
    Button = Color3.fromRGB(60, 60, 60),
    ButtonHover = Color3.fromRGB(80, 80, 80)
}

-- Основной интерфейс (используем вашу структуру)
local SmileUiB, Main, Window, Open

-- Инициализация библиотеки
function SmileUI:Init(options)
    options = options or {}
    
    -- Создаем основной GUI
    SmileUiB = Instance.new("ScreenGui")
    Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Dev = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    Window = Instance.new("Frame")
    Open = Instance.new("TextButton")
    local UICorner_7 = Instance.new("UICorner")

    -- Настройка свойств
    SmileUiB.Name = "SmileUI"
    SmileUiB.Parent = PlayerGui
    SmileUiB.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Main.Name = "Main"
    Main.Parent = SmileUiB
    Main.BackgroundColor3 = Theme.Background
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.373697907, 0, 0.240938172, 0)
    Main.Size = UDim2.new(0, 400, 0, 450)
    Main.Visible = false -- Скрываем по умолчанию

    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Main

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Theme.TopBar
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(1, 0, 0, 37)

    UICorner_2.CornerRadius = UDim.new(0, 9)
    UICorner_2.Parent = TopBar

    Dev.Name = "Dev"
    Dev.Parent = TopBar
    Dev.BackgroundTransparency = 1.000
    Dev.BorderSizePixel = 0
    Dev.Size = UDim2.new(1, 0, 0, 37)

    TextLabel.Parent = Dev
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderSizePixel = 0
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Text = options.Title or "Smile UI"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 16.000

    Window.Name = "Window"
    Window.Parent = Main
    Window.BackgroundTransparency = 1.000
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 0, 0.15289256, 0)
    Window.Size = UDim2.new(1, 0, 0.85, 0)

    -- Кнопка открытия/закрытия
    Open.Name = "Open"
    Open.Parent = SmileUiB
    Open.BackgroundColor3 = Theme.Accent
    Open.BorderSizePixel = 0
    Open.Position = UDim2.new(0, 20, 0, 20)
    Open.Size = UDim2.new(0, 50, 0, 50)
    Open.Font = Enum.Font.GothamBold
    Open.Text = "≡"
    Open.TextColor3 = Color3.fromRGB(255, 255, 255)
    Open.TextSize = 24.000

    UICorner_7.CornerRadius = UDim.new(1, 0)
    UICorner_7.Parent = Open

    -- Drag functionality for TopBar
    local dragging
    local dragInput
    local dragStart
    local startPos

    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Toggle visibility
    Open.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)

    return SmileUI
end

-- Создание окна
function SmileUI:Window(options)
    local window = {
        Toggles = {},
        Buttons = {},
        Labels = {}
    }
    
    if options then
        if options.Title then
            TextLabel.Text = options.Title
        end
    end
    
    return window
end

-- Создание секции
function SmileUI:CreateSection(parent, name)
    local section = Instance.new("Frame")
    local sectionName = Instance.new("TextLabel")
    local separator = Instance.new("Frame")
    
    section.Name = "Section"
    section.Parent = parent or Window
    section.BackgroundTransparency = 1
    section.Size = UDim2.new(1, -20, 0, 40)
    
    sectionName.Name = "SectionName"
    sectionName.Parent = section
    sectionName.BackgroundTransparency = 1
    sectionName.Position = UDim2.new(0, 10, 0, 0)
    sectionName.Size = UDim2.new(1, -20, 0, 25)
    sectionName.Font = Enum.Font.GothamSemibold
    sectionName.Text = name or "Section"
    sectionName.TextColor3 = Theme.Text
    sectionName.TextSize = 14
    sectionName.TextXAlignment = Enum.TextXAlignment.Left
    
    separator.Name = "Separator"
    separator.Parent = section
    separator.Position = UDim2.new(0, 10, 0, 30)
    separator.Size = UDim2.new(1, -20, 0, 1)
    separator.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    
    return section
end

-- Создание переключателя (на основе вашего Tbutton)
function SmileUI:Toggle(options)
    local toggle = {
        Value = options.Default or false,
        Callback = options.Callback
    }
    
    local Tbutton = Instance.new("Frame")
    local ToggleBtn = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    local Background = Instance.new("Frame")
    local UICorner_4 = Instance.new("UICorner")
    local Circle = Instance.new("Frame")
    local UICorner_5 = Instance.new("UICorner")
    local NameFunction = Instance.new("TextLabel")
    
    Tbutton.Name = "Toggle_" .. options.Name
    Tbutton.Parent = options.Parent or Window
    Tbutton.BackgroundTransparency = 1
    Tbutton.BorderSizePixel = 0
    Tbutton.Size = UDim2.new(1, -20, 0, 35)
    
    NameFunction.Name = "NameFunction"
    NameFunction.Parent = Tbutton
    NameFunction.BackgroundTransparency = 1
    NameFunction.BorderSizePixel = 0
    NameFunction.Position = UDim2.new(0, 0, 0, 0)
    NameFunction.Size = UDim2.new(0, 200, 0, 35)
    NameFunction.Font = Enum.Font.Gotham
    NameFunction.Text = options.Name or "Toggle"
    NameFunction.TextColor3 = Theme.Text
    NameFunction.TextSize = 14
    NameFunction.TextXAlignment = Enum.TextXAlignment.Left
    
    ToggleBtn.Name = "ToggleBtn"
    ToggleBtn.Parent = Tbutton
    ToggleBtn.BackgroundColor3 = Theme.ToggleOff
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Position = UDim2.new(1, -45, 0.5, -8)
    ToggleBtn.Size = UDim2.new(0, 40, 0, 16)
    ToggleBtn.Text = ""
    
    UICorner_3.CornerRadius = UDim.new(1, 0)
    UICorner_3.Parent = ToggleBtn
    
    Circle.Name = "Circle"
    Circle.Parent = ToggleBtn
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BorderSizePixel = 0
    Circle.Position = UDim2.new(0, 2, 0, 2)
    Circle.Size = UDim2.new(0, 12, 0, 12)
    
    UICorner_5.CornerRadius = UDim.new(1, 0)
    UICorner_5.Parent = Circle
    
    -- Анимация переключателя
    local function updateToggle()
        local goal = {}
        if toggle.Value then
            goal.Position = UDim2.new(1, -14, 0, 2)
            goal.BackgroundColor3 = Theme.ToggleOn
        else
            goal.Position = UDim2.new(0, 2, 0, 2)
            goal.BackgroundColor3 = Theme.ToggleOff
        end
        
        local tween = TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = goal.BackgroundColor3})
        local circleTween = TweenService:Create(Circle, TweenInfo.new(0.2), {Position = goal.Position})
        
        tween:Play()
        circleTween:Play()
    end
    
    -- Обработчик клика
    ToggleBtn.MouseButton1Click:Connect(function()
        toggle.Value = not toggle.Value
        updateToggle()
        
        if toggle.Callback then
            toggle.Callback(toggle.Value)
        end
    end)
    
    -- Инициализация
    updateToggle()
    
    -- Методы для управления
    function toggle:Set(value)
        toggle.Value = value
        updateToggle()
    end
    
    function toggle:Get()
        return toggle.Value
    end
    
    return toggle
end

-- Создание кнопки (на основе вашего Button)
function SmileUI:Button(options)
    local button = {
        Callback = options.Callback
    }
    
    local ButtonFrame = Instance.new("Frame")
    local ClickBtn = Instance.new("TextButton")
    local UICorner_6 = Instance.new("UICorner")
    local ButtonText = Instance.new("TextLabel")
    
    ButtonFrame.Name = "Button_" .. options.Name
    ButtonFrame.Parent = options.Parent or Window
    ButtonFrame.BackgroundTransparency = 1
    ButtonFrame.BorderSizePixel = 0
    ButtonFrame.Size = UDim2.new(1, -20, 0, 40)
    
    ClickBtn.Name = "ClickBtn"
    ClickBtn.Parent = ButtonFrame
    ClickBtn.BackgroundColor3 = Theme.Button
    ClickBtn.BorderSizePixel = 0
    ClickBtn.Size = UDim2.new(1, 0, 1, 0)
    ClickBtn.Text = ""
    
    UICorner_6.CornerRadius = UDim.new(0, 6)
    UICorner_6.Parent = ClickBtn
    
    ButtonText.Name = "ButtonText"
    ButtonText.Parent = ClickBtn
    ButtonText.BackgroundTransparency = 1
    ButtonText.BorderSizePixel = 0
    ButtonText.Size = UDim2.new(1, 0, 1, 0)
    ButtonText.Font = Enum.Font.Gotham
    ButtonText.Text = options.Name or "Button"
    ButtonText.TextColor3 = Theme.Text
    ButtonText.TextSize = 14
    
    -- Эффекты при наведении
    ClickBtn.MouseEnter:Connect(function()
        ClickBtn.BackgroundColor3 = Theme.ButtonHover
    end)
    
    ClickBtn.MouseLeave:Connect(function()
        ClickBtn.BackgroundColor3 = Theme.Button
    end)
    
    ClickBtn.MouseButton1Click:Connect(function()
        -- Анимация нажатия
        local tween = TweenService:Create(ClickBtn, TweenInfo.new(0.1), {
            Size = UDim2.new(0.95, 0, 0.9, 0),
            Position = UDim2.new(0.025, 0, 0.05, 0)
        })
        tween:Play()
        
        tween.Completed:Connect(function()
            local tween2 = TweenService:Create(ClickBtn, TweenInfo.new(0.1), {
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0)
            })
            tween2:Play()
            
            if button.Callback then
                button.Callback()
            end
        end)
    end)
    
    -- Методы для управления
    function button:SetText(text)
        ButtonText.Text = text
    end
    
    return button
end

-- Создание слайдера
function SmileUI:Slider(options)
    local slider = {
        Value = options.Default or options.Min,
        Min = options.Min or 0,
        Max = options.Max or 100,
        Callback = options.Callback
    }
    
    local SliderFrame = Instance.new("Frame")
    local SliderName = Instance.new("TextLabel")
    local SliderBack = Instance.new("Frame")
    local SliderFill = Instance.new("Frame")
    local SliderButton = Instance.new("TextButton")
    local ValueText = Instance.new("TextLabel")
    
    SliderFrame.Name = "Slider_" .. options.Name
    SliderFrame.Parent = options.Parent or Window
    SliderFrame.BackgroundTransparency = 1
    SliderFrame.Size = UDim2.new(1, -20, 0, 50)
    
    SliderName.Name = "SliderName"
    SliderName.Parent = SliderFrame
    SliderName.BackgroundTransparency = 1
    SliderName.Size = UDim2.new(1, 0, 0, 20)
    SliderName.Font = Enum.Font.Gotham
    SliderName.Text = options.Name or "Slider"
    SliderName.TextColor3 = Theme.Text
    SliderName.TextSize = 14
    SliderName.TextXAlignment = Enum.TextXAlignment.Left
    
    SliderBack.Name = "SliderBack"
    SliderBack.Parent = SliderFrame
    SliderBack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    SliderBack.BorderSizePixel = 0
    SliderBack.Position = UDim2.new(0, 0, 0, 25)
    SliderBack.Size = UDim2.new(1, 0, 0, 6)
    SliderBack.ClipsDescendants = true
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(1, 0)
    UICorner.Parent = SliderBack
    
    SliderFill.Name = "SliderFill"
    SliderFill.Parent = SliderBack
    SliderFill.BackgroundColor3 = Theme.Accent
    SliderFill.BorderSizePixel = 0
    SliderFill.Size = UDim2.new(0, 0, 1, 0)
    
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(1, 0)
    UICorner2.Parent = SliderFill
    
    SliderButton.Name = "SliderButton"
    SliderButton.Parent = SliderBack
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.BorderSizePixel = 0
    SliderButton.Size = UDim2.new(0, 15, 0, 15)
    SliderButton.Position = UDim2.new(0, 0, 0.5, -7.5)
    SliderButton.Text = ""
    
    local UICorner3 = Instance.new("UICorner")
    UICorner3.CornerRadius = UDim.new(1, 0)
    UICorner3.Parent = SliderButton
    
    ValueText.Name = "ValueText"
    ValueText.Parent = SliderFrame
    ValueText.BackgroundTransparency = 1
    ValueText.Position = UDim2.new(1, -50, 0, 0)
    ValueText.Size = UDim2.new(0, 50, 0, 20)
    ValueText.Font = Enum.Font.Gotham
    ValueText.Text = tostring(slider.Value)
    ValueText.TextColor3 = Theme.Text
    ValueText.TextSize = 14
    ValueText.TextXAlignment = Enum.TextXAlignment.Right
    
    -- Обновление слайдера
    local function updateSlider()
        local percent = (slider.Value - slider.Min) / (slider.Max - slider.Min)
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        SliderButton.Position = UDim2.new(percent, -7.5, 0.5, -7.5)
        ValueText.Text = tostring(math.floor(slider.Value))
    end
    
    -- Drag functionality
    local dragging = false
    
    local function updateFromInput(input)
        if not dragging then return end
        
        local relativeX = (input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X
        relativeX = math.clamp(relativeX, 0, 1)
        
        slider.Value = math.floor(slider.Min + relativeX * (slider.Max - slider.Min))
        updateSlider()
        
        if slider.Callback then
            slider.Callback(slider.Value)
        end
    end
    
    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    SliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    SliderBack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            updateFromInput(input)
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            updateFromInput(input)
        end
    end)
    
    -- Инициализация
    updateSlider()
    
    -- Методы для управления
    function slider:Set(value)
        slider.Value = math.clamp(value, slider.Min, slider.Max)
        updateSlider()
    end
    
    function slider:Get()
        return slider.Value
    end
    
    return slider
end

-- Создание выпадающего списка
function SmileUI:Dropdown(options)
    local dropdown = {
        Value = options.Default or options.Options[1],
        Options = options.Options or {},
        Open = false,
        Callback = options.Callback
    }
    
    local DropdownFrame = Instance.new("Frame")
    local DropdownButton = Instance.new("TextButton")
    local DropdownText = Instance.new("TextLabel")
    local Arrow = Instance.new("TextLabel")
    local OptionsFrame = Instance.new("ScrollingFrame")
    
    DropdownFrame.Name = "Dropdown_" .. options.Name
    DropdownFrame.Parent = options.Parent or Window
    DropdownFrame.BackgroundTransparency = 1
    DropdownFrame.Size = UDim2.new(1, -20, 0, 35)
    
    DropdownButton.Name = "DropdownButton"
    DropdownButton.Parent = DropdownFrame
    DropdownButton.BackgroundColor3 = Theme.Button
    DropdownButton.BorderSizePixel = 0
    DropdownButton.Size = UDim2.new(1, 0, 0, 35)
    DropdownButton.Text = ""
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = DropdownButton
    
    DropdownText.Name = "DropdownText"
    DropdownText.Parent = DropdownButton
    DropdownText.BackgroundTransparency = 1
    DropdownText.Position = UDim2.new(0, 10, 0, 0)
    DropdownText.Size = UDim2.new(1, -30, 1, 0)
    DropdownText.Font = Enum.Font.Gotham
    DropdownText.Text = options.Name .. ": " .. dropdown.Value
    DropdownText.TextColor3 = Theme.Text
    DropdownText.TextSize = 14
    DropdownText.TextXAlignment = Enum.TextXAlignment.Left
    
    Arrow.Name = "Arrow"
    Arrow.Parent = DropdownButton
    Arrow.BackgroundTransparency = 1
    Arrow.Position = UDim2.new(1, -20, 0, 0)
    Arrow.Size = UDim2.new(0, 20, 1, 0)
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Text = "▼"
    Arrow.TextColor3 = Theme.Text
    Arrow.TextSize = 12
    
    OptionsFrame.Name = "OptionsFrame"
    OptionsFrame.Parent = DropdownFrame
    OptionsFrame.BackgroundColor3 = Theme.Button
    OptionsFrame.BorderSizePixel = 0
    OptionsFrame.Position = UDim2.new(0, 0, 0, 40)
    OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
    OptionsFrame.Visible = false
    OptionsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    OptionsFrame.ScrollBarThickness = 3
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = OptionsFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 6)
    UICorner2.Parent = OptionsFrame
    
    -- Создание опций
    for i, option in ipairs(dropdown.Options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Name = "Option_" .. option
        OptionButton.Parent = OptionsFrame
        OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        OptionButton.BorderSizePixel = 0
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.Text = option
        OptionButton.TextColor3 = Theme.Text
        OptionButton.TextSize = 14
        
        OptionButton.MouseButton1Click:Connect(function()
            dropdown.Value = option
            DropdownText.Text = options.Name .. ": " .. dropdown.Value
            toggleDropdown()
            
            if dropdown.Callback then
                dropdown.Callback(dropdown.Value)
            end
        end)
        
        OptionButton.MouseEnter:Connect(function()
            OptionButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)
        
        OptionButton.MouseLeave:Connect(function()
            OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end)
    end
    
    -- Обновление размера опций
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        OptionsFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Функция открытия/закрытия
    local function toggleDropdown()
        dropdown.Open = not dropdown.Open
        
        if dropdown.Open then
            OptionsFrame.Visible = true
            OptionsFrame.Size = UDim2.new(1, 0, 0, math.min(#dropdown.Options * 30, 150))
            DropdownFrame.Size = UDim2.new(1, -20, 0, 40 + math.min(#dropdown.Options * 30, 150))
            Arrow.Text = "▲"
        else
            OptionsFrame.Visible = false
            OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
            DropdownFrame.Size = UDim2.new(1, -20, 0, 35)
            Arrow.Text = "▼"
        end
    end
    
    DropdownButton.MouseButton1Click:Connect(toggleDropdown)
    
    -- Методы для управления
    function dropdown:Set(value)
        if table.find(dropdown.Options, value) then
            dropdown.Value = value
            DropdownText.Text = options.Name .. ": " .. dropdown.Value
        end
    end
    
    function dropdown:Get()
        return dropdown.Value
    end
    
    function dropdown:AddOption(option)
        table.insert(dropdown.Options, option)
        -- Здесь нужно пересоздать опции
    end
    
    return dropdown
end

-- Функция для создания лейбла
function SmileUI:Label(options)
    local labelFrame = Instance.new("Frame")
    local label = Instance.new("TextLabel")
    
    labelFrame.Name = "Label_" .. options.Name
    labelFrame.Parent = options.Parent or Window
    labelFrame.BackgroundTransparency = 1
    labelFrame.Size = UDim2.new(1, -20, 0, 30)
    
    label.Name = "Label"
    label.Parent = labelFrame
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Font = Enum.Font.Gotham
    label.Text = options.Text or options.Name or "Label"
    label.TextColor3 = Theme.Text
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Методы для управления
    local labelObj = {}
    
    function labelObj:SetText(text)
        label.Text = text
    end
    
    return labelObj
end

-- Уничтожение интерфейса
function SmileUI:Destroy()
    if SmileUiB then
        SmileUiB:Destroy()
        SmileUiB = nil
    end
end

-- Показать/скрыть интерфейс
function SmileUI:ToggleVisibility()
    if Main then
        Main.Visible = not Main.Visible
    end
end

return SmileUI
