local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SuperMeterContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "SuperMeterContainer"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SuperMeter = nil
	
	SuperMeter = MenuBuilder.BuildRegisteredType( "SuperMeter", {
		controllerIndex = f1_local1
	} )
	SuperMeter.id = "SuperMeter"
	SuperMeter:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	SuperMeter:BindAlphaToModel( DataSources.inGame.player.super.superMeterAlpha:GetModel( f1_local1 ) )
	self:addElement( SuperMeter )
	self.SuperMeter = SuperMeter
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.hidden = function ()
			SuperMeter:AnimateSequence( "hidden" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "SuperMeterContainer", SuperMeterContainer )
LockTable( _M )
