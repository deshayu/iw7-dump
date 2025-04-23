local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 512
f0_local1 = 512
f0_local2 = 1
local f0_local3 = 2
local f0_local4 = -1
local f0_local5 = -2
local f0_local6 = -2
local f0_local7 = -3
local f0_local8 = 3
local f0_local9 = 4
local f0_local10 = 5
local f0_local11 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = "@KILLSTREAKS_PRECISION_AIRSTRIKE"
	local f1_local1 = "@KILLSTREAKS_ODIN_ASSAULT"
	local f1_local2 = "@PLATFORM_ODIN_SMOKE"
	local f1_local3 = "@PLATFORM_ODIN_AIRDROP"
	local f1_local4 = "@PLATFORM_ODIN_MARKING"
	local f1_local5 = "@PLATFORM_ODIN_JUGGERNAUT"
	local f1_local6 = "@PLATFORM_ODIN_LARGE_ROD"
	local f1_local7 = "@PLATFORM_ODIN_SMALL_ROD"
	local f1_local8 = "@LUA_MENU_CALLSTRIKE"
	local f1_local9 = "@KILLSTREAKS_ORBITAL_DEPLOYMENT_CAPS"
	local f1_local10 = "@KILLSTREAKS_THOR"
	local f1_local11 = "@LUA_MENU_MP_SUIT_REAPER"
	if f1_arg1.value == f0_local8 then
		f1_local6 = "@LUA_MENU_MP_ORBITAL_DEPLOYMENT_SELECTION"
		f1_local7 = ""
	elseif f1_arg1.value == f0_local9 then
		f1_local6 = "@LUA_MENU_MP_THOR_MISSILE"
		f1_local7 = ""
	elseif f1_arg1.value == f0_local10 then
		f1_local6 = "@LUA_MENU_MP_REAPER_CAPS"
		f1_local7 = "@SUPER_MP_REAPER_THERMAL"
	end
	f1_arg0.curValue = f1_arg1.value
	if f1_arg1.value == f0_local2 or f1_arg1.value == f0_local3 or f1_arg1.value == f0_local8 or f1_arg1.value == f0_local9 or f1_arg1.value == f0_local10 then
		f1_arg0:animateToState( "active", 0 )
		local f1_local12 = f1_arg0:getChildById( "odinControlsLeftId" )
		local f1_local13 = f1_local12:getChildById( "odinControlsLeftVLId" )
		local f1_local14 = f1_arg0:getChildById( "odinControlsRightId" )
		local f1_local15 = f1_local14:getChildById( "odinControlsRightVLId" )
		local f1_local16 = f1_local13:getChildById( "smokeTextId" )
		local f1_local17 = f1_local13:getChildById( "airdropTextId" )
		local f1_local18 = f1_local15:getChildById( "markingTextId" )
		local f1_local19 = f1_local15:getChildById( "juggernautTextId" )
		if f1_arg1.value == f0_local2 then
			f1_local16:setText( Engine.Localize( f1_local2 ) )
			f1_local16.current_state = "smoke"
			f1_local17:setText( Engine.Localize( f1_local3 ) )
			f1_local17.current_state = "airdrop"
			f1_local18:setText( Engine.Localize( f1_local4 ) )
			f1_local18.current_state = "marking"
			f1_local19:setText( Engine.Localize( f1_local5 ) )
			f1_local19.current_state = "juggernaut"
		elseif f1_arg1.value == f0_local3 then
			f1_local16:setText( Engine.Localize( f1_local7 ) )
			f1_local16.current_state = "small_rod"
			f1_local17:setText( Engine.Localize( f1_local3 ) )
			f1_local17.current_state = "airdrop"
			f1_local18:setText( Engine.Localize( f1_local6 ) )
			f1_local18.current_state = "large_rod"
			f1_local19:setText( Engine.Localize( f1_local5 ) )
			f1_local19.current_state = "juggernaut"
		elseif f1_arg1.value == f0_local8 or f1_arg1.value == f0_local9 or f1_arg1.value == f0_local10 then
			f1_local16:setText( Engine.Localize( f1_local7 ) )
			f1_local16.current_state = "small_rod"
			f1_local17:setText( Engine.Localize( f1_local3 ) )
			f1_local17.current_state = "airdrop"
			f1_local18:setText( Engine.Localize( f1_local6 ) )
			f1_local18.current_state = "large_rod"
			f1_local19:setText( Engine.Localize( f1_local5 ) )
			f1_local19.current_state = "juggernaut"
		end
		local f1_local20 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				150
			}
		} )
		f1_local20( f1_local12 )
		f1_local20 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				150
			}
		} )
		f1_local20( f1_local14 )
	else
		f1_arg0:animateToState( "default", 0 )
	end
