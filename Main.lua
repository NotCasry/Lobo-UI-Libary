local Lobo = {}

local Player = game.Players.LocalPlayer
local StarterGui = Player:FindFirstChild("PlayerGui")

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

local new = Instance.new

_G.CloseKey = Enum.KeyCode.LeftAlt

local TweenService = game:GetService("TweenService")

local Themes = {

	Dark = {
		Header = Color3.fromRGB(25, 25, 25),
		Background = Color3.fromRGB(45, 45, 45),
		TextColor = Color3.fromRGB(255, 255, 255),
		TextFont = Enum.Font.Arial
	};

	Light = {
		Header = Color3.fromRGB(255, 255, 255),
		Background = Color3.fromRGB(245, 245, 245),
		TextColor = Color3.fromRGB(0, 0, 0),
		TextFont = Enum.Font.Arial
	};

}

-- Yes I know this is the same as the Kavo
local LibaryName = tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))..tostring(math.random(1, 100))..tostring(math.random(1,50))..tostring(math.random(1, 100))

-- Dragging also from Kavo
function Lobo:Dragging(frame, parent)

	parent = parent or frame

	local dragging = false
	local dragInput, mousePos, framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = parent.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	input.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			TweenService:Create(parent, tweeninfo(0.3), {Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)}):Play()
		end
	end)
end

function Lobo:ToggleUI()
	if (StarterGui[LibaryName].Enabled) then
		StarterGui[LibaryName].Enabled = false
	else
		StarterGui[LibaryName].Enabled = true
	end
end

function Lobo.CreateLibary(LibName, ThemeName)
	local ScreenGui = new("ScreenGui")
	local Main = new("Frame")
	local MainHeader = new("Frame")
	local MainUICorner = new("UICorner")
	local HeaderUICorner = new("UICorner")
	local MainOptions = new("Frame")
	local OptionsListLayout = new("UIListLayout")
	local Title = Instance.new("TextLabel")
	
	Lobo:Dragging(MainHeader, Main)
	
	--Names
	ScreenGui.Name = LibaryName
	Main.Name = "MAIN_FRAME"
	MainHeader.Name = "MAIN_HEADER"
	MainUICorner.Name = "UI_CORNER"
	HeaderUICorner.Name = "HEADER_UI_CORNER"
	MainOptions.Name = "MAIN_OPTIONS"
	OptionsListLayout.Name = "OPTIONS_LAYOUT"
	Title.Name = "HEADER_TITLE"

	--Parents
	ScreenGui.Parent = StarterGui
	Main.Parent = ScreenGui
	MainHeader.Parent = Main
	MainUICorner.Parent = Main
	HeaderUICorner.Parent = MainHeader
	MainOptions.Parent = Main
	OptionsListLayout.Parent = MainOptions
	Title.Parent = Main
	
	--Properties
	ScreenGui.ResetOnSpawn = false
	
	Main.Size = UDim2.new(0.343, 0, 0.537, 0)
	Main.Position = UDim2.new(0.014, 0, 0.442, 0)

	Main.BackgroundColor3 = Themes[ThemeName]["Background"]

	MainHeader.Size = UDim2.new(1, 0, 0.143, 0)
	MainHeader.Position = UDim2.new(0, 0, 0, 0)
	MainHeader.BackgroundColor3 = Themes[ThemeName]["Header"]
	
	MainOptions.Size = UDim2.new(0.358, 0, 0.856, 0)
	MainOptions.Position = UDim2.new(0, 0, 0.143, 0)
	MainOptions.BorderSizePixel = 0
	MainOptions.BackgroundColor3 = Themes[ThemeName]["Header"]
	
	OptionsListLayout.Padding = UDim.new(0, 25)
	
	Title.BackgroundTransparency = 1
	Title.TextColor3 = Themes[ThemeName]["TextColor"]
	Title.Font = Themes[ThemeName]["TextFont"]
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Size = UDim2.new(0.242, 0, 0.104, 0)
	Title.Position = UDim2.new(0.022, 0, 0.018, 0)
	Title.TextSize = 35
	Title.Text = LibName

	local self = {}

	function self:CreateSection(SectionName)
		-- Create Section Here
		local lo = {}

		function lo:Button(ButtonName, ButtonDescription, ButtonFunction)
		end

		function lo:Label(LabelName, LabelText)
		end

		function lo:String(InputName, InputDescription)
		end

		function lo:Number(InputName, InputDescription)
		end

		function lo:Slider(SliderName, SliderDescription, MinimumValue, MaximumValue, SliderFunction)
		end

		function lo:Boolean(BooleanName, BooleanDescription, Boolean)
		end

		function lo:DropDown(DropDownName, DropDownDescription, DropDownTable, DropDownFunction)
		end

		return lo
	end
	
	input.InputBegan:Connect(function(input, gameProcessedEvent)
		if not gameProcessedEvent then
			if input.KeyCode == _G.CloseKey then
				Lobo:ToggleUI()
			end
		end
	end)

	return self
end

return Lobo
