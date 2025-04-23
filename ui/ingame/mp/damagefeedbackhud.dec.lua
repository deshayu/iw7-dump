local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0 )
	if Game.GetOmnvar( f1_arg0 ) >= 0 then
		return true
	else
		return false
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Game.GetOmnvar( "damage_feedback_icon" )
	if f2_local0 ~= nil then
		if Game.IsCinematicCameraActive() then
			return 
		end
		local f2_local1 = f2_arg0:getChildById( "battleslideBaseContainer" )
		local f2_local2 = f2_arg0:getChildById( "battleslidePulseContainer" )
		if f2_local0 == "hitcritical" then
			local f2_local3 = MBh.AnimateSequence( {
				{
					"default",
					100
				},
				{
					"active",
					20
				},
				{
					"close",
					50
				}
			} )
			f2_local3( f2_local1 )
			f2_local3 = MBh.AnimateSequence( {
				{
					"default",
					0
				},
				{
					"active",
					50
				},
				{
					"close",
					90
				}
			} )
			f2_local3( f2_local2 )
		end
	end
end

f0_local2 = function ()
	local self = LUI.UIElement.new()
	self:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		bottom = 16,
		left = -16,
		right = 16,
		alpha = 1
	} )
	self:animateToState( "default" )
	self:registerOmnvarHandler( "damage_feedback_icon_notify", f0_local1 )
	local f3_local1 = LUI.UIElement.new()
	f3_local1.id = "battleslideBaseContainer"
	f3_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		left = -16,
		right = 16,
		height = 32,
		alpha = 0
	} )
	f3_local1:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		left = -20,
		right = 20,
		height = 40,
		alpha = 0.5
	} )
	f3_local1:registerAnimationState( "close", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -22,
		left = -22,
		right = 22,
		height = 44,
		alpha = 0
	} )
	f3_local1:animateToState( "default" )
	local f3_local2 = LUI.UIImage.new()
	f3_local2.id = "battleslideBaseImage"
	f3_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "damage_feedback_deadeye" ),
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	f3_local2:animateToState( "default" )
	f3_local1:addElement( f3_local2 )
	local f3_local3 = LUI.UIElement.new()
	f3_local3.id = "battleslidePulseContainer"
	f3_local3:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -16,
		left = -16,
		right = 16,
		height = 32,
		alpha = 0
	} )
	f3_local3:registerAnimationState( "active", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -32,
		left = -32,
		right = 32,
		height = 64,
		alpha = 1
	} )
	f3_local3:registerAnimationState( "close", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -64,
		left = -64,
		right = 64,
		height = 128,
		alpha = 0
	} )
	f3_local3:animateToState( "default" )
	local f3_local4 = LUI.UIImage.new()
	f3_local4.id = "battleslidePulseImage"
	f3_local4:registerAnimationState( "default", {
		material = RegisterMaterial( "damage_feedback_deadeye" ),
		topAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		alpha = 1
	} )
	f3_local4:animateToState( "default" )
	f3_local3:addElement( f3_local4 )
	self:addElement( f3_local1 )
	self:addElement( f3_local3 )
	return self
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.value
	if f4_local0 ~= nil then
		if Game.IsCinematicCameraActive() then
			return 
		end
		local f4_local1 = 500
		local f4_local2 = f4_arg0:getChildById( "hudIconTypeImageId" )
		if f4_local0 == "scavenger" and f0_local0( "ui_gambler_show" ) == false then
			f4_local2:animateToState( "scavenger", 0 )
			f4_local1 = 2500
		elseif f4_local0 == "scavenger_eqp" and f0_local0( "ui_gambler_show" ) == false then
			f4_local2:animateToState( "scavenger_eqp", 0 )
			f4_local1 = 2500
		elseif f4_local0 == "boxofguns" and f0_local0( "ui_gambler_show" ) == false then
			f4_local2:animateToState( "boxofguns", 0 )
			f4_local1 = 2500
		elseif f4_local0 == "throwingknife" and f0_local0( "ui_gambler_show" ) == false then
			f4_local2:animateToState( "throwingknife", 0 )
			f4_local1 = 2500
		elseif f4_local0 == "oracle" and f0_local0( "ui_gambler_show" ) == false then
			f4_local2:animateToState( "oracle", 0 )
			f4_local1 = 2500
		elseif f4_local0 == "eqp_ping" and f0_local0( "ui_gambler_show" ) == false then
			f4_local2:animateToState( "eqp_ping", 0 )
			f4_local1 = 2500
		else
			f4_local2:animateToState( "default", 0 )
		end
		local f4_local3 = MBh.AnimateSequence( {
			{
				"active",
				0
			},
			{
				"default",
				f4_local1
			}
		} )
		f4_local3( f4_arg0 )
	end
