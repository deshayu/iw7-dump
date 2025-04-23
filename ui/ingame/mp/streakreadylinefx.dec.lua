local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakReadyLineFX( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 30 * _1080p )
	self.id = "StreakReadyLineFX"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LineR = nil
	
	LineR = LUI.UIImage.new()
	LineR.id = "LineR"
	LineR:SetRGBFromInt( 15444736, 0 )
	LineR:SetAlpha( 0, 0 )
	LineR:setImage( RegisterMaterial( "hud_ammo_glow" ), 0 )
	LineR:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, _1080p * -500, _1080p * -13, _1080p * 13 )
	self:addElement( LineR )
	self.LineR = LineR
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LineR:RegisterAnimationSequence( "ShowSuperMessage", {
			{
				function ()
					return self.LineR:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LineR:SetAlpha( 0.8, 80, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LineR:SetAlpha( 0.8, 160, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LineR:SetAlpha( 0.8, 70, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LineR:SetAlpha( 0, 90, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.LineR:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -13, _1080p * 13, 0 )
				end,
				function ()
					return self.LineR:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -13, _1080p * 13, 79, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LineR:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 250, _1080p * -13, _1080p * 13, 159, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LineR:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 270, _1080p * -13, _1080p * 13, 70, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.LineR:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 230, _1080p * 270, _1080p * -13, _1080p * 13, 90, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowSuperMessage = function ()
			LineR:AnimateSequence( "ShowSuperMessage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "StreakReadyLineFX", StreakReadyLineFX )
LockTable( _M )
