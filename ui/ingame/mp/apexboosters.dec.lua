local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ApexBoosters( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 40 * _1080p )
	self.id = "ApexBoosters"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Booster = nil
	
	Booster = MenuBuilder.BuildRegisteredType( "ApexBoosterMessage", {
		controllerIndex = f1_local1
	} )
	Booster.id = "Booster"
	Booster:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Booster )
	self.Booster = Booster
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Booster:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Booster:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Booster:AnimateSequence( "Default" )
		end
		
		Booster:RegisterAnimationSequence( "On", {
			{
				function ()
					return self.Booster:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Booster:SetAlpha( 0.25, 40 )
				end,
				function ()
					return self.Booster:SetAlpha( 1, 40 )
				end
			}
		} )
		self._sequences.On = function ()
			Booster:AnimateLoop( "On" )
		end
		
		Booster:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.Booster:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			Booster:AnimateSequence( "Off" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.miniJackalBoost:GetModel( f1_local1 ), function ()
		if DataSources.inGame.MP.scorestreakHuds.miniJackalBoost:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalBoost:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "On" )
		end
		if DataSources.inGame.MP.scorestreakHuds.miniJackalBoost:GetValue( f1_local1 ) ~= nil and DataSources.inGame.MP.scorestreakHuds.miniJackalBoost:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Off" )
		end
	end )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "ApexBoosters", ApexBoosters )
LockTable( _M )
