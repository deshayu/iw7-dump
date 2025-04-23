local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CPTimer( menu, controller )
	local self = LUI.UIElement.new()
	self.id = controller.omnvar .. "timer"
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
	local f1_local1 = Engine.UsingSplitscreenUpscaling() and 10 or 0
	local f1_local2 = LUI.UIElement.new()
	local f1_local3 = Engine.GetDvarString( "ui_mapname" ) == "cp_base_building"
	local f1_local4 = controller.leftOffset
	f1_local2:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = false,
		top = 31 + f1_local1,
		left = 0 + f1_local4,
		width = 74,
		height = 32,
		alpha = 0
	} )
	f1_local2:registerAnimationState( "visible", {
		alpha = 1
	} )
	f1_local2:animateToState( "default" )
	local f1_local5 = controller.icon
	local f1_local6 = LUI.UIImage.new()
	f1_local6.id = "nuke_icon"
	f1_local6:registerAnimationState( "default", {
		material = RegisterMaterial( f1_local5 ),
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = -24 + f1_local4,
		top = -15,
		height = 48,
		width = 48
	} )
	f1_local6:animateToState( "default" )
	f1_local2:addElement( f1_local6 )
	local f1_local7 = LUI.UICountdown.new()
	f1_local7.id = "nuke_countdown"
	f1_local7:registerAnimationState( "default", {
		alignment = LUI.Alignment.Center,
		font = CoD.TextSettings.HudDigitalNormalFont.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = true,
		rightAnchor = true,
		top = 40,
		left = 0,
		right = f1_local4 * 2,
		height = CoD.TextSettings.HudDigitalNormalFont.Height
	} )
	f1_local7:animateToState( "default" )
	f1_local2:addElement( f1_local7 )
	f1_local2:registerOmnvarHandler( controller.omnvar, function ( f2_arg0, f2_arg1 )
		if f2_arg1.value > 0 then
			f1_local7:setEndTime( f2_arg1.value )
			if f2_arg0.current_state ~= "visible" then
				f2_arg0:animateToState( "visible", 250 )
				f2_arg0.current_state = "visible"
			end
		elseif f2_arg0.current_state ~= "default" then
			f2_arg0:animateToState( "default", 250 )
			f2_arg0.current_state = "default"
		end
	end )
	self:addElement( f1_local2 )
	return self
end

function NukeTimer( f3_arg0, f3_arg1 )
	return CPTimer( nil, {
		leftOffset = 320,
		icon = "alien_icon_nuke",
		omnvar = "zm_ui_timer"
	} )
end

function C6Timer( f4_arg0, f4_arg1 )
	return CPTimer( nil, {
		leftOffset = 320,
		icon = "alien_icon_nuke",
		omnvar = "ui_alien_c6_timer"
	} )
end

MenuBuilder.registerType( "C6Timer", C6Timer )
MenuBuilder.registerType( "NukeTimer", NukeTimer )
LockTable( _M )
