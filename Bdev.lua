local BdevLib = {}

-- Основная функция для создания интерфейса
function BdevLib:CreateWindow(options)
    local window = {}
    
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

    Main.Name = "Main"
    Main.Parent = BdevUI
    Main.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
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

    -- Добавляем UIListLayout в Window для автоматического расположения
    WindowLayout.Name = "WindowLayout"
    WindowLayout.Parent = Window
    WindowLayout.SortOrder = Enum.SortOrder.LayoutOrder
    WindowLayout.Padding = UDim.new(0, 8)
    WindowLayout.VerticalAlignment = Enum.VerticalAlignment.Top

    -- Добавляем Padding для Window
    WindowPadding.Name = "WindowPadding"
    WindowPadding.Parent = Window
    WindowPadding.PaddingTop = UDim.new(0, 8)
    WindowPadding.PaddingLeft = UDim.new(0, 8)

    -- Новая кнопка-иконка
    IconBtn.Name = "IconBtn"
    IconBtn.Parent = BdevUI
    IconBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    IconBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    IconBtn.BorderSizePixel = 0
    IconBtn.Position = UDim2.new(0.21875, 0, 0.272921115, 0)
    IconBtn.Size = UDim2.new(0, 51, 0, 51)
    IconBtn.Image = "rbxassetid://136075515627576"

    UICorner_7.CornerRadius = UDim.new(1.5, 0)
    UICorner_7.Parent = IconBtn

    -- Получаем UserInputService для определения типа устройства
    local UserInputService = game:GetService("UserInputService")
    local isMobile = UserInputService.TouchEnabled

    -- Функционал перетаскивания для главного окна
    local draggingMain = false
    local dragInputMain
    local dragStartMain
    local startPosMain
    
    local function updateMain(input)
        local delta = input.Position - dragStartMain
        Main.Position = UDim2.new(
            startPosMain.X.Scale, 
            startPosMain.X.Offset + delta.X,
            startPosMain.Y.Scale, 
            startPosMain.Y.Offset + delta.Y
        )
    end
    
    -- Универсальная функция для начала перетаскивания (работает на ПК и телефоне)
    local function beginDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            draggingMain = true
            dragStartMain = input.Position
            startPosMain = Main.Position
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingMain = false
                    connection:Disconnect()
                end
            end)
        end
    end
    
    -- Универсальная функция для отслеживания ввода
    local function handleDragInput(input)
        if draggingMain and (input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch) then
            dragInputMain = input
        end
    end
    
    -- Подключаем обработчики
    TopBar.InputBegan:Connect(beginDrag)
    TopBar.InputChanged:Connect(handleDragInput)
    
    -- Функционал перетаскивания для кнопки-иконки
    local draggingIcon = false
    local dragInputIcon
    local dragStartIcon
    local startPosIcon
    
    local function updateIcon(input)
        local delta = input.Position - dragStartIcon
        IconBtn.Position = UDim2.new(
            startPosIcon.X.Scale,
            startPosIcon.X.Offset + delta.X,
            startPosIcon.Y.Scale,
            startPosIcon.Y.Offset + delta.Y
        )
    end
    
    -- Универсальная функция для начала перетаскивания иконки
    local function beginIconDrag(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            draggingIcon = true
            dragStartIcon = input.Position
            startPosIcon = IconBtn.Position
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    draggingIcon = false
                    connection:Disconnect()
                end
            end)
        end
    end
    
    -- Универсальная функция для отслеживания ввода иконки
    local function handleIconDragInput(input)
        if draggingIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch) then
            dragInputIcon = input
        end
    end
    
    -- Подключаем обработчики для иконки
    IconBtn.InputBegan:Connect(beginIconDrag)
    IconBtn.InputChanged:Connect(handleIconDragInput)
    
    -- Обработчик перемещения для обоих окон
    UserInputService.InputChanged:Connect(function(input)
        -- Перемещение главного окна
        if draggingMain and (input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch) then
            updateMain(input)
        end
        
        -- Перемещение иконки
        if draggingIcon and (input.UserInputType == Enum.UserInputType.MouseMovement or
           input.UserInputType == Enum.UserInputType.Touch) then
            updateIcon(input)
        end
    end)

    -- Функционал открытия/закрытия
    local isOpen = false
    
    -- Универсальная функция клика для иконки
    local function handleIconClick(input)
        if input and (input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch) then
            isOpen = not isOpen
            Main.Visible = isOpen
        end
    end
    
    -- Подключаем клик для мыши
    IconBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        Main.Visible = isOpen
    end)
    
    -- Для сенсора используем InputBegan с проверкой
    IconBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            isOpen = not isOpen
            Main.Visible = isOpen
        end
    end)

    -- Убираем фиксированные позиции и используем только LayoutOrder
    -- currentYOffset больше не нужен

    -- Функция для создания кнопки
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
        Button.Size = UDim2.new(1, -16, 0, 27)
        Button.LayoutOrder = #Window:GetChildren() -- Автоматический порядок

        -- UIListLayout внутри Button
        UIListLayout_2.Parent = Button
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 8)

        UIPadding_2.Parent = Button
        UIPadding_2.PaddingLeft = UDim.new(0.800000012, -12)

        ClickBtn.Name = "ClickBtn"
        ClickBtn.Parent = Button
        ClickBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ClickBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.BorderSizePixel = 0
        ClickBtn.Size = UDim2.new(0, 38, 0, 22)
        ClickBtn.Font = Enum.Font.SourceSans
        ClickBtn.Text = ""
        ClickBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ClickBtn.TextSize = 14.000
        ClickBtn.AutoButtonColor = false

        UICorner_6.CornerRadius = UDim.new(1, 0)
        UICorner_6.Parent = ClickBtn

        -- Текст кнопки
        FunText.Name = "FunText"
        FunText.Parent = ClickBtn
        FunText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        FunText.BackgroundTransparency = 1.000
        FunText.BorderColor3 = Color3.fromRGB(0, 0, 0)
        FunText.BorderSizePixel = 0
        FunText.Position = UDim2.new(-3.56926203, 0, -0.0389612354, 0)
        FunText.Size = UDim2.new(0, 72, 0, 20)
        FunText.Font = Enum.Font.Jura
        FunText.Text = options.Name or "Click"
        FunText.TextColor3 = Color3.fromRGB(255, 255, 255)
        FunText.TextScaled = true
        FunText.TextSize = 16
        FunText.TextWrapped = true

        -- Callback с поддержкой сенсора
        local function handleButtonClick()
            if options.Callback then
                options.Callback()
            end
        end
        
        -- Подключаем клик для мыши
        ClickBtn.MouseButton1Click:Connect(handleButtonClick)
        
        -- Подключаем тап для сенсора через InputBegan
        ClickBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                handleButtonClick()
                
                -- Визуальная обратная связь
                local originalColor = ClickBtn.BackgroundColor3
                ClickBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                
                local connection
                connection = input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        ClickBtn.BackgroundColor3 = originalColor
                        connection:Disconnect()
                    end
                end)
            end
        end)
        
        return Button
    end

    -- Функция для создания переключателя
    function window:CreateToggle(options)
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
        Tbutton.Size = UDim2.new(1, -16, 0, 17)
        Tbutton.LayoutOrder = #Window:GetChildren() -- Автоматический порядок

        -- UIListLayout внутри Tbutton
        UIListLayout.Parent = Tbutton
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 8)

        UIPadding.Parent = Tbutton
        UIPadding.PaddingLeft = UDim.new(0.800000012, -12)

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = Tbutton
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ToggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.BorderSizePixel = 0
        ToggleBtn.Position = UDim2.new(1.19108284, 0, 0, 0)
        ToggleBtn.Size = UDim2.new(0, 39, 0, 16)
        ToggleBtn.Font = Enum.Font.SourceSans
        ToggleBtn.Text = ""
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        ToggleBtn.TextSize = 14.000
        ToggleBtn.AutoButtonColor = false

        UICorner_3.CornerRadius = UDim.new(1, 2)
        UICorner_3.Parent = ToggleBtn

        Background.Name = "Background"
        Background.Parent = ToggleBtn
        Background.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(0, 0, 0)
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
        Circle.Size = UDim2.new(0, 16, 0, 16)
        
        -- Позиция круга в зависимости от состояния
        Circle.Position = toggled and UDim2.new(0.59, 0, 0, 0) or UDim2.new(0, 0, 0, 0)

        UICorner_5.CornerRadius = UDim.new(1, 2)
        UICorner_5.Parent = Circle

        -- Текст переключателя
        NameFunction.Name = "NameFunction"
        NameFunction.Parent = ToggleBtn
        NameFunction.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.BackgroundTransparency = 1.000
        NameFunction.BorderColor3 = Color3.fromRGB(0, 0, 0)
        NameFunction.BorderSizePixel = 0
        NameFunction.Position = UDim2.new(-3.4777832, 0, -0.125, 0)
        NameFunction.Size = UDim2.new(0, 72, 0, 20)
        NameFunction.Font = Enum.Font.Jura
        NameFunction.Text = options.Name or "Toggle"
        NameFunction.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameFunction.TextScaled = true
        NameFunction.TextSize = 16
        NameFunction.TextWrapped = true

        -- Функция переключения
        local function updateToggle()
            if toggled then
                Circle.Position = UDim2.new(0.59, 0, 0, 0)
                Background.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            else
                Circle.Position = UDim2.new(0, 0, 0, 0)
                Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            end
            
            if options.Callback then
                options.Callback(toggled)
            end
        end

        -- Обработчик клика для мыши
        ToggleBtn.MouseButton1Click:Connect(function()
            toggled = not toggled
            updateToggle()
        end)
        
        -- Обработчик для сенсора через InputBegan
        ToggleBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.Touch then
                toggled = not toggled
                updateToggle()
                
                -- Визуальная обратная связь
                local originalColor = ToggleBtn.BackgroundColor3
                ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
                
                local connection
                connection = input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        ToggleBtn.BackgroundColor3 = originalColor
                        connection:Disconnect()
                    end
                end)
            end
        end)
        
        return Tbutton
    end

    return window
end

return BdevLib
