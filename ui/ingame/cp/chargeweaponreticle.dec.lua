local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 and 0 <= f1_arg1 then
		f1_arg0:animateToState( "visible", 0 )
		f1_arg0:processEvent( {
			name = "update_base_color"
		} )
		f1_arg0:processEvent( {
			name = "set_reticle_charges",
			num_charges = f1_arg1
		} )
	else
		f1_arg0:animateToState( "default", 0 )
	end
end

function ChargeWeaponReticle()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "reticle_hud_root"
	local f2_local1 = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f2_local1:registerAnimationState( "visible", {
		alpha = 1
	} )
	f2_local1.id = "nx1_custom_ret"
	f2_local1:registerOmnvarHandler( "ui_custom_reticle_state", function ( f3_arg0, f3_arg1 )
		f0_local0( f3_arg0, f3_arg1.value )
	end )
	f2_local1:registerEventHandler( "custom_reticle_timer", function ( element, event )
		f0_local0( element, Game.GetOmnvar( "ui_custom_reticle_state" ) )
	end )
	f2_local1:addElement( LUI.UITimer.new( nil, {
		interval = 50,
		event = "custom_reticle_timer",
		disposable = false
	} ) )
	local f2_local2 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_center_cook_white" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = -20,
		bottom = 20,
		left = -20,
		right = 20,
		alpha = 0.5,
		red = 1,
		green = 1,
		blue = 1
	} )
	f2_local2.id = "main_ret_image_id"
	f2_local2:registerAnimationState( "charged", {
		red = 0.9,
		green = 0.6,
		blue = 0
	} )
	f2_local2:registerEventHandler( "update_base_color", function ( element, event )
		if 10 <= Game.GetPlayerClipAmmo( 1 ) then
			element:animateToState( "charged", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f2_local3 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = -20,
		bottom = 0,
		left = -20,
		right = 0,
		alpha = 0
	} )
	f2_local3:registerAnimationState( "visible", {
		alpha = 1
	} )
	f2_local3.id = "main_ret_image_tl_id"
	f2_local3:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 1 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f2_local4 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = -20,
		bottom = 0,
		left = 20,
		right = 0,
		alpha = 0
	} )
	f2_local4:registerAnimationState( "visible", {
		alpha = 1
	} )
	f2_local4.id = "main_ret_image_tr_id"
	f2_local4:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 2 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f2_local5 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = 20,
		bottom = 0,
		left = 20,
		right = 0,
		alpha = 0
	} )
	f2_local5:registerAnimationState( "visible", {
		alpha = 1
	} )
	f2_local5.id = "main_ret_image_br_id"
	f2_local5:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 3 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	local f2_local6 = LUI.UIImage.new( {
		material = RegisterMaterial( "reticle_nx1_cook" ),
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		red = 0.9,
		green = 0.6,
		blue = 0,
		top = 20,
		bottom = 0,
		left = -20,
		right = 0,
		alpha = 0
	} )
	f2_local6:registerAnimationState( "visible", {
		alpha = 1
	} )
	f2_local6.id = "main_ret_image_bl_id"
	f2_local6:registerEventHandler( "set_reticle_charges", function ( element, event )
		if event.num_charges and event.num_charges >= 4 then
			element:animateToState( "visible", 0 )
		else
			element:animateToState( "default", 0 )
		end
	end )
	self:addElement( f2_local1 )
	f2_local1:addElement( f2_local2 )
	f2_local1:addElement( f2_local3 )
	f2_local1:addElement( f2_local4 )
	f2_local1:addElement( f2_local5 )
	f2_local1:addElement( f2_local6 )
	f0_local0( f2_local1, Game.GetOmnvar( "ui_custom_reticle_state" ) )
	return self
end

MenuBuilder.registerType( "ChargeWeaponReticle", ChargeWeaponReticle )
LockTable( _M )
