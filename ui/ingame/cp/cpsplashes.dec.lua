local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CPSplashes()
	local f1_local0 = {
		File = "cp/zombies/zombie_splashtable.csv",
		Ref = 0,
		Name = 1,
		Desc = 2,
		Duration = 4
	}
	local self = LUI.UIElement.new()
	self.id = "splashes"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		right = 0,
		bottom = 0
	} )
	self:animateToState( "default" )
	local f1_local2 = LUI.UIElement.new()
	f1_local2.id = "content"
	f1_local2:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 23,
		left = 0,
		width = 280,
		height = 80
	} )
	f1_local2:animateToState( "default" )
	local f1_local3 = LUI.UIImage.new()
	f1_local3.id = "background"
	f1_local3:registerAnimationState( "default", {
		material = RegisterMaterial( "zmb_hud_message_green_bg" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f1_local3:animateToState( "default" )
	local f1_local4 = LUI.UIImage.new()
	f1_local4.id = "splashImageId"
	f1_local4:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 18,
		left = 12,
		height = 64,
		width = 64,
		material = RegisterMaterial( "hud_icon_pl_zombie" )
	} )
	f1_local4:animateToState( "default" )
	local f1_local5 = LUI.UIText.new()
	f1_local5.id = "title"
	f1_local5:registerAnimationState( "default", {
		red = 0.96,
		green = 0.07,
		blue = 0.8,
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 85,
		width = 447,
		top = -3,
		height = CoD.TextSettings.SmallFont.Height
	} )
	f1_local5:animateToState( "default" )
	f1_local2:addElement( f1_local5 )
	local f1_local6 = LUI.UIText.new()
	f1_local6.id = "desc"
	f1_local6:registerAnimationState( "default", {
		font = CoD.TextSettings.SmallFont.Font,
		alignment = LUI.Alignment.Left,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		left = 85,
		width = 300,
		top = 20,
		height = CoD.TextSettings.SmallFont.Height
	} )
	f1_local6:animateToState( "default" )
	f1_local2:addElement( f1_local6 )
	local f1_local7 = LUI.UIElement.new()
	f1_local7.id = "splashes"
	f1_local7:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -13,
		left = -200,
		width = 380,
		height = 110,
		alpha = 1
	} )
	f1_local7:registerAnimationState( "hidden", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -128,
		left = -200,
		width = 380,
		height = 110,
		alpha = 0
	} )
	f1_local7:animateToState( "hidden" )
	local f1_local8 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
		local f2_local0 = f2_arg1.value
		if not f2_local0 or f2_local0 == -1 then
			f2_arg0:animateToState( "hidden", 0 )
			return 
		end
		local f2_local1 = ""
		if f2_arg4 and f2_arg4 >= 0 then
			f2_local1 = Game.GetPlayerName( f2_arg4 )
		end
		local f2_local2 = Engine.Localize( Engine.TableLookupByRow( f1_local0.File, f2_local0, f1_local0.Desc ), f2_arg3, f2_local1 )
		if not f2_local2 then
			DebugPrint( "WARNING: Missing splash description for row " .. f2_local0 .. " in " .. f1_local0.File )
			return 
		end
		f1_local6:setText( f2_local2 )
		if f2_local1 and not f2_arg2 then
			f2_arg2 = f2_local1
		end
		f1_local5:setText( f2_arg2 )
		local f2_local3 = MBh.AnimateSequence( {
			{
				"hidden",
				0,
				true,
				true
			},
			{
				"default",
				200,
				false,
				true
			},
			{
				"default",
				tonumber( Engine.TableLookupByRow( f1_local0.File, f2_local0, f1_local0.Duration ) ) * 1000,
				true,
				true
			},
			{
				"hidden",
				200,
				true,
				false
			}
		} )
		f2_local3( f2_arg0, {} )
	end
	
	f1_local7:registerOmnvarHandler( "ui_splash_idx", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.value
		local f3_local1 = Game.GetOmnvar( "ui_splash_optional_number" )
		f1_local8( f3_arg0, f3_arg1, Engine.Localize( Engine.TableLookupByRow( f1_local0.File, f3_local0, f1_local0.Name ), f3_local1 ), f3_local1 )
	end )
	f1_local7:registerOmnvarHandler( "ui_splash_playercard_idx", function ( f4_arg0, f4_arg1 )
		f1_local8( f4_arg0, f4_arg1, nil, Game.GetOmnvar( "ui_splash_playercard_optional_number" ), Game.GetOmnvar( "ui_splash_playercard_clientnum" ) )
	end )
	f1_local7:registerOmnvarHandler( "ui_merit_splash_idx", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.value
		local f5_local1 = Game.GetOmnvar( "ui_merit_splash_optional_number" )
		f1_local8( f5_arg0, f5_arg1, Engine.Localize( Engine.TableLookupByRow( f1_local0.File, f5_local0, f1_local0.Name ), f5_local1 ), f5_local1, Game.GetOmnvar( "ui_splash_playercard_clientnum" ) )
	end )
	f1_local7:addElement( f1_local3 )
	f1_local7:addElement( f1_local2 )
	f1_local7:addElement( f1_local4 )
	self:addElement( f1_local7 )
	return self
end

MenuBuilder.registerType( "CPSplashes", CPSplashes )
LockTable( _M )
