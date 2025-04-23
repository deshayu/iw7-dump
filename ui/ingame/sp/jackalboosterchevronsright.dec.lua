local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalBoosterChevronsRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 366 * _1080p, 0, 32 * _1080p )
	self.id = "JackalBoosterChevronsRight"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ChevronStrip = nil
	
	ChevronStrip = LUI.UIImage.new()
	ChevronStrip.id = "ChevronStrip"
	ChevronStrip:SetZRotation( 180, 0 )
	ChevronStrip:setImage( RegisterMaterial( "hud_jackal_chevron_strip" ), 0 )
	self:addElement( ChevronStrip )
	self.ChevronStrip = ChevronStrip
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ChevronStrip:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.ChevronStrip:SetUMin( 0.28, 0 )
				end,
				function ()
					return self.ChevronStrip:SetUMin( 0.03, 2000 )
				end
			},
			{
				function ()
					return self.ChevronStrip:SetUMax( 1, 0 )
				end,
				function ()
					return self.ChevronStrip:SetUMax( 0.74, 2000 )
				end
			}
		} )
		self._sequences.Loop = function ()
			ChevronStrip:AnimateLoop( "Loop" )
		end
		
		ChevronStrip:RegisterAnimationSequence( "Stop", {
			{
				function ()
					return self.ChevronStrip:SetUMin( 0.29, 0 )
				end
			},
			{
				function ()
					return self.ChevronStrip:SetUMax( 1, 0 )
				end
			}
		} )
		self._sequences.Stop = function ()
			ChevronStrip:AnimateSequence( "Stop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.atmoLaunch:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Loop" )
	end )
	return self
end

MenuBuilder.registerType( "JackalBoosterChevronsRight", JackalBoosterChevronsRight )
LockTable( _M )
