local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HaloDropSideMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 896 * _1080p )
	self.id = "HaloDropSideMeter"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image0Copy1 = nil
	
	Image0Copy1 = LUI.UIImage.new()
	Image0Copy1.id = "Image0Copy1"
	Image0Copy1:setImage( RegisterMaterial( "halo_side_meter_bot_lines" ), 0 )
	Image0Copy1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * 42, _1080p * -433, _1080p * 430 )
	self:addElement( Image0Copy1 )
	self.Image0Copy1 = Image0Copy1
	
	local Tics = nil
	
	Tics = LUI.UIImage.new()
	Tics.id = "Tics"
	Tics:SetDepth( -16, 0 )
	Tics:setImage( RegisterMaterial( "halo_side_meter_tics" ), 0 )
	Tics:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 14, _1080p * 30, _1080p * -422, _1080p * 420 )
	self:addElement( Tics )
	self.Tics = Tics
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Tics:RegisterAnimationSequence( "StartDrop", {
			{
				function ()
					return self.Tics:SetVMin( 0, 0 )
				end,
				function ()
					return self.Tics:SetVMin( -0.99, 600 )
				end
			},
			{
				function ()
					return self.Tics:SetVMax( 1, 0 )
				end,
				function ()
					return self.Tics:SetVMax( 0.01, 600 )
				end
			}
		} )
		self._sequences.StartDrop = function ()
			Tics:AnimateLoop( "StartDrop" )
		end
		
		Tics:RegisterAnimationSequence( "Landing", {
			{
				function ()
					return self.Tics:SetVMin( 0, 0 )
				end,
				function ()
					return self.Tics:SetVMin( -0.99, 1490 )
				end
			},
			{
				function ()
					return self.Tics:SetVMax( 1, 0 )
				end,
				function ()
					return self.Tics:SetVMax( 0.01, 1490 )
				end
			}
		} )
		self._sequences.Landing = function ()
			Tics:AnimateLoop( "Landing" )
		end
		
		Tics:RegisterAnimationSequence( "LandingDone", {
			{
				function ()
					return self.Tics:SetVMin( 0, 0 )
				end
			},
			{
				function ()
					return self.Tics:SetVMax( 1, 0 )
				end
			}
		} )
		self._sequences.LandingDone = function ()
			Tics:AnimateSequence( "LandingDone" )
		end
		
		Tics:RegisterAnimationSequence( "LevelOut", {
			{
				function ()
					return self.Tics:SetVMin( 0, 0 )
				end,
				function ()
					return self.Tics:SetVMin( -0.99, 2500 )
				end
			},
			{
				function ()
					return self.Tics:SetVMax( 1, 0 )
				end,
				function ()
					return self.Tics:SetVMax( 0.01, 2500 )
				end
			}
		} )
		self._sequences.LevelOut = function ()
			Tics:AnimateLoop( "LevelOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "HaloDropSideMeter", HaloDropSideMeter )
LockTable( _M )
