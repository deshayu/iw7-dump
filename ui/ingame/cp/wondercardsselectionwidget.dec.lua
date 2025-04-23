local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WonderCardsSelectionWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 116 * _1080p, 0, 672 * _1080p )
	self.id = "WonderCardsSelectionWidget"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ZomConsumableSmall1 = nil
	
	ZomConsumableSmall1 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	ZomConsumableSmall1.id = "ZomConsumableSmall1"
	ZomConsumableSmall1.radialAlphaLarge.circleFill:SetProgress( 0 )
	ZomConsumableSmall1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 157, _1080p * 530.92, _1080p * 589.92 )
	ZomConsumableSmall1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot1Alpha:GetModel( f1_local1 ) )
	ZomConsumableSmall1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ZomConsumableSmall1.cardImageCopy0:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( ZomConsumableSmall1 )
	self.ZomConsumableSmall1 = ZomConsumableSmall1
	
	local ZomConsumableSmall2 = nil
	
	ZomConsumableSmall2 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	ZomConsumableSmall2.id = "ZomConsumableSmall2"
	ZomConsumableSmall2.radialAlphaLarge.circleFill:SetProgress( 0 )
	ZomConsumableSmall2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 157, _1080p * 402, _1080p * 461 )
	ZomConsumableSmall2:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot2Alpha:GetModel( f1_local1 ) )
	ZomConsumableSmall2:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ZomConsumableSmall2.cardImageCopy0:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( ZomConsumableSmall2 )
	self.ZomConsumableSmall2 = ZomConsumableSmall2
	
	local ZomConsumableSmall3 = nil
	
	ZomConsumableSmall3 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	ZomConsumableSmall3.id = "ZomConsumableSmall3"
	ZomConsumableSmall3.radialAlphaLarge.circleFill:SetProgress( 0 )
	ZomConsumableSmall3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 157, _1080p * 275, _1080p * 334 )
	ZomConsumableSmall3:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot3Alpha:GetModel( f1_local1 ) )
	ZomConsumableSmall3:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ZomConsumableSmall3.cardImageCopy0:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( ZomConsumableSmall3 )
	self.ZomConsumableSmall3 = ZomConsumableSmall3
	
	local ZomConsumableSmall4 = nil
	
	ZomConsumableSmall4 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	ZomConsumableSmall4.id = "ZomConsumableSmall4"
	ZomConsumableSmall4.radialAlphaLarge.circleFill:SetProgress( 0 )
	ZomConsumableSmall4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 157, _1080p * 146, _1080p * 205 )
	ZomConsumableSmall4:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot4Alpha:GetModel( f1_local1 ) )
	ZomConsumableSmall4:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			ZomConsumableSmall4.cardImageCopy0:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( ZomConsumableSmall4 )
	self.ZomConsumableSmall4 = ZomConsumableSmall4
	
	local ZomConsumableSmall5 = nil
	
	ZomConsumableSmall5 = MenuBuilder.BuildRegisteredType( "ZomConsumableSmall", {
		controllerIndex = f1_local1
	} )
	ZomConsumableSmall5.id = "ZomConsumableSmall5"
	ZomConsumableSmall5.radialAlphaLarge.circleFill:SetProgress( 0 )
	ZomConsumableSmall5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 107, _1080p * 157, _1080p * 17, _1080p * 76 )
	ZomConsumableSmall5:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableSlot5Alpha:GetModel( f1_local1 ) )
	ZomConsumableSmall5:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableDeckSlot5Icon:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			ZomConsumableSmall5.cardImageCopy0:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( ZomConsumableSmall5 )
	self.ZomConsumableSmall5 = ZomConsumableSmall5
	
	local WonderCardArrows1 = nil
	
	WonderCardArrows1 = MenuBuilder.BuildRegisteredType( "WonderCardArrows", {
		controllerIndex = f1_local1
	} )
	WonderCardArrows1.id = "WonderCardArrows1"
	WonderCardArrows1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.5, _1080p * 216.5, _1080p * 506.84, _1080p * 775.08 )
	self:addElement( WonderCardArrows1 )
	self.WonderCardArrows1 = WonderCardArrows1
	
	local WonderCardArrows2 = nil
	
	WonderCardArrows2 = MenuBuilder.BuildRegisteredType( "WonderCardArrows", {
		controllerIndex = f1_local1
	} )
	WonderCardArrows2.id = "WonderCardArrows2"
	WonderCardArrows2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.5, _1080p * 216.5, _1080p * 377.72, _1080p * 645.96 )
	self:addElement( WonderCardArrows2 )
	self.WonderCardArrows2 = WonderCardArrows2
	
	local WonderCardArrows3 = nil
	
	WonderCardArrows3 = MenuBuilder.BuildRegisteredType( "WonderCardArrows", {
		controllerIndex = f1_local1
	} )
	WonderCardArrows3.id = "WonderCardArrows3"
	WonderCardArrows3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.5, _1080p * 216.5, _1080p * 250.72, _1080p * 518.96 )
	self:addElement( WonderCardArrows3 )
	self.WonderCardArrows3 = WonderCardArrows3
	
	local WonderCardArrows4 = nil
	
	WonderCardArrows4 = MenuBuilder.BuildRegisteredType( "WonderCardArrows", {
		controllerIndex = f1_local1
	} )
	WonderCardArrows4.id = "WonderCardArrows4"
	WonderCardArrows4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.5, _1080p * 216.5, _1080p * 120.72, _1080p * 388.96 )
	self:addElement( WonderCardArrows4 )
	self.WonderCardArrows4 = WonderCardArrows4
	
	local WonderCardArrows5 = nil
	
	WonderCardArrows5 = MenuBuilder.BuildRegisteredType( "WonderCardArrows", {
		controllerIndex = f1_local1
	} )
	WonderCardArrows5.id = "WonderCardArrows5"
	WonderCardArrows5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 39.5, _1080p * 216.5, _1080p * -7.28, _1080p * 260.96 )
	self:addElement( WonderCardArrows5 )
	self.WonderCardArrows5 = WonderCardArrows5
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WonderCardArrows1:RegisterAnimationSequence( "card1Select", {
			{
				function ()
					return self.WonderCardArrows1:SetAlpha( 1, 0 )
				end
			}
		} )
		WonderCardArrows2:RegisterAnimationSequence( "card1Select", {
			{
				function ()
					return self.WonderCardArrows2:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows3:RegisterAnimationSequence( "card1Select", {
			{
				function ()
					return self.WonderCardArrows3:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows4:RegisterAnimationSequence( "card1Select", {
			{
				function ()
					return self.WonderCardArrows4:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows5:RegisterAnimationSequence( "card1Select", {
			{
				function ()
					return self.WonderCardArrows5:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.card1Select = function ()
			WonderCardArrows1:AnimateSequence( "card1Select" )
			WonderCardArrows2:AnimateSequence( "card1Select" )
			WonderCardArrows3:AnimateSequence( "card1Select" )
			WonderCardArrows4:AnimateSequence( "card1Select" )
			WonderCardArrows5:AnimateSequence( "card1Select" )
		end
		
		WonderCardArrows1:RegisterAnimationSequence( "card2Select", {
			{
				function ()
					return self.WonderCardArrows1:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows2:RegisterAnimationSequence( "card2Select", {
			{
				function ()
					return self.WonderCardArrows2:SetAlpha( 1, 0 )
				end
			}
		} )
		WonderCardArrows3:RegisterAnimationSequence( "card2Select", {
			{
				function ()
					return self.WonderCardArrows3:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows4:RegisterAnimationSequence( "card2Select", {
			{
				function ()
					return self.WonderCardArrows4:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows5:RegisterAnimationSequence( "card2Select", {
			{
				function ()
					return self.WonderCardArrows5:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.card2Select = function ()
			WonderCardArrows1:AnimateSequence( "card2Select" )
			WonderCardArrows2:AnimateSequence( "card2Select" )
			WonderCardArrows3:AnimateSequence( "card2Select" )
			WonderCardArrows4:AnimateSequence( "card2Select" )
			WonderCardArrows5:AnimateSequence( "card2Select" )
		end
		
		WonderCardArrows1:RegisterAnimationSequence( "card3Select", {
			{
				function ()
					return self.WonderCardArrows1:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows2:RegisterAnimationSequence( "card3Select", {
			{
				function ()
					return self.WonderCardArrows2:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows3:RegisterAnimationSequence( "card3Select", {
			{
				function ()
					return self.WonderCardArrows3:SetAlpha( 1, 0 )
				end
			}
		} )
		WonderCardArrows4:RegisterAnimationSequence( "card3Select", {
			{
				function ()
					return self.WonderCardArrows4:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows5:RegisterAnimationSequence( "card3Select", {
			{
				function ()
					return self.WonderCardArrows5:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.card3Select = function ()
			WonderCardArrows1:AnimateSequence( "card3Select" )
			WonderCardArrows2:AnimateSequence( "card3Select" )
			WonderCardArrows3:AnimateSequence( "card3Select" )
			WonderCardArrows4:AnimateSequence( "card3Select" )
			WonderCardArrows5:AnimateSequence( "card3Select" )
		end
		
		WonderCardArrows1:RegisterAnimationSequence( "card4Select", {
			{
				function ()
					return self.WonderCardArrows1:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows2:RegisterAnimationSequence( "card4Select", {
			{
				function ()
					return self.WonderCardArrows2:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows3:RegisterAnimationSequence( "card4Select", {
			{
				function ()
					return self.WonderCardArrows3:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows4:RegisterAnimationSequence( "card4Select", {
			{
				function ()
					return self.WonderCardArrows4:SetAlpha( 1, 0 )
				end
			}
		} )
		WonderCardArrows5:RegisterAnimationSequence( "card4Select", {
			{
				function ()
					return self.WonderCardArrows5:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.card4Select = function ()
			WonderCardArrows1:AnimateSequence( "card4Select" )
			WonderCardArrows2:AnimateSequence( "card4Select" )
			WonderCardArrows3:AnimateSequence( "card4Select" )
			WonderCardArrows4:AnimateSequence( "card4Select" )
			WonderCardArrows5:AnimateSequence( "card4Select" )
		end
		
		WonderCardArrows1:RegisterAnimationSequence( "card5Select", {
			{
				function ()
					return self.WonderCardArrows1:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows2:RegisterAnimationSequence( "card5Select", {
			{
				function ()
					return self.WonderCardArrows2:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows3:RegisterAnimationSequence( "card5Select", {
			{
				function ()
					return self.WonderCardArrows3:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows4:RegisterAnimationSequence( "card5Select", {
			{
				function ()
					return self.WonderCardArrows4:SetAlpha( 0, 0 )
				end
			}
		} )
		WonderCardArrows5:RegisterAnimationSequence( "card5Select", {
			{
				function ()
					return self.WonderCardArrows5:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.card5Select = function ()
			WonderCardArrows1:AnimateSequence( "card5Select" )
			WonderCardArrows2:AnimateSequence( "card5Select" )
			WonderCardArrows3:AnimateSequence( "card5Select" )
			WonderCardArrows4:AnimateSequence( "card5Select" )
			WonderCardArrows5:AnimateSequence( "card5Select" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetModel( f1_local1 ), function ()
		if DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) == 0 then
			ACTIONS.AnimateSequence( self, "card1Select" )
		end
		if DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "card2Select" )
		end
		if DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "card3Select" )
		end
		if DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "card5Select" )
		end
		if DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) ~= nil and DataSources.inGame.CP.zombies.consumableDeckSlotOn:GetValue( f1_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "card4Select" )
		end
	end )
	return self
end

MenuBuilder.registerType( "WonderCardsSelectionWidget", WonderCardsSelectionWidget )
LockTable( _M )
