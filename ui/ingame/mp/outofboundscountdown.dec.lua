local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OutOfBoundsCountdown( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "OutOfBoundsCountdown"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ReturnCountdown = nil
	
	ReturnCountdown = MenuBuilder.BuildRegisteredType( "ReturnCountdown", {
		controllerIndex = f1_local1
	} )
	ReturnCountdown.id = "ReturnCountdown"
	ReturnCountdown:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -228, _1080p * 228, _1080p * -110, _1080p * 110 )
	self:addElement( ReturnCountdown )
	self.ReturnCountdown = ReturnCountdown
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReturnCountdown:RegisterAnimationSequence( "HideCountdown", {
			{
				function ()
					return self.ReturnCountdown:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideCountdown = function ()
			ReturnCountdown:AnimateSequence( "HideCountdown" )
		end
		
		ReturnCountdown:RegisterAnimationSequence( "ShowCountdown", {
			{
				function ()
					return self.ReturnCountdown:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.ReturnCountdown:SetAlpha( 0.4, 300, LUI.EASING.inSine )
				end,
				function ()
					return self.ReturnCountdown:SetAlpha( 0.9, 300, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.ShowCountdown = function ()
			ReturnCountdown:AnimateLoop( "ShowCountdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.outOfBoundsCountdownActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.MP.outOfBoundsCountdownActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.outOfBoundsCountdownActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "ShowCountdown" )
		end
		if DataSources.inGame.MP.outOfBoundsCountdownActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.outOfBoundsCountdownActive:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "HideCountdown" )
		end
	end )
	return self
end

MenuBuilder.registerType( "OutOfBoundsCountdown", OutOfBoundsCountdown )
LockTable( _M )
