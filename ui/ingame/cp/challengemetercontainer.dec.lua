local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ChallengeMeterContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ChallengeMeterContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local challengeWidgetNew = nil
	
	challengeWidgetNew = MenuBuilder.BuildRegisteredType( "challengeWidgetNew", {
		controllerIndex = f1_local1
	} )
	challengeWidgetNew.id = "challengeWidgetNew"
	challengeWidgetNew:SetYRotation( 16, 0 )
	challengeWidgetNew:SetZRotation( -3, 0 )
	challengeWidgetNew:SetScale( -0.13, 0 )
	challengeWidgetNew:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -30, _1080p * 500, _1080p * -35.15, _1080p * 201.85 )
	self:addElement( challengeWidgetNew )
	self.challengeWidgetNew = challengeWidgetNew
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.Display = function ()
			
		end
		
		challengeWidgetNew:RegisterAnimationSequence( "splitScreenDisplay", {
			{
				function ()
					return self.challengeWidgetNew:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 5, _1080p * 535, _1080p * -35.15, _1080p * 201.85, 0 )
				end
			}
		} )
		self._sequences.splitScreenDisplay = function ()
			challengeWidgetNew:AnimateSequence( "splitScreenDisplay" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "splitScreenDisplay" )
	end
	return self
end

MenuBuilder.registerType( "ChallengeMeterContainer", ChallengeMeterContainer )
LockTable( _M )
