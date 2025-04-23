local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function BuildRadarTargeting( menu, controller )
	local self = LUI.UIElement.new( nil, controller )
	self.id = "UIRadarTargeting"
	LUI.UIElement.init( self )
	if not controller then
		controller = {}
	end
	controller.minRadiusPct = controller.minRadiusPct or 0
	controller.maxRadiusPct = controller.maxRadiusPct or 1
	controller.maxDistance = controller.maxDistance or 999999
	controller.distanceExponent = controller.distanceExponent or 1
	controller.cursorMaterial = controller.cursorMaterial or "radar_targeting_cursor"
	controller.cursorWidth = controller.cursorWidth or 40
	controller.cursorHeight = controller.cursorHeight or 40
	controller.cursorMoveRate = controller.cursorMoveRate or 0.5
	if LUI.UIElement.SetupRadarTargeting then
		self:SetupRadarTargeting( controller )
	end
	return self
end

MenuBuilder.registerType( "RadarTargeting", BuildRadarTargeting )
LockTable( _M )
