local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	
end

function OlympusMonsRadarTargeting( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "OlympusMonsRadarTargeting"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Radar = nil
	
	Radar = MenuBuilder.BuildRegisteredType( "RadarTargeting", {
		radarCenterOffsetX = 0,
		radarCenterOffsetY = 0.16,
		minRadiusPct = 0,
		maxRadiusPct = 1,
		maxDistance = 150000,
		distanceExponent = 0.75,
		maskMaterial = "radar_targeting_mask",
		cursorMaterial = "",
		cursorWidth = 80,
		cursorHeight = 80,
		cursorMoveRate = 0.5,
		controllerIndex = f2_local1
	} )
	Radar.id = "Radar"
	Radar:setImage( RegisterMaterial( "radar_targeting_frame_radar" ), 0 )
	Radar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88.75, _1080p * 1831.25, 0, _1080p * 1080 )
	self:addElement( Radar )
	self.Radar = Radar
	
	local OlympusMonsDamageState = nil
	
	OlympusMonsDamageState = MenuBuilder.BuildRegisteredType( "OlympusMonsDamageState", {
		controllerIndex = f2_local1
	} )
	OlympusMonsDamageState.id = "OlympusMonsDamageState"
	OlympusMonsDamageState:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 894.5, _1080p * 1025.5, _1080p * 618, _1080p * 930 )
	self:addElement( OlympusMonsDamageState )
	self.OlympusMonsDamageState = OlympusMonsDamageState
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "OlympusMonsRadarTargeting", OlympusMonsRadarTargeting )
LockTable( _M )
