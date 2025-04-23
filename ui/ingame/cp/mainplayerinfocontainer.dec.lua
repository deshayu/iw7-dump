local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MainPlayerInfoContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 417 * _1080p )
	self.id = "MainPlayerInfoContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local MainPlayerInfo = nil
	
	MainPlayerInfo = MenuBuilder.BuildRegisteredType( "MainPlayerInfo", {
		controllerIndex = f1_local1
	} )
	MainPlayerInfo.id = "MainPlayerInfo"
	MainPlayerInfo:SetYRotation( 16, 0 )
	MainPlayerInfo:SetZRotation( 3, 0 )
	MainPlayerInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 281.5, _1080p * 181.47, _1080p * 400.47 )
	self:addElement( MainPlayerInfo )
	self.MainPlayerInfo = MainPlayerInfo
	
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

MenuBuilder.registerType( "MainPlayerInfoContainer", MainPlayerInfoContainer )
LockTable( _M )
