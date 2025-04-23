local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.Header and f1_arg0.MessageText )
	local f1_local0 = f1_arg0.Header
	local f1_local1 = f1_arg0.MessageText
	local f1_local2 = f1_local1:GetCurrentFont()
	local f1_local3, f1_local4, f1_local5, f1_local6 = f1_local1:getLocalRect()
	local f1_local7, f1_local8, f1_local9, f1_local10 = GetTextDimensions( f1_arg1, f1_local2, math.abs( f1_local4 - f1_local6 ), math.abs( f1_local3 - f1_local5 ) )
	local f1_local11 = math.abs( f1_local7 - f1_local9 )
	local f1_local12 = _1080p * 26
	local f1_local13 = _1080p * -118
	local f1_local14 = f1_local13 + f1_local11 + f1_local12
	f1_local0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -118, _1080p * 32, _1080p * -2, _1080p * 30 )
	f1_local0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, f1_local13, f1_local14, _1080p * -2, _1080p * 30, 100, LUI.EASING.outBack )
	f1_local1:setText( f1_arg1 )
end

function TimeToBeat( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 200 * _1080p, 0, 26 * _1080p )
	self.id = "TimeToBeat"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Carrot = nil
	
	Carrot = LUI.UIImage.new()
	Carrot.id = "Carrot"
	Carrot:SetZRotation( 180, 0 )
	Carrot:setImage( RegisterMaterial( "hud_arrow" ), 0 )
	Carrot:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -8, _1080p * 8, _1080p * -12, _1080p * 4 )
	self:addElement( Carrot )
	self.Carrot = Carrot
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	self:addElement( Background )
	self.Background = Background
	
	local TimeToBeat = nil
	
	TimeToBeat = LUI.UIStyledText.new()
	TimeToBeat.id = "TimeToBeat"
	TimeToBeat:SetRGBFromTable( SWATCHES.Scoreboard.background, 0 )
	TimeToBeat:setText( Engine.Localize( "MP_TIME_TO_BEAT" ), 0 )
	TimeToBeat:SetFontSize( 26 * _1080p )
	TimeToBeat:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	TimeToBeat:SetAlignment( LUI.Alignment.Center )
	self:addElement( TimeToBeat )
	self.TimeToBeat = TimeToBeat
	
	return self
end

MenuBuilder.registerType( "TimeToBeat", TimeToBeat )
LockTable( _M )
