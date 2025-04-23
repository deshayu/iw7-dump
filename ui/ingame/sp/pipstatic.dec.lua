local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PipStatic( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 300 * _1080p )
	self.id = "PipStatic"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PipStatic = nil
	
	PipStatic = LUI.UIImage.new()
	PipStatic.id = "PipStatic"
	PipStatic:setImage( RegisterMaterial( "hud_pip_overlay_static" ), 0 )
	self:addElement( PipStatic )
	self.PipStatic = PipStatic
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PipStatic:RegisterAnimationSequence( "Static", {
			{
				function ()
					return self.PipStatic:SetZRotation( 0, 0 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 0, 40 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 90, 10 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 90, 40 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 180, 10 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 180, 40 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 270, 10 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 270, 40 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 90, 10 )
				end,
				function ()
					return self.PipStatic:SetZRotation( 90, 40 )
				end
			},
			{
				function ()
					return self.PipStatic:SetVMin( 0, 0 )
				end,
				function ()
					return self.PipStatic:SetVMin( 0, 40 )
				end,
				function ()
					return self.PipStatic:SetVMin( -0.7, 10 )
				end,
				function ()
					return self.PipStatic:SetVMin( -0.7, 40 )
				end,
				function ()
					return self.PipStatic:SetVMin( -0.27, 10 )
				end,
				function ()
					return self.PipStatic:SetVMin( -0.27, 40 )
				end,
				function ()
					return self.PipStatic:SetVMin( 0.24, 10 )
				end,
				function ()
					return self.PipStatic:SetVMin( 0.24, 40 )
				end,
				function ()
					return self.PipStatic:SetVMin( 0.41, 10 )
				end,
				function ()
					return self.PipStatic:SetVMin( 0.41, 40 )
				end
			},
			{
				function ()
					return self.PipStatic:SetUMin( 0, 0 )
				end,
				function ()
					return self.PipStatic:SetUMin( 0, 40 )
				end,
				function ()
					return self.PipStatic:SetUMin( -0.76, 10 )
				end,
				function ()
					return self.PipStatic:SetUMin( -0.76, 40 )
				end,
				function ()
					return self.PipStatic:SetUMin( 0.14, 10 )
				end,
				function ()
					return self.PipStatic:SetUMin( 0.14, 40 )
				end,
				function ()
					return self.PipStatic:SetUMin( -0.11, 10 )
				end,
				function ()
					return self.PipStatic:SetUMin( -0.11, 40 )
				end,
				function ()
					return self.PipStatic:SetUMin( -0.32, 10 )
				end,
				function ()
					return self.PipStatic:SetUMin( -0.32, 40 )
				end
			}
		} )
		self._sequences.Static = function ()
			PipStatic:AnimateLoop( "Static" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Static" )
	return self
end

MenuBuilder.registerType( "PipStatic", PipStatic )
LockTable( _M )
