local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function VehicleTargets()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	self.id = "vehicleHudTargetsId"
	self:setupOwnerdraw( CoD.Ownerdraw.CGHudTargetsVehicle )
	return self
end

function VehicleWeaponReticle()
	local self = LUI.UIElement.new()
	self.id = "vehicleWeaponReticleId"
	self:registerAnimationState( "default", {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	self:setupOwnerdraw( CoD.Ownerdraw.CGVehicleReticle )
	return self
end

MenuBuilder.registerType( "VehicleTargets", VehicleTargets )
MenuBuilder.registerType( "VehicleWeaponReticle", VehicleWeaponReticle )
LockTable( _M )
