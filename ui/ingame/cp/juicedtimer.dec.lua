local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function JuicedTimer()
	local self = LUI.UIElement.new()
	self.id = "juiced_timer"
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
	local f1_local1 = LUI.UIElement.new()
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
	f1_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f1_local1:animateToState( "default" )
	local f1_local2 = LUI.UIImage.new()
	f1_local2.id = "icon"
	f1_local2:registerAnimationState( "default", {
		material = RegisterMaterial( "specialty_juiced" ),
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		bottom = 0,
		height = 32
	} )
	f1_local2:animateToState( "default" )
	f1_local1:addElement( f1_local2 )
	local f1_local3 = LUI.UICountdown.new()
	f1_local3.id = "countdown"
	f1_local3:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = false,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		bottom = 20,
		left = 0,
		right = 0,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f1_local3:animateToState( "default" )
	f1_local1:addElement( f1_local3 )
	f1_local1:registerOmnvarHandler( "ui_juiced_end_milliseconds", function ( f2_arg0, f2_arg1 )
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
	end )
	self:addElement( f1_local1 )
	return self
end

MenuBuilder.registerType( "JuicedTimer", JuicedTimer )
LockTable( _M )
