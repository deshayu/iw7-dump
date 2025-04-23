LUI.TownIntro = LUI.Class( LUI.UIElement )
local f0_local0 = 10000
LUI.TownIntro.init = function ( f1_arg0, f1_arg1 )
	LUI.TownIntro.super.init( f1_arg0 )
	f1_arg0.id = "RigBootup"
	f1_arg0.show = false
	f1_arg0.played = false
	f1_arg0.controllerIndex = f1_arg1
	f1_arg0:registerOmnvarHandler( "zm_ui_dialpad_9", function ( f2_arg0, f2_arg1 )
		if f2_arg1.value == 1 then
			f2_arg0:CheckStartBink()
		end
	end )
end

LUI.TownIntro.ShouldBeVisible = function ( f3_arg0 )
	return f3_arg0.show
end

LUI.TownIntro.InitLayer = function ( f4_arg0 )
	if f4_arg0.played then
		DebugPrint( "WARNING: townBootup bink trying to play when it's already played. This should not happen" )
		f4_arg0:FinishPlayBink()
		return 
	else
		local f4_local0 = "aotrt_title"
		if not f4_local0 then
			f4_arg0:FinishPlayBink()
			return 
		else
			local self = LUI.UIImage.new( {
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
			self.id = "bink"
			f4_arg0:addElement( self )
			Engine.PlayMenuVideo( f4_local0 )
			f4_arg0.played = true
			f4_arg0:dispatchEventToRoot( {
				name = "prep_bootup",
				immediate = true
			} )
			local f4_local2 = f4_arg0:Wait( f0_local0 )
			f4_local2.onComplete = function ()
				f4_arg0:FinishPlayBink()
			end
			
		end
	end
end

LUI.TownIntro.ClearLayer = function ( f6_arg0, f6_arg1 )
	f6_arg0:closeChildren()
end

LUI.TownIntro.CheckStartBink = function ( f7_arg0 )
	if f7_arg0.played then
		return 
	else
		f7_arg0.show = true
	end
end

LUI.TownIntro.FinishPlayBink = function ( f8_arg0 )
	if f8_arg0.show then
		f8_arg0.show = false
		f8_arg0:dispatchEventToRoot( {
			name = "bootup_hud",
			immediate = true
		} )
	end
end

LUI.TownIntro.Frame = function ( f9_arg0 )
	if f9_arg0.show and f9_arg0.played and Engine.IsVideoFinished() then
		f9_arg0:FinishPlayBink()
	end
end

LUI.TownIntro.Start = function ()
	local f10_local0 = LUI.RigBootup.GetInstance()
	if f10_local0 then
		f10_local0:CheckStartBink()
	end
end

LUI.TownIntro.HasPlayed = function ()
	local f11_local0 = LUI.TownIntro.GetInstance()
	if f11_local0 then
		local f11_local1
		if not f11_local0.show then
			f11_local1 = f11_local0.played
		else
			f11_local1 = false
		end
		return f11_local1
	else
		return true
	end
end

LUI.TownIntro.GetInstance = function ()
	local f12_local0 = Engine.GetLuiRoot()
	assert( f12_local0 )
	return f12_local0.townBootup
end

