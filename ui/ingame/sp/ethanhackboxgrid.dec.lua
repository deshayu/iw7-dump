local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EthanHackBoxGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 224 * _1080p, 0, 200 * _1080p )
	self.id = "EthanHackBoxGrid"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Box1 = nil
	
	Box1 = LUI.UIImage.new()
	Box1.id = "Box1"
	Box1:SetAlpha( 0.3, 0 )
	Box1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 94, _1080p * 108, _1080p * 141 )
	self:addElement( Box1 )
	self.Box1 = Box1
	
	local Box2 = nil
	
	Box2 = LUI.UIImage.new()
	Box2.id = "Box2"
	Box2:SetAlpha( 0.3, 0 )
	Box2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 73, _1080p * 106 )
	self:addElement( Box2 )
	self.Box2 = Box2
	
	local BoxGrid = nil
	
	BoxGrid = LUI.UIImage.new()
	BoxGrid.id = "BoxGrid"
	BoxGrid:setImage( RegisterMaterial( "hud_ethan_side_grid_box" ), 0 )
	BoxGrid:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 224, 0, _1080p * 200 )
	self:addElement( BoxGrid )
	self.BoxGrid = BoxGrid
	
	local Box3 = nil
	
	Box3 = LUI.UIImage.new()
	Box3.id = "Box3"
	Box3:SetAlpha( 0.3, 0 )
	Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 73, _1080p * 106 )
	self:addElement( Box3 )
	self.Box3 = Box3
	
	local Box4 = nil
	
	Box4 = LUI.UIImage.new()
	Box4.id = "Box4"
	Box4:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	Box4:SetAlpha( 0.3, 0 )
	Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 38, _1080p * 71 )
	self:addElement( Box4 )
	self.Box4 = Box4
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Box1:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Box1:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Box1:SetAlpha( 0.6, 300 )
				end,
				function ()
					return self.Box1:SetAlpha( 0, 70 )
				end,
				function ()
					return self.Box1:SetAlpha( 0.3, 70 )
				end,
				function ()
					return self.Box1:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Box1:SetAlpha( 0.3, 40 )
				end,
				function ()
					return self.Box1:SetAlpha( 0, 30 )
				end,
				function ()
					return self.Box1:SetAlpha( 0.3, 20 )
				end
			}
		} )
		Box2:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Box2:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Box2:SetAlpha( 0.3, 590 )
				end,
				function ()
					return self.Box2:SetAlpha( 0.6, 10 )
				end,
				function ()
					return self.Box2:SetAlpha( 0.3, 1000 )
				end
			}
		} )
		Box3:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Box3:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.Box3:SetAlpha( 0, 860 )
				end,
				function ()
					return self.Box3:SetAlpha( 0.3, 20 )
				end,
				function ()
					return self.Box3:SetAlpha( 0, 850 )
				end,
				function ()
					return self.Box3:SetAlpha( 0.3, 10 )
				end,
				function ()
					return self.Box3:SetAlpha( 0, 920 )
				end,
				function ()
					return self.Box3:SetAlpha( 0.3, 10 )
				end,
				function ()
					return self.Box3:SetAlpha( 0, 1330 )
				end
			},
			{
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 107, _1080p * 140, 0 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 108.01, _1080p * 141.01, 860 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 37, _1080p * 70, 9 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 108, _1080p * 141, 9 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 108, _1080p * 141, 850 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 73, _1080p * 106, 9 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 73, _1080p * 106, 920 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 38, _1080p * 71, 9 )
				end,
				function ()
					return self.Box3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 38, _1080p * 71, 1329 )
				end
			}
		} )
		Box4:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 38, _1080p * 71, 0 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 38, _1080p * 71, 300 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 94, _1080p * 38, _1080p * 71, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 94, _1080p * 38, _1080p * 71, 290 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 38, _1080p * 71, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 38, _1080p * 71, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 38, _1080p * 71, 10 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 38, _1080p * 71, 290 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 38, _1080p * 71, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 38, _1080p * 71, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 73, _1080p * 106, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 73, _1080p * 106, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 94, _1080p * 73, _1080p * 106, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60, _1080p * 94, _1080p * 73, _1080p * 106, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 73, _1080p * 106, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 73, _1080p * 106, 290 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 73, _1080p * 106, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 73, _1080p * 106, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 73, _1080p * 106, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 73, _1080p * 106, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 108, _1080p * 141, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26, _1080p * 60, _1080p * 108, _1080p * 141, 390 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61, _1080p * 95, _1080p * 108, _1080p * 141, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 61, _1080p * 95, _1080p * 108, _1080p * 141, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 108, _1080p * 141, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 95, _1080p * 129, _1080p * 108, _1080p * 141, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 108, _1080p * 141, 10 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 164, _1080p * 108, _1080p * 141, 289 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 108, _1080p * 141, 9 )
				end,
				function ()
					return self.Box4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165, _1080p * 199, _1080p * 108, _1080p * 141, 289 )
				end
			}
		} )
		self._sequences.BootUp = function ()
			Box1:AnimateLoop( "BootUp" )
			Box2:AnimateLoop( "BootUp" )
			Box3:AnimateLoop( "BootUp" )
			Box4:AnimateLoop( "BootUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "EthanHackBoxGrid", EthanHackBoxGrid )
LockTable( _M )
