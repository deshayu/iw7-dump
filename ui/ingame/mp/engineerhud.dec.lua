local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 32
f0_local1 = 64
f0_local2 = 16
local f0_local3 = 16
local f0_local4 = 256
local f0_local5 = 256
local f0_local6 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.value > 0 then
		f1_arg0:animateToState( "active", 0 )
		if not f1_arg0.played_flash then
			local f1_local0 = f1_arg0:getFirstDescendentById( "shoulder_cannon_flash_image_id" )
			local f1_local1 = MBh.AnimateSequence( {
				{
					"active",
					0
				},
				{
					"closing",
					500
				}
			} )
			f1_local1( f1_local0 )
			f1_arg0.played_flash = true
		end
		local f1_local0 = f1_arg0:getFirstDescendentById( "shoulder_cannon_ammo_back_image_id" )
		if f1_arg1.value == 1 then
			local f1_local1 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"opening",
					250
				},
				{
					"active",
					250
				}
			} )
			f1_local1( f1_local0 )
		end
	else
		f1_arg0.played_flash = false
		f1_arg0:animateToState( "default", 0 )
	end
end

local f0_local7 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Game.GetOmnvar( "ui_shoulder_cannon_ammo" )
	f2_arg0:setText( f2_local0 )
	if f2_local0 > 0 then
		local f2_local1 = MBh.AnimateSequence( {
			{
				"default",
				100
			},
			{
				"hidden",
				100
			},
			{
				"default",
				100
			}
		} )
		f2_local1( f2_arg0 )
	else
		f2_arg0:animateToState( "hidden" )
	end
end

local f0_local8 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = Game.GetOmnvar( "ui_shoulder_cannon_state" )
	local f3_local1 = ""
	if f3_local0 == 0 then
		f3_local1 = "@LUA_MENU_MP_PLAYER_TURRET_READY"
	elseif f3_local0 == 1 then
		f3_local1 = "@LUA_MENU_MP_PLAYER_TURRET_LOCK"
	elseif f3_local0 == 2 then
		f3_local1 = "@LUA_MENU_MP_PLAYER_TURRET_FIRING"
	elseif f3_local0 == 3 then
		f3_local1 = "@LUA_MENU_MP_PLAYER_TURRET_OFFLINE"
	elseif f3_local0 == 4 then
		f3_local1 = "@LUA_MENU_MP_ENGINEER_DRONE_ASSAULT"
	elseif f3_local0 == 5 then
		f3_local1 = "@LUA_MENU_MP_ENGINEER_DRONE_DEFENSE"
	elseif f3_local0 == 6 then
		f3_local1 = "@LUA_MENU_MP_ENGINEER_DRONE_SUPPORT"
	else
		f3_local1 = "@LUA_MENU_MP_PLAYER_TURRET_EMPTY"
	end
	f3_arg0:setText( Engine.Localize( f3_local1 ) )
	if f3_local0 > 0 then
		local f3_local2 = MBh.AnimateSequence( {
			{
				"default",
				300
			},
			{
				"hidden",
				100
			},
			{
				"default",
				100
			},
			{
				"hidden",
				100
			},
			{
				"default",
				100
			}
		} )
		f3_local2( f3_arg0 )
	end
end

local f0_local9 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Game.GetOmnvar( "ui_eng_drone_ammo_type" )
	local f4_local1 = ""
	if f4_local0 == 0 then
		f4_local1 = ""
	elseif f4_local0 == 1 then
		f4_local1 = "@LUA_MENU_MP_PLAYER_SHOULDER_CANNON_AMMO"
	elseif f4_local0 == 2 then
		f4_local1 = "@LUA_MENU_MP_PLAYER_TROPHY_AMMO"
	elseif f4_local0 == 3 then
		f4_local1 = "@LUA_MENU_MP_PLAYER_RADAR"
	end
	f4_arg0:setText( Engine.Localize( f4_local1 ) )
	if f4_local0 > 0 then
		local f4_local2 = MBh.AnimateSequence( {
			{
				"default",
				300
			},
			{
				"hidden",
				100
			},
			{
				"default",
				100
			},
			{
				"hidden",
				100
			},
			{
				"default",
				100
			}
		} )
		f4_local2( f4_arg0 )
	end
end

