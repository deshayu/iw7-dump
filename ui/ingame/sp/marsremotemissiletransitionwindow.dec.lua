local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MarsRemoteMissileTransitionWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "MarsRemoteMissileTransitionWindow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromInt( 0, 0 )
	Image0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 546, _1080p * 54, _1080p * 304 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local AccentLogo = nil
	
	AccentLogo = LUI.UIImage.new()
	AccentLogo.id = "AccentLogo"
	AccentLogo:SetAlpha( 0.3, 0 )
	AccentLogo:SetScale( -0.5, 0 )
	AccentLogo:setImage( RegisterMaterial( "icon_edi" ), 0 )
	AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -864, _1080p * -414, _1080p * -473.5, _1080p * -248.5 )
	self:addElement( AccentLogo )
	self.AccentLogo = AccentLogo
	
	local Label0 = nil
	
	Label0 = LUI.UIText.new()
	Label0.id = "Label0"
	Label0:SetAlpha( 0, 0 )
	Label0:setText( Engine.Localize( "MARSBASE_KILLSTREAK_INITIALIZING" ), 0 )
	Label0:SetFontSize( 36 * _1080p )
	Label0:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Label0:SetAlignment( LUI.Alignment.Center )
	Label0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -458, _1080p * 458, _1080p * -184.74, _1080p * -148.74 )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Image0:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Image0:SetScale( -0.3, 0 )
				end,
				function ()
					return self.Image0:SetScale( -0.3, 500 )
				end,
				function ()
					return self.Image0:SetScale( 0, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.Image0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Image0:SetAlpha( 1, 850 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.Image0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1668, _1080p * 252, 0, _1080p * 1080, 0 )
				end,
				function ()
					return self.Image0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.Image0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 299, LUI.EASING.outBack )
				end
			}
		} )
		AccentLogo:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.AccentLogo:SetScale( -0.3, 0 )
				end,
				function ()
					return self.AccentLogo:SetScale( -0.3, 500 )
				end,
				function ()
					return self.AccentLogo:SetScale( 0, 100, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 850 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0, 150 )
				end
			},
			{
				function ()
					return self.AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1893, _1080p * -1443, _1080p * -112.5, _1080p * 112.5, 0 )
				end,
				function ()
					return self.AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * 225, _1080p * -112.5, _1080p * 112.5, 400, LUI.EASING.outBack )
				end,
				function ()
					return self.AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * 225, _1080p * -112.5, _1080p * 112.5, 299, LUI.EASING.outBack )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "Bootup", {
			{
				function ()
					return self.Label0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Label0:SetAlpha( 0, 590 )
				end,
				function ()
					return self.Label0:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Label0:SetAlpha( 0.4, 30 )
				end,
				function ()
					return self.Label0:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Label0:SetAlpha( 0.4, 30 )
				end,
				function ()
					return self.Label0:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Label0:SetAlpha( 0.3, 30 )
				end,
				function ()
					return self.Label0:SetAlpha( 1, 30 )
				end,
				function ()
					return self.Label0:SetAlpha( 1, 70 )
				end,
				function ()
					return self.Label0:SetAlpha( 0, 150 )
				end
			}
		} )
		self._sequences.Bootup = function ()
			Image0:AnimateSequence( "Bootup" )
			AccentLogo:AnimateSequence( "Bootup" )
			Label0:AnimateSequence( "Bootup" )
		end
		
		Image0:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Image0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Image0:SetAlpha( 1, 50 )
				end,
				function ()
					return self.Image0:SetAlpha( 1, 350 )
				end,
				function ()
					return self.Image0:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.Image0:SetScale( 0, 0 )
				end,
				function ()
					return self.Image0:SetScale( 0, 250 )
				end,
				function ()
					return self.Image0:SetScale( -0.3, 100, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.Image0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 0 )
				end,
				function ()
					return self.Image0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, 0, _1080p * 1080, 449 )
				end,
				function ()
					return self.Image0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -1668, _1080p * 252, 0, _1080p * 1080, 150 )
				end
			}
		} )
		AccentLogo:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.AccentLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0, 200 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 50 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 350 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0, 10 )
				end
			},
			{
				function ()
					return self.AccentLogo:SetScale( 0, 0 )
				end,
				function ()
					return self.AccentLogo:SetScale( 0, 250 )
				end,
				function ()
					return self.AccentLogo:SetScale( -0.3, 100, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * 225, _1080p * -112.5, _1080p * 112.5, 0 )
				end,
				function ()
					return self.AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -225, _1080p * 225, _1080p * -112.5, _1080p * 112.5, 449 )
				end,
				function ()
					return self.AccentLogo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1893, _1080p * -1443, _1080p * -112.5, _1080p * 112.5, 150 )
				end
			}
		} )
		Label0:RegisterAnimationSequence( "Shutdown", {
			{
				function ()
					return self.Label0:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Shutdown = function ()
			Image0:AnimateSequence( "Shutdown" )
			AccentLogo:AnimateSequence( "Shutdown" )
			Label0:AnimateSequence( "Shutdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileTransitionWindow", MarsRemoteMissileTransitionWindow )
LockTable( _M )
