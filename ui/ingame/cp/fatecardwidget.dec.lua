local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg0.cardAnimation == f1_arg1 then
		return 
	else
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
		f1_arg0.cardAnimation = f1_arg1
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	ACTIONS.AnimateSequence( f2_arg0, "initial" )
	local f2_local0 = DataSources.inGame.CP.zombies.consumableDpadPressed
	local f2_local1 = DataSources.inGame.CP.zombies.consumablesRemaining
	local f2_local2 = DataSources.inGame.CP.zombies.consumableDeckSelectReady
	local f2_local3 = DataSources.inGame.CP.zombies.dpadUpActivated
	f2_arg0:SubscribeToModel( f2_local3:GetModel( f2_arg1 ), function ()
		if f2_local3:GetValue( f2_arg1 ) == 4 then
			f0_local0( f2_arg0, "initial5Cards" )
		end
	end )
	local f2_local4 = function ()
		local f4_local0 = f2_local0:GetValue( f2_arg1 )
		if f4_local0 ~= nil and f4_local0 == 1 then
			local f4_local1 = f2_local1:GetValue( f2_arg1 )
			if f4_local1 == 5 then
				f0_local0( f2_arg0, "cardCycle5Cards" )
			elseif f4_local1 == 4 then
				f0_local0( f2_arg0, "cardCycle4Cards" )
			elseif f4_local1 == 3 then
				f0_local0( f2_arg0, "cardCycle3Cards" )
			elseif f4_local1 == 2 then
				f0_local0( f2_arg0, "cardCycle2Cards" )
			elseif f4_local1 == 1 then
				f0_local0( f2_arg0, "cardCycle1Card" )
			end
		end
	end
	
	f2_arg0:SubscribeToModel( f2_local0:GetModel( f2_arg1 ), f2_local4 )
	f2_arg0:SubscribeToModel( f2_local1:GetModel( f2_arg1 ), f2_local4 )
	local f2_local5 = function ()
		local f5_local0 = f2_local2:GetValue( f2_arg1 )
		local f5_local1 = f2_local1:GetValue( f2_arg1 )
		if f5_local0 == 1 then
			if f5_local1 == 5 then
				f0_local0( f2_arg0, "meterFull5Cards" )
			elseif f5_local1 == 4 then
				f0_local0( f2_arg0, "meterFull4Cards" )
			elseif f5_local1 == 3 then
				f0_local0( f2_arg0, "meterFull3Cards" )
			elseif f5_local1 == 2 then
				f0_local0( f2_arg0, "meterFull2Cards" )
			elseif f5_local1 == 1 then
				f0_local0( f2_arg0, "meterFull1Card" )
			end
			if f2_local3:GetValue( f2_arg1 ) ~= 4 then
				ACTIONS.AnimateSequence( f2_arg0, "FireOn" )
			end
		elseif f5_local0 == 0 then
			if f5_local1 == 5 then
				f0_local0( f2_arg0, "initial5Cards" )
			elseif f5_local1 == 4 then
				f0_local0( f2_arg0, "initial4Cards" )
			elseif f5_local1 == 3 then
				f0_local0( f2_arg0, "initial3Cards" )
			elseif f5_local1 == 2 then
				f0_local0( f2_arg0, "initial2Cards" )
			elseif f5_local1 == 1 then
				f0_local0( f2_arg0, "initial1Card" )
			end
			ACTIONS.AnimateSequence( f2_arg0, "FireOff" )
		end
		if f5_local1 == 0 then
			f0_local0( f2_arg0, "noMoreCards" )
		end
	end
	
	f2_arg0:SubscribeToModel( f2_local2:GetModel( f2_arg1 ), f2_local5 )
	f2_arg0:SubscribeToModel( f2_local1:GetModel( f2_arg1 ), f2_local5 )
end

function FateCardWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 253 * _1080p, 0, 389 * _1080p )
	self.id = "FateCardWidget"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Fire = nil
	
	Fire = LUI.UIImage.new()
	Fire.id = "Fire"
	Fire:SetAlpha( 0, 0 )
	Fire:setImage( RegisterMaterial( "zm_wc_fire_loop" ), 0 )
	Fire:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 18.75, _1080p * 236.25, _1080p * -20, _1080p * 211.16 )
	self:addElement( Fire )
	self.Fire = Fire
	
	local fanCard4 = nil
	
	fanCard4 = MenuBuilder.BuildRegisteredType( "FateFanCard", {
		controllerIndex = f6_local1
	} )
	fanCard4.id = "fanCard4"
	fanCard4:SetZRotation( -25, 0 )
	fanCard4:SetScale( -0.5, 0 )
	fanCard4.fanOverlay:SetRGBFromInt( 2500134, 0 )
	fanCard4.fanOverlay:SetAlpha( 0.6, 0 )
	fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 20.68, _1080p * 275.68, _1080p * 76.5, _1080p * 588.5 )
	self:addElement( fanCard4 )
	self.fanCard4 = fanCard4
	
	local fanCard3 = nil
	
	fanCard3 = MenuBuilder.BuildRegisteredType( "FateFanCard", {
		controllerIndex = f6_local1
	} )
	fanCard3.id = "fanCard3"
	fanCard3:SetZRotation( -20, 0 )
	fanCard3:SetScale( -0.5, 0 )
	fanCard3.fanOverlay:SetRGBFromInt( 3684408, 0 )
	fanCard3.fanOverlay:SetAlpha( 0.6, 0 )
	fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 17.68, _1080p * 272.68, _1080p * 69.5, _1080p * 581.5 )
	self:addElement( fanCard3 )
	self.fanCard3 = fanCard3
	
	local fanCard2 = nil
	
	fanCard2 = MenuBuilder.BuildRegisteredType( "FateFanCard", {
		controllerIndex = f6_local1
	} )
	fanCard2.id = "fanCard2"
	fanCard2:SetZRotation( -15, 0 )
	fanCard2:SetScale( -0.5, 0 )
	fanCard2.fanOverlay:SetRGBFromInt( 4342338, 0 )
	fanCard2.fanOverlay:SetAlpha( 0.6, 0 )
	fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 13.68, _1080p * 268.68, _1080p * 63.5, _1080p * 575.5 )
	self:addElement( fanCard2 )
	self.fanCard2 = fanCard2
	
	local fanCard1 = nil
	
	fanCard1 = MenuBuilder.BuildRegisteredType( "FateFanCard", {
		controllerIndex = f6_local1
	} )
	fanCard1.id = "fanCard1"
	fanCard1:SetZRotation( -10, 0 )
	fanCard1:SetScale( -0.5, 0 )
	fanCard1.fanOverlay:SetRGBFromInt( 5066061, 0 )
	fanCard1.fanOverlay:SetAlpha( 0.6, 0 )
	fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 9.68, _1080p * 264.68, _1080p * 58.5, _1080p * 570.5 )
	self:addElement( fanCard1 )
	self.fanCard1 = fanCard1
	
	local FateCardOnDeck = nil
	
	FateCardOnDeck = MenuBuilder.BuildRegisteredType( "FateCardOnDeck", {
		controllerIndex = f6_local1
	} )
	FateCardOnDeck.id = "FateCardOnDeck"
	FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 47.5, _1080p * 202.5, _1080p * 166.82, _1080p * 337.82 )
	self:addElement( FateCardOnDeck )
	self.FateCardOnDeck = FateCardOnDeck
	
	local Triangle = nil
	
	Triangle = LUI.UIImage.new()
	Triangle.id = "Triangle"
	Triangle:SetRGBFromInt( 2434341, 0 )
	Triangle:SetZRotation( 180, 0 )
	Triangle:setImage( RegisterMaterial( "zm_wc_triangle" ), 0 )
	Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -7, _1080p * 249, _1080p * 195.5, _1080p * 451.5 )
	self:addElement( Triangle )
	self.Triangle = Triangle
	
	local FateCardDevilWidget = nil
	
	FateCardDevilWidget = MenuBuilder.BuildRegisteredType( "FateCardDevilWidget", {
		controllerIndex = f6_local1
	} )
	FateCardDevilWidget.id = "FateCardDevilWidget"
	FateCardDevilWidget:SetScale( 0.07, 0 )
	FateCardDevilWidget.radialAlphaLarge.circleFill:SetAlpha( 1, 0 )
	FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 213.9, _1080p * 470.3 )
	self:addElement( FateCardDevilWidget )
	self.FateCardDevilWidget = FateCardDevilWidget
	
	local upArrow = nil
	
	upArrow = LUI.UIImage.new()
	upArrow.id = "upArrow"
	upArrow:SetAlpha( 0, 0 )
	upArrow:SetScale( -0.5, 0 )
	upArrow:setImage( RegisterMaterial( "hud_dpad_arrow" ), 0 )
	upArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 157, _1080p * 87.82, _1080p * 119.82 )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = nil
	
	downArrow = LUI.UIImage.new()
	downArrow.id = "downArrow"
	downArrow:SetAlpha( 0, 0 )
	downArrow:SetZRotation( 180, 0 )
	downArrow:SetScale( -0.5, 0 )
	downArrow:setImage( RegisterMaterial( "hud_dpad_arrow" ), 0 )
	downArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93, _1080p * 157, _1080p * 126.82, _1080p * 158.82 )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Fire:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end
			}
		} )
		fanCard4:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.fanCard1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "initial", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.initial = function ()
			Fire:AnimateSequence( "initial" )
			fanCard4:AnimateSequence( "initial" )
			fanCard3:AnimateSequence( "initial" )
			fanCard2:AnimateSequence( "initial" )
			fanCard1:AnimateSequence( "initial" )
			FateCardOnDeck:AnimateSequence( "initial" )
			Triangle:AnimateSequence( "initial" )
			FateCardDevilWidget:AnimateSequence( "initial" )
		end
		
		fanCard4:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 1, 10 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 0, 250 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 1, 40 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 0, 190 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 70 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 130 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 80 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 109 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 185.82, _1080p * 356.82, 40 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 129 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 75.5, _1080p * 246.5, 159 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "cardCycle5Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.cardCycle5Cards = function ()
			fanCard4:AnimateSequence( "cardCycle5Cards" )
			fanCard3:AnimateSequence( "cardCycle5Cards" )
			fanCard2:AnimateSequence( "cardCycle5Cards" )
			fanCard1:AnimateSequence( "cardCycle5Cards" )
			FateCardOnDeck:AnimateSequence( "cardCycle5Cards" )
			Triangle:AnimateSequence( "cardCycle5Cards" )
			FateCardDevilWidget:AnimateSequence( "cardCycle5Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 1, 40 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 0, 190 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 70 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 130 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 80 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 109 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 185.82, _1080p * 356.82, 40 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 129 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "cardCycle4Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.cardCycle4Cards = function ()
			fanCard4:AnimateSequence( "cardCycle4Cards" )
			fanCard3:AnimateSequence( "cardCycle4Cards" )
			fanCard2:AnimateSequence( "cardCycle4Cards" )
			fanCard1:AnimateSequence( "cardCycle4Cards" )
			FateCardOnDeck:AnimateSequence( "cardCycle4Cards" )
			Triangle:AnimateSequence( "cardCycle4Cards" )
			FateCardDevilWidget:AnimateSequence( "cardCycle4Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 70 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 130 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 80 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 109 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 185.82, _1080p * 356.82, 40 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 129 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "cardCycle3Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.cardCycle3Cards = function ()
			fanCard4:AnimateSequence( "cardCycle3Cards" )
			fanCard3:AnimateSequence( "cardCycle3Cards" )
			fanCard2:AnimateSequence( "cardCycle3Cards" )
			fanCard1:AnimateSequence( "cardCycle3Cards" )
			FateCardOnDeck:AnimateSequence( "cardCycle3Cards" )
			Triangle:AnimateSequence( "cardCycle3Cards" )
			FateCardDevilWidget:AnimateSequence( "cardCycle3Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 100 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 10 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 80 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 109 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 185.82, _1080p * 356.82, 40 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 129 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "cardCycle2Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.cardCycle2Cards = function ()
			fanCard4:AnimateSequence( "cardCycle2Cards" )
			fanCard3:AnimateSequence( "cardCycle2Cards" )
			fanCard2:AnimateSequence( "cardCycle2Cards" )
			fanCard1:AnimateSequence( "cardCycle2Cards" )
			FateCardOnDeck:AnimateSequence( "cardCycle2Cards" )
			Triangle:AnimateSequence( "cardCycle2Cards" )
			FateCardDevilWidget:AnimateSequence( "cardCycle2Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.fanCard1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 140 )
				end,
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 109 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 185.82, _1080p * 356.82, 40 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 129 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "cardCycle1Card", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.cardCycle1Card = function ()
			fanCard4:AnimateSequence( "cardCycle1Card" )
			fanCard3:AnimateSequence( "cardCycle1Card" )
			fanCard2:AnimateSequence( "cardCycle1Card" )
			fanCard1:AnimateSequence( "cardCycle1Card" )
			FateCardOnDeck:AnimateSequence( "cardCycle1Card" )
			Triangle:AnimateSequence( "cardCycle1Card" )
			FateCardDevilWidget:AnimateSequence( "cardCycle1Card" )
		end
		
		fanCard4:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.fanCard1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "initial1Card", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.initial1Card = function ()
			fanCard4:AnimateSequence( "initial1Card" )
			fanCard3:AnimateSequence( "initial1Card" )
			fanCard2:AnimateSequence( "initial1Card" )
			fanCard1:AnimateSequence( "initial1Card" )
			FateCardOnDeck:AnimateSequence( "initial1Card" )
			Triangle:AnimateSequence( "initial1Card" )
			FateCardDevilWidget:AnimateSequence( "initial1Card" )
		end
		
		fanCard4:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "initial2Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.initial2Cards = function ()
			fanCard4:AnimateSequence( "initial2Cards" )
			fanCard3:AnimateSequence( "initial2Cards" )
			fanCard2:AnimateSequence( "initial2Cards" )
			fanCard1:AnimateSequence( "initial2Cards" )
			FateCardOnDeck:AnimateSequence( "initial2Cards" )
			Triangle:AnimateSequence( "initial2Cards" )
			FateCardDevilWidget:AnimateSequence( "initial2Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "initial3Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget.radialAlphaLarge.circleFill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.initial3Cards = function ()
			fanCard4:AnimateSequence( "initial3Cards" )
			fanCard3:AnimateSequence( "initial3Cards" )
			fanCard2:AnimateSequence( "initial3Cards" )
			fanCard1:AnimateSequence( "initial3Cards" )
			FateCardOnDeck:AnimateSequence( "initial3Cards" )
			Triangle:AnimateSequence( "initial3Cards" )
			FateCardDevilWidget:AnimateSequence( "initial3Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "initial4Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.initial4Cards = function ()
			fanCard4:AnimateSequence( "initial4Cards" )
			fanCard3:AnimateSequence( "initial4Cards" )
			fanCard2:AnimateSequence( "initial4Cards" )
			fanCard1:AnimateSequence( "initial4Cards" )
			FateCardOnDeck:AnimateSequence( "initial4Cards" )
			Triangle:AnimateSequence( "initial4Cards" )
			FateCardDevilWidget:AnimateSequence( "initial4Cards" )
		end
		
		Fire:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end
			}
		} )
		fanCard4:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 0, 1300 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 0, 260 )
				end,
				function ()
					return self.fanCard4:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 0, 1300 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 0, 220 )
				end,
				function ()
					return self.fanCard3:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 1300 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 0, 170 )
				end,
				function ()
					return self.fanCard2:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 0, 0 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 1300 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 0, 100 )
				end,
				function ()
					return self.fanCard1:SetAlpha( 1, 70 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 0, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAlpha( 0, 1300 )
				end,
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "initial5Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.initial5Cards = function ()
			Fire:AnimateSequence( "initial5Cards" )
			fanCard4:AnimateSequence( "initial5Cards" )
			fanCard3:AnimateSequence( "initial5Cards" )
			fanCard2:AnimateSequence( "initial5Cards" )
			fanCard1:AnimateSequence( "initial5Cards" )
			FateCardOnDeck:AnimateSequence( "initial5Cards" )
			Triangle:AnimateSequence( "initial5Cards" )
			FateCardDevilWidget:AnimateSequence( "initial5Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 180 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "meterFull5Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.meterFull5Cards = function ()
			fanCard4:AnimateSequence( "meterFull5Cards" )
			fanCard3:AnimateSequence( "meterFull5Cards" )
			fanCard2:AnimateSequence( "meterFull5Cards" )
			fanCard1:AnimateSequence( "meterFull5Cards" )
			FateCardOnDeck:AnimateSequence( "meterFull5Cards" )
			Triangle:AnimateSequence( "meterFull5Cards" )
			FateCardDevilWidget:AnimateSequence( "meterFull5Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 180 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "meterFull4Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.meterFull4Cards = function ()
			fanCard4:AnimateSequence( "meterFull4Cards" )
			fanCard3:AnimateSequence( "meterFull4Cards" )
			fanCard2:AnimateSequence( "meterFull4Cards" )
			fanCard1:AnimateSequence( "meterFull4Cards" )
			FateCardOnDeck:AnimateSequence( "meterFull4Cards" )
			Triangle:AnimateSequence( "meterFull4Cards" )
			FateCardDevilWidget:AnimateSequence( "meterFull4Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 180 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "meterFull3Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.meterFull3Cards = function ()
			fanCard4:AnimateSequence( "meterFull3Cards" )
			fanCard3:AnimateSequence( "meterFull3Cards" )
			fanCard2:AnimateSequence( "meterFull3Cards" )
			fanCard1:AnimateSequence( "meterFull3Cards" )
			FateCardOnDeck:AnimateSequence( "meterFull3Cards" )
			Triangle:AnimateSequence( "meterFull3Cards" )
			FateCardDevilWidget:AnimateSequence( "meterFull3Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 180 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "meterFull2Cards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.meterFull2Cards = function ()
			fanCard4:AnimateSequence( "meterFull2Cards" )
			fanCard3:AnimateSequence( "meterFull2Cards" )
			fanCard2:AnimateSequence( "meterFull2Cards" )
			fanCard1:AnimateSequence( "meterFull2Cards" )
			FateCardOnDeck:AnimateSequence( "meterFull2Cards" )
			Triangle:AnimateSequence( "meterFull2Cards" )
			FateCardDevilWidget:AnimateSequence( "meterFull2Cards" )
		end
		
		fanCard4:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.fanCard1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.FateCardOnDeck.name:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.icon:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck.name:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 1, 260 )
				end
			},
			{
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 169.82, _1080p * 340.82, 0 )
				end,
				function ()
					return self.FateCardOnDeck:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 45.5, _1080p * 200.5, _1080p * 76.82, _1080p * 247.82, 180 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "meterFull1Card", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.meterFull1Card = function ()
			fanCard4:AnimateSequence( "meterFull1Card" )
			fanCard3:AnimateSequence( "meterFull1Card" )
			fanCard2:AnimateSequence( "meterFull1Card" )
			fanCard1:AnimateSequence( "meterFull1Card" )
			FateCardOnDeck:AnimateSequence( "meterFull1Card" )
			Triangle:AnimateSequence( "meterFull1Card" )
			FateCardDevilWidget:AnimateSequence( "meterFull1Card" )
		end
		
		fanCard4:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.fanCard4:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetZRotation( -30, 0 )
				end
			},
			{
				function ()
					return self.fanCard4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 4.25, _1080p * 259.25, _1080p * 75.5, _1080p * 587.5, 0 )
				end
			}
		} )
		fanCard3:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.fanCard3:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetZRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.fanCard3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1.25, _1080p * 256.25, _1080p * 70.5, _1080p * 582.5, 0 )
				end
			}
		} )
		fanCard2:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.fanCard2:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetZRotation( -20, 0 )
				end
			},
			{
				function ()
					return self.fanCard2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -0.75, _1080p * 254.25, _1080p * 64.5, _1080p * 576.5, 0 )
				end
			}
		} )
		fanCard1:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.fanCard1:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetZRotation( -15, 0 )
				end
			},
			{
				function ()
					return self.fanCard1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -2.75, _1080p * 252.25, _1080p * 58.5, _1080p * 570.5, 0 )
				end
			}
		} )
		FateCardOnDeck:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.FateCardOnDeck:SetAlpha( 0, 160 )
				end
			}
		} )
		Triangle:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.Triangle:SetScale( 0.03, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.Triangle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 251, _1080p * 195.5, _1080p * 451.5, 0 )
				end
			}
		} )
		FateCardDevilWidget:RegisterAnimationSequence( "noMoreCards", {
			{
				function ()
					return self.FateCardDevilWidget:SetScale( 0.05, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.FateCardDevilWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40.7, _1080p * 296.7, _1080p * 218.9, _1080p * 475.3, 0 )
				end
			}
		} )
		self._sequences.noMoreCards = function ()
			fanCard4:AnimateSequence( "noMoreCards" )
			fanCard3:AnimateSequence( "noMoreCards" )
			fanCard2:AnimateSequence( "noMoreCards" )
			fanCard1:AnimateSequence( "noMoreCards" )
			FateCardOnDeck:AnimateSequence( "noMoreCards" )
			Triangle:AnimateSequence( "noMoreCards" )
			FateCardDevilWidget:AnimateSequence( "noMoreCards" )
		end
		
		Fire:RegisterAnimationSequence( "FireOn", {
			{
				function ()
					return self.Fire:SetAlpha( 1, 0 )
				end
			}
		} )
		upArrow:RegisterAnimationSequence( "FireOn", {
			{
				function ()
					return self.upArrow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.upArrow:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.upArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 155, _1080p * 53.82, _1080p * 85.82, 200 )
				end
			}
		} )
		downArrow:RegisterAnimationSequence( "FireOn", {
			{
				function ()
					return self.downArrow:SetAlpha( 0, 200 )
				end,
				function ()
					return self.downArrow:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.downArrow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 91, _1080p * 155, _1080p * 126.82, _1080p * 158.82, 200 )
				end
			}
		} )
		self._sequences.FireOn = function ()
			Fire:AnimateSequence( "FireOn" )
			upArrow:AnimateSequence( "FireOn" )
			downArrow:AnimateSequence( "FireOn" )
		end
		
		Fire:RegisterAnimationSequence( "FireOff", {
			{
				function ()
					return self.Fire:SetScale( 0, 0 )
				end
			},
			{
				function ()
					return self.Fire:SetAlpha( 0, 0 )
				end
			}
		} )
		upArrow:RegisterAnimationSequence( "FireOff", {
			{
				function ()
					return self.upArrow:SetAlpha( 0, 0 )
				end
			}
		} )
		downArrow:RegisterAnimationSequence( "FireOff", {
			{
				function ()
					return self.downArrow:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.FireOff = function ()
			Fire:AnimateSequence( "FireOff" )
			upArrow:AnimateSequence( "FireOff" )
			downArrow:AnimateSequence( "FireOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "FateCardWidget", FateCardWidget )
LockTable( _M )
