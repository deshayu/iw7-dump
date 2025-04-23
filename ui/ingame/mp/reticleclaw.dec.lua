local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleClaw( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleClaw"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReticleClawBaseWrapper = nil
	
	ReticleClawBaseWrapper = MenuBuilder.BuildRegisteredType( "ReticleClawBaseWrapper", {
		controllerIndex = f1_local1
	} )
	ReticleClawBaseWrapper.id = "ReticleClawBaseWrapper"
	ReticleClawBaseWrapper:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	ReticleClawBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ReticleClawBaseWrapper:SetLeft( _1080p * Multiply( f2_local0, -1 ), 0 )
		end
	end )
	ReticleClawBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ReticleClawBaseWrapper:SetRight( _1080p * Multiply( f3_local0, 1 ), 0 )
		end
	end )
	ReticleClawBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ReticleClawBaseWrapper:SetTop( _1080p * Multiply( f4_local0, -1 ), 0 )
		end
	end )
	ReticleClawBaseWrapper:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			ReticleClawBaseWrapper:SetBottom( _1080p * Multiply( f5_local0, 1 ), 0 )
		end
	end )
	ReticleClawBaseWrapper:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( ReticleClawBaseWrapper )
	self.ReticleClawBaseWrapper = ReticleClawBaseWrapper
	
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "ReticleClawBaseWrapper",
			sequenceName = "OnFire",
			elementPath = "ReticleClawBaseWrapper"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "LeftLine",
			sequenceName = "Fire",
			elementPath = "ReticleClawBaseWrapper.LeftLine"
		} )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "RightLine",
			sequenceName = "Fire",
			elementPath = "ReticleClawBaseWrapper.RightLine"
		} )
	end )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "LeftLine",
		sequenceName = "Idle2",
		elementPath = "ReticleClawBaseWrapper.LeftLine"
	} )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "RightLine",
		sequenceName = "Idle2",
		elementPath = "ReticleClawBaseWrapper.RightLine"
	} )
	return self
end

MenuBuilder.registerType( "ReticleClaw", ReticleClaw )
LockTable( _M )
