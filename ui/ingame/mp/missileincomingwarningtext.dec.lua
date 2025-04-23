local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.MissileWarningText:SetBlendMode( BLEND_MODE.addWithAlpha )
end

function MissileIncomingWarningText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 256 * _1080p )
	self.id = "MissileIncomingWarningText"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local MissileWarningBlackBG = nil
	
	MissileWarningBlackBG = LUI.UIImage.new()
	MissileWarningBlackBG.id = "MissileWarningBlackBG"
	MissileWarningBlackBG:setImage( RegisterMaterial( "hud_incoming_missle_bg_black" ), 0 )
	MissileWarningBlackBG:SetBlendMode( BLEND_MODE.addWithAlpha )
	MissileWarningBlackBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -64, _1080p * 64 )
	self:addElement( MissileWarningBlackBG )
	self.MissileWarningBlackBG = MissileWarningBlackBG
	
	local MissileWarningText = nil
	
	MissileWarningText = LUI.UIText.new()
	MissileWarningText.id = "MissileWarningText"
	MissileWarningText:SetRGBFromTable( SWATCHES.apex.warning, 0 )
	MissileWarningText:setText( ToUpperCase( ToUpperCase( Engine.Localize( "JACKAL_INCOMING_MISSILES" ) ) ), 0 )
	MissileWarningText:SetFontSize( 36 * _1080p )
	MissileWarningText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	MissileWarningText:SetAlignment( LUI.Alignment.Center )
	MissileWarningText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 28 )
	self:addElement( MissileWarningText )
	self.MissileWarningText = MissileWarningText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MissileWarningText:RegisterAnimationSequence( "BlinkText", {
			{
				function ()
					return self.MissileWarningText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MissileWarningText:SetAlpha( 0.3, 50 )
				end,
				function ()
					return self.MissileWarningText:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.BlinkText = function ()
			MissileWarningText:AnimateLoop( "BlinkText" )
		end
		
		MissileWarningText:RegisterAnimationSequence( "EndBlinkText", {
			{
				function ()
					return self.MissileWarningText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.EndBlinkText = function ()
			MissileWarningText:AnimateSequence( "EndBlinkText" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "MissileIncomingWarningText", MissileIncomingWarningText )
LockTable( _M )
