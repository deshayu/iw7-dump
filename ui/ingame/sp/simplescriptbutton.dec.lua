local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SimpleScriptButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 45 * _1080p )
	self.id = "SimpleScriptButton"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ButtonBorder = nil
	
	ButtonBorder = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	ButtonBorder.id = "ButtonBorder"
	ButtonBorder:SetRGBFromInt( 6645093, 0 )
	ButtonBorder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 436, 0, _1080p * 45 )
	self:addElement( ButtonBorder )
	self.ButtonBorder = ButtonBorder
	
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetRGBFromInt( 4276545, 0 )
	BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 436, 0, _1080p * 45 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local ButtonText = nil
	
	ButtonText = LUI.UIText.new()
	ButtonText.id = "ButtonText"
	ButtonText:setText( "Temp", 0 )
	ButtonText:SetFontSize( 36 * _1080p )
	ButtonText:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ButtonText:SetAlignment( LUI.Alignment.Left )
	ButtonText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 436, _1080p * 9, _1080p * 45 )
	self:addElement( ButtonText )
	self.ButtonText = ButtonText
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetRGBFromInt( 0, 0 )
	Icon:setImage( RegisterMaterial( "arrow_right" ), 0 )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 372, _1080p * 436, 0, _1080p * 45 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonBorder:RegisterAnimationSequence( "ButtonHighlightSequence", {
			{
				function ()
					return self.ButtonBorder:SetRGBFromInt( 6645093, 0 )
				end,
				function ()
					return self.ButtonBorder:SetRGBFromInt( 16777215, 20 )
				end
			},
			{
				function ()
					return self.ButtonBorder:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.ButtonBorder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 436, 0, _1080p * 45, 0 )
				end,
				function ()
					return self.ButtonBorder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45, 19 )
				end
			}
		} )
		BGImage:RegisterAnimationSequence( "ButtonHighlightSequence", {
			{
				function ()
					return self.BGImage:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.BGImage:SetRGBFromInt( 4276545, 0 )
				end
			},
			{
				function ()
					return self.BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 436, 0, _1080p * 45, 0 )
				end,
				function ()
					return self.BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45, 19 )
				end
			}
		} )
		ButtonText:RegisterAnimationSequence( "ButtonHighlightSequence", {
			{
				function ()
					return self.ButtonText:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 429, _1080p * 9, _1080p * 45, 19 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonHighlightSequence", {
			{
				function ()
					return self.Icon:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Icon:SetRGBFromInt( 16777215, 20 )
				end
			},
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 372, _1080p * 436, 0, _1080p * 45, 0 )
				end,
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 436, _1080p * 500, 0, _1080p * 45, 19 )
				end
			}
		} )
		self._sequences.ButtonHighlightSequence = function ()
			ButtonBorder:AnimateSequence( "ButtonHighlightSequence" )
			BGImage:AnimateSequence( "ButtonHighlightSequence" )
			ButtonText:AnimateSequence( "ButtonHighlightSequence" )
			Icon:AnimateSequence( "ButtonHighlightSequence" )
		end
		
		ButtonBorder:RegisterAnimationSequence( "ButtonUnhighlightSequence", {
			{
				function ()
					return self.ButtonBorder:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.ButtonBorder:SetRGBFromInt( 6645093, 20 )
				end
			},
			{
				function ()
					return self.ButtonBorder:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.ButtonBorder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45, 0 )
				end,
				function ()
					return self.ButtonBorder:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 429, 0, _1080p * 45, 19 )
				end
			}
		} )
		BGImage:RegisterAnimationSequence( "ButtonUnhighlightSequence", {
			{
				function ()
					return self.BGImage:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 500, 0, _1080p * 45, 0 )
				end,
				function ()
					return self.BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 429, 0, _1080p * 45, 19 )
				end
			}
		} )
		Icon:RegisterAnimationSequence( "ButtonUnhighlightSequence", {
			{
				function ()
					return self.Icon:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Icon:SetRGBFromInt( 0, 20 )
				end
			},
			{
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 436, _1080p * 500, 0, _1080p * 45, 0 )
				end,
				function ()
					return self.Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 365, _1080p * 429, 0, _1080p * 45, 19 )
				end
			}
		} )
		self._sequences.ButtonUnhighlightSequence = function ()
			ButtonBorder:AnimateSequence( "ButtonUnhighlightSequence" )
			BGImage:AnimateSequence( "ButtonUnhighlightSequence" )
			Icon:AnimateSequence( "ButtonUnhighlightSequence" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ButtonBorder:addEventHandler( "button_over", function ( f32_arg0, f32_arg1 )
		local f32_local0 = f32_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonHighlightSequence" )
	end )
	ButtonBorder:addEventHandler( "button_up", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUnhighlightSequence" )
	end )
	return self
end

MenuBuilder.registerType( "SimpleScriptButton", SimpleScriptButton )
LockTable( _M )
