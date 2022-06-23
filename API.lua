-- Test Script
local Libary = require(script.LoboUILibary) -- > Loadstring

local Window = Libary.CreateLibary("Menu Name", "Dark") -- Second Argument: Theme Name
local Section = Window:CreateSection("Section Name")

-- TextButton
local TriggerButton = Section:Button("Trigger", "Triggeres a remote event.", function()
	print("Hello World!")
end)

-- TextLabel
local Label = Section:Label("This is a label test", "This is a test")

-- TextBox (string)
local StringInput = Section:String("Input a word", "Input a word into the box")

-- TextBox (integar)
local IntegarInput = Section:Number("Input a number", "Input a number into the box")

-- Slider (Non-Roblox Core Gui)
local Slider = Section:Slider("WalkSpeed", "Changes the walkspeed of the player", 120, 16, function(value)
	print(value.." is the current walkspeed of the player!")
end)

-- Boolean (CheckBox) (Non-Roblox Core Gui)
local PlayerExists = false
local Boolean = Section:Boolean("Check if player exists", "It checks if the player exists", PlayerExists)

-- DropDown
local DropDown = Section:DropDown("Worlds", "Teleport to a world.", {"Overworld", "Netherworld", "TheEnd"}, function(world)
	print("Teleporting to "..world)
end)
