local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function GetTextWidth( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0, f1_local1, f1_local2, f1_local3 = GetTextDimensions( f1_arg0, f1_arg1, f1_arg2 )
	return f1_local2
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.updateForRightAlignedText = function ()
		local f3_local0 = 450
		local f3_local1 = 10
		local f3_local2 = GetTextWidth( f2_arg0.Card1Desc:getText(), FONTS.GetFont( FONTS.MainMedium.File ), 21 )
		local f3_local3 = GetTextWidth( f2_arg0.Card1Name:getText(), FONTS.GetFont( FONTS.MainBold.File ), 29 )
		f3_local2 = math.min( f3_local2, f3_local0 )
		f3_local3 = math.max( math.min( f3_local3, f3_local0 ), f3_local2 )
		f2_arg0.Card1Desc:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * (f3_local2 + f3_local1), _1080p * 36, _1080p * 57 )
		f2_arg0.Card1Name:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * (f3_local3 + f3_local1), _1080p * 7, _1080p * 36 )
	end
	
end

function CPPauseMenuFAFCardDescription( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 540 * _1080p, 0, 90 * _1080p )
	self.id = "CPPauseMenuFAFCardDescription"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local BackingGradient = nil
	
	BackingGradient = LUI.UIImage.new()
	BackingGradient.id = "BackingGradient"
	BackingGradient:SetRGBFromInt( 0, 0 )
	BackingGradient:SetAlpha( 0.5, 0 )
	BackingGradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BackingGradient:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -15, _1080p * 525, 0, 0 )
	self:addElement( BackingGradient )
	self.BackingGradient = BackingGradient
	
	local Card1Desc = nil
	
	Card1Desc = LUI.UIText.new()
	Card1Desc.id = "Card1Desc"
	Card1Desc:SetFontSize( 22 * _1080p )
	Card1Desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Card1Desc:SetAlignment( LUI.Alignment.Left )
	Card1Desc:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 450, _1080p * 36, _1080p * 57 )
	Card1Desc:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Desc:GetModel( f4_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Desc:GetValue( f4_local1 )
		if f5_local0 ~= nil then
			Card1Desc:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Card1Desc )
	self.Card1Desc = Card1Desc
	
	local Card1Name = nil
	
	Card1Name = LUI.UIText.new()
	Card1Name.id = "Card1Name"
	Card1Name:SetFontSize( 30 * _1080p )
	Card1Name:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Card1Name:SetAlignment( LUI.Alignment.Left )
	Card1Name:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 450, _1080p * 7, _1080p * 36 )
	Card1Name:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetModel( f4_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetValue( f4_local1 )
		if f6_local0 ~= nil then
			Card1Name:setText( f6_local0, 0 )
		end
	end )
	self:addElement( Card1Name )
	self.Card1Name = Card1Name
	
	local BackingGradientTopLine = nil
	
	BackingGradientTopLine = LUI.UIImage.new()
	BackingGradientTopLine.id = "BackingGradientTopLine"
	BackingGradientTopLine:SetAlpha( 0.75, 0 )
	BackingGradientTopLine:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BackingGradientTopLine:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -15, _1080p * 525, _1080p * -1, 0 )
	self:addElement( BackingGradientTopLine )
	self.BackingGradientTopLine = BackingGradientTopLine
	
	local BackingGradientBottomLine = nil
	
	BackingGradientBottomLine = LUI.UIImage.new()
	BackingGradientBottomLine.id = "BackingGradientBottomLine"
	BackingGradientBottomLine:SetAlpha( 0.75, 0 )
	BackingGradientBottomLine:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BackingGradientBottomLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -15, _1080p * 525, 0, _1080p * 1 )
	self:addElement( BackingGradientBottomLine )
	self.BackingGradientBottomLine = BackingGradientBottomLine
	
	PostLoadFunc( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "CPPauseMenuFAFCardDescription", CPPauseMenuFAFCardDescription )
LockTable( _M )
