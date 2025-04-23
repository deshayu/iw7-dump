local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0.compassTrackerText
	local f1_local1 = DataSources.inGame.HUD.compassRotation
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = math.ceil( f1_local1:GetValue( f1_arg1 ) )
		local f2_local1 = nil
		if f2_local0 <= 180 then
			f2_local1 = f2_local0 / 180 * -2.5
		else
			f2_local1 = (1 - (f2_local0 - 180) / 180) * 2.5
		end
		f1_local0:setText( string.format( "%0.5f", f2_local1 ), 0 )
	end )
	local f1_local2 = f1_arg0.WarningFuel
	local f1_local3 = f1_arg0.WarningPressure
	local f1_local4 = f1_arg0.WarningSystemIntegrity
	local f1_local5 = f1_arg0.WarningCritical
	local f1_local6 = function ()
		local f3_local0 = f1_local2:SetZRotation( 0, 1000 )
		f3_local0.onComplete = function ()
			ACTIONS.AnimateSequence( f1_local2, "Pulse" )
		end
		
		local f3_local1 = f1_local3:SetZRotation( 0, 3000 )
		f3_local1.onComplete = function ()
			ACTIONS.AnimateSequence( f1_local3, "Pulse" )
		end
		
		local f3_local2 = f1_local4:SetZRotation( 0, 100 )
		f3_local2.onComplete = function ()
			ACTIONS.AnimateSequence( f1_local4, "Pulse" )
		end
		
		local f3_local3 = f1_local5:SetZRotation( 0, 100 )
		f3_local3.onComplete = function ()
			ACTIONS.AnimateSequence( f1_local5, "Pulse" )
		end
		
	end
	
	f1_local6()
end

function DropshipFlightStatusBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 829 * _1080p, 0, 159 * _1080p )
	self.id = "DropshipFlightStatusBar"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local compassTracker = nil
	
	compassTracker = LUI.UIImage.new()
	compassTracker.id = "compassTracker"
	compassTracker:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	compassTracker:setImage( RegisterMaterial( "hud_jackal_compass_tracker" ), 0 )
	compassTracker:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -61, _1080p * 66, 0, _1080p * 32 )
	self:addElement( compassTracker )
	self.compassTracker = compassTracker
	
	local compassTrackerText = nil
	
	compassTrackerText = LUI.UIText.new()
	compassTrackerText.id = "compassTrackerText"
	compassTrackerText:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	compassTrackerText:setText( "-----", 0 )
	compassTrackerText:SetFontSize( 14 * _1080p )
	compassTrackerText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	compassTrackerText:SetAlignment( LUI.Alignment.Center )
	compassTrackerText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -29, _1080p * 35, _1080p * 4, _1080p * 18 )
	self:addElement( compassTrackerText )
	self.compassTrackerText = compassTrackerText
	
	local compass = nil
	
	compass = MenuBuilder.BuildRegisteredType( "Compass", {
		stretch = 0.25,
		controllerIndex = f8_local1
	} )
	compass.id = "compass"
	compass:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	compass:SetAlpha( 0.8, 0 )
	compass:setImage( RegisterMaterial( "hud_jackal_compass_tickertape" ), 0 )
	compass:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -121, _1080p * 126, _1080p * 29, _1080p * 51 )
	self:addElement( compass )
	self.compass = compass
	
	local TopBarLeft = nil
	
	TopBarLeft = LUI.UIImage.new()
	TopBarLeft.id = "TopBarLeft"
	TopBarLeft:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	TopBarLeft:setImage( RegisterMaterial( "dropship_hud_topbar_left_1" ), 0 )
	TopBarLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 15, _1080p * 271, _1080p * 15, _1080p * 79 )
	self:addElement( TopBarLeft )
	self.TopBarLeft = TopBarLeft
	
	local TopBarRight = nil
	
	TopBarRight = LUI.UIImage.new()
	TopBarRight.id = "TopBarRight"
	TopBarRight:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	TopBarRight:setImage( RegisterMaterial( "dropship_hud_topbar_left_1" ), 0 )
	TopBarRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -15, _1080p * -271, _1080p * 15, _1080p * 79 )
	self:addElement( TopBarRight )
	self.TopBarRight = TopBarRight
	
	local WarningFuel = nil
	
	WarningFuel = MenuBuilder.BuildRegisteredType( "DropshipFlightStatusWarningLeft", {
		controllerIndex = f8_local1
	} )
	WarningFuel.id = "WarningFuel"
	WarningFuel:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 195, _1080p * -95, _1080p * -33 )
	self:addElement( WarningFuel )
	self.WarningFuel = WarningFuel
	
	local WarningPressure = nil
	
	WarningPressure = MenuBuilder.BuildRegisteredType( "DropshipFlightStatusWarningRight", {
		controllerIndex = f8_local1
	} )
	WarningPressure.id = "WarningPressure"
	WarningPressure:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -195, 0, _1080p * -95, _1080p * -33 )
	self:addElement( WarningPressure )
	self.WarningPressure = WarningPressure
	
	local WarningSystemIntegrity = nil
	
	WarningSystemIntegrity = MenuBuilder.BuildRegisteredType( "DropshipFlightStatusSystemIntegrity", {
		controllerIndex = f8_local1
	} )
	WarningSystemIntegrity.id = "WarningSystemIntegrity"
	WarningSystemIntegrity:SetScale( -0.3, 0 )
	WarningSystemIntegrity:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -253, _1080p * 259, _1080p * 47, _1080p * 111 )
	self:addElement( WarningSystemIntegrity )
	self.WarningSystemIntegrity = WarningSystemIntegrity
	
	local Landing = nil
	
	Landing = LUI.UIText.new()
	Landing.id = "Landing"
	Landing:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	Landing:setText( ToUpperCase( Engine.Localize( "DROPSHIP_LANDING" ) ), 0 )
	Landing:SetFontSize( 20 * _1080p )
	Landing:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Landing:SetAlignment( LUI.Alignment.Center )
	Landing:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -105, _1080p * -32, _1080p * 36, _1080p * 56 )
	self:addElement( Landing )
	self.Landing = Landing
	
	local Flight = nil
	
	Flight = LUI.UIText.new()
	Flight.id = "Flight"
	Flight:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	Flight:setText( ToUpperCase( Engine.Localize( "DROPSHIP_FLIGHT" ) ), 0 )
	Flight:SetFontSize( 20 * _1080p )
	Flight:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	Flight:SetAlignment( LUI.Alignment.Center )
	Flight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -207, _1080p * -143, _1080p * 36, _1080p * 56 )
	self:addElement( Flight )
	self.Flight = Flight
	
	local BarHighlight = nil
	
	BarHighlight = LUI.UIImage.new()
	BarHighlight.id = "BarHighlight"
	BarHighlight:SetRGBFromTable( SWATCHES.dropship.highlight, 0 )
	BarHighlight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -203, _1080p * -148, _1080p * 32, _1080p * 35 )
	self:addElement( BarHighlight )
	self.BarHighlight = BarHighlight
	
	local PayloadSecured = nil
	
	PayloadSecured = LUI.UIText.new()
	PayloadSecured.id = "PayloadSecured"
	PayloadSecured:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	PayloadSecured:setText( "PAYLOAD SECURED", 0 )
	PayloadSecured:SetFontSize( 19 * _1080p )
	PayloadSecured:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PayloadSecured:SetAlignment( LUI.Alignment.Center )
	PayloadSecured:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 29, _1080p * 187, _1080p * 36, _1080p * 55 )
	self:addElement( PayloadSecured )
	self.PayloadSecured = PayloadSecured
	
	local PayloadUnsecured = nil
	
	PayloadUnsecured = LUI.UIText.new()
	PayloadUnsecured.id = "PayloadUnsecured"
	PayloadUnsecured:SetRGBFromTable( SWATCHES.dropship.overlay, 0 )
	PayloadUnsecured:SetAlpha( 0, 0 )
	PayloadUnsecured:setText( ToUpperCase( Engine.Localize( "DROPSHIP_PAYLOAD_SECURED" ) ), 0 )
	PayloadUnsecured:SetFontSize( 19 * _1080p )
	PayloadUnsecured:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PayloadUnsecured:SetAlignment( LUI.Alignment.Center )
	PayloadUnsecured:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 206, _1080p * 36, _1080p * 55 )
	self:addElement( PayloadUnsecured )
	self.PayloadUnsecured = PayloadUnsecured
	
	local WarningCritical = nil
	
	WarningCritical = MenuBuilder.BuildRegisteredType( "DropshipFlightStatusCritical", {
		controllerIndex = f8_local1
	} )
	WarningCritical.id = "WarningCritical"
	WarningCritical:SetScale( -0.3, 0 )
	WarningCritical:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -253, _1080p * 259, _1080p * 95, _1080p * 127 )
	self:addElement( WarningCritical )
	self.WarningCritical = WarningCritical
	
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "DropshipFlightStatusBar", DropshipFlightStatusBar )
LockTable( _M )
