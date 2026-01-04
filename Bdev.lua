local BdevLib = {}

-- Основная функция для создания интерфейса
function BdevLib:CreateWindow(options)
    local window = {}
    
    -- Получаем UserInputService для определения типа устройства
    local UserInputService = game:GetService("UserInputService")
    local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
    
    -- Создаем основной GUI
    local BdevUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Dev = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Window = Instance.new("Frame")
    local WindowLayout = Instance.new("UIListLayout")
    local WindowPadding = Instance.new("UIPadding")
    local IconBtn = Instance.new("ImageButton")
    local UICorner_7 = Instance.new("UICorner")

    -- Настройка свойств из твоего кода
    BdevUI.Name = "Bdev UI"
    BdevUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    BdevUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BdevUI.ResetOnSpawn = false

    -- Адаптивные размеры для мобильных устройств
    local baseSize = isMobile and 250 or 193
    local baseHeight = isMobile and 300 or 242
    
    Main.Name = "Main"
    Main.Parent = BdevUI
    Main.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = isMobile and UDim2.new(0.1, 0, 0.1, 0) or UDim2.new(0.373697907, 0, 0.240938172, 0)
    Main.Size = UDim2.new(0, baseSize, 0, baseHeight)
    Main.Visible = false
    Main.AnchorPoint = isMobile and Vector2.new(0, 0) or Vector2.new(0, 0)

    UICorner.CornerRadius = UDim.new(0, 9)
    UICorner.Parent = Main

    TopBar.Name = "TopBar"
    TopBar.Parent = Main
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopBar.BorderSizePixel = 0
    TopBar.Size = UDim2.new(0, baseSize, 0, isMobile and 45 or 37)

    UICorner_2.CornerRadius = UDim.new(0, 9)
    UICorner_2.Parent = TopBar

    Dev.Name = "Dev"
    Dev.Parent = TopBar
    Dev.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dev.BackgroundTransparency = 1.000
    Dev.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Dev.BorderSizePixel = 0
    Dev.Size = UDim2.new(0, baseSize, 0, isMobile and 45 or 37)

    TextLabel.Parent = Dev
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = isMobile and UDim2.new(0.05, 0, 0, 0) or UDim2.new(0.0729166642, 0, 0, 0)
    TextLabel.Size = UDim2.new(0, baseSize, 0, isMobile and 45 or 37)
    TextLabel.Font = Enum.Font.Fondamento
    TextLabel.Text = options.Name or "Bdev"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = isMobile and 24 or 30
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.FontFace = Font.new("rbxasset://fonts/families/Fondamento.json", Enum.FontWeight.Bold)

    Window.Name = "Window"
    Window.Parent = Main
    Window.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Window.BackgroundTransparency = 1.000
    Window.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 0, isMobile and 0.15 or 0.15289256, 0)
    Window.Size = UDim2.new(0, baseSize, 0, isMobile and 255 or 205)

    -- Добавляем UIListLayout в Window для автоматического расположения
    WindowLayout.Name = "WindowLayout"
    WindowLayout.Parent = Window
    WindowLayout.SortOrder = Enum.SortOrder.LayoutOrder
    WindowLayout.Padding = UDim.new(0, isMobile and 10 or 8)
    WindowLayout.VerticalAlignment = Enum.VerticalAlignment.Top

    -- Добавляем Padding для Window
    WindowPadding.Name = "WindowPadding"
    WindowPadding.Parent = Window
    WindowPadding.PaddingTop = UDim.new(0, isMobile and 10 or 8)
    WindowPadding.PaddingLeft = UDim.new(0, isMobile and 10 or 8)

    -- Новая кнопка-иконка
    IconBtn.Name = "IconBtn"
    IconBtn.Parent = BdevUI
    IconBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IconBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IconBtn.BorderSizePixel = 0
    IconBtn.Position = isMobile and UDim2.new(0.02, 0, 0.02, 0) or UDim2.new(0.21875, 0, 0.272921115, 0)
    IconBtn.Size = isMobile and UDim2.new(0, 70, 0, 70) or UDim2.new(0, 51, 0, 51)
    IconBtn.Image = "rbxassetid://136075515627576"
    IconBtn.ScaleType = Enum.ScaleType.Fit

    UICorner_7.CornerRadius = UDim.new(1.5, 0)
    UICorner_7.Parent = IconBtn

    -- Улучшенный функционал перетаскивания для мобильных устройств
    local draggingMain = false
    local dragStartMain
    local startPosMain
    
    local function updateMain(input)
        if draggingMain and dragStartMain and startPosMain then
            local delta = input.Position - dragStartMain
            local newX = startPosMain.X.Offset + delta.X
            local newY = startPosMain.Y.Offset + delta.Y
            
            -- Ограничиваем перемещение в пределах экрана
            local screenSize = workspace.CurrentCamera.ViewportSize
            local mainSize = Main.AbsoluteSize
            
            newX = math.clamp(newX, 0, screenSize.X - mainSize.X)
            newY = math.clamp(newY, 0, screenSize.Y - mainSize.Y)
            
            Main.Position = UDim2.new(0, newX, 0, newY)
        end
    end
    
    -- Универсальная функция для начала перетаскивания
    local function startDragging(input, isTopBar)
        if (isMobile and input.UserInputType == Enum.UserInputType.Touch) or 
           (not isMobile and input.UserInputType == Enum.UserInputType.MouseButton1) then
            
            if isTopBar then
                draggingMain = true
            end
            
            dragStartMain = input.Position
            startPosMain = Main.Position
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingMain = false
                    dragStartMain = nil
                    startPosMain = nil
                    connection:Disconnect()
                end
            end)
        end
    end
    
    -- Для мобильных устройств добавляем длительное нажатие для перетаскивания иконки
    if isMobile then
        local touchStartTime = 0
        local touchStartPos
        
        IconBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                touchStartTime = tick()
                touchStartPos = input.Position
            end
        end)
        
        IconBtn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                local touchDuration = tick() - touchStartTime
                local touchEndPos = input.Position
                
                -- Если было короткое нажатие - открываем/закрываем меню
                if touchDuration < 0.5 and (touchEndPos - touchStartPos).Magnitude < 10 then
                    isOpen = not isOpen
                    Main.Visible = isOpen
                end
            end
        end)
        
        -- Прямое перетаскивание иконки
        IconBtn.InputBegan:Connect(function(input)
            startDragging(input, false)
        end)
    else
        -- Для ПК обычный клик
        IconBtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            Main.Visible = isOpen
        end)
    end
    
    TopBar.InputBegan:Connect(function(input)
        startDragging(input, true)
    end)
    
    -- Обновляем позицию при перемещении
    UserInputService.InputChanged:Connect(function(input)
        if (draggingMain) and (input.UserInputType == Enum.UserInputType.Touch or 
           input.UserInputType == Enum.UserInputType.MouseMovement) then
            updateMain(input)
        end
    end)

    -- Функционал открытия/закрытия
    local isOpen = false
    
    -- Для мобильных устройств добавляем кнопку закрытия
    if isMobile then
        local CloseBtn = Instance.new("TextButton")
        CloseBtn.Name = "CloseBtn"
        CloseBtn.Parent = TopBar
        CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        CloseBtn.BorderSizePixel = 0
        CloseBtn.Position = UDim2.new(0.85, 0, 0.2, 0)
        CloseBtn.Size = UDim2.new(0, 25, 0, 25)
        CloseBtn.Font = Enum.Font.SourceSans
        CloseBtn.Text = "X"
        CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        CloseBtn.TextSize = 16
        
        local UICornerClose = Instance.new("UICorner")
        UICornerClose.CornerRadius = UDim.new(0, 5)
        UICornerClose.Parent = CloseBtn
        
        CloseBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                isOpen = false
                Main.Visible = false
            end
        end)
        
        -- Также закрываем при тапе вне окна
        local function onInputBegan(input)
            if isOpen and input.UserInputType == Enum.UserInputType.Touch then
                local touchPos = input.Position
                local mainAbsPos = Main.AbsolutePosition
                local mainAbsSize = Main.AbsoluteSize
                
                -- Если тап вне окна - закрываем
                if touchPos.X < mainAbsPos.X or touchPos.X > mainAbsPos.X + mainAbsSize.X or
                   touchPos.Y < mainAbsPos.Y or touchPos.Y > mainAbsPos.Y + mainAbsSize.Y then
                    
                    local iconAbsPos = IconBtn.AbsolutePosition
                    local iconAbsSize = IconBtn.AbsoluteSize
                    
                    -- Проверяем, не тапнули ли по иконке
                    if touchPos.X < iconAbsPos.X or touchPos.X > iconAbsPos.X + iconAbsSize.X or
                       touchPos.Y < iconAbsPos.Y or touchPos.Y > iconAbsPos.Y + iconAbsSize.Y then
                        isOpen = false
                        Main.Visible = false
                    end
                end
            end
        end
        
        UserInputService.InputBegan:Connect(onInputBegan)
    end

    -- Счетчик для LayoutOrder
    local elementCount = 0

    -- Функция для создания кнопки
    function window:CreateButton(options)
        elementCount = elementCount + 1
        
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
        Button.LayoutOrder = elementCount
        Button.Size = UDim2.new(0, baseSize - 16, 0, isMobile and 40 or 27)

        -- UIListLayout внутри Button
        UIListLayout_2.Parent = Button
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 8)

        UIPadding_2.Parent = Button
        UIPadding_2.PaddingLeft = UDim.new(0, isMobile and 10 : 8)

        ClickBtn.Name = "ClickBtn"
        ClickBtn.Parent = Button
        ClickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.BorderSizePixel = 0
        ClickBtn.Size = UDim2.new(0, isMobile and 50 : 38, 0, isMobile and 30 : 22)
        ClickBtn.Font = Enum.Font.SourceSans
        ClickBtn.Text = ""
        ClickBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.TextSize = 14.000
        ClickBtn.AutoButtonColor = not isMobile -- Отключаем автоцвет для лучшего контроля на мобильных

        -- Анимация нажатия для мобильных
        if isMobile then
            local originalSize = ClickBtn.Size
            local pressedSize = UDim2.new(0, ClickBtn.Size.X.Offset * 0.95, 0, ClickBtn.Size.Y.Offset * 0.95)
            
            ClickBtn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    ClickBtn:TweenSize(pressedSize, "Out", "Quad", 0.1, true)
                end
            end)
            
            ClickBtn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    ClickBtn:TweenSize(originalSize, "Out", "Quad", 0.1, true)
                end
            end)
        end

        UICorner_6.CornerRadius = UDim.new(1, 0)
        UICorner_6.Parent = ClickBtn

        -- Текст кнопки
        FunText.Name = "FunText"
        FunText.Parent = ClickBtn
        FunText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FunText.BackgroundTransparency = 1.000
        FunText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FunText.BorderSizePixel = 0
        FunText.Position = isMobile and UDim2.new(-2.5, 0, 0, 0) or UDim2.new(-3.56926203, 0, -0.0389612354, 0)
        FunText.Size = UDim2.new(0, isMobile and 150 : 72, 0, isMobile and 30 : 20)
        FunText.Font = Enum.Font.Jura
        FunText.Text = options.Name or "Click"
        FunText.TextColor3 = Color3.fromRGB(255, 255, 255)
        FunText.TextScaled = true
        FunText.TextSize = isMobile and 18 : 16
        FunText.TextWrapped = true
        FunText.FontFace = Font.new("rbxasset://fonts/families/Jura.json", Enum.FontWeight.Bold)

        -- Callback функция с защитой от спама на мобильных
        local lastClick = 0
        local function safeCallback()
            local now = tick()
            if now - lastClick > 0.5 then -- Защита от двойных нажатий
                lastClick = now
                if options.Callback then
                    options.Callback()
                end
            end
        end
        
        ClickBtn.MouseButton1Click:Connect(safeCallback)
        
        -- Для мобильных также обрабатываем Touch
        if isMobile then
            ClickBtn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    safeCallback()
                end
            end)
        end
        
        return Button
    end

    -- Функция для создания переключателя
    function window:CreateToggle(options)
        elementCount = elementCount + 1
        
        local Tbutton = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
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
        Tbutton.LayoutOrder = elementCount
        Tbutton.Size = UDim2.new(0, baseSize - 16, 0, isMobile and 30 : 17)

        -- UIListLayout внутри Tbutton
        UIListLayout.Parent = Tbutton
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 8)

        UIPadding.Parent = Tbutton
        UIPadding.PaddingLeft = UDim.new(0, isMobile and 10 : 8)

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = Tbutton
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.BorderSizePixel = 0
        ToggleBtn.Size = UDim2.new(0, isMobile and 50 : 39, 0, isMobile and 25 : 16)
        ToggleBtn.Font = Enum.Font.SourceSans
        ToggleBtn.Text = ""
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.TextSize = 14.000
        ToggleBtn.AutoButtonColor = not isMobile

        UICorner_3.CornerRadius = UDim.new(1, 2)
        UICorner_3.Parent = ToggleBtn

        Background.Name = "Background"
        Background.Parent = ToggleBtn
        Background.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 0, 0)
        Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Background.BorderSizePixel = 0
        Background.Size = UDim2.new(1, 0, 1, 0)

        UICorner_4.CornerRadius = UDim.new(1, 2)
        UICorner_4.Parent = Background

        Circle.Name = "Circle"
        Circle.Parent = Background
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Circle.BorderSizePixel = 0
        Circle.Size = UDim2.new(0, isMobile and 20 : 16, 0, isMobile and 20 : 16)
        
        -- Позиция круга в зависимости от состояния
        Circle.Position = toggled and UDim2.new(0.6, 0, 0.05, 0) or UDim2.new(0, 0, 0.05, 0)

        UICorner_5.CornerRadius = UDim.new(1, 2)
        UICorner_5.Parent = Circle

        -- Текст переключателя
        NameFunction.Name = "NameFunction"
        NameFunction.Parent = ToggleBtn
        NameFunction.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.BackgroundTransparency = 1.000
        NameFunction.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameFunction.BorderSizePixel = 0
        NameFunction.Position = isMobile and UDim2.new(-2.5, 0, -0.2, 0) or UDim2.new(-3.4777832, 0, -0.125, 0)
        NameFunction.Size = UDim2.new(0, isMobile and 150 : 72, 0, isMobile and 30 : 20)
        NameFunction.Font = Enum.Font.Jura
        NameFunction.Text = options.Name or "Toggle"
        NameFunction.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.TextScaled = true
        NameFunction.TextSize = isMobile and 18 : 16
        NameFunction.TextWrapped = true
        NameFunction.FontFace = Font.new("rbxasset://fonts/families/Jura.json", Enum.FontWeight.Bold)

        -- Функция переключения с анимацией
        local function updateToggle()
            local targetPosition = toggled and UDim2.new(0.6, 0, 0.05, 0) or UDim2.new(0, 0, 0.05, 0)
            local targetColor = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 0, 0)
            
            Circle:TweenPosition(targetPosition, "Out", "Quad", 0.2, true)
            Background:TweenBackgroundColor3(targetColor, "Out", "Quad", 0.2, true)
            
            if options.Callback then
                options.Callback(toggled)
            end
        end

        -- Обработчик для ПК
        ToggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
        end)
        
        -- Обработчик для мобильных
        if isMobile then
            ToggleBtn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    toggled = not toggled
                    updateToggle()
                end
            end)
        end
        
        return Tbutton
    end

    -- Функция для создания слайдера (дополнительно для мобильных)
    function window:CreateSlider(options)
        elementCount = elementCount + 1
        
        local min = options.Min or 0
        local max = options.Max or 100
        local default = options.Default or min
        local value = default
        
        local SliderContainer = Instance.new("Frame")
        local SliderName = Instance.new("TextLabel")
        local SliderBackground = Instance.new("Frame")
        local SliderFill = Instance.new("Frame")
        local SliderButton = Instance.new("TextButton")
        local ValueLabel = Instance.new("TextLabel")
        
        SliderContainer.Name = "SliderContainer"
        SliderContainer.Parent = Window
        SliderContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderContainer.BackgroundTransparency = 1.000
        SliderContainer.BorderSizePixel = 0
        SliderContainer.LayoutOrder = elementCount
        SliderContainer.Size = UDim2.new(0, baseSize - 16, 0, isMobile and 60 : 40)
        
        SliderName.Name = "SliderName"
        SliderName.Parent = SliderContainer
        SliderName.BackgroundTransparency = 1
        SliderName.Size = UDim2.new(1, 0, 0, isMobile and 25 : 20)
        SliderName.Font = Enum.Font.Jura
        SliderName.Text = options.Name or "Slider"
        SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderName.TextSize = isMobile and 18 : 16
        SliderName.TextXAlignment = Enum.TextXAlignment.Left
        
        SliderBackground.Name = "SliderBackground"
        SliderBackground.Parent = SliderContainer
        SliderBackground.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        SliderBackground.BorderSizePixel = 0
        SliderBackground.Position = UDim2.new(0, 0, 0, isMobile and 30 : 25)
        SliderBackground.Size = UDim2.new(1, 0, 0, isMobile and 15 : 10)
        
        local BackgroundCorner = Instance.new("UICorner")
        BackgroundCorner.CornerRadius = UDim.new(0, 5)
        BackgroundCorner.Parent = SliderBackground
        
        SliderFill.Name = "SliderFill"
        SliderFill.Parent = SliderBackground
        SliderFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        SliderFill.BorderSizePixel = 0
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(0, 5)
        FillCorner.Parent = SliderFill
        
        SliderButton.Name = "SliderButton"
        SliderButton.Parent = SliderBackground
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        SliderButton.BorderSizePixel = 0
        SliderButton.Size = UDim2.new(0, isMobile and 25 : 20, 1.5, 0)
        SliderButton.Position = UDim2.new((default - min) / (max - min), -SliderButton.Size.X.Offset / 2, 0, -SliderButton.Size.Y.Offset / 4)
        SliderButton.Text = ""
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 5)
        ButtonCorner.Parent = SliderButton
        
        ValueLabel.Name = "ValueLabel"
        ValueLabel.Parent = SliderContainer
        ValueLabel.BackgroundTransparency = 1
        ValueLabel.Position = UDim2.new(0.7, 0, 0, isMobile and 30 : 25)
        ValueLabel.Size = UDim2.new(0.3, 0, 0, isMobile and 25 : 20)
        ValueLabel.Font = Enum.Font.Jura
        ValueLabel.Text = tostring(default)
        ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        ValueLabel.TextSize = isMobile and 18 : 16
        ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
        
        local function updateSlider(input)
            local sliderAbsolutePosition = SliderBackground.AbsolutePosition
            local sliderAbsoluteSize = SliderBackground.AbsoluteSize
            
            local relativeX
            if isMobile and input then
                relativeX = math.clamp((input.Position.X - sliderAbsolutePosition.X) / sliderAbsoluteSize.X, 0, 1)
            else
                relativeX = math.clamp((input.Position.X - sliderAbsolutePosition.X) / sliderAbsoluteSize.X, 0, 1)
            end
            
            value = math.floor(min + (max - min) * relativeX)
            local fillSize = (value - min) / (max - min)
            
            SliderFill.Size = UDim2.new(fillSize, 0, 1, 0)
            SliderButton.Position = UDim2.new(fillSize, -SliderButton.Size.X.Offset / 2, 0, -SliderButton.Size.Y.Offset / 4)
            ValueLabel.Text = tostring(value)
            
            if options.Callback then
                options.Callback(value)
            end
        end
        
        local dragging = false
        
        SliderButton.InputBegan:Connect(function(input)
            if (isMobile and input.UserInputType == Enum.UserInputType.Touch) or
               (not isMobile and input.UserInputType == Enum.UserInputType.MouseButton1) then
                dragging = true
            end
        end)
        
        SliderBackground.InputBegan:Connect(function(input)
            if (isMobile and input.UserInputType == Enum.UserInputType.Touch) or
               (not isMobile and input.UserInputType == Enum.UserInputType.MouseButton1) then
                dragging = true
                updateSlider(input)
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.Touch or 
               input.UserInputType == Enum.UserInputType.MouseMovement) then
                updateSlider(input)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if (isMobile and input.UserInputType == Enum.UserInputType.Touch) or
               (not isMobile and input.UserInputType == Enum.UserInputType.MouseButton1) then
                dragging = false
            end
        end)
        
        return SliderContainer
    end

    return window
end

return BdevLib
