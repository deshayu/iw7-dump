local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	return function ()
		local f2_local0 = 68
		local f2_local1 = DataSources.inGame.player.currentWeapon.clipAmmoRight:GetValue( f1_arg1 )
		local f2_local2 = DataSources.inGame.player.currentWeapon.clipAmmoMax:GetValue( f1_arg1 )
		if f2_local1 and f2_local2 then
			local f2_local3
			if f2_local2 == 0 then
				f2_local3 = 0
				if not f2_local3 then
				
				else
					f1_arg0.AmmoBar:SetLeft( _1080p * f2_local0 * f2_local3 * -1, 0 )
				end
			end
			f2_local3 = f2_local1 / f2_local2
		end
	end
	
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.AmmoBar )
	f3_arg0.AmmoBar:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoRight:GetModel( f3_arg1 ), f0_local0( f3_arg0, f3_arg1 ) )
	f3_arg0.AmmoBar:SubscribeToModel( DataSources.inGame.player.currentWeapon.clipAmmoMax:GetModel( f3_arg1 ), f0_local0( f3_arg0, f3_arg1 ) )
end

function ZomRightClipAmmoBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 68 * _1080p, 0, 18 * _1080p )
	self.id = "ZomRightClipAmmoBar"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local AmmoBar = nil
	
	AmmoBar = LUI.UIImage.new()
	AmmoBar.id = "AmmoBar"
	AmmoBar:SetRGBFromInt( 5525313, 0 )
	AmmoBar:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -85.88, 0, 0, 0 )
	self:addElement( AmmoBar )
	self.AmmoBar = AmmoBar
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "ZomRightClipAmmoBar", ZomRightClipAmmoBar )
LockTable( _M )
