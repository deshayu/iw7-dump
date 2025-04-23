local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenMainRadar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 1024 * _1080p )
	self.id = "JackalInteriorScreenMainRadar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Ping = nil
	
	Ping = LUI.UIImage.new()
	Ping.id = "Ping"
	Ping:SetScale( -0.5, 0 )
	Ping:setImage( RegisterMaterial( "hud_jackal_interior_main_map_circle" ), 0 )
	Ping:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -128, _1080p * 128 )
	self:addElement( Ping )
	self.Ping = Ping
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Ping:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Ping:SetScale( -0.95, 0 )
				end,
				function ()
					return self.Ping:SetScale( 2, 1000 )
				end,
				function ()
					return self.Ping:SetScale( 2, 1000 )
				end
			},
			{
				function ()
					return self.Ping:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Ping:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.Ping:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.Loop = function ()
			Ping:AnimateLoop( "Loop" )
		end
		
		Ping:RegisterAnimationSequence( "Stop", {
			{
				function ()
					return self.Ping:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Stop = function ()
			Ping:AnimateSequence( "Stop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.noGunsModeActive:GetModel( f1_local1 ), function ()
		if DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "Stop" )
		end
		if DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_local1 ) ~= nil and DataSources.inGame.jackal.noGunsModeActive:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "Loop" )
		end
	end )
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenMainRadar", JackalInteriorScreenMainRadar )
LockTable( _M )