end

local f0_local12 = function ()
	local f2_local0 = "@PLATFORM_ODIN_AIRDROP"
	local f2_local1 = "@PLATFORM_ODIN_SMOKE"
	local self = LUI.UIElement.new()
	self.id = "odinControlsLeftId"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		left = -750,
		top = -32,
		bottom = 32,
		width = 512,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local f2_local3 = LUI.UIVerticalList.new()
	f2_local3.id = "odinControlsLeftVLId"
	f2_local3:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		spacing = 20
	} )
	f2_local3:animateToState( "default", 0 )
	local f2_local4 = LUI.UIText.new()
	f2_local4.id = "airdropTextId"
	f2_local4:setText( f2_local0 )
	f2_local4:setTextStyle( CoD.TextStyle.Shadowed )
	f2_local4:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 0,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		red = 1,
		green = 1,
		blue = 1,
		alignment = LUI.Alignment.Right,
		alpha = 0
	} )
	f2_local4:animateToState( "default", 0 )
	f2_local4:registerAnimationState( "flash1", {
		red = 1,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	f2_local4:registerAnimationState( "flash2", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	f2_local4:registerEventHandler( "flashing", MBh.AnimateLoop( {
		{
			"flash1",
			250
		},
		{
			"flash2",
			250
		}
	} ) )
	f2_local4:registerEventHandler( "stop_flashing", MBh.AnimateToState( "default", 0 ) )
	local f2_local5 = LUI.UIText.new()
	f2_local5.id = "smokeTextId"
	f2_local5:setText( f2_local1 )
	f2_local5:setTextStyle( CoD.TextStyle.Shadowed )
	f2_local5:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 0,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		red = 1,
		green = 1,
		blue = 1,
		alignment = LUI.Alignment.Right,
		alpha = 1
	} )
	f2_local5:animateToState( "default", 0 )
	f2_local5:registerAnimationState( "flash1", {
		red = 1,
		green = 0,
		blue = 0,
		alpha = 0.5
	} )
	f2_local5:registerAnimationState( "flash2", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.25
	} )
	f2_local5:registerEventHandler( "flashing", MBh.AnimateLoop( {
		{
			"flash1",
			250
		},
		{
			"flash2",
			250
		}
	} ) )
	f2_local5:registerEventHandler( "stop_flashing", MBh.AnimateToState( "default", 0 ) )
	if Engine.IsPS3() then
		f2_local3:addElement( f2_local5 )
		f2_local3:addElement( f2_local4 )
	else
		f2_local3:addElement( f2_local4 )
		f2_local3:addElement( f2_local5 )
	end
	self:addElement( f2_local3 )
	return self
end

local f0_local13 = function ()
	local f3_local0 = "@PLATFORM_ODIN_JUGGERNAUT"
	local f3_local1 = "@PLATFORM_ODIN_MARKING"
	local self = LUI.UIElement.new()
	self.id = "odinControlsRightId"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		right = 750,
		top = -32,
		bottom = 32,
		width = 512,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	local f3_local3 = LUI.UIVerticalList.new()
	f3_local3.id = "odinControlsRightVLId"
	f3_local3:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		spacing = 20
	} )
	f3_local3:animateToState( "default", 0 )
	local f3_local4 = LUI.UIText.new()
	f3_local4.id = "juggernautTextId"
	f3_local4:setText( f3_local0 )
	f3_local4:setTextStyle( CoD.TextStyle.Shadowed )
	f3_local4:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 0,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		red = 1,
		green = 1,
		blue = 1,
		alignment = LUI.Alignment.Left,
		alpha = 0
	} )
	f3_local4:animateToState( "default", 0 )
	f3_local4:registerAnimationState( "flash1", {
		red = 1,
		green = 0,
		blue = 0,
		alpha = 0
	} )
	f3_local4:registerAnimationState( "flash2", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	f3_local4:registerEventHandler( "flashing", MBh.AnimateLoop( {
		{
			"flash1",
			250
		},
		{
			"flash2",
			250
		}
	} ) )
	f3_local4:registerEventHandler( "stop_flashing", MBh.AnimateToState( "default", 0 ) )
	local f3_local5 = LUI.UIText.new()
	f3_local5.id = "markingTextId"
	f3_local5:setText( f3_local1 )
	f3_local5:setTextStyle( CoD.TextStyle.Shadowed )
	f3_local5:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 0,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		red = 1,
		green = 1,
		blue = 1,
		alignment = LUI.Alignment.Left,
		alpha = 1
	} )
	f3_local5:animateToState( "default", 0 )
	f3_local5:registerAnimationState( "flash1", {
		red = 1,
		green = 0,
		blue = 0,
		alpha = 0.5
	} )
	f3_local5:registerAnimationState( "flash2", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0.25
	} )
	f3_local5:registerEventHandler( "flashing", MBh.AnimateLoop( {
		{
			"flash1",
			250
		},
		{
			"flash2",
			250
		}
	} ) )
	f3_local5:registerEventHandler( "stop_flashing", MBh.AnimateToState( "default", 0 ) )
	if Engine.IsPS3() then
		f3_local3:addElement( f3_local5 )
		f3_local3:addElement( f3_local4 )
	else
		f3_local3:addElement( f3_local4 )
		f3_local3:addElement( f3_local5 )
	end
	self:addElement( f3_local3 )
	return self
