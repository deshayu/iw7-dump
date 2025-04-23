local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ghostHUDContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ghostHUDContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ghostArcadeGameSkullDestroyed = nil
	
	ghostArcadeGameSkullDestroyed = MenuBuilder.BuildRegisteredType( "ghostArcadeGameSkullDestroyed", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameSkullDestroyed.id = "ghostArcadeGameSkullDestroyed"
	ghostArcadeGameSkullDestroyed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 27, _1080p * 302, _1080p * 799, _1080p * 949 )
	self:addElement( ghostArcadeGameSkullDestroyed )
	self.ghostArcadeGameSkullDestroyed = ghostArcadeGameSkullDestroyed
	
	local ghostArcadeGameWidget = nil
	
	ghostArcadeGameWidget = MenuBuilder.BuildRegisteredType( "ghostArcadeGameWidget", {
		controllerIndex = f1_local1
	} )
	ghostArcadeGameWidget.id = "ghostArcadeGameWidget"
	ghostArcadeGameWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1308, _1080p * 1709, _1080p * 847, _1080p * 979 )
	self:addElement( ghostArcadeGameWidget )
	self.ghostArcadeGameWidget = ghostArcadeGameWidget
	
	local entanglerWidget = nil
	
	entanglerWidget = MenuBuilder.BuildRegisteredType( "entanglerWidget", {
		controllerIndex = f1_local1
	} )
	entanglerWidget.id = "entanglerWidget"
	entanglerWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 572, _1080p * 1172, _1080p * 889, _1080p * 949 )
	self:addElement( entanglerWidget )
	self.entanglerWidget = entanglerWidget
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		entanglerWidget:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.entanglerWidget:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			entanglerWidget:AnimateSequence( "initial" )
		end
		
		entanglerWidget:RegisterAnimationSequence( "display", {
			{
				function ()
					return self.entanglerWidget:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.display = function ()
			entanglerWidget:AnimateSequence( "display" )
		end
		
		ghostArcadeGameWidget:RegisterAnimationSequence( "hideEscapeWidget", {
			{
				function ()
					return self.ghostArcadeGameWidget:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.hideEscapeWidget = function ()
			ghostArcadeGameWidget:AnimateSequence( "hideEscapeWidget" )
		end
		
		ghostArcadeGameSkullDestroyed:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.ghostArcadeGameSkullDestroyed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 44, _1080p * 319, _1080p * 416, _1080p * 566, 0 )
				end
			}
		} )
		ghostArcadeGameWidget:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.ghostArcadeGameWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1482, _1080p * 1883, _1080p * 464, _1080p * 596, 0 )
				end
			}
		} )
		entanglerWidget:RegisterAnimationSequence( "splitscreen", {
			{
				function ()
					return self.entanglerWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.entanglerWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 712, _1080p * 1312, _1080p * 506, _1080p * 566, 0 )
				end
			}
		} )
		self._sequences.splitscreen = function ()
			ghostArcadeGameSkullDestroyed:AnimateSequence( "splitscreen" )
			ghostArcadeGameWidget:AnimateSequence( "splitscreen" )
			entanglerWidget:AnimateSequence( "splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	entanglerWidget:SubscribeToModel( DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == true and not CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "display" )
		end
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == false and not CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "initial" )
		end
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == true and CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "splitscreen" )
		end
		if DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.ghostArcadeIsActive:GetValue( f1_local1 ) == false and CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "initial" )
		end
	end )
	ACTIONS.AnimateSequence( self, "initial" )
	return self
end

MenuBuilder.registerType( "ghostHUDContainer", ghostHUDContainer )
LockTable( _M )
