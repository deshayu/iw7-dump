local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MainPlayerInfoContainerDLC3( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 335 * _1080p, 0, 417 * _1080p )
	self.id = "MainPlayerInfoContainerDLC3"
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
	
	local MainPlayerInfoDLC3 = nil
	
	MainPlayerInfoDLC3 = MenuBuilder.BuildRegisteredType( "MainPlayerInfoDLC3", {
		controllerIndex = f1_local1
	} )
	MainPlayerInfoDLC3.id = "MainPlayerInfoDLC3"
	MainPlayerInfoDLC3:SetYRotation( 16, 0 )
	MainPlayerInfoDLC3:SetZRotation( 3, 0 )
	MainPlayerInfoDLC3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 3.5, _1080p * 285.5, _1080p * 181.47, _1080p * 400.47 )
	self:addElement( MainPlayerInfoDLC3 )
	self.MainPlayerInfoDLC3 = MainPlayerInfoDLC3
	
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
		MainPlayerInfoDLC3:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.MainPlayerInfoDLC3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 36.5, _1080p * 318.5, _1080p * 181.47, _1080p * 400.47, 0 )
				end
			}
		} )
		self._sequences.splitscreen = function ()
			PlayerCash:AnimateSequence( "splitscreen" )
			MainPlayerInfoDLC3:AnimateSequence( "splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "MainPlayerInfoContainerDLC3", MainPlayerInfoContainerDLC3 )
LockTable( _M )
