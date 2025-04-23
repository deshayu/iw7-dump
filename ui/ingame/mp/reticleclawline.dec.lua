local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleClawLine( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleClawLine"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Small = nil
	
	Small = LUI.UIImage.new()
	Small.id = "Small"
	Small:SetScale( -0.25, 0 )
	Small:setImage( RegisterMaterial( "hud_reticle_hip_claw_arrow" ), 0 )
	Small:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 35.4, _1080p * -50.6, 0, 0 )
	self:addElement( Small )
	self.Small = Small
	
	local Medium = nil
	
	Medium = LUI.UIImage.new()
	Medium.id = "Medium"
	Medium:SetScale( -0.1, 0 )
	Medium:setImage( RegisterMaterial( "hud_reticle_hip_claw_arrow" ), 0 )
	Medium:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 59.4, _1080p * -26.6, 0, 0 )
	self:addElement( Medium )
	self.Medium = Medium
	
	local Large = nil
	
	Large = LUI.UIImage.new()
	Large.id = "Large"
	Large:setImage( RegisterMaterial( "hud_reticle_hip_claw_arrow" ), 0 )
	Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0 )
	self:addElement( Large )
	self.Large = Large
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Small:RegisterAnimationSequence( "Idle2", {
			{
				function ()
					return self.Small:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 43, _1080p * -43, 0, 0, 0 )
				end,
				function ()
					return self.Small:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 28, _1080p * -58, 0, 0, 3000, LUI.EASING.inOutBack )
				end,
				function ()
					return self.Small:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 36, _1080p * -50, 0, 0, 1000, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Small:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 33, _1080p * -53, 0, 0, 1010, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Small:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 43, _1080p * -43, 0, 0, 1989, LUI.EASING.inOutBack )
				end
			}
		} )
		Medium:RegisterAnimationSequence( "Idle2", {
			{
				function ()
					return self.Medium:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 64, _1080p * -22, 0, 0, 0 )
				end,
				function ()
					return self.Medium:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 56, _1080p * -30, 0, 0, 3000, LUI.EASING.inOutBack )
				end,
				function ()
					return self.Medium:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 60, _1080p * -26, 0, 0, 1000, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Medium:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 58, _1080p * -28, 0, 0, 1010, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Medium:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 64, _1080p * -22, 0, 0, 1989, LUI.EASING.inOutBack )
				end
			}
		} )
		Large:RegisterAnimationSequence( "Idle2", {
			{
				function ()
					return self.Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0, 0 )
				end,
				function ()
					return self.Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0, 3000, LUI.EASING.inOutBack )
				end,
				function ()
					return self.Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0, 1000, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0, 1010, LUI.EASING.inOutCubic )
				end,
				function ()
					return self.Large:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 86, 0, 0, 0, 1989, LUI.EASING.inOutBack )
				end
			}
		} )
		self._sequences.Idle2 = function ()
			Small:AnimateLoop( "Idle2" )
			Medium:AnimateLoop( "Idle2" )
			Large:AnimateLoop( "Idle2" )
		end
		
		Small:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.Small:SetAlpha( 0.2, 30 )
				end,
				function ()
					return self.Small:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Small:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Small:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Small:SetAlpha( 1, 60, LUI.EASING.outQuadratic )
				end
			}
		} )
		Medium:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.Medium:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Medium:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Medium:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Medium:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Medium:SetAlpha( 1, 60, LUI.EASING.outQuadratic )
				end
			}
		} )
		Large:RegisterAnimationSequence( "Fire", {
			{
				function ()
					return self.Large:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 0.2, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 0.6, 30 )
				end,
				function ()
					return self.Large:SetAlpha( 1, 60, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Fire = function ()
			Small:AnimateSequence( "Fire" )
			Medium:AnimateSequence( "Fire" )
			Large:AnimateSequence( "Fire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "ReticleClawLine", ReticleClawLine )
LockTable( _M )
