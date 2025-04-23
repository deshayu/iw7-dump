local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Blood:setupOwnerdraw( CoD.Ownerdraw.CGLowHealthOverlay )
end

function ZomPlayerDamageFlash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ZomPlayerDamageFlash"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Blood = nil
	
	Blood = LUI.UIImage.new()
	Blood.id = "Blood"
	Blood:SetAlpha( 0, 0 )
	Blood:SetScale( 0.1, 0 )
	Blood:setImage( RegisterMaterial( "overlay_low_health" ), 0 )
	Blood:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 4.33, _1080p * -3.67, _1080p * 12.43, _1080p * -15.57 )
	self:addElement( Blood )
	self.Blood = Blood
	
	local Flash = nil
	
	Flash = LUI.UIImage.new()
	Flash.id = "Flash"
	Flash:SetRGBFromInt( 13718355, 0 )
	Flash:SetAlpha( 0, 0 )
	Flash:SetScale( 0.16, 0 )
	Flash:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10000, _1080p * 10000, _1080p * -10000, _1080p * 10000 )
	self:addElement( Flash )
	self.Flash = Flash
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Flash:RegisterAnimationSequence( "Flash", {
			{
				function ()
					return self.Flash:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Flash:SetAlpha( 0.25, 110 )
				end,
				function ()
					return self.Flash:SetAlpha( 0, 110, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.Flash = function ()
			Flash:AnimateSequence( "Flash" )
		end
		
		Blood:RegisterAnimationSequence( "bloodOn", {
			{
				function ()
					return self.Blood:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Blood:SetAlpha( 0.85, 470 )
				end
			}
		} )
		self._sequences.bloodOn = function ()
			Blood:AnimateSequence( "bloodOn" )
		end
		
		Blood:RegisterAnimationSequence( "bloodOff", {
			{
				function ()
					return self.Blood:SetAlpha( 0.85, 40 )
				end,
				function ()
					return self.Blood:SetAlpha( 0, 460 )
				end
			}
		} )
		self._sequences.bloodOff = function ()
			Blood:AnimateSequence( "bloodOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Blood:SubscribeToModel( DataSources.inGame.CP.zombies.playerHealthBlood:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.playerHealthBlood:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.playerHealthBlood:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bloodOn" )
		end
		if DataSources.inGame.CP.zombies.playerHealthBlood:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.playerHealthBlood:GetValue( f2_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "bloodOff" )
		end
	end )
	Flash:SubscribeToModel( DataSources.inGame.CP.zombies.playerDamagedFlash:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.playerDamagedFlash:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.playerDamagedFlash:GetValue( f2_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "Flash" )
		end
	end )
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ZomPlayerDamageFlash", ZomPlayerDamageFlash )
LockTable( _M )
