local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MainPlayerInfoContainerDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 417 * _1080p )
	self.id = "MainPlayerInfoContainerDLC2"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PlayerCash = nil
	
	PlayerCash = MenuBuilder.BuildRegisteredType( "PlayerCash", {
		controllerIndex = f1_local1
	} )
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetYRotation( 16, 0 )
	PlayerCash:SetZRotation( 3, 0 )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 167.5, _1080p * 3.63, _1080p * 156.63 )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	local MainPlayerInfoDLC2 = nil
	
	MainPlayerInfoDLC2 = MenuBuilder.BuildRegisteredType( "MainPlayerInfoDLC2", {
		controllerIndex = f1_local1
	} )
	MainPlayerInfoDLC2.id = "MainPlayerInfoDLC2"
	MainPlayerInfoDLC2:SetYRotation( 16, 0 )
	MainPlayerInfoDLC2:SetZRotation( 3, 0 )
	MainPlayerInfoDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.5, _1080p * 294.5, _1080p * 198, _1080p * 417 )
	self:addElement( MainPlayerInfoDLC2 )
	self.MainPlayerInfoDLC2 = MainPlayerInfoDLC2
	
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
		
		PlayerCash:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36.5, _1080p * 200.5, _1080p * 3.63, _1080p * 156.63, 0 )
				end
			}
		} )
		MainPlayerInfoDLC2:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.MainPlayerInfoDLC2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.5, _1080p * 321.5, _1080p * 198, _1080p * 417, 0 )
				end
			}
		} )
		self._sequences.splitscreen = function ()
			PlayerCash:AnimateSequence( "splitscreen" )
			MainPlayerInfoDLC2:AnimateSequence( "splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "MainPlayerInfoContainerDLC2", MainPlayerInfoContainerDLC2 )
LockTable( _M )
