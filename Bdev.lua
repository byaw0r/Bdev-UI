local BdevLib = {}

-- Основная функция для создания интерфейса
function BdevLib:CreateWindow(options)
    local window = {}
    
    -- Получаем сервисы
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local isMobile = UserInputService.TouchEnabled
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    
    -- Создаем основной GUI
    local BdevUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local TopBar = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local Dev = Instance.new("Frame")
    local TextLabel = Instance.new("TextLabel")
    local Window = Instance.new("Frame")
    local IconBtn = Instance.new("ImageButton")
    local UICorner_7 = Instance.new("UICorner")

    -- Настройка свойств из твоего кода
    BdevUI.Name = "Bdev UI"
    BdevUI.Parent = player:WaitForChild("PlayerGui")
    BdevUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BdevUI.ResetOnSpawn = false

    -- Получаем размеры экрана
    local viewportSize = workspace.CurrentCamera.ViewportSize
    
    -- Позиционируем Main по центру экрана
    Main.Name = "Main"
    Main.Parent = BdevUI
    Main.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Size = UDim2.new(0, 193, 0, 242)
    Main.Position = UDim2.new(0.5, -96.5, 0.5, -121) -- Центр экрана
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
    TextLabel.Font = Enum.Font.Fondamento
    TextLabel.Text = options.Name or "Bdev"
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.TextSize = 30
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

    -- Кнопка-иконка также по центру экрана
    IconBtn.Name = "IconBtn"
    IconBtn.Parent = BdevUI
    IconBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IconBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IconBtn.BorderSizePixel = 0
    IconBtn.Size = UDim2.new(0, 51, 0, 51)
    IconBtn.Position = UDim2.new(0.5, -25.5, 0.5, -25.5) -- Центр экрана
    IconBtn.Image = "rbxassetid://136075515627576"

    UICorner_7.CornerRadius = UDim.new(1.5, 0)
    UICorner_7.Parent = IconBtn

    -- Флаг для отслеживания перетаскивания
    local isDragging = false
    local dragStart
    local startPosition

    -- Универсальная функция для перетаскивания
    local function startDragging(frame, input)
        if not isDragging then
            isDragging = true
            dragStart = input.Position
            startPosition = frame.Position
            
            -- Не блокируем мышь - это была главная ошибка
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                -- Сохраняем курсор в норме
            end
        end
    end

    local function updateDragging(frame, input)
        if isDragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPosition.X.Scale, 
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale, 
                startPosition.Y.Offset + delta.Y
            )
        end
    end

    local function stopDragging()
        isDragging = false
        -- Восстанавливаем нормальное поведение мыши
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end

    -- Обработчики для главного окна
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            startDragging(Main, input)
        end
    end)

    TopBar.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch) then
            updateDragging(Main, input)
        end
    end)

    TopBar.InputEnded:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch) then
            stopDragging()
        end
    end)

    -- Обработчики для иконки
    IconBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            startDragging(IconBtn, input)
        end
    end)

    IconBtn.InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch) then
            updateDragging(IconBtn, input)
        end
    end)

    IconBtn.InputEnded:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch) then
            stopDragging()
        end
    end)

    -- Функционал открытия/закрытия меню
    local isOpen = false
    
    -- Для мобильных устройств: отдельная обработка тапов
    if isMobile then
        local lastTouchTime = 0
        
        IconBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                local currentTime = tick()
                
                -- Проверяем, был ли короткий тап (менее 0.2 секунды)
                if currentTime - lastTouchTime < 0.2 then
                    -- Это был двойной тап или быстрый клик
                    isOpen = not isOpen
                    Main.Visible = isOpen
                end
                
                lastTouchTime = currentTime
            end
        end)
    else
        -- Для ПК: обычный клик мышью
        IconBtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            Main.Visible = isOpen
        end)
    end

    -- Счетчик для Y-позиции
    local currentYOffset = 8

    -- Функция для создания кнопки
    function window:CreateButton(options)
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
        Button.Position = UDim2.new(0, 10, 0, currentYOffset)
        Button.Size = UDim2.new(0, 173, 0, 27)

        ClickBtn.Name = "ClickBtn"
        ClickBtn.Parent = Button
        ClickBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ClickBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.BorderSizePixel = 0
        ClickBtn.Size = UDim2.new(1, 0, 1, 0)
        ClickBtn.Font = Enum.Font.Jura
        ClickBtn.Text = options.Name or "Click"
        ClickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        ClickBtn.TextSize = 16
        ClickBtn.AutoButtonColor = true -- Включаем автоматическое изменение цвета

        UICorner_6.CornerRadius = UDim.new(0, 8)
        UICorner_6.Parent = ClickBtn

        -- Анимация нажатия
        local function animatePress()
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            local pressTween = TweenService:Create(ClickBtn, tweenInfo, {
                Size = UDim2.new(0.95, 0, 0.9, 0),
                BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            })
            
            local releaseTween = TweenService:Create(ClickBtn, tweenInfo, {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            })
            
            pressTween:Play()
            task.wait(0.1)
            releaseTween:Play()
        end

        -- Callback функция
        local function handleButtonClick()
            animatePress()
            if options.Callback then
                options.Callback()
            end
        end
        
        -- Обработчик для ПК и мобильных устройств
        ClickBtn.MouseButton1Click:Connect(handleButtonClick)
        
        -- Для сенсора: дополнительная обратная связь
        if isMobile then
            ClickBtn.TouchTap:Connect(handleButtonClick)
        end
        
        -- Увеличиваем Y-позицию
        currentYOffset = currentYOffset + 35
        
        return Button
    end

    -- Функция для создания переключателя
    function window:CreateToggle(options)
        local Tbutton = Instance.new("Frame")
        local ToggleBtn = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local Background = Instance.new("Frame")
        local UICorner_4 = Instance.new("UICorner")
        local Circle = Instance.new("Frame")
        local UICorner_5 = Instance.new("UICorner")
        local NameLabel = Instance.new("TextLabel")

        local toggled = options.Default or false

        Tbutton.Name = "Tbutton"
        Tbutton.Parent = Window
        Tbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tbutton.BackgroundTransparency = 1.000
        Tbutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tbutton.BorderSizePixel = 0
        Tbutton.Position = UDim2.new(0, 10, 0, currentYOffset)
        Tbutton.Size = UDim2.new(0, 173, 0, 27)

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = Tbutton
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ToggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.BorderSizePixel = 0
        ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
        ToggleBtn.Font = Enum.Font.SourceSans
        ToggleBtn.Text = ""
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.TextSize = 14.000
        ToggleBtn.AutoButtonColor = true -- Включаем автоматическое изменение цвета

        UICorner_3.CornerRadius = UDim.new(0, 8)
        UICorner_3.Parent = ToggleBtn

        Background.Name = "Background"
        Background.Parent = ToggleBtn
        Background.AnchorPoint = Vector2.new(1, 0.5)
        Background.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 100, 100)
        Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Background.BorderSizePixel = 0
        Background.Position = UDim2.new(0.95, 0, 0.5, 0)
        Background.Size = UDim2.new(0, 40, 0, 20)

        UICorner_4.CornerRadius = UDim.new(1, 0)
        UICorner_4.Parent = Background

        Circle.Name = "Circle"
        Circle.Parent = Background
        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Circle.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Circle.BorderSizePixel = 0
        Circle.Size = UDim2.new(0, 18, 0, 18)
        Circle.Position = toggled and UDim2.new(0.55, 0, 0.1, 0) or UDim2.new(0, 0, 0.1, 0)

        UICorner_5.CornerRadius = UDim.new(1, 0)
        UICorner_5.Parent = Circle

        -- Метка с названием
        NameLabel.Name = "NameLabel"
        NameLabel.Parent = ToggleBtn
        NameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameLabel.BackgroundTransparency = 1.000
        NameLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameLabel.BorderSizePixel = 0
        NameLabel.Position = UDim2.new(0.05, 0, 0, 0)
        NameLabel.Size = UDim2.new(0.7, 0, 1, 0)
        NameLabel.Font = Enum.Font.Jura
        NameLabel.Text = options.Name or "Toggle"
        NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameLabel.TextSize = 16
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left

        -- Функция переключения с анимацией
        local function updateToggle()
            local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            
            if toggled then
                local circleTween = TweenService:Create(Circle, tweenInfo, {
                    Position = UDim2.new(0.55, 0, 0.1, 0)
                })
                local bgTween = TweenService:Create(Background, tweenInfo, {
                    BackgroundColor3 = Color3.fromRGB(0, 200, 0)
                })
                
                circleTween:Play()
                bgTween:Play()
            else
                local circleTween = TweenService:Create(Circle, tweenInfo, {
                    Position = UDim2.new(0, 0, 0.1, 0)
                })
                local bgTween = TweenService:Create(Background, tweenInfo, {
                    BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                })
                
                circleTween:Play()
                bgTween:Play()
            end
            
            if options.Callback then
                options.Callback(toggled)
            end
        end

        -- Обработчик клика
        ToggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
        end)
        
        -- Для сенсора
        if isMobile then
            ToggleBtn.TouchTap:Connect(function()
                toggled = not toggled
                updateToggle()
            end)
        end
        
        -- Увеличиваем Y-позицию
        currentYOffset = currentYOffset + 35
        
        return Tbutton
    end

    return window
end

return BdevLib
