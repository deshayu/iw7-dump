local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = DataSources.inGame.jackal.boosterState:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local0, function ()
		local f2_local0 = DataModel.GetModelValue( f1_local0 )
		if f2_local0 == JackalBoosterStates.Ready or f2_local0 == JackalBoosterStates.Priming or JackalBoosterStates.Primed == boostersState or JackalBoosterStates.Engaged == boostersState then
			ACTIONS.AnimateSequence( f1_arg0, "Intro" )
		elseif f2_local0 == JackalBoosterStates.Off then
			ACTIONS.AnimateSequence( f1_arg0, "Outtro" )
		end
	end )
end

function JackalBoosters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "JackalBoosters"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local boosterLeft = nil
	
	boosterLeft = MenuBuilder.BuildRegisteredType( "JackalBoosterLeft", {
		controllerIndex = f3_local1
	} )
	boosterLeft.id = "boosterLeft"
	boosterLeft:SetYRotation( 45, 0 )
	boosterLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 100, _1080p * 500, _1080p * 245, _1080p * 320 )
	self:addElement( boosterLeft )
	self.boosterLeft = boosterLeft
	
	local boosterRight = nil
	
	boosterRight = MenuBuilder.BuildRegisteredType( "JackalBoosterRight", {
		controllerIndex = f3_local1
	} )
	boosterRight.id = "boosterRight"
	boosterRight:SetYRotation( -45, 0 )
	boosterRight:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -500, _1080p * -100, _1080p * 245, _1080p * 320 )
	self:addElement( boosterRight )
	self.boosterRight = boosterRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		boosterLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.boosterLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		boosterRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.boosterRight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			boosterLeft:AnimateSequence( "Default" )
			boosterRight:AnimateSequence( "Default" )
		end
		
		boosterLeft:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.boosterLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterLeft:SetAlpha( 1, 30 )
				end
			}
		} )
		boosterRight:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.boosterRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 1, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 0, 30 )
				end,
				function ()
					return self.boosterRight:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.Intro = function ()
			boosterLeft:AnimateSequence( "Intro" )
			boosterRight:AnimateSequence( "Intro" )
		end
		
		boosterLeft:RegisterAnimationSequence( "Outtro", {
			{
				function ()
					return self.boosterLeft:SetAlpha( 0, 250 )
				end
			}
		} )
		boosterRight:RegisterAnimationSequence( "Outtro", {
			{
				function ()
					return self.boosterRight:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.Outtro = function ()
			boosterLeft:AnimateSequence( "Outtro" )
			boosterRight:AnimateSequence( "Outtro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalBoosters", JackalBoosters )
LockTable( _M )
