LUI.RigBootup = LUI.Class( LUI.UIElement )
local f0_local0 = 20000
local f0_local1 = 28000
local f0_local2 = 5
LUI.RigBootup.init = function ( f1_arg0, f1_arg1 )
	LUI.RigBootup.super.init( f1_arg0 )
	f1_arg0.id = "RigBootup"
	f1_arg0.show = false
	f1_arg0.played = false
	f1_arg0.controllerIndex = f1_arg1
	f1_arg0:registerOmnvarHandler( "ui_session_state", function ( f2_arg0, f2_arg1 )
		if f2_arg1.value == "playing" then
			f2_arg0:CheckStartBink()
		end
	end )
end

LUI.RigBootup.ShouldBeVisible = function ( f3_arg0 )
	return f3_arg0.show
end

LUI.RigBootup.InitLayer = function ( f4_arg0 )
	if f4_arg0.played then
		DebugPrint( "WARNING: Rigbootup bink trying to play when it's already played. This should not happen" )
		f4_arg0:FinishPlayBink()
		return 
	end
	local f4_local0 = Game.GetTime()
	if f0_local0 <= f4_local0 then
		return 
	end
	local f4_local1, f4_local2 = nil
	if GameX.IsRankedMatch() then
		f4_local1 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
	else
		f4_local1 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
	if f4_local1 and f4_local1.archetype then
		local self = f4_local1.archetype:GetValue( f4_arg0.controllerIndex )
		if self then
			f4_local2 = Cac.GetRigBootupBink( self )
		end
	end
	if not f4_local2 then
		f4_arg0:FinishPlayBink()
		return 
	end
	local self = LUI.UIImage.new()
	self:SetRGBFromInt( 0 )
	self:SetAlpha( 1 )
	self.id = "background"
	f4_arg0:addElement( self )
	local f4_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "cinematic" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f4_local4.id = "bink"
	f4_arg0:addElement( f4_local4 )
	Engine.PlayMenuVideo( f4_local2 )
	f4_arg0.played = true
	local f4_local5 = f4_arg0:Wait( 1000 )
	f4_local5.onComplete = function ()
		self:SetAlpha( 0 )
	end
	
	f4_arg0:dispatchEventToRoot( {
		name = "prep_bootup",
		immediate = true
	} )
	f4_local5 = f4_arg0:Wait( 3200 )
	f4_local5.onComplete = function ()
		Engine.NotifyServer( "rig_boot_started", 1 )
	end
	
	local f4_local6 = f4_arg0:Wait( f0_local1 - f4_local0 )
	f4_local6.onComplete = function ()
		f4_arg0:FinishPlayBink()
	end
	
end

LUI.RigBootup.ClearLayer = function ( f8_arg0, f8_arg1 )
	f8_arg0:closeChildren()
end

LUI.RigBootup.CheckStartBink = function ( f9_arg0 )
	if f9_arg0.played then
		return 
	end
	if f0_local0 > Game.GetTime() and f0_local2 < Game.GetOmnvar( "ui_match_start_countdown" ) then
		f9_arg0.show = true
	else
		f9_arg0.show = false
	end
end

LUI.RigBootup.FinishPlayBink = function ( f10_arg0 )
	if f10_arg0.show then
		f10_arg0.show = false
		f10_arg0:dispatchEventToRoot( {
			name = "bootup_hud",
			immediate = true
		} )
	end
end

LUI.RigBootup.Frame = function ( f11_arg0 )
	if f11_arg0.show and f11_arg0.played and Engine.IsVideoFinished() then
		f11_arg0:FinishPlayBink()
	end
end

LUI.RigBootup.Start = function ()
	local f12_local0 = LUI.RigBootup.GetInstance()
	if f12_local0 then
		f12_local0:CheckStartBink()
	end
end

LUI.RigBootup.HasPlayed = function ()
	local f13_local0 = LUI.RigBootup.GetInstance()
	if f13_local0 then
		local f13_local1
		if not f13_local0.show then
			f13_local1 = f13_local0.played
		else
			f13_local1 = false
		end
		return f13_local1
	else
		return true
	end
end

LUI.RigBootup.GetInstance = function ()
	local f14_local0 = Engine.GetLuiRoot()
	assert( f14_local0 )
	return f14_local0.rigBootup
end

