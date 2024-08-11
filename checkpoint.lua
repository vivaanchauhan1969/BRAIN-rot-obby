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
local AdvancedRespawnScript=script;
repeat Wait(0)until script and script.Parent and script.Parent.ClassName=="Model";
local Adam=AdvancedRespawnScript.Parent;
local GameDerbis=Game:GetService("Debris");
local AdamHumanoid;
for _,Child in pairs(Adam:GetChildren())do
if Child and Child.ClassName=="Humanoid"and Child.Health>0.001 then
AdamHumanoid=Child;
end;
end;
local Respawndant=Adam:Clone();
coroutine.resume(coroutine.create(function()
if Adam and AdamHumanoid and AdamHumanoid:FindFirstChild("Status")and not AdamHumanoid:FindFirstChild("Status"):FindFirstChild("AvalibleSpawns")then
SpawnModel=Instance.new("Model");
SpawnModel.Parent=AdamHumanoid.Status;
SpawnModel.Name="AvalibleSpawns";
else
SpawnModel=AdamHumanoid:FindFirstChild("Status"):FindFirstChild("AvalibleSpawns");
end;
function FindSpawn(SearchValue)
local PartsArchivable=SearchValue:GetChildren();
for AreaSearch=1,#PartsArchivable do
if PartsArchivable[AreaSearch].className=="SpawnLocation"then
local PositionValue=Instance.new("Vector3Value",SpawnModel);
PositionValue.Value=PartsArchivable[AreaSearch].Position;
PositionValue.Name=PartsArchivable[AreaSearch].Duration;
end;
FindSpawn(PartsArchivable[AreaSearch]);
end;
end;
FindSpawn(Game.Workspace);
local SpawnChilden=SpawnModel:GetChildren();
if#SpawnChilden>0 then
local SpawnItself=SpawnChilden[math.random(1,#SpawnChilden)];
local RespawningForceField=Instance.new("ForceField");
RespawningForceField.Parent=Adam;
RespawningForceField.Name="SpawnForceField";
GameDerbis:AddItem(RespawningForceField,SpawnItself.Name);
Adam:MoveTo(SpawnItself.Value+Vector3.new(0,3.5,0));
else
if Adam:FindFirstChild("SpawnForceField")then
Adam:FindFirstChild("SpawnForceField"):Destroy();
end;
Adam:MoveTo(Vector3.new(0,115,0));
end;
end));
function Respawn()
Wait(5);
Respawndant.Parent=Adam.Parent;
Respawndant:makeJoints();
Respawndant:FindFirstChild("Head"):MakeJoints();
Respawndant:FindFirstChild("Torso"):MakeJoints();
Adam:remove();
end;
AdamHumanoid.Died:connect(Respawn);
sp=script.Parent
lastattack=0
nextrandom=0
nextsound=0
nextjump=0
chasing=false

variance=4

damage=50
attackrange=4.5
sightrange=999--60
runspeed=40
wonderspeed=8
healthregen=false
colors={"Sand red","Dusty Rose","Medium blue","Sand blue","Lavender","Earth green","Brown","Medium stone grey","Brick yellow"}

function raycast(spos,vec,currentdist)
	local hit2,pos2=game.Workspace:FindPartOnRay(Ray.new(spos+(vec*.01),vec*currentdist),script.Parent)
	if hit2~=nil and pos2 then
		if hit2.Parent==script.Parent and hit2.Transparency>=.8 or hit2.Name=="Handle" or string.sub(hit2.Name,1,6)=="Effect" or hit2.Parent:IsA("Hat") or hit2.Parent:IsA("Tool") or (hit2.Parent:FindFirstChild("Humanoid") and hit2.Parent:FindFirstChild("TEAM") and hit2.Parent:FindFirstChild("TEAM").Value == script.Parent.TEAM.Value) or (not hit2.Parent:FindFirstChild("Humanoid") and hit2.CanCollide==false) then
			local currentdist=currentdist-(pos2-spos).magnitude
			return raycast(pos2,vec,currentdist)
		end
	end
	return hit2,pos2
end

function waitForChild(parent,childName)
	local child=parent:findFirstChild(childName)
	if child then return child end
	while true do
		child=parent.ChildAdded:wait()
		if child.Name==childName then return child end
	end
end

local Torso=waitForChild(sp,"Torso")
local Head=waitForChild(sp,"Head")
local RightShoulder=waitForChild(Torso,"Right Shoulder")
local LeftShoulder=waitForChild(Torso,"Left Shoulder")
local RightHip=waitForChild(Torso,"Right Hip")
local LeftHip=waitForChild(Torso,"Left Hip")
local Neck=waitForChild(Torso,"Tail")
local Humanoid=waitForChild(sp,"Humanoid")
local BodyColors=waitForChild(sp,"Body Colors")
local pose="Standing"
local hitsound=waitForChild(Head,"Bite Bark")
local BARKING=waitForChild(Head,"Seal Barking")


local sounds={
	waitForChild(Torso,"GroanSound"),
	waitForChild(Torso,"RawrSound")


if healthregen then
	local regenscript=waitForChild(sp,"HealthRegenerationScript")
	regenscript.Disabled=false
end
Humanoid.WalkSpeed=wonderspeed

local toolAnim="None"
local toolAnimTime=0

function moveJump()
	RightShoulder.MaxVelocity = 0.5
	LeftShoulder.MaxVelocity = 0.5
  RightShoulder.DesiredAngle=3.14
	LeftShoulder.DesiredAngle=-3.14
	RightHip.DesiredAngle=0
	LeftHip.DesiredAngle=0
end

function moveFreeFall()
	RightShoulder.MaxVelocity = 0.5
	LeftShoulder.MaxVelocity =0.5
	RightShoulder.DesiredAngle=3.14
	LeftShoulder.DesiredAngle=-3.14
	RightHip.DesiredAngle=0
	LeftHip.DesiredAngle=0
end

function moveSit()
	RightShoulder.MaxVelocity = 0.15
	LeftShoulder.MaxVelocity = 0.15
	RightShoulder.DesiredAngle=3.14 /2
	LeftShoulder.DesiredAngle=-3.14 /2
	RightHip.DesiredAngle=3.14 /2
	LeftHip.DesiredAngle=-3.14 /2
end

function animate(time)
	local amplitude
	local frequency
	if (pose == "Jumping") then
		moveJump()
		return
	end
	if (pose == "FreeFall") then
		moveFreeFall()
		return
	end
	if (pose == "Seated") then
		moveSit()
		return
	end
	local climbFudge = 0
	if (pose == "Running") then
		RightShoulder.MaxVelocity = 0.15
		LeftShoulder.MaxVelocity = 0.15
		amplitude = 1
		frequency = 9
	elseif (pose == "Climbing") then
		RightShoulder.MaxVelocity = 0.5 
		LeftShoulder.MaxVelocity = 0.5
		amplitude = 1
		frequency = 9
		climbFudge = 3.14
	else
		amplitude = 0.1
		frequency = 1
	end
	desiredAngle = amplitude * math.sin(time*frequency)
	if not chasing and frequency==9 then
		frequency=4
	end
	if chasing then
		[RightShoulder.DesiredAngle=math.pi/2
		LeftShoulder.DesiredAngle=-math.pi/2
		RightHip.DesiredAngle=-desiredAngle*2
		LeftHip.DesiredAngle=-desiredAngle*2]]
	else
