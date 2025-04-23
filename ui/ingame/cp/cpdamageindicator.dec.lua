local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function DamageIndications( f1_arg0, f1_arg1 )
	local f1_local0 = 600
	local f1_local1 = 8
	local f1_local2 = 0.75
	local f1_local3 = 80
	local f1_local4 = -50
	local f1_local5 = -50
	local f1_local6 = CoD.TextSettings.HudIW6SmallFont
	local self = LUI.UIText.new( {
		alignment = LUI.Alignment.Center,
		font = f1_local6.Font,
		topAnchor = true,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		left = f1_local4 - f1_local3 / 2,
		top = f1_local5,
		width = f1_local3,
		height = f1_local6.Height
	} )
	self.id = "damage_amount_" .. f1_arg0
	self:setTextStyle( CoD.TextStyle.Shadowed )
	self:registerAnimationState( "default", {
		red = 0.75,
		green = 0.61,
		blue = 0.21
	} )
	self:registerAnimationState( "critical", {
		red = 0.94,
		green = 0.24,
		blue = 0.14
	} )
	self:registerAnimationState( "armor", {
		red = 0.49,
		green = 0.49,
		blue = 0.49
	} )
	local f1_local8 = nil
	local f1_local9 = f1_local0 / f1_local1 / 1000
	local f1_local10 = 0
	local f1_local11 = 0
	local f1_local12 = -250 - 150 * math.random()
	local f1_local13 = -100 + 200 * math.random()
	local f1_local14 = 800
	local f1_local15 = {}
	local f1_local16 = nil
	local f1_local17 = f1_local2 * f1_local1
	self:setText( f1_arg1 )
	if Game.GetOmnvar( "damage_scale_type" ) == "hitaliensoft" then
		self:animateToState( "critical", 0 )
	elseif Game.GetOmnvar( "damage_scale_type" ) == "hitalienarmor" then
		self:animateToState( "armor", 0 )
	else
		self:animateToState( "default", 0 )
	end
	for f1_local18 = 1, f1_local1, 1 do
		f1_local12 = f1_local12 + f1_local14 * f1_local9
		f1_local10 = f1_local10 + f1_local13 * f1_local9
		f1_local11 = f1_local11 + f1_local12 * f1_local9
		f1_local16 = 1
		if f1_local17 <= f1_local18 then
			f1_local16 = 1 - (f1_local18 - f1_local17) / (f1_local1 - f1_local2 * f1_local1)
		end
		f1_local8 = "anim_" .. f1_local18
		self:registerAnimationState( f1_local8, {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			left = f1_local4 - f1_local10 - f1_local3 / 2,
			top = f1_local5 + f1_local11,
			width = f1_local3,
			height = f1_local6.Height,
			alpha = f1_local16
		} )
		table.insert( f1_local15, {
			f1_local8,
			f1_local9 * 1000
		} )
	end
	local f1_local18 = MBh.AnimateSequence( f1_local15 )
	f1_local18( self, {} )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( f1_local8 ), function ( element, event )
		element:close()
	end )
	return self
end

function CPDamageIndicator()
	local f3_local0 = 0
	local f3_local1 = 8
	local self = LUI.UIElement.new( {
		topAnchor = false,
		bottomAnchor = false,
		leftAnchor = false,
		rightAnchor = false,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "damage_indications"
	local f3_local3 = function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg0:getNumChildren()
		if f3_local1 <= f4_arg0:getNumChildren() then
			return 
		else
			f3_local0 = f3_local0 + 1
			f4_arg0:addElement( DamageIndications( f3_local0, f4_arg1 ) )
		end
	end
	
	self:registerOmnvarHandler( "ui_damage_amount", function ( f5_arg0, f5_arg1 )
		f3_local3( f5_arg0, f5_arg1.value )
	end )
	return self
end

MenuBuilder.registerType( "CPDamageIndicator", CPDamageIndicator )
LockTable( _M )
