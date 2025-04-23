local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalBoosterHighlightRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 366 * _1080p, 0, 32 * _1080p )
	self.id = "JackalBoosterHighlightRight"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:setImage( RegisterMaterial( "hud_jackal_boost_highlight" ), 0 )
	Highlight:SetUMax( 1.43, 0 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "Loop", {
			{
				function ()
					return self.Highlight:SetUMax( 0, 0 )
				end,
				function ()
					return self.Highlight:SetUMax( 2.43, 1000 )
				end
			},
			{
				function ()
					return self.Highlight:SetUMin( -1.43, 0 )
				end,
				function ()
					return self.Highlight:SetUMin( 1, 1000 )
				end
			}
		} )
		self._sequences.Loop = function ()
			Highlight:AnimateLoop( "Loop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.jackal.atmoLaunch:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "Loop" )
	end )
	return self
end

MenuBuilder.registerType( "JackalBoosterHighlightRight", JackalBoosterHighlightRight )
LockTable( _M )
