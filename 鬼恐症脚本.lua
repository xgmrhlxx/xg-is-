-只有被开源才能成长经过冷
局部光线场= loadstring(游戏:http get(' https://Sirius。菜单/光线场'))()

局部窗口=光线场:创建窗口({
Name = "恐鬼症 1.2.1 [停更]",
Icon = 0，
LoadingTitle = "恐鬼症 1.2.1 [停更]",
LoadingSubtitle = "由西瓜",
主题= "深蓝",

DisableRayfieldPrompts = false，
DisableBuildWarnings = false，

KeySystem = true，
按键设置= {
Title = "恐鬼症 1.2.1 [停更]",
字幕= "验证系统",
注意= "加入群聊看公告获取卡密 企鹅交流群:751910733",
文件名= "恐怖",
SaveKey = true，
GrabKeyFromSite = false，
Key = { "龙城" }
   }
})

--函数
本地照明=游戏:GetService("照明")
本地玩家= game:GetService(“玩家")
本地玩家=玩家。本地播放器
本地工作空间= workspace:GetDescendants()
本地工作空间1 =游戏:获取服务(“工作空间”)
--函数

--锁定函数
本地GhostLock = true
--锁定函数

--初始化诅咒道具透视函数
本地诅咒= {}
对于_，ipairs(工作区)中的被诅咒的恶臭
如果被诅咒卒:IsA(“模型")和被诅咒的卒. Name == "显灵板"
被诅咒的=被诅咒的卒
结束
如果被诅咒卒:IsA(“模型")和被诅咒的卒. Name == "召唤循环"
被诅咒的=被诅咒的卒
结束
如果被诅咒的棋子:IsA(“工具")和被诅咒的棋子. Name == "塔罗牌"
被诅咒的=被诅咒的卒
结束
结束
--初始化诅咒道具透视函数

--初始化互动透视
local EMFBillboardGuiDescendantAdded
function EMFBillboardGui(descendant)
	if descendant:IsA("Part") and descendant.Name == "EMFPart" then
		local BillboardGui = Instance.new("BillboardGui")
		local TextLabel = Instance.new("TextLabel")

        BillboardGui.Name = "EMFBillboardGui"
		BillboardGui.Parent = descendant
        BillboardGui.AlwaysOnTop = true
        BillboardGui.Size = UDim2.new(0, 40, 0, 20)

        TextLabel.Parent = BillboardGui
文本标签。Text = "互动"
文本标签。BackgroundTransparency = 1
文本标签。Size = UDim2.new(0，40，0，20)
文本标签。TextColor3 = Color3.fromRGB(70，255，0)
文本标签。TextSize = 10
结束
结束
--初始化互动透视

local Function = Window:CreateTab("功能", "book-check")

--证据
local Section = Function:CreateSection("证据")
local EMFCountLabel = Function:CreateParagraph({Title = "互动(电磁场读取)", Content = "出现次数:未知"})
local Thermometer = Function:CreateParagraph({Title = "冻结温度(一直获取 = 没有冻结温度)", Content = "获取中..."})
local Ouijabox = Function:CreateParagraph({Title = "精灵盒(道具需要在鬼房)", Content = "捕捉中..."})
--证据

--玩家
local Section = Function:CreateSection("玩家")
local Collision = Function:CreateToggle({
    Name = "穿门",
    CurrentValue = false,
    Flag = "切换按钮",
    Callback = function(Value)
        for _, Doors in ipairs(Workspace) do
            if Doors:IsA("Folder") and Doors.Name == "Doors" then
            local ModelDoors = Doors:GetDescendants()
		        for _, ModelDoor in ipairs(ModelDoors) do
		            if ModelDoor:IsA("MeshPart") or ModelDoor:IsA("Part") then
			            if ModelDoor.Name == "RightDoor" or ModelDoor.Name == "LeftDoor" or ModelDoor.Name == "Door"  then
					        if ModelDoor.CanCollide then
						        ModelDoor.CanCollide = false
					        	else
					            ModelDoor.CanCollide = true
					        end
			        	end
		        	end
		        end
            end
        end
    end,
})
local Light = Function:CreateButton({
    Name = "夜视",
    Callback = function()
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.GlobalShadows = false
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.FogStart = 0
        Lighting.Atmosphere:Destroy()
    end,
})
local SpeedPlayer = Function:CreateToggle({
   Name = "稳定速度+无限体力(BUG利用)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if Value then
            for _, LocalPlayer in ipairs(LocalPlayer:GetChildren()) do
	            if LocalPlayer.Name == "Dead" then
					LocalPlayer.Value = true
	            end
            end
            Rayfield:Notify({
               Title = "告知",
                Content = "开启后加速无法关闭，除非游戏重置移动数度",
                Duration = 5,
                Image = "triangle-alert",
            })
			else
            for _, LocalPlayer in ipairs(LocalPlayer:GetChildren()) do
	            if LocalPlayer.Name == "Dead" then
					LocalPlayer.Value = false
	            end
            end
		end
   end,
})
--玩家

--透视
local Section = Function:CreateSection("透视")
local Ghost = Function:CreateToggle({
   Name = "幽灵",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if GhostLock then
            GhostLock = false
            GhostESP()
            else
            GhostLock = true
        end
   end,
})
local EMF = Function:CreateToggle({
   Name = "互动",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if Value then
			EMFBillboardGuiDescendantAdded = workspace.Map.DescendantAdded:Connect(EMFBillboardGui)
			else
			EMFBillboardGuiDescendantAdded:Disconnect()
		end
   end,
})
local Cursed = Function:CreateToggle({
   Name = "诅咒道具",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if Value then
			local CursedHighlight = Cursed:FindFirstChild("CursedESP")
            if not CursedHighlight then
	            local Highlight = Instance.new("Highlight")
                Highlight.Name = "CursedESP"
                Highlight.Parent = Cursed
                Highlight.FillTransparency = 1
                Highlight.OutlineColor = Color3.fromRGB(255, 170, 127)
                Highlight.OutlineTransparency = 0.2
            end
			else
			local CursedHighlightDestroy = Cursed:FindFirstChild("CursedESP")
            if CursedHighlightDestroy then
				CursedHighlightDestroy:Destroy()
			end
		end
   end,
})
local VoodooDoll = Function:CreateToggle({
   Name = "巫毒娃娃",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if Value then
			local VoodooDoll = Workspace1.VoodooDoll
            local VoodooDollHighlightRepeat = VoodooDoll:FindFirstChild("VoodooDollESP")
            if not VoodooDollHighlightRepeat then
                local Highlight = Instance.new("Highlight")
                Highlight.Name = "VoodooDollESP"
                Highlight.Parent = VoodooDoll
                Highlight.FillTransparency = 1
                Highlight.OutlineColor = Color3.fromRGB(0,255,255)
                Highlight.OutlineTransparency = 0.5
            end
			else
			local VoodooDollDestroy = Workspace1.VoodooDoll
            local VoodooDollHighlightRepeatDestroy = VoodooDollDestroy:FindFirstChild("VoodooDollESP")
            if VoodooDollHighlightRepeatDestroy then
				VoodooDollHighlightRepeatDestroy:Destroy()
			end
		end
   end,
})
local Generators = Function:CreateToggle({
   Name = "发电机",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if Value then
            local Generators = Workspace1.Map.Generators.GeneratorMesh
            local GeneratorsHighlightRepeat = Generators:FindFirstChild("GeneratorsESP")
            if not GeneratorsHighlightRepeat then
                local Highlight = Instance.new("Highlight")
                Highlight.Name = "GeneratorsESP"
                Highlight.Parent = Generators
                Highlight.FillTransparency = 1
                Highlight.OutlineColor = Color3.fromRGB(255, 255, 127)
                Highlight.OutlineTransparency = 0.3
            end
			else
			local GeneratorsDestroy = Workspace1.Map.Generators.GeneratorMesh
            local GeneratorsHighlightRepeatDestroy = GeneratorsDestroy:FindFirstChild("GeneratorsESP")
            if GeneratorsHighlightRepeatDestroy then
				GeneratorsHighlightRepeatDestroy:Destroy()
			end
		end
   end,
})
--透视

--恶搞
local Section = Function:CreateSection("恶搞")
local Death = Function:CreateButton({
   Name = "自杀(确保自己没有带道具再使用)",
   Callback = function()
        local DeathLocalPlayer = Players.LocalPlayer
        local DeathCharacter = DeathLocalPlayer.Character
        local DeathHumanoid = DeathCharacter.Humanoid
		DeathHumanoid.Health = 0
   end,
})

--恶搞

local Announcement = Window:CreateTab("公告", "bell-ring")
--公告
local Paragraph = Announcement:CreateParagraph({Title = "[+]添加[卡密]功能", Content = "为了能更好的集中一个群内"})
local Paragraph = Announcement:CreateParagraph({Title = "[+]修复[穿门]功能", Content = "修复了无法穿其他地图的大门了"})
local Paragraph = Announcement:CreateParagraph({Title = "[+]添加[自杀]功能", Content = "可以让自己随时随地死亡了"})
local Paragraph = Announcement:CreateParagraph({Title = "[+]透视更改", Content = "可以关闭啦"})
local Paragraph = Announcement:CreateParagraph({Title = "[+]布局重组", Content = "更美观啦"})
local Paragraph = Announcement:CreateParagraph({Title = "[+]公告窗口", Content = "可以查看更详细的更新内容啦"})
--公告

local Player = Window:CreateTab("防巡查(玩家加入记录)", "triangle-alert")
--初始化防巡查
local function onPlayerJoin(player)
    local playerName = "Name:" .. player.Name
	local playerId = "ID:" .. player.UserId
    local PlayersTitie = Player:CreateParagraph({Title = playerName, Content = playerId})
	Rayfield:Notify({
        Title = "玩家加入记录",
        Content = "有新玩家加入了本局，疑似巡查请注意演戏",
        Duration = 5,
        Image = "triangle-alert",
    })
end
Players.PlayerAdded:Connect(onPlayerJoin)
--初始化防巡查

--初始化EMF出现次数
local EMFCount = 0
function MapDescendantAdded(descendant)
	if descendant:IsA("Part") and descendant.Name == "EMFPart" then
	    EMFCount = EMFCount + 1
		local EMFMerge = "出现次数:" .. EMFCount
        EMFCountLabel:Set({Title = "互动(电磁场读取)", Content = EMFMerge})
结束
结束
工作空间。map . DescendantAdded:Connect(MapDescendantAdded)
--初始化EMF出现次数

--初始化幽灵透视
函数GhostESP()
重复
for _，Ghost in IPA IRS(workspace 1:get children())do
如果鬼。Name == "Ghost "和Ghost:IsA("Model ")那么
local Ghost parts = Ghost:get children()
对于_，ghost part in ipairs(ghost parts)do
如果GhostPart:IsA("MeshPart ")，则
local New = ghost part:findfirst child(" ghost esp ")
如果不是新的，那么
local boxshandledecoration = instance . new(" boxshandledecoration ")
box handler装饰。Name = "GhostESP "
box handler装饰。Size = Vector3.new(1，1，1)
box handler装饰。AlwaysOnTop = true
box handler装饰。ZIndex = 5
box handler装饰。Parent = GhostPart
box handler装饰。Adornee = GhostPart
box handler装饰。透明度= 0.4
结束
结束
结束
结束
结束
等待(1)
直到幽灵锁定
结束
--初始化幽灵透视
--初始化精灵盒功能
local Spirit = workspace:get descendants()
local Name = "酒精盒"
本地锁2 =假

函数onchildAdded(子级)
如果孩子:IsA(“声音”)，则
local child name = string . lower(child。姓名)
Ouijabox:Set({Title = "精灵盒（道具需要在鬼房)"，Content = childName})
如果Lock2 == false，则
Rayfield:通知({
Title = "精灵盒",
内容= "精灵盒获取成功,请在界面内查看",
持续时间= 5，
Image = "检查"，
            })
结束
锁定2 =真
结束
结束

为_，ipairs中的SpiritName(精神)做
如果SpiritName .名称= =名称和精神名称:IsA("工具")然后
local Handle = spirit name:get children()
对于_，ipairs中的句柄名称(Handle)do
如果HandleName。Name == "处理"然后
HandleName。child added:Connect(onchildAdded)
结束
结束
结束
结束
--初始化精灵盒功能
Rayfield:LoadConfiguration()
--初始化冻结温度功能
本地锁=假
重复
对于_，ipairs(Workspace)中的工作区do
如果工作区。Name = = " _ _ _ _ _温度"那么
如果工作区。值< 0和工作空间。那么值>-3
本地工作空间值=数量(工作空间。值)
温度计:设置({Title = "冻结温度（一直获取=没有冻结温度)"，Content = WorkspaceValue})
Rayfield:通知({
Title = "冻结温度",
内容= "冻结温度获取成功,请在界面内查看",
持续时间= 5，
Image = "检查"，
                })
锁定=真
结束
结束
结束
等待(1)
直到锁定
--初始化冻结温度功能