end

function hudIconTypeHudDef()
	local self = LUI.UIElement.new()
	self.id = "hudIconTypeHud"
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
	local f5_local1 = LUI.UIElement.new()
	f5_local1:registerAnimationState( "default", {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -34,
		bottom = -22,
		left = 90,
		right = 102,
		alpha = 0
	} )
	f5_local1:registerAnimationState( "active", {
		alpha = 1
	} )
	f5_local1:animateToState( "default" )
	f5_local1:registerOmnvarHandler( "damage_feedback_other", f0_local3 )
	local f5_local2 = {}
	if not Engine.IsAliensMode() then
		LUI.ConcatenateToTable( f5_local2, {
			{
				name = "scavenger",
				material = RegisterMaterial( "icon_scavenger_pickup" ),
				leftAnchor = false,
				rightAnchor = false,
				left = -24,
				right = 24,
				height = 48
			},
			{
				name = "scavenger_eqp",
				material = RegisterMaterial( "scavenger_pickup_eqp" ),
				leftAnchor = false,
				rightAnchor = false,
				left = -36,
				right = 36,
				height = 36
			},
			{
				name = "boxofguns",
				material = RegisterMaterial( "boxofguns_pickup" ),
				leftAnchor = false,
				rightAnchor = false,
				left = -36,
				right = 36,
				height = 36
			},
			{
				name = "throwingknife",
				material = RegisterMaterial( "throwingknife_pickup" ),
				leftAnchor = false,
				rightAnchor = false,
				left = -36,
				right = 36,
				height = 36
			},
			{
				name = "eqp_ping",
				material = RegisterMaterial( "icon_trait_eye_spy" ),
				leftAnchor = true,
				rightAnchor = false,
				left = 0,
				height = 36,
				width = 36,
				red = 0,
				green = 0.63,
				blue = 0.9
			}
		} )
	end
	local f5_local3 = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		rightAnchor = false
	} )
	f5_local3.id = "hudIconTypeImageId"
	local f5_local4 = Engine.UsingSplitscreenUpscaling() and 137 or 100
	for f5_local9, f5_local10 in ipairs( f5_local2 ) do
		local f5_local11 = f5_local3
		local f5_local12 = f5_local3.registerAnimationState
		local f5_local13 = f5_local10.name
		local f5_local14 = {
			material = f5_local10.material,
			topAnchor = true,
			bottomAnchor = false
		}
		local f5_local8
		if f5_local10.leftAnchor ~= nil then
			f5_local8 = f5_local10.leftAnchor
		else
			f5_local8 = true
		end
		f5_local14.leftAnchor = f5_local8
		if f5_local10.rightAnchor ~= nil then
			f5_local8 = f5_local10.rightAnchor
		else
			f5_local8 = true
		end
		f5_local14.rightAnchor = f5_local8
		f5_local14.top = f5_local10.top or f5_local4
		f5_local14.height = f5_local10.height or 64
		f5_local14.width = f5_local10.width
		f5_local14.left = f5_local10.left
		f5_local14.right = f5_local10.right
		f5_local14.red = f5_local10.red or 1
		f5_local14.blue = f5_local10.blue or 1
		f5_local14.green = f5_local10.green or 1
		f5_local12( f5_local11, f5_local13, f5_local14 )
	end
	f5_local1:addElement( f5_local3 )
	self:addElement( f5_local1 )
	return self
end

MenuBuilder.registerType( "battleslideHudDef", f0_local2 )
MenuBuilder.registerType( "hudIconTypeHudDef", hudIconTypeHudDef )
LockTable( _M )
