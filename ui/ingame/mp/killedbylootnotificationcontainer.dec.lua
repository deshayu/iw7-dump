local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityNotify:GetModel( f1_arg1 ), function ()
		ACTIONS.AnimateSequence( f1_arg0, "Show" )
	end, true )
end

function KilledByLootNotificationContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "KilledByLootNotificationContainer"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local KilledByLootWeaponNotification = nil
	
	KilledByLootWeaponNotification = MenuBuilder.BuildRegisteredType( "KilledByLootWeaponNotification", {
		controllerIndex = f3_local1
	} )
	KilledByLootWeaponNotification.id = "KilledByLootWeaponNotification"
	KilledByLootWeaponNotification:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -150, _1080p * -50 )
	self:addElement( KilledByLootWeaponNotification )
	self.KilledByLootWeaponNotification = KilledByLootWeaponNotification
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		KilledByLootWeaponNotification:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.KilledByLootWeaponNotification:SetAlpha( 0, 0 )
				end,
				function ()
					return self.KilledByLootWeaponNotification:SetAlpha( 1, 300 )
				end,
				function ()
					return self.KilledByLootWeaponNotification:SetAlpha( 1, 2200 )
				end,
				function ()
					return self.KilledByLootWeaponNotification:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.Show = function ()
			KilledByLootWeaponNotification:AnimateSequence( "Show" )
		end
		
		KilledByLootWeaponNotification:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.KilledByLootWeaponNotification:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			KilledByLootWeaponNotification:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Hide" )
	return self
end

MenuBuilder.registerType( "KilledByLootNotificationContainer", KilledByLootNotificationContainer )
LockTable( _M )
