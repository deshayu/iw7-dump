local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LoungeTVMenuButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 360 * _1080p, 0, 60 * _1080p )
	self.id = "LoungeTVMenuButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromInt( 3227968, 0 )
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 60 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local Text = nil
	
	Text = LUI.UIText.new()
	Text.id = "Text"
	Text:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
	Text:setText( LocalizeString( ToUpperCase( "Button" ) ), 0 )
	Text:SetFontSize( 36 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 12, _1080p * 48 )
	self:addElement( Text )
	self.Text = Text
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "ButtonHighlightSequence", {
			{
				function ()
					return self.Highlight:SetAlpha( 1, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonHighlightSequence", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
				end
			}
		} )
		self._sequences.ButtonHighlightSequence = function ()
			Highlight:AnimateSequence( "ButtonHighlightSequence" )
			Text:AnimateSequence( "ButtonHighlightSequence" )
		end
		
		Highlight:RegisterAnimationSequence( "ButtonUnhighlightSequence", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		Text:RegisterAnimationSequence( "ButtonUnhighlightSequence", {
			{
				function ()
					return self.Text:SetRGBFromTable( SWATCHES.loungeTV.tint, 0 )
				end
			},
			{
				function ()
					return self.Text:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, _1080p * 11, _1080p * 49, 0 )
				end
			}
		} )
		self._sequences.ButtonUnhighlightSequence = function ()
			Highlight:AnimateSequence( "ButtonUnhighlightSequence" )
			Text:AnimateSequence( "ButtonUnhighlightSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_up", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUnhighlightSequence" )
	end )
	self:addEventHandler( "button_over", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonHighlightSequence" )
	end )
	return self
end

MenuBuilder.registerType( "LoungeTVMenuButton", LoungeTVMenuButton )
LockTable( _M )