local f0_local10 = function ()
	local self = LUI.UIElement.new()
	self.id = "shoulder_cannon_ammo_container"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 0,
		right = -5,
		height = f0_local2 * 2,
		width = f0_local3,
		spacing = 0
	} )
	self:animateToState( "default", 0 )
	local f5_local1 = LUI.UIText.new()
	f5_local1.id = "shoulder_cannon_ammo_count_id"
	f5_local1:setText( "" )
	f5_local1:setTextStyle( CoD.TextStyle.Shadowed )
	f5_local1:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 2,
		right = 170,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		width = 256,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alignment = LUI.Alignment.Left,
		alpha = 1
	} )
	f5_local1:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f5_local1:animateToState( "default", 0 )
	local f5_local2 = LUI.UIText.new()
	f5_local2.id = "shoulder_cannon_state_id"
	f5_local2:setText( "" )
	f5_local2:setTextStyle( CoD.TextStyle.Shadowed )
	f5_local2:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 50,
		right = 190,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		width = 256,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alignment = LUI.Alignment.Left,
		alpha = 1
	} )
	f5_local2:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f5_local2:animateToState( "default", 0 )
	local f5_local3 = LUI.UIText.new()
	f5_local3.id = "shoulder_cannon_ammo_text_id"
	f5_local3:setText( "" )
	f5_local3:setTextStyle( CoD.TextStyle.Shadowed )
	f5_local3:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 16,
		left = -105,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		width = 226,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alignment = LUI.Alignment.Left,
		alpha = 1
	} )
	f5_local3:registerAnimationState( "hidden", {
		alpha = 0
	} )
	f5_local3:animateToState( "default", 0 )
	f5_local1:registerOmnvarHandler( "ui_shoulder_cannon_ammo", f0_local7 )
	f5_local2:registerOmnvarHandler( "ui_shoulder_cannon_state", f0_local8 )
	f5_local3:registerOmnvarHandler( "ui_eng_drone_ammo_type", f0_local9 )
	self:addElement( f5_local1 )
	self:addElement( f5_local2 )
	self:addElement( f5_local3 )
	return self
end

local f0_local11 = function ( f6_arg0, f6_arg1 )
	if f6_arg1.value == 0 then
		f6_arg0:animateToState( "default", 0 )
		LUI.UITimer.Stop( f6_arg0.positionTimer )
	elseif f6_arg1.value == 2 then
		f6_arg0:animateToState( "dim", 0 )
		f6_arg0:dispatchEventToChildren( {
			name = "reticleLocked"
		} )
	elseif f6_arg1.value == 1 then
		f6_arg0:animateToState( "active", 0 )
		LUI.UITimer.Reset( f6_arg0.positionTimer )
		f6_arg0:dispatchEventToChildren( {
			name = "reticleLocking"
		} )
	end
end

local f0_local12 = function ()
	local f7_local0 = RegisterMaterial( "hud_fofbox_hostile" )
	local self = LUI.UIImage.new()
	self.id = "shoulderCannonHudReticleId"
	self:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		height = 32,
		width = 32,
		material = f7_local0,
		zRot = 45,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerAnimationState( "dim", {
		alpha = 0.25
	} )
	self:animateToState( "default", 0 )
	local f7_local2 = 50
	self:registerEventHandler( "reticleLocked", MBh.AnimateSequence( {
		{
			"dim",
			f7_local2
		},
		{
			"active",
			f7_local2
		},
		{
			"dim",
			f7_local2
		},
		{
			"active",
			f7_local2
		},
		{
			"default",
			f7_local2
		}
	} ) )
	self:registerEventHandler( "reticleLocking", MBh.AnimateSequence( {
		{
			"dim",
			f7_local2
		},
		{
			"default",
			f7_local2
		},
		{
			"dim",
			f7_local2
		}
	} ) )
	return self
end

local f0_local13 = function ()
	local self = LUI.UIElement.new()
	self.id = "shoulderCannonReticleContainerId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = 1,
		height = 1,
		alpha = 0
	} )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:animateToState( "default", 0 )
	local f8_local1 = LUI.UITimer.new( nil, {
		interval = 16,
		event = {
			name = "updateTargetPos"
		},
		timerGroup = nil,
		disposable = false,
		eventTarget = nil,
		deferNextFrame = false,
		stopped = true
	} )
	f8_local1.id = "shoulderCannonReticleTimerId"
	self.positionTimer = f8_local1
	self:addElement( f8_local1 )
	self:registerEventHandler( "updateTargetPos", function ( element, event )
		local f9_local0 = Game.GetOmnvar( "ui_shoulder_cannon_target_ent" )
		if f9_local0 > -1 then
			local f9_local1, f9_local2 = Game.GetScreenLocation( f9_local0, "j_spineupper" )
			if f9_local1 and f9_local2 then
				local f9_local3, f9_local4 = nil
				local f9_local5 = ScreenResolution[currentScreenResolution]
				element:registerAnimationState( "position", {
					topAnchor = true,
					leftAnchor = true,
					bottomAnchor = false,
					rightAnchor = false,
					top = LUI.clamp( f9_local2, 0, f9_local5.height ) - 10,
					left = LUI.clamp( f9_local1, 0, f9_local5.width ) - 20,
					width = 0,
					height = 0,
					alpha = 1
				} )
				element:animateToState( "position", 0 )
			end
		end
	end )
	self:registerOmnvarHandler( "ui_shoulder_cannon_hud_reticle", f0_local11 )
	self:addElement( f0_local12() )
	return self
