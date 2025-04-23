local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.jackal.launchAltitude:GetModel( f1_arg1 ), function ()
		f1_arg0.AltitudeValueLabel:setText( math.ceil( DataSources.inGame.jackal.launchAltitude:GetValue( f1_arg1 ) / 1000 ) )
	end, false )
end

function JackalLaunchOverlayAltitude( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 121 * _1080p, 0, 70 * _1080p )
	self.id = "JackalLaunchOverlayAltitude"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local AltitudeLabel = nil
	
	AltitudeLabel = LUI.UIText.new()
	AltitudeLabel.id = "AltitudeLabel"
	AltitudeLabel:setText( ToUpperCase( Engine.Localize( "JACKAL_ALTITUDE" ) ), 0 )
	AltitudeLabel:SetFontSize( 16 * _1080p )
	AltitudeLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AltitudeLabel:SetAlignment( LUI.Alignment.Right )
	AltitudeLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 12, _1080p * -3, _1080p * -20, _1080p * -4 )
	self:addElement( AltitudeLabel )
	self.AltitudeLabel = AltitudeLabel
	
	local AltitudeValueLabel = nil
	
	AltitudeValueLabel = LUI.UIText.new()
	AltitudeValueLabel.id = "AltitudeValueLabel"
	AltitudeValueLabel:setText( "652", 0 )
	AltitudeValueLabel:SetFontSize( 38 * _1080p )
	AltitudeValueLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AltitudeValueLabel:SetAlignment( LUI.Alignment.Right )
	AltitudeValueLabel:SetAnchorsAndPosition( 0, 0, 0, 1, 0, _1080p * -21.5, 0, _1080p * 38 )
	self:addElement( AltitudeValueLabel )
	self.AltitudeValueLabel = AltitudeValueLabel
	
	local AltitudeMLabel = nil
	
	AltitudeMLabel = LUI.UIText.new()
	AltitudeMLabel.id = "AltitudeMLabel"
	AltitudeMLabel:setText( Engine.Localize( "JACKAL_KM" ), 0 )
	AltitudeMLabel:SetFontSize( 22 * _1080p )
	AltitudeMLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AltitudeMLabel:SetAlignment( LUI.Alignment.Left )
	AltitudeMLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -19.5, _1080p * 13.5, _1080p * 13, _1080p * 35 )
	self:addElement( AltitudeMLabel )
	self.AltitudeMLabel = AltitudeMLabel
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "JackalLaunchOverlayAltitude", JackalLaunchOverlayAltitude )
LockTable( _M )
