local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnnotationOffscreenIncomingMissile( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "AnnotationOffscreenIncomingMissile"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Caret = nil
	
	Caret = LUI.UIImage.new()
	Caret.id = "Caret"
	Caret:SetRGBFromInt( 16776192, 0 )
	Caret:SetAlpha( 0, 0 )
	Caret:setImage( RegisterMaterial( "hud_jackal_incoming_missile" ), 0 )
	Caret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 19, _1080p * -19, _1080p * 19 )
	self:addElement( Caret )
	self.Caret = Caret
	
	local caretOffscreen = nil
	
	caretOffscreen = LUI.UIImage.new()
	caretOffscreen.id = "caretOffscreen"
	caretOffscreen:SetAlpha( 0, 0 )
	caretOffscreen:setImage( RegisterMaterial( "hud_jackal_incoming_missile" ), 0 )
	caretOffscreen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * 9, _1080p * -8, _1080p * 12 )
	self:addElement( caretOffscreen )
	self.caretOffscreen = caretOffscreen
	
	local Indicator = nil
	
	Indicator = MenuBuilder.BuildRegisteredType( "OffscreenIncomingMissileIndicator", {
		controllerIndex = f1_local1
	} )
	Indicator.id = "Indicator"
	Indicator:SetAlpha( 0, 0 )
	Indicator:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -16, _1080p * 16, _1080p * -16, _1080p * 16 )
	self:addElement( Indicator )
	self.Indicator = Indicator
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Caret:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.Caret:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.Caret:SetRGBFromInt( 16776192, 0 )
				end
			},
			{
				function ()
					return self.Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 26, _1080p * -19, _1080p * 18, 0 )
				end
			}
		} )
		caretOffscreen:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.caretOffscreen:SetAlpha( 0, 0 )
				end,
				function ()
					return self.caretOffscreen:SetAlpha( 1, 130 )
				end,
				function ()
					return self.caretOffscreen:SetAlpha( 0, 130 )
				end
			},
			{
				function ()
					return self.caretOffscreen:SetRGBFromInt( 16736000, 0 )
				end,
				function ()
					return self.caretOffscreen:SetRGBFromInt( 16776856, 130 )
				end,
				function ()
					return self.caretOffscreen:SetRGBFromInt( 16736000, 130 )
				end
			},
			{
				function ()
					return self.caretOffscreen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12, 0 )
				end,
				function ()
					return self.caretOffscreen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * 12, _1080p * -12, _1080p * 12, 129 )
				end
			}
		} )
		Indicator:RegisterAnimationSequence( "offscreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Indicator:SetRGBFromInt( 16776856, 0 )
				end,
				function ()
					return self.Indicator:SetRGBFromInt( 16736000, 130 )
				end,
				function ()
					return self.Indicator:SetRGBFromInt( 16776856, 130 )
				end
			}
		} )
		self._sequences.offscreen = function ()
			Caret:AnimateLoop( "offscreen" )
			caretOffscreen:AnimateLoop( "offscreen" )
			Indicator:AnimateLoop( "offscreen" )
		end
		
		Caret:RegisterAnimationSequence( "oncreen", {
			{
				function ()
					return self.Caret:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Caret:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.Caret:SetRGBFromInt( 16776856, 0 )
				end,
				function ()
					return self.Caret:SetRGBFromInt( 16736000, 130 )
				end,
				function ()
					return self.Caret:SetRGBFromInt( 16776856, 130 )
				end
			},
			{
				function ()
					return self.Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -18, _1080p * 18, 0 )
				end
			}
		} )
		caretOffscreen:RegisterAnimationSequence( "oncreen", {
			{
				function ()
					return self.caretOffscreen:SetAlpha( 0, 0 )
				end
			}
		} )
		Indicator:RegisterAnimationSequence( "oncreen", {
			{
				function ()
					return self.Indicator:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.oncreen = function ()
			Caret:AnimateLoop( "oncreen" )
			caretOffscreen:AnimateLoop( "oncreen" )
			Indicator:AnimateLoop( "oncreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "anchor_on_screen", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "oncreen" )
	end )
	self:addEventHandler( "anchor_off_screen", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "offscreen" )
	end )
	return self
end

MenuBuilder.registerType( "AnnotationOffscreenIncomingMissile", AnnotationOffscreenIncomingMissile )
LockTable( _M )
