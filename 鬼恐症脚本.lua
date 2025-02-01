-- 获取游戏的核心服务
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- 创建一个屏幕GUI对象
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

-- 创建一个按钮对象
local Button = Instance.new("TextButton")
Button.Parent = ScreenGui
Button.Text = "点击我"
Button.Size = UDim2.new(0.2, 0, 0.1, 0)
Button.Position = UDim2.new(0.4, 0, 0.4, 0)

-- 定义变量来存储鼠标状态和初始位置
local isDragging = false
local dragStartPosition
local mouse

-- 连接鼠标按下事件
Button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStartPosition = input.Position
        mouse = Player:GetMouse()
    end
end)

-- 连接鼠标移动事件
Button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and isDragging then
        local delta = input.Position - dragStartPosition
        local newX = Button.Position.X.Scale + (delta.X / ScreenGui.AbsoluteSize.X)
        local newY = Button.Position.Y.Scale + (delta.Y / ScreenGui.AbsoluteSize.Y)
        Button.Position = UDim2.new(newX, 0, newY, 0)
    end
end)

-- 连接鼠标释放事件
Button.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- 点击按钮后的反馈函数
local function showFeedback()
    -- 创建反馈的Frame
    local feedbackFrame = Instance.new("Frame")
    feedbackFrame.Parent = ScreenGui
    feedbackFrame.Size = UDim2.new(0.2, 0, 0.1, 0)
    feedbackFrame.Position = UDim2.new(0.8, 0, 0.9, 0)
    feedbackFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- 绿色背景
    feedbackFrame.Visible = false
    feedbackFrame.Transparency = 1

    -- 创建反馈的文本
    local feedbackText = Instance.new("TextLabel")
    feedbackText.Parent = feedbackFrame
    feedbackText.Text = "按钮被点击了！"
    feedbackText.Size = UDim2.new(1, 0, 1, 0)
    feedbackText.TextScaled = true
    feedbackText.TextColor3 = Color3.fromRGB(255, 255, 255) -- 白色文本

    -- 显示动画
    local showInfo = TweenInfo.new(
        0.5, -- 动画持续时间
        Enum.EasingStyle.Quad, -- 缓动样式
        Enum.EasingDirection.Out -- 缓动方向
    )
    local showGoal = {
        Transparency = 0,
        Visible = true
    }
    local showTween = TweenService:Create(feedbackFrame, showInfo, showGoal)
    showTween:Play()

    -- 两秒后执行消失动画
    task.wait(2)
    local hideInfo = TweenInfo.new(
        0.5, -- 动画持续时间
        Enum.EasingStyle.Quad, -- 缓动样式
        Enum.EasingDirection.In -- 缓动方向
    )
    local hideGoal = {
        Transparency = 1,
        Visible = false
    }
    local hideTween = TweenService:Create(feedbackFrame, hideInfo, hideGoal)
    hideTween:Play()
    hideTween.Completed:Wait()
    feedbackFrame:Destroy()
end

-- 给按钮添加点击事件
Button.MouseButton1Click:Connect(showFeedback)
