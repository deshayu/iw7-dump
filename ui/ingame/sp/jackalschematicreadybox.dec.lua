local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function JackalSchematicReadyBox( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 22 * _1080p )
	self.id = "JackalSchematicReadyBox"
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
	Background:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Background:SetUseAA( true )
	self:addElement( Background )
	self.Background = Background
	
	local ReadyText = nil
	
	ReadyText = LUI.UIStyledText.new()
	ReadyText.id = "ReadyText"
	ReadyText:SetRGBFromInt( 0, 0 )
	ReadyText:setText( ToUpperCase( Engine.Localize( "HUD_READY" ) ), 0 )
	ReadyText:SetFontSize( 16 * _1080p )
	ReadyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ReadyText:SetAlignment( LUI.Alignment.Center )
	ReadyText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -8, _1080p * 8 )
	self:addElement( ReadyText )
	self.ReadyText = ReadyText
	
	local StringReference = nil
	
	StringReference = LUI.UIText.new()
	StringReference.id = "StringReference"
	StringReference:setText( ToUpperCase( "" ), 0 )
	StringReference:SetFontSize( 22 * _1080p )
	StringReference:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StringReference:SetAlignment( LUI.Alignment.Center )
	StringReference:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * -22, 0 )
	self:addElement( StringReference )
	self.StringReference = StringReference
	
	self._animationSets.DefaultAnimationSet = function ()
		StringReference:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.StringReference:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * -22, _1080p * -2, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			StringReference:AnimateSequence( "DefaultSequence" )
		end
		
		StringReference:RegisterAnimationSequence( "SetBottom", {
			{
				function ()
					return self.StringReference:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200, _1080p * 200, _1080p * 23, _1080p * 43, 0 )
				end
			}
		} )
		self._sequences.SetBottom = function ()
			StringReference:AnimateSequence( "SetBottom" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "JackalSchematicReadyBox", JackalSchematicReadyBox )
LockTable( _M )
