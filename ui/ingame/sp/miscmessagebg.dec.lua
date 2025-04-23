local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MiscMessageBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 25 * _1080p )
	self.id = "MiscMessageBG"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.HUD.glow, 0 )
	Background:SetAlpha( 0.1, 0 )
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Background )
	self.Background = Background
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.HUD.glow, 0 )
	Glow:SetAlpha( 0.6, 0 )
	Glow:setImage( RegisterMaterial( "hud_glow" ), 0 )
	Glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Glow:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -7, _1080p * 23, _1080p * -27.5, _1080p * 27.5 )
	self:addElement( Glow )
	self.Glow = Glow
	
	local CapLeft = nil
	
	CapLeft = LUI.UIImage.new()
	CapLeft.id = "CapLeft"
	CapLeft:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0 )
	self:addElement( CapLeft )
	self.CapLeft = CapLeft
	
	local CapRight = nil
	
	CapRight = LUI.UIImage.new()
	CapRight.id = "CapRight"
	CapRight:SetRGBFromTable( SWATCHES.HUD.active, 0 )
	CapRight:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 7, _1080p * 10, 0, 0 )
	self:addElement( CapRight )
	self.CapRight = CapRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "MessageOn", {
			{
				function ()
					return self.Background:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 1600 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 200 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -300, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -300, 0, 0, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 3199 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -300, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "MessageOn", {
			{
				function ()
					return self.Glow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 1300 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 1300 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.Glow:SetRGBFromTable( SWATCHES.HUD.glow, 0 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 17, _1080p * -40, _1080p * 40, 0 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 17, _1080p * -40, _1080p * 40, 400 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 293, _1080p * 323, _1080p * -40, _1080p * 40, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 293, _1080p * 323, _1080p * -40, _1080p * 40, 3199 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 17, _1080p * -40, _1080p * 40, 200, LUI.EASING.inBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "MessageOn", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 3800 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "MessageOn", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapRight:SetRGBFromTable( SWATCHES.HUD.active, 0 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -299, _1080p * -296, 0, 0, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -299, _1080p * -296, 0, 0, 400 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 7, _1080p * 10, 0, 0, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 7, _1080p * 10, 0, 0, 3199 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -299, _1080p * -296, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.MessageOn = function ()
			Background:AnimateSequence( "MessageOn" )
			Glow:AnimateSequence( "MessageOn" )
			CapLeft:AnimateSequence( "MessageOn" )
			CapRight:AnimateSequence( "MessageOn" )
		end
		
		Background:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Glow:SetAlpha( 0, 0 )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CapLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.CapRight:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Background:AnimateSequence( "Default" )
			Glow:AnimateSequence( "Default" )
			CapLeft:AnimateSequence( "Default" )
			CapRight:AnimateSequence( "Default" )
		end
		
		Background:RegisterAnimationSequence( "MessageOnNegative", {
			{
				function ()
					return self.Background:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 1600 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Background:SetAlpha( 0.1, 200 )
				end
			},
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -300, 0, 0, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -300, 0, 0, 400 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 3199 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 0, 0, 0, 0, _1080p * -300, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		Glow:RegisterAnimationSequence( "MessageOnNegative", {
			{
				function ()
					return self.Glow:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 1300 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 200 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 1300 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0.6, 50 )
				end,
				function ()
					return self.Glow:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.Glow:SetRGBFromInt( 16719104, 0 )
				end
			},
			{
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 17, _1080p * -40, _1080p * 40, 0 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 17, _1080p * -40, _1080p * 40, 400 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 293, _1080p * 323, _1080p * -40, _1080p * 40, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 293, _1080p * 323, _1080p * -40, _1080p * 40, 3199 )
				end,
				function ()
					return self.Glow:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -13, _1080p * 17, _1080p * -40, _1080p * 40, 200, LUI.EASING.inBack )
				end
			}
		} )
		CapLeft:RegisterAnimationSequence( "MessageOnNegative", {
			{
				function ()
					return self.CapLeft:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 3800 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapLeft:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -3, 0, 0, 0, 0 )
				end
			}
		} )
		CapRight:RegisterAnimationSequence( "MessageOnNegative", {
			{
				function ()
					return self.CapRight:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 200 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 1300 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 1, 50 )
				end,
				function ()
					return self.CapRight:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.CapRight:SetRGBFromInt( 13461087, 0 )
				end
			},
			{
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -299, _1080p * -296, 0, 0, 0 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -299, _1080p * -296, 0, 0, 400 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 7, _1080p * 10, 0, 0, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * 7, _1080p * 10, 0, 0, 3199 )
				end,
				function ()
					return self.CapRight:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -299, _1080p * -296, 0, 0, 200, LUI.EASING.inBack )
				end
			}
		} )
		self._sequences.MessageOnNegative = function ()
			Background:AnimateSequence( "MessageOnNegative" )
			Glow:AnimateSequence( "MessageOnNegative" )
			CapLeft:AnimateSequence( "MessageOnNegative" )
			CapRight:AnimateSequence( "MessageOnNegative" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "MiscMessageBG", MiscMessageBG )
LockTable( _M )
