local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MainPlayerInfoContainerDLC4( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 417 * _1080p )
	self.id = "MainPlayerInfoContainerDLC4"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MainPlayerInfoDLC4 = nil
	
	MainPlayerInfoDLC4 = MenuBuilder.BuildRegisteredType( "MainPlayerInfoDLC4", {
		controllerIndex = f1_local1
	} )
	MainPlayerInfoDLC4.id = "MainPlayerInfoDLC4"
	MainPlayerInfoDLC4:SetYRotation( 16, 0 )
	MainPlayerInfoDLC4:SetZRotation( 3, 0 )
	MainPlayerInfoDLC4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 281.5, _1080p * 181.47, _1080p * 400.47 )
	self:addElement( MainPlayerInfoDLC4 )
	self.MainPlayerInfoDLC4 = MainPlayerInfoDLC4
	
	local PlayerCash = nil
	
	PlayerCash = MenuBuilder.BuildRegisteredType( "PlayerCash", {
		controllerIndex = f1_local1
	} )
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetYRotation( 16, 0 )
	PlayerCash:SetZRotation( 3, 0 )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 167.5, _1080p * 5, _1080p * 158 )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	self._animationSets.DefaultAnimationSet = function ()
		PlayerCash:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.PlayerCash:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PlayerCash:SetAlpha( 0, 10080 )
				end,
				function ()
					return self.PlayerCash:SetAlpha( 1, 660 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			PlayerCash:AnimateSequence( "DefaultSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "MainPlayerInfoContainerDLC4", MainPlayerInfoContainerDLC4 )
LockTable( _M )
