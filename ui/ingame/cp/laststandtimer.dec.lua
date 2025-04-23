local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function LastStandTimer()
	local self = LUI.UIElement.new()
	self.id = "laststand_timer"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 0,
		left = 0,
		width = 200,
		height = 200
	} )
	self:animateToState( "default" )
	local f1_local1 = LUI.UIElement.new()
	if utils.cp.AliensUtils.IsChaosMode() and Engine.UsingSplitscreenUpscaling() then
		f1_local1:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = true,
			rightAnchor = false,
			bottom = -13,
			left = 60,
			width = 32,
			height = 40,
			alpha = 0
		} )
	else
		f1_local1:registerAnimationState( "default", {
			topAnchor = false,
			bottomAnchor = true,
			leftAnchor = false,
			rightAnchor = false,
			bottom = -14,
			left = -16,
			right = 16,
			height = 32,
			alpha = 0
		} )
	end
	f1_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f1_local1:animateToState( "default" )
	local f1_local2 = LUI.UIImage.new()
	f1_local2.id = "laststand_icon"
	f1_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "alien_icon_laststand" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 35,
		right = 35,
		bottom = -10,
		height = 32
	} )
	f1_local2:animateToState( "default" )
	f1_local1:addElement( f1_local2 )
	local f1_local3 = LUI.UICountdown.new()
	f1_local3.id = "laststand_countdown"
	f1_local3:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = false,
		bottom = 20,
		left = 0,
		right = 100,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f1_local3:animateToState( "default" )
	f1_local1:addElement( f1_local3 )
	local f1_local4 = function ( f2_arg0, f2_arg1 )
		if f2_arg1.value > 0 then
			f1_local3:setEndTime( f2_arg1.value )
			if f2_arg0.current_state ~= "visible" then
				f2_arg0:animateToState( "visible", 250 )
				f2_arg0.current_state = "visible"
			end
		elseif f2_arg0.current_state ~= "default" then
			f2_arg0:animateToState( "default", 250 )
			f2_arg0.current_state = "default"
		end
	end
	
	f1_local1:registerOmnvarHandler( "zm_ui_laststand_end_milliseconds", f1_local4 )
	local f1_local5 = Game.GetOmnvar( "zm_ui_laststand_end_milliseconds" )
	if f1_local5 and f1_local5 > 0 then
		f1_local4( f1_local1, {
			value = f1_local5
		} )
	end
	self:addElement( f1_local1 )
	return self
end

MenuBuilder.registerType( "LastStandTimer", LastStandTimer )
LockTable( _M )
