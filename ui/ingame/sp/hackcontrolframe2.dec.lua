local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function HackControlFrame2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HackControlFrame2"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SideBracketRight = nil
	
	SideBracketRight = LUI.UIImage.new()
	SideBracketRight.id = "SideBracketRight"
	SideBracketRight:setImage( RegisterMaterial( "hud_robot_hack_side_bracket" ), 0 )
	SideBracketRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -60, _1080p * -400, _1080p * 400 )
	self:addElement( SideBracketRight )
	self.SideBracketRight = SideBracketRight
	
	local SideBracketLeft = nil
	
	SideBracketLeft = LUI.UIImage.new()
	SideBracketLeft.id = "SideBracketLeft"
	SideBracketLeft:SetZRotation( 180, 0 )
	SideBracketLeft:setImage( RegisterMaterial( "hud_robot_hack_side_bracket" ), 0 )
	SideBracketLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 232, _1080p * -400, _1080p * 400 )
	self:addElement( SideBracketLeft )
	self.SideBracketLeft = SideBracketLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SideBracketRight:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0, 0 )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "Off", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Off = function ()
			SideBracketRight:AnimateSequence( "Off" )
			SideBracketLeft:AnimateSequence( "Off" )
		end
		
		SideBracketRight:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.SideBracketRight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SideBracketRight:SetAlpha( 0, 2100 )
				end,
				function ()
					return self.SideBracketRight:SetAlpha( 0.5, 50 )
				end
			},
			{
				function ()
					return self.SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 18, _1080p * 190, _1080p * -400, _1080p * 400, 2150 )
				end,
				function ()
					return self.SideBracketRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -232, _1080p * -60, _1080p * -400, _1080p * 400, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		SideBracketLeft:RegisterAnimationSequence( "BootUp", {
			{
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SideBracketLeft:SetAlpha( 0, 2100 )
				end,
				function ()
					return self.SideBracketLeft:SetAlpha( 0.5, 50 )
				end
			},
			{
				function ()
					return self.SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -190, _1080p * -18, _1080p * -400, _1080p * 400, 2150 )
				end,
				function ()
					return self.SideBracketLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 60, _1080p * 232, _1080p * -400, _1080p * 400, 149, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.BootUp = function ()
			SideBracketRight:AnimateSequence( "BootUp" )
			SideBracketLeft:AnimateSequence( "BootUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "BootUp" )
	return self
end

MenuBuilder.registerType( "HackControlFrame2", HackControlFrame2 )
LockTable( _M )
