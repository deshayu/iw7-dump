local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function tutorialYesButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 30 * _1080p )
	self.id = "tutorialYesButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ButtonBacking = nil
	
	ButtonBacking = LUI.UIImage.new()
	ButtonBacking.id = "ButtonBacking"
	ButtonBacking:SetRGBFromInt( 0, 0 )
	ButtonBacking:SetAlpha( 0, 0 )
	self:addElement( ButtonBacking )
	self.ButtonBacking = ButtonBacking
	
	local ButtonText = nil
	
	ButtonText = LUI.UIText.new()
	ButtonText.id = "ButtonText"
	ButtonText:setText( Engine.Localize( "MENU_NEW" ), 0 )
	ButtonText:SetFontSize( 22 * _1080p )
	ButtonText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ButtonText:SetAlignment( LUI.Alignment.Center )
	ButtonText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11 )
	self:addElement( ButtonText )
	self.ButtonText = ButtonText
	
	self._animationSets.DefaultAnimationSet = function ()
		ButtonBacking:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ButtonBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ButtonText:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			ButtonBacking:AnimateSequence( "DefaultSequence" )
			ButtonText:AnimateSequence( "DefaultSequence" )
		end
		
		ButtonBacking:RegisterAnimationSequence( "buttonOver", {
			{
				function ()
					return self.ButtonBacking:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ButtonBacking:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		ButtonText:RegisterAnimationSequence( "buttonOver", {
			{
				function ()
					return self.ButtonText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ButtonText:SetRGBFromInt( 0, 0 )
				end
			}
		} )
		self._sequences.buttonOver = function ()
			ButtonBacking:AnimateSequence( "buttonOver" )
			ButtonText:AnimateSequence( "buttonOver" )
		end
		
		ButtonBacking:RegisterAnimationSequence( "buttonUp", {
			{
				function ()
					return self.ButtonBacking:SetAlpha( 0, 0 )
				end
			}
		} )
		ButtonText:RegisterAnimationSequence( "buttonUp", {
			{
				function ()
					return self.ButtonText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ButtonText:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.buttonUp = function ()
			ButtonBacking:AnimateSequence( "buttonUp" )
			ButtonText:AnimateSequence( "buttonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f15_arg0, f15_arg1 )
		local f15_local0 = f15_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "buttonOver" )
	end )
	self:addEventHandler( "button_up", function ( f16_arg0, f16_arg1 )
		local f16_local0 = f16_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "buttonUp" )
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "tutorialYesButton", tutorialYesButton )
LockTable( _M )
