local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageArabic() then
		f1_arg0.Card1Description.updateForRightAlignedText()
		f1_arg0.Card2Description.updateForRightAlignedText()
		f1_arg0.Card3Description.updateForRightAlignedText()
		f1_arg0.Card4Description.updateForRightAlignedText()
		f1_arg0.Card5Description.updateForRightAlignedText()
	end
end

function CPPauseMenuFAFCardDeck( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 800 * _1080p, 0, 800 * _1080p )
	self.id = "CPPauseMenuFAFCardDeck"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local RedGlow = nil
	
	RedGlow = LUI.UIImage.new()
	RedGlow.id = "RedGlow"
	RedGlow:SetAlpha( 0.8, 0 )
	RedGlow:setImage( RegisterMaterial( "cp_menu_pause_red_glow" ), 0 )
	RedGlow:SetBlendMode( BLEND_MODE.addWithAlpha )
	RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -286, _1080p * 494, _1080p * -37, _1080p * 743 )
	self:addElement( RedGlow )
	self.RedGlow = RedGlow
	
	local Spinner = nil
	
	Spinner = LUI.UIImage.new()
	Spinner.id = "Spinner"
	Spinner:SetAlpha( 0.3, 0 )
	Spinner:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	Spinner:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -348, _1080p * 556, _1080p * -73.5, _1080p * 830.5 )
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetAlpha( 0.15, 0 )
	Triangle:setImage( RegisterMaterial( "cp_menu_pause_devil_head_triangle" ), 0 )
	Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -122, _1080p * 344, _1080p * 210, _1080p * 648 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	local Card5Description = nil
	
	Card5Description = MenuBuilder.BuildRegisteredType( "CPPauseMenuFAFCardDescription", {
		controllerIndex = f2_local1
	} )
	Card5Description.id = "Card5Description"
	Card5Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 176, _1080p * 717.38, _1080p * 618.06, _1080p * 708.06 )
	Card5Description:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot5Alpha:GetModel( f2_local1 ) )
	Card5Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Desc:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Desc:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Card5Description.Card1Desc:setText( f3_local0, 0 )
		end
	end )
	Card5Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			Card5Description.Card1Name:setText( f4_local0, 0 )
		end
	end )
	self:addElement( Card5Description )
	self.Card5Description = Card5Description
	
	local Card5 = nil
	
	Card5 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f2_local1
	} )
	Card5.id = "Card5"
	Card5:SetScale( -0.5, 0 )
	Card5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.75, _1080p * 127.75, _1080p * 503.06, _1080p * 663.06 )
	Card5:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot5Alpha:GetModel( f2_local1 ) )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Backing:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			Card5.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f2_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f2_local1 )
		if f6_local0 ~= nil then
			Card5.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:GetModel( f2_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5FillPercent:GetValue( f2_local1 )
		if f7_local0 ~= nil then
			Card5.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f7_local0 )
		end
	end )
	Card5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetModel( f2_local1 ), function ()
		local f8_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Name:GetValue( f2_local1 )
		if f8_local0 ~= nil then
			Card5.wonderCardName1:setText( f8_local0, 0 )
		end
	end )
	self:addElement( Card5 )
	self.Card5 = Card5
	
	local Card4Description = nil
	
	Card4Description = MenuBuilder.BuildRegisteredType( "CPPauseMenuFAFCardDescription", {
		controllerIndex = f2_local1
	} )
	Card4Description.id = "Card4Description"
	Card4Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 324, _1080p * 605.38, _1080p * 502, _1080p * 592 )
	Card4Description:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot4Alpha:GetModel( f2_local1 ) )
	Card4Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Desc:GetModel( f2_local1 ), function ()
		local f9_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Desc:GetValue( f2_local1 )
		if f9_local0 ~= nil then
			Card4Description.Card1Desc:setText( f9_local0, 0 )
		end
	end )
	Card4Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetModel( f2_local1 ), function ()
		local f10_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetValue( f2_local1 )
		if f10_local0 ~= nil then
			Card4Description.Card1Name:setText( f10_local0, 0 )
		end
	end )
	self:addElement( Card4Description )
	self.Card4Description = Card4Description
	
	local Card4 = nil
	
	Card4 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f2_local1
	} )
	Card4.id = "Card4"
	Card4:SetScale( -0.5, 0 )
	Card4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165.5, _1080p * 276.5, _1080p * 385.5, _1080p * 545.5 )
	Card4:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot4Alpha:GetModel( f2_local1 ) )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Backing:GetModel( f2_local1 ), function ()
		local f11_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Backing:GetValue( f2_local1 )
		if f11_local0 ~= nil then
			Card4.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetModel( f2_local1 ), function ()
		local f12_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Icon:GetValue( f2_local1 )
		if f12_local0 ~= nil then
			Card4.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:GetModel( f2_local1 ), function ()
		local f13_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4FillPercent:GetValue( f2_local1 )
		if f13_local0 ~= nil then
			Card4.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f13_local0 )
		end
	end )
	Card4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetModel( f2_local1 ), function ()
		local f14_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot4Name:GetValue( f2_local1 )
		if f14_local0 ~= nil then
			Card4.wonderCardName1:setText( f14_local0, 0 )
		end
	end )
	self:addElement( Card4 )
	self.Card4 = Card4
	
	local Card3Description = nil
	
	Card3Description = MenuBuilder.BuildRegisteredType( "CPPauseMenuFAFCardDescription", {
		controllerIndex = f2_local1
	} )
	Card3Description.id = "Card3Description"
	Card3Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 472, _1080p * 930, _1080p * 335, _1080p * 425 )
	Card3Description:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot3Alpha:GetModel( f2_local1 ) )
	Card3Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Desc:GetModel( f2_local1 ), function ()
		local f15_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Desc:GetValue( f2_local1 )
		if f15_local0 ~= nil then
			Card3Description.Card1Desc:setText( f15_local0, 0 )
		end
	end )
	Card3Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetModel( f2_local1 ), function ()
		local f16_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetValue( f2_local1 )
		if f16_local0 ~= nil then
			Card3Description.Card1Name:setText( f16_local0, 0 )
		end
	end )
	self:addElement( Card3Description )
	self.Card3Description = Card3Description
	
	local Card3 = nil
	
	Card3 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f2_local1
	} )
	Card3.id = "Card3"
	Card3:SetScale( -0.5, 0 )
	Card3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 308.5, _1080p * 430.5, _1080p * 250.72, _1080p * 435.09 )
	Card3:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot3Alpha:GetModel( f2_local1 ) )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Backing:GetModel( f2_local1 ), function ()
		local f17_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Backing:GetValue( f2_local1 )
		if f17_local0 ~= nil then
			Card3.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f17_local0 ), 0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetModel( f2_local1 ), function ()
		local f18_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Icon:GetValue( f2_local1 )
		if f18_local0 ~= nil then
			Card3.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f18_local0 ), 0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:GetModel( f2_local1 ), function ()
		local f19_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3FillPercent:GetValue( f2_local1 )
		if f19_local0 ~= nil then
			Card3.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f19_local0 )
		end
	end )
	Card3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetModel( f2_local1 ), function ()
		local f20_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot3Name:GetValue( f2_local1 )
		if f20_local0 ~= nil then
			Card3.wonderCardName1:setText( f20_local0, 0 )
		end
	end )
	self:addElement( Card3 )
	self.Card3 = Card3
	
	local Card2Description = nil
	
	Card2Description = MenuBuilder.BuildRegisteredType( "CPPauseMenuFAFCardDescription", {
		controllerIndex = f2_local1
	} )
	Card2Description.id = "Card2Description"
	Card2Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 324, _1080p * 605.38, _1080p * 170, _1080p * 260 )
	Card2Description:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot2Alpha:GetModel( f2_local1 ) )
	Card2Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Desc:GetModel( f2_local1 ), function ()
		local f21_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Desc:GetValue( f2_local1 )
		if f21_local0 ~= nil then
			Card2Description.Card1Desc:setText( f21_local0, 0 )
		end
	end )
	Card2Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetModel( f2_local1 ), function ()
		local f22_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetValue( f2_local1 )
		if f22_local0 ~= nil then
			Card2Description.Card1Name:setText( f22_local0, 0 )
		end
	end )
	self:addElement( Card2Description )
	self.Card2Description = Card2Description
	
	local Card2 = nil
	
	Card2 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f2_local1
	} )
	Card2.id = "Card2"
	Card2:SetScale( -0.5, 0 )
	Card2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 162.89, _1080p * 280.89, _1080p * 122.38, _1080p * 287.63 )
	Card2:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot2Alpha:GetModel( f2_local1 ) )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Backing:GetModel( f2_local1 ), function ()
		local f23_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Backing:GetValue( f2_local1 )
		if f23_local0 ~= nil then
			Card2.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f23_local0 ), 0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetModel( f2_local1 ), function ()
		local f24_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Icon:GetValue( f2_local1 )
		if f24_local0 ~= nil then
			Card2.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f24_local0 ), 0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:GetModel( f2_local1 ), function ()
		local f25_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2FillPercent:GetValue( f2_local1 )
		if f25_local0 ~= nil then
			Card2.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f25_local0 )
		end
	end )
	Card2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetModel( f2_local1 ), function ()
		local f26_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot2Name:GetValue( f2_local1 )
		if f26_local0 ~= nil then
			Card2.wonderCardName1:setText( f26_local0, 0 )
		end
	end )
	self:addElement( Card2 )
	self.Card2 = Card2
	
	local Card1Description = nil
	
	Card1Description = MenuBuilder.BuildRegisteredType( "CPPauseMenuFAFCardDescription", {
		controllerIndex = f2_local1
	} )
	Card1Description.id = "Card1Description"
	Card1Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 177, _1080p * 718.38, _1080p * 48, _1080p * 138 )
	Card1Description:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot1Alpha:GetModel( f2_local1 ) )
	Card1Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Desc:GetModel( f2_local1 ), function ()
		local f27_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Desc:GetValue( f2_local1 )
		if f27_local0 ~= nil then
			Card1Description.Card1Desc:setText( f27_local0, 0 )
		end
	end )
	Card1Description:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetModel( f2_local1 ), function ()
		local f28_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetValue( f2_local1 )
		if f28_local0 ~= nil then
			Card1Description.Card1Name:setText( f28_local0, 0 )
		end
	end )
	self:addElement( Card1Description )
	self.Card1Description = Card1Description
	
	local Card1 = nil
	
	Card1 = MenuBuilder.BuildRegisteredType( "ZomConsumablesWidgetCard", {
		controllerIndex = f2_local1
	} )
	Card1.id = "Card1"
	Card1:SetScale( -0.5, 0 )
	Card1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.51, _1080p * 135.16, _1080p * 1, _1080p * 161 )
	Card1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot1Alpha:GetModel( f2_local1 ) )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Backing:GetModel( f2_local1 ), function ()
		local f29_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Backing:GetValue( f2_local1 )
		if f29_local0 ~= nil then
			Card1.ZomConsumableSmall.cardBacking:setImage( RegisterMaterial( f29_local0 ), 0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetModel( f2_local1 ), function ()
		local f30_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Icon:GetValue( f2_local1 )
		if f30_local0 ~= nil then
			Card1.ZomConsumableSmall.cardImageCopy0:setImage( RegisterMaterial( f30_local0 ), 0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:GetModel( f2_local1 ), function ()
		local f31_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1FillPercent:GetValue( f2_local1 )
		if f31_local0 ~= nil then
			Card1.ZomConsumableSmall.radialAlphaLarge.circleFill:SetProgress( f31_local0 )
		end
	end )
	Card1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetModel( f2_local1 ), function ()
		local f32_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot1Name:GetValue( f2_local1 )
		if f32_local0 ~= nil then
			Card1.wonderCardName1:setText( f32_local0, 0 )
		end
	end )
	self:addElement( Card1 )
	self.Card1 = Card1
	
	local RadialProgressBar = nil
	
	RadialProgressBar = MenuBuilder.BuildRegisteredType( "WonderCardWidget", {
		controllerIndex = f2_local1
	} )
	RadialProgressBar.id = "RadialProgressBar"
	RadialProgressBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.84, _1080p * 196.84, _1080p * 289.94, _1080p * 473.94 )
	self:addElement( RadialProgressBar )
	self.RadialProgressBar = RadialProgressBar
	
	local TriangleCopy0 = nil
	
	TriangleCopy0 = LUI.UIImage.new()
	TriangleCopy0.id = "TriangleCopy0"
	TriangleCopy0:SetScale( -0.44, 0 )
	TriangleCopy0:setImage( RegisterMaterial( "cp_menu_pause_devil_head_triangle" ), 0 )
	TriangleCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -125, _1080p * 341, _1080p * 194, _1080p * 632 )
	self:addElement( TriangleCopy0 )
	self.TriangleCopy0 = TriangleCopy0
	
	local DevilHeadBig = nil
	
	DevilHeadBig = LUI.UIImage.new()
	DevilHeadBig.id = "DevilHeadBig"
	DevilHeadBig:SetScale( 0.29, 0 )
	DevilHeadBig:setImage( RegisterMaterial( "zm_wc_devil_head" ), 0 )
	DevilHeadBig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -20.87, _1080p * 235.13, _1080p * 250.5, _1080p * 506.5 )
	self:addElement( DevilHeadBig )
	self.DevilHeadBig = DevilHeadBig
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.CardSlot4Locked = function ()
			Card5Description:AnimateSequence( "CardSlot4Locked" )
			Card5:AnimateSequence( "CardSlot4Locked" )
			Card4Description:AnimateSequence( "CardSlot4Locked" )
			Card4:AnimateSequence( "CardSlot4Locked" )
		end
		
		self._sequences.CardSlot4Unlocked = function ()
			Card5Description:AnimateSequence( "CardSlot4Unlocked" )
			Card5:AnimateSequence( "CardSlot4Unlocked" )
			Card4Description:AnimateSequence( "CardSlot4Unlocked" )
			Card4:AnimateSequence( "CardSlot4Unlocked" )
		end
		
		self._sequences.CardSlot5Locked = function ()
			Card5Description:AnimateSequence( "CardSlot5Locked" )
			Card5:AnimateSequence( "CardSlot5Locked" )
		end
		
		self._sequences.CardSlot5Unlocked = function ()
			Card5Description:AnimateSequence( "CardSlot5Unlocked" )
			Card5:AnimateSequence( "CardSlot5Unlocked" )
		end
		
		Spinner:RegisterAnimationSequence( "RotateSpinner", {
			{
				function ()
					return self.Spinner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Spinner:SetZRotation( -359, 40000 )
				end
			}
		} )
		self._sequences.RotateSpinner = function ()
			Spinner:AnimateLoop( "RotateSpinner" )
		end
		
		RedGlow:RegisterAnimationSequence( "GlowPulse", {
			{
				function ()
					return self.RedGlow:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.RedGlow:SetAlpha( 1, 2000, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.8, 8000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RedGlow:SetAlpha( 0.8, 2000 )
				end
			},
			{
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -286, _1080p * 494, _1080p * -37, _1080p * 743, 0 )
				end,
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -373.5, _1080p * 581.5, _1080p * -124.5, _1080p * 830.5, 2000, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -286, _1080p * 494, _1080p * -37, _1080p * 743, 8000, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.RedGlow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -286, _1080p * 494, _1080p * -37, _1080p * 743, 2000 )
				end
			}
		} )
		self._sequences.GlowPulse = function ()
			RedGlow:AnimateLoop( "GlowPulse" )
		end
		
		Triangle:RegisterAnimationSequence( "ShowHead", {
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 72.25, _1080p * 149.75, _1080p * 349.58, _1080p * 422.42, 0 )
				end,
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -122, _1080p * 344, _1080p * 210, _1080p * 648, 200, LUI.EASING.inQuadratic )
				end
			}
		} )
		DevilHeadBig:RegisterAnimationSequence( "ShowHead", {
			{
				function ()
					return self.DevilHeadBig:SetAlpha( 0, 0 )
				end,
				function ()
					return self.DevilHeadBig:SetAlpha( 0, 190 )
				end,
				function ()
					return self.DevilHeadBig:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.DevilHeadBig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 82.27, _1080p * 131.73, _1080p * 335, _1080p * 397, 200 )
				end,
				function ()
					return self.DevilHeadBig:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -43, _1080p * 257, _1080p * 178, _1080p * 554, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.ShowHead = function ()
			Triangle:AnimateSequence( "ShowHead" )
			DevilHeadBig:AnimateSequence( "ShowHead" )
		end
		
		Card5Description:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card5Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 175, _1080p * 716.38, _1080p * 574, _1080p * 664, 0 )
				end
			}
		} )
		Card5:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.75, _1080p * 127.75, _1080p * 457.06, _1080p * 617.06, 0 )
				end
			}
		} )
		Card4Description:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card4Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 324, _1080p * 605.38, _1080p * 472, _1080p * 562, 0 )
				end
			}
		} )
		Card4:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 165.5, _1080p * 276.5, _1080p * 355.5, _1080p * 515.5, 0 )
				end
			}
		} )
		Card3Description:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card3Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 471, _1080p * 929, _1080p * 335, _1080p * 425, 0 )
				end
			}
		} )
		Card2Description:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card2Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 323, _1080p * 604.38, _1080p * 203, _1080p * 293, 0 )
				end
			}
		} )
		Card2:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 162.89, _1080p * 280.89, _1080p * 157.38, _1080p * 322.63, 0 )
				end
			}
		} )
		Card1Description:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card1Description:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 175, _1080p * 716.38, _1080p * 101, _1080p * 191, 0 )
				end
			}
		} )
		Card1:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Card1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.51, _1080p * 135.16, _1080p * 56, _1080p * 216, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			Card5Description:AnimateSequence( "Splitscreen" )
			Card5:AnimateSequence( "Splitscreen" )
			Card4Description:AnimateSequence( "Splitscreen" )
			Card4:AnimateSequence( "Splitscreen" )
			Card3Description:AnimateSequence( "Splitscreen" )
			Card2Description:AnimateSequence( "Splitscreen" )
			Card2:AnimateSequence( "Splitscreen" )
			Card1Description:AnimateSequence( "Splitscreen" )
			Card1:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "GlowPulse" )
	ACTIONS.AnimateSequence( self, "RotateSpinner" )
	if CONDITIONS.IsFateCardSlotUnlocked( f2_local1, "fate_card_slot_4" ) and not CONDITIONS.IsFateCardSlotUnlocked( f2_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "CardSlot4Unlocked" )
	end
	if CONDITIONS.IsFateCardSlotUnlocked( f2_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "CardSlot5Unlocked" )
	end
	if not CONDITIONS.IsFateCardSlotUnlocked( f2_local1, "fate_card_slot_4" ) then
		ACTIONS.AnimateSequence( self, "CardSlot4Locked" )
	end
	if not CONDITIONS.IsFateCardSlotUnlocked( f2_local1, "fate_card_slot_4" ) and not CONDITIONS.IsFateCardSlotUnlocked( f2_local1, "fate_card_slot_5" ) then
		ACTIONS.AnimateSequence( self, "CardSlot5Locked" )
	end
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "CPPauseMenuFAFCardDeck", CPPauseMenuFAFCardDeck )
LockTable( _M )
