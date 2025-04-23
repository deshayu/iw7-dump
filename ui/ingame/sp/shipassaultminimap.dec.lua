local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	ACTIONS.AnimateSequence( f1_arg0, "Open" )
	local f1_local0 = DataSources.inGame.SP.showMinimap:GetModel( f1_arg1 )
	f1_arg0:SubscribeToModel( f1_local0, function ()
		if not DataModel.GetModelValue( f1_local0 ) then
			ACTIONS.AnimateSequence( f1_arg0, "Close" )
		end
	end, true )
end

function ShipAssaultMinimap( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "ShipAssaultMinimap"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Minimap = nil
	
	Minimap = LUI.UIImage.new()
	Minimap.id = "Minimap"
	Minimap:SetZRotation( -2, 0 )
	Minimap:setImage( RegisterMaterial( "hud_minimap_sdf_destroyer" ), 0 )
	Minimap:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -978, 0, _1080p * -604 )
	self:addElement( Minimap )
	self.Minimap = Minimap
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Minimap:RegisterAnimationSequence( "Open", {
			{
				function ()
					return self.Minimap:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Minimap:SetAlpha( 1, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 500, _1080p * -1420, 0, _1080p * -577, 0 )
				end,
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -978, 0, _1080p * -577, 500, LUI.EASING.outBack )
				end
			}
		} )
		self._sequences.Open = function ()
			Minimap:AnimateSequence( "Open" )
		end
		
		Minimap:RegisterAnimationSequence( "Close", {
			{
				function ()
					return self.Minimap:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Minimap:SetAlpha( 0, 500, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -978, 0, _1080p * -577, 0 )
				end,
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 500, _1080p * -1420, 0, _1080p * -577, 500, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.Close = function ()
			Minimap:AnimateSequence( "Close" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ShipAssaultMinimap", ShipAssaultMinimap )
LockTable( _M )
