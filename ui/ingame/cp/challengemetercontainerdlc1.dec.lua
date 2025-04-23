local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ChallengeMeterContainerDLC1( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ChallengeMeterContainerDLC1"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local challengeWidgetDLC1 = nil
	
	challengeWidgetDLC1 = MenuBuilder.BuildRegisteredType( "challengeWidgetDLC1", {
		controllerIndex = f1_local1
	} )
	challengeWidgetDLC1.id = "challengeWidgetDLC1"
	challengeWidgetDLC1:SetYRotation( 16, 0 )
	challengeWidgetDLC1:SetZRotation( -3, 0 )
	challengeWidgetDLC1:SetScale( -0.13, 0 )
	challengeWidgetDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -30, _1080p * 500, _1080p * -35.15, _1080p * 201.85 )
	self:addElement( challengeWidgetDLC1 )
	self.challengeWidgetDLC1 = challengeWidgetDLC1
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		challengeWidgetDLC1:RegisterAnimationSequence( "Display", {
			{
				function ()
					return self.challengeWidgetDLC1:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Display = function ()
			challengeWidgetDLC1:AnimateSequence( "Display" )
		end
		
		challengeWidgetDLC1:RegisterAnimationSequence( "splitScreenDisplay", {
			{
				function ()
					return self.challengeWidgetDLC1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 535, _1080p * -35.15, _1080p * 201.85, 0 )
				end
			}
		} )
		self._sequences.splitScreenDisplay = function ()
			challengeWidgetDLC1:AnimateSequence( "splitScreenDisplay" )
		end
		
		challengeWidgetDLC1:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.challengeWidgetDLC1:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			challengeWidgetDLC1:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveMode:GetModel( f1_local1 ), function ()
		if CONDITIONS.IsDLC2( self ) and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f1_local1 ) > 0 then
			ACTIONS.AnimateSequence( self, "Display" )
		end
		if CONDITIONS.IsDLC2( self ) and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f1_local1 ) <= 0 then
			ACTIONS.AnimateSequence( self, "Hide" )
		end
	end )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "splitScreenDisplay" )
	end
	return self
end

MenuBuilder.registerType( "ChallengeMeterContainerDLC1", ChallengeMeterContainerDLC1 )
LockTable( _M )
