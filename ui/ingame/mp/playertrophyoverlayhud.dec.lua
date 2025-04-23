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
			local f1_local0 = f1_arg0:getFirstDescendentById( "trophy_flash_image_id" )
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
		local f1_local0 = f1_arg0:getFirstDescendentById( "trophy_ammo_back_image_id" )
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

local f0_local7 = function ()
	local f2_local0 = RegisterMaterial( "apache_ammo_mp" )
	local self = LUI.UIElement.new()
	self.id = "trophy_ammo_container"
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
	local f2_local2 = LUI.UIImage.new()
	f2_local2.id = "trophy_ammo1"
	f2_local2:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 2,
		right = 0,
		height = f0_local2,
		width = f0_local3,
		material = f2_local0,
		alpha = 1
	} )
	f2_local2:animateToState( "default", 0 )
	local f2_local3 = LUI.UIImage.new()
	f2_local3.id = "trophy_ammo2"
	f2_local3:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = true,
		top = 12,
		right = 0,
		height = f0_local2,
		width = f0_local3,
		material = f2_local0,
		alpha = 1
	} )
	f2_local3:animateToState( "default", 0 )
	f2_local3:registerAnimationState( "inactive", {
		alpha = 0
	} )
	self:addElement( f2_local2 )
	self:addElement( f2_local3 )
	return self
end

local f0_local8 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0:getChildById( "trophy_ammo_container" )
	if f3_arg1.value < 2 then
		local f3_local1 = f3_local0:getChildById( "trophy_ammo" .. f3_arg1.value + 1 )
		local f3_local2 = MBh.AnimateSequence( {
			{
				"inactive",
				50
			},
			{
				"inactive",
				50
			},
			{
				"default",
				0
			},
			{
				"default",
				50
			},
			{
				"inactive",
				50
			},
			{
				"inactive",
				50
			},
			{
				"default",
				0
			},
			{
				"default",
				50
			},
			{
				"inactive",
				150
			}
		} )
		f3_local2( f3_local1 )
		f3_local1:animateToState( "inactive", 250 )
	else
		local f3_local1 = f3_local0:getChildById( "trophy_ammo1" )
		f3_local1:animateToState( "default", 0 )
		local f3_local2 = f3_local0:getChildById( "trophy_ammo2" )
		f3_local2:animateToState( "default", 0 )
	end
	if f3_arg1.value == 0 then
		f3_arg0:animateToState( "inactive", 0 )
	end
end

MenuBuilder.registerType( "playerTrophyOverlayDef", function ()
	local f4_local0 = RegisterMaterial( "apache_flare_back_mp" )
	local f4_local1 = RegisterMaterial( "apache_visor_mp" )
	local f4_local2 = RegisterMaterial( "pointflash" )
	local self = LUI.UIElement.new()
	self.id = "trophy_overlay_container_id"
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
	self:registerOmnvarHandler( "ui_playertrophy", f0_local6 )
	self:registerEventHandler( "init_overlay", f0_local6 )
	local f4_local4 = LUI.UIImage.new()
	f4_local4.id = "trophy_visor_image_id"
	f4_local4:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = f4_local1,
		alpha = 1
	} )
	f4_local4:animateToState( "default", 0 )
	local f4_local5 = LUI.UIImage.new()
	f4_local5.id = "trophy_flash_image_id"
	f4_local5:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f0_local4,
		left = -f0_local5,
		bottom = f0_local4,
		right = f0_local5,
		material = f4_local2,
		alpha = 0
	} )
	f4_local5:animateToState( "default", 0 )
	f4_local5:registerAnimationState( "active", {
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
	f4_local5:registerAnimationState( "closing", {
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
	local f4_local6 = LUI.UIImage.new()
	f4_local6.id = "trophy_ammo_back_image_id"
	f4_local6:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 100,
		left = 170,
		bottom = 100,
		width = f0_local1,
		material = f4_local0,
		alpha = 0
	} )
	f4_local6:animateToState( "default", 0 )
	f4_local6:registerAnimationState( "opening", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 100 - f0_local0 * 0.5 - 40,
		left = 130,
		bottom = 100 + f0_local0 * 0.5 + 40,
		width = f0_local1,
		alpha = 0
	} )
	f4_local6:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = false,
		top = 100 - f0_local0 * 0.5,
		left = 170,
		bottom = 100 + f0_local0 * 0.5,
		width = f0_local1,
		alpha = 1
	} )
	f4_local6:registerOmnvarHandler( "ui_playertrophy_ammo", f0_local8 )
	local f4_local7 = LUI.UIText.new()
	f4_local7.id = "trophy_ammo_text_id"
	f4_local7:setText( Engine.Localize( "@LUA_MENU_MP_PLAYER_TROPHY_AMMO" ) )
	f4_local7:setTextStyle( CoD.TextStyle.Shadowed )
	f4_local7:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = 20,
		left = 0,
		height = CoD.TextSettings.HudEuroMedSmallFont.Height,
		width = 256,
		font = CoD.TextSettings.HudEuroMedSmallFont.Font,
		alignment = LUI.Alignment.Left
	} )
	f4_local7:animateToState( "default", 0 )
	f4_local6:addElement( f0_local7() )
	f4_local6:addElement( f4_local7 )
	self:addElement( f4_local5 )
	self:addElement( f4_local6 )
	return self
end )
LockTable( _M )
