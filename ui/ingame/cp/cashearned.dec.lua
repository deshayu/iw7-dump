local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function CashNotification( f1_arg0, f1_arg1 )
	assert( f1_arg1 )
	local f1_local0 = 600
	local f1_local1 = 4
	local f1_local2 = 0.45
	local f1_local3 = 80
	local f1_local4 = -50
	local f1_local5 = -50
	local f1_local6 = CoD.TextSettings.HudIW6SmallFont
	local self = LUI.UIStyledText.new( {
		red = 1,
		green = 1,
		blue = 1,
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
	self.id = "cash_get_" .. f1_arg0
	local f1_local8 = 1
	local f1_local9 = 1
	local f1_local10 = 1
	if f1_arg1 < 0 then
		self:SetShadowRGBFromInt( GetIntForColor( COLORS.red ), 0 )
		self:SetRGBFromInt( GetIntForColor( COLORS.red ), 0 )
		self:SetOutlineRGBFromInt( 0, 0 )
		self:SetShadowMinDistance( -0.5, 0 )
		self:SetShadowMaxDistance( 0.5, 0 )
		f1_local8 = 1
		f1_local9 = 0
		f1_local10 = 0
	else
		self:SetShadowRGBFromInt( 1, 0 )
		self:SetOutlineRGBFromInt( 0, 0 )
		self:SetShadowMinDistance( -1, 0 )
		self:SetShadowMaxDistance( 0.5, 0 )
	end
	self:SetOutlineMinDistance( -0.2, 0 )
	self:SetOutlineMaxDistance( 0, 0 )
	self:setText( Engine.Localize( f1_arg1 ) )
	local f1_local11 = nil
	local f1_local12 = f1_local0 / f1_local1 / 1000
	local f1_local13 = 0
	local f1_local14 = 0
	local f1_local15 = 250 - 150 * math.random()
	local f1_local16 = -100 + 200 * math.random()
	local f1_local17 = 250
	local f1_local18 = {}
	local f1_local19 = nil
	local f1_local20 = f1_local2 * f1_local1
	for f1_local21 = 1, f1_local1, 1 do
		f1_local15 = f1_local15 + f1_local17 * f1_local12
		f1_local13 = f1_local13 + f1_local16 * f1_local12
		f1_local14 = f1_local14 + f1_local15 * f1_local12
		f1_local19 = 1
		if f1_local20 <= f1_local21 then
			f1_local19 = 1 - (f1_local21 - f1_local20) / (f1_local1 - f1_local2 * f1_local1)
		end
		f1_local11 = "anim_" .. f1_local21
		self:registerAnimationState( f1_local11, {
			topAnchor = true,
			bottomAnchor = false,
			leftAnchor = false,
			rightAnchor = false,
			left = f1_local4 - f1_local13 - f1_local3 / 2,
			top = f1_local5 + f1_local14,
			width = f1_local3,
			height = f1_local6.Height,
			red = f1_local8,
			green = f1_local9,
			blue = f1_local10,
			alpha = f1_local19
		} )
		table.insert( f1_local18, {
			f1_local11,
			f1_local12 * 1000
		} )
	end
	local f1_local21 = MBh.AnimateSequence( f1_local18 )
	f1_local21( self, {} )
	self:registerEventHandler( LUI.FormatAnimStateFinishEvent( f1_local11 ), function ( element, event )
		element:close()
	end )
	return self
end

function CashEarned()
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
	self.id = "cash_notifications"
	local f3_local3 = function ( f4_arg0, f4_arg1 )
		if f3_local1 <= f4_arg0:getNumChildren() then
			return 
		else
			f3_local0 = f3_local0 + 1
			f4_arg0:addElement( CashNotification( f3_local0, f4_arg1 ) )
		end
	end
	
	local f3_local4 = LUI.UIElement.new()
	f3_local4:setupUIIntWatch( "AlienCash" )
	f3_local4.id = "cashWatch"
	f3_local4:registerEventHandler( "int_watch_alert", function ( element, event )
		event.name = "cash_change"
		self:processEvent( event )
	end )
	self:addElement( f3_local4 )
	self:registerEventHandler( "cash_change", function ( element, event )
		local f6_local0 = event.newValue - event.oldValue
		if f6_local0 == 0 then
			return 
		else
			f3_local3( element, f6_local0 )
		end
	end )
	self:registerOmnvarHandler( "ui_alien_cash_overflow", function ( f7_arg0, f7_arg1 )
		f3_local3( f7_arg0, 0 )
	end )
	return self
end

MenuBuilder.registerType( "CashEarned", CashEarned )
LockTable( _M )
