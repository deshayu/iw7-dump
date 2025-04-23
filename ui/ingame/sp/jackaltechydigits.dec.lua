local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.TopField )
	f1_arg0.TopField:SetUseGameClock( true )
end

function JackalTechyDigits( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 36 * _1080p )
	self.id = "JackalTechyDigits"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local TopField = nil
	
	TopField = MenuBuilder.BuildRegisteredType( "UITechyDigits", {
		digits = 4,
		minValue = 0,
		maxValue = 100000000,
		longWait = 340,
		shortWaitMin = 20,
		shortWaitMax = 60,
		pulsesMin = 3,
		pulsesMax = 7,
		controllerIndex = f2_local1
	} )
	TopField.id = "TopField"
	TopField:SetFontSize( 12 * _1080p )
	TopField:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TopField:SetAlignment( LUI.Alignment.Center )
	TopField:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 12 )
	self:addElement( TopField )
	self.TopField = TopField
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalTechyDigits", JackalTechyDigits )
LockTable( _M )
