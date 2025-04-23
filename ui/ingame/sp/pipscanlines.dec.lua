local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PipScanlines( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "PipScanlines"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local scanlines = nil
	
	scanlines = LUI.UIImage.new()
	scanlines.id = "scanlines"
	scanlines:setImage( RegisterMaterial( "hud_pip_scanlines" ), 0 )
	scanlines:SetUMin( 0.05, 0 )
	scanlines:SetUMax( 0.95, 0 )
	scanlines:SetVMin( 0.15, 0 )
	scanlines:SetVMax( 0.85, 0 )
	self:addElement( scanlines )
	self.scanlines = scanlines
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		scanlines:RegisterAnimationSequence( "Jitter", {
			{
				function ()
					return self.scanlines:SetUMin( 0.06, 0 )
				end
			},
			{
				function ()
					return self.scanlines:SetUMax( 0.95, 0 )
				end
			},
			{
				function ()
					return self.scanlines:SetVMin( 0.2, 0 )
				end,
				function ()
					return self.scanlines:SetVMin( 0.25, 100 )
				end
			},
			{
				function ()
					return self.scanlines:SetVMax( 0.8, 0 )
				end,
				function ()
					return self.scanlines:SetVMax( 0.85, 100 )
				end
			}
		} )
		self._sequences.Jitter = function ()
			scanlines:AnimateLoop( "Jitter" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Jitter" )
	return self
end

MenuBuilder.registerType( "PipScanlines", PipScanlines )
LockTable( _M )