end

local f0_local14 = function ()
	local f10_local0 = RegisterMaterial( "apache_mg_back_mp" )
	local f10_local1 = RegisterMaterial( "pointflash" )
	local f10_local2 = RegisterMaterial( "cranked_back_1_flipped" )
	local self = LUI.UIElement.new()
	self.id = "shoulder_cannon_overlay_container_id"
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
	self:registerOmnvarHandler( "ui_shoulder_cannon", f0_local6 )
	self:registerEventHandler( "init_overlay", f0_local6 )
	local f10_local4 = LUI.UIImage.new()
	f10_local4.id = "shoulder_cannon_flash_image_id"
	f10_local4:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f0_local4,
		left = -f0_local5,
		bottom = f0_local4,
		right = f0_local5,
		material = f10_local1,
		alpha = 0
	} )
	f10_local4:animateToState( "default", 0 )
	f10_local4:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f0_local4,
		left = -f0_local5,
		bottom = f0_local4,
		right = f0_local5,
		alpha = 1
	} )
	f10_local4:registerAnimationState( "closing", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f0_local4 * -2,
		left = -f0_local5 * 100,
		bottom = f0_local4 * -2,
		right = f0_local5 * 100,
		alpha = 0
	} )
	local f10_local5 = LUI.UIImage.new()
	f10_local5.id = "shoulder_cannon_ammo_back_image_id"
	f10_local5:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 105,
		left = -200,
		bottom = 100,
		width = f0_local1,
		material = f10_local0,
		alpha = 0
	} )
	f10_local5:animateToState( "default", 0 )
	f10_local5:registerAnimationState( "opening", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 105 - f0_local0 * 0.5 - 40,
		left = -160,
		bottom = 100 + f0_local0 * 0.5 + 40,
		width = f0_local1,
		alpha = 0
	} )
	f10_local5:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 105 - f0_local0 * 0.5,
		left = -200,
		bottom = 100 + f0_local0 * 0.5,
		width = f0_local1,
		alpha = 1
	} )
	local f10_local6 = LUI.UIImage.new()
	f10_local6.id = "shoulder_cannon_timer_bg"
	f10_local6:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = true,
		bottom = 105,
		left = -125,
		height = 185,
		width = 145,
		alignment = LUI.Alignment.Left,
		material = f10_local2,
		alpha = 0.5
	} )
	f10_local6:animateToState( "default", 0 )
	f10_local5:addElement( f10_local6 )
	f10_local5:addElement( f0_local10() )
	self:addElement( f10_local4 )
	self:addElement( f10_local5 )
	return self
end

local f0_local15 = function ( f11_arg0, f11_arg1 )
	if f11_arg1.value == 1 then
		if f11_arg0.current_state ~= "active" then
			f11_arg0:animateToState( "active", 0 )
			f11_arg0.current_state = "active"
		end
	elseif f11_arg1.value == 0 and f11_arg0.current_state ~= "default" then
		f11_arg0:animateToState( "default", 0 )
		f11_arg0.current_state = "default"
	end
end

MenuBuilder.registerType( "engineerOverlayDef", function ()
	local f12_local0 = RegisterMaterial( "apache_visor_mp" )
	local self = LUI.UIElement.new()
	self.id = "engineer_overlay_container_id"
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
	self:registerOmnvarHandler( "ui_engineer_hud", f0_local15 )
	self:registerEventHandler( "init_overlay", f0_local15 )
	local f12_local2 = LUI.UIImage.new()
	f12_local2.id = "trophy_visor_image_id"
	f12_local2:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = f12_local0,
		alpha = 1
	} )
	f12_local2:animateToState( "default", 0 )
	self:addElement( f0_local13() )
	self:addElement( f12_local2 )
	return self
end )
MenuBuilder.registerType( "shoulderCannonOverlayDef", f0_local14 )
LockTable( _M )