end

local f0_local14 = function ()
	local self = LUI.UIElement.new()
	self.id = "odin_text_bits"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true
	} )
	self:animateToState( "default", 0 )
	return self
end

local f0_local15 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = "@PLATFORM_ODIN_SMOKE"
	local f5_local1 = "@PLATFORM_ODIN_AIRDROP"
	local f5_local2 = "@PLATFORM_ODIN_MARKING"
	local f5_local3 = "@PLATFORM_ODIN_JUGGERNAUT"
	local f5_local4 = "@PLATFORM_ODIN_JUGGERNAUT_MOVE"
	local f5_local5 = "@PLATFORM_ODIN_LARGE_ROD"
	local f5_local6 = "@PLATFORM_ODIN_SMALL_ROD"
	local f5_local7 = f5_arg0:getChildById( "odinControlsLeftId" )
	local f5_local8 = f5_local7:getChildById( "odinControlsLeftVLId" )
	local f5_local9 = f5_local8:getChildById( "airdropTextId" )
	local f5_local10 = f5_local8:getChildById( "smokeTextId" )
	if f5_arg0.curValue then
		if f5_arg0.curValue == f0_local8 then
			f5_local5 = "@LUA_MENU_MP_ORBITAL_DEPLOYMENT_SELECTION"
			f5_local6 = ""
		elseif f5_arg0.curValue == f0_local9 then
			f5_local5 = "@LUA_MENU_MP_THOR_MISSILE"
			f5_local6 = ""
		elseif f5_arg0.curValue == f0_local10 then
			f5_local5 = "@LUA_MENU_MP_REAPER_CAPS"
			f5_local6 = "@SUPER_MP_REAPER_THERMAL"
		end
	end
	if f5_local9.current_state and f5_local9.current_state == "airdrop" then
		f5_local9:setText( Engine.Localize( f5_local1 ) )
	end
	if f5_local10.current_state then
		if f5_local10.current_state == "smoke" then
			f5_local10:setText( Engine.Localize( f5_local0 ) )
		elseif f5_local10.current_state == "small_rod" then
			f5_local10:setText( Engine.Localize( f5_local6 ) )
		end
	end
	local f5_local11 = f5_arg0:getChildById( "odinControlsRightId" )
	local f5_local12 = f5_local11:getChildById( "odinControlsRightVLId" )
	local f5_local13 = f5_local12:getChildById( "juggernautTextId" )
	local f5_local14 = f5_local12:getChildById( "markingTextId" )
	if f5_local13.current_state then
		if f5_local13.current_state == "juggernaut" then
			f5_local13:setText( Engine.Localize( f5_local3 ) )
		elseif f5_local13.current_state == "move" then
			f5_local13:setText( Engine.Localize( f5_local4 ) )
		end
	end
	if f5_local14.current_state then
		if f5_local14.current_state == "marking" then
			f5_local14:setText( Engine.Localize( f5_local2 ) )
		elseif f5_local14.current_state == "large_rod" then
			f5_local14:setText( Engine.Localize( f5_local5 ) )
		end
	end
end

MenuBuilder.registerType( "odinOverlayDef", function ()
	local self = LUI.UIElement.new()
	self.id = "odinOverlayContainerId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerEventHandler( "init_overlay", f0_local11 )
	self:registerEventHandler( "refresh_controls", f0_local15 )
	self:registerEventHandler( "empty_menu_stack", f0_local15 )
	self:registerOmnvarHandler( "ui_odin", f0_local11 )
	self:addElement( f0_local12() )
	self:addElement( f0_local13() )
	self:addElement( f0_local14() )
	return self
end )
LockTable( _M )
