local spawn = script.Parent
spawn.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		local checkpointData = game.ServerStorage:FindFirstChild("CheckpointData")
		if not checkpointData then
			checkpointData = Instance.new("Model", game.ServerStorage)
			checkpointData.Name = "CheckpointData"
		end
		
		local checkpoint = checkpointData:FindFirstChild(tostring(player.userId))
		if not checkpoint then
			checkpoint = Instance.new("ObjectValue", checkpointData)
			checkpoint.Name = tostring(player.userId)
			
			player.CharacterAdded:connect(function(character)
				wait()
				character:WaitForChild("HumanoidRootPart").CFrame = game.ServerStorage.CheckpointData[tostring(player.userId)].Value.CFrame + Vector3.new(0, 4, 0)
			end)
		end
		
		checkpoint.Value = spawn
	end
end)

script.Parent.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health = 0
	end
end)
local conveyor = script.Parent
conveyor.Velocity = conveyor.CFrame:vectorToWorldSpace(Vector3.new(0, 0, -conveyor.Configuration.Speed.Value))
conveyor.SurfaceGui.Enabled = false
script.Parent.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		hit.Parent.Humanoid.Health = 0
	end
local spawn = script.Parent
spawn.Touched:connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		local checkpointData = game.ServerStorage:FindFirstChild("CheckpointData")
		if not checkpointData then
			checkpointData = Instance.new("Model", game.ServerStorage)
			checkpointData.Name = "CheckpointData"
		end
		
		local checkpoint = checkpointData:FindFirstChild(tostring(player.userId))
		if not checkpoint then
			checkpoint = Instance.new("ObjectValue", checkpointData)
			checkpoint.Name = tostring(player.userId)
			
			player.CharacterAdded:connect(function(character)
				wait()
end)
local trampoline = script.Parent
trampoline.Velocity = Vector3.new(0, trampoline.Configuration.BounceSpeed.Value, 0)
trampoline.SurfaceGui.Enabled = false	
local debounce = false

function getPlayer(humanoid) 
local players = game.Players:children() 
for i = 1, #players do 
if players[i].Character.Humanoid == humanoid then return players[i] end 
end 
return nil 
end 

function onTouch(part) 

local human = part.Parent:findFirstChild("Humanoid") 
if (human ~= nil) and debounce == false then

debounce = true

local player = getPlayer(human) 

if (player == nil) then return end 

script.Parent:clone().Parent = player.Backpack

wait(2)
debounce = false
end
end


script.Parent.Parent.Touched:connect(onTouch) 
