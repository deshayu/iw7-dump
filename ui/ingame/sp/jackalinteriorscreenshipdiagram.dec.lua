local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalInteriorScreenShipDiagram( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 1336 * _1080p )
	self.id = "JackalInteriorScreenShipDiagram"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ShipInfo = nil
	
	ShipInfo = MenuBuilder.BuildRegisteredType( "JackalInteriorScreenShipInfo", {
		controllerIndex = f1_local1
	} )
	ShipInfo.id = "ShipInfo"
	ShipInfo:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( ShipInfo )
	self.ShipInfo = ShipInfo
	
	local Flare = nil
	
	Flare = LUI.UIImage.new()
	Flare.id = "Flare"
	Flare:SetAlpha( 0, 0 )
	self:addElement( Flare )
	self.Flare = Flare
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ShipInfo:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.ShipInfo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ShipInfo:SetAlpha( 0, 400 )
				end,
				function ()
					return self.ShipInfo:SetAlpha( 1, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ShipInfo:SetScale( 0.05, 0 )
				end,
				function ()
					return self.ShipInfo:SetScale( 0.05, 400 )
				end,
				function ()
					return self.ShipInfo:SetScale( 0, 600, LUI.EASING.outQuadratic )
				end
			}
		} )
		Flare:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Flare:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Flare:SetAlpha( 1, 400, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAlpha( 0, 600, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 511, _1080p * -511, _1080p * 667, _1080p * -667, 0 )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 667, _1080p * -667, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Flare:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 599, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Bootup = function ()
			ShipInfo:AnimateSequence( "Bootup" )
			Flare:AnimateSequence( "Bootup" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "JackalInteriorScreenShipDiagram", JackalInteriorScreenShipDiagram )
LockTable( _M )
