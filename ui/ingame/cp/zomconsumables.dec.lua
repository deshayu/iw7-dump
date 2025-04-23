local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ZomConsumables( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 585 * _1080p, 0, 167 * _1080p )
	self.id = "ZomConsumables"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 3355443, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 585, 0, _1080p * 167 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local wonderCardBacking3 = nil
	
	wonderCardBacking3 = LUI.UIImage.new()
	wonderCardBacking3.id = "wonderCardBacking3"
	wonderCardBacking3:SetRGBFromInt( 8810865, 0 )
	wonderCardBacking3:SetScale( 0.02, 0 )
	wonderCardBacking3:setImage( RegisterMaterial( "wonder_card_plain" ), 0 )
	wonderCardBacking3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.5, _1080p * 144.5, _1080p * 6, _1080p * 161 )
	self:addElement( wonderCardBacking3 )
	self.wonderCardBacking3 = wonderCardBacking3
	
	local Consumable1 = nil
	
	Consumable1 = LUI.UIImage.new()
	Consumable1.id = "Consumable1"
	Consumable1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32.5, _1080p * 144.5, _1080p * 30, _1080p * 138 )
	Consumable1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableIcon1:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableIcon1:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Consumable1:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Consumable1 )
	self.Consumable1 = Consumable1
	
	local ConsumableName1 = nil
	
	ConsumableName1 = LUI.UIText.new()
	ConsumableName1.id = "ConsumableName1"
	ConsumableName1:SetFontSize( 36 * _1080p )
	ConsumableName1:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ConsumableName1:setTextStyle( CoD.TextStyle.Shadowed )
	ConsumableName1:SetAlignment( LUI.Alignment.Left )
	ConsumableName1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 155, _1080p * 655, _1080p * 4, _1080p * 40 )
	ConsumableName1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	ConsumableName1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableName1:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableName1:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ConsumableName1:setText( f3_local0, 0 )
		end
	end )
	self:addElement( ConsumableName1 )
	self.ConsumableName1 = ConsumableName1
	
	local ConsumableDesc1 = nil
	
	ConsumableDesc1 = LUI.UIText.new()
	ConsumableDesc1.id = "ConsumableDesc1"
	ConsumableDesc1:SetFontSize( 30 * _1080p )
	ConsumableDesc1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ConsumableDesc1:SetAlignment( LUI.Alignment.Left )
	ConsumableDesc1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 155, _1080p * 579, _1080p * 41, _1080p * 71 )
	ConsumableDesc1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	ConsumableDesc1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableDesc1:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableDesc1:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ConsumableDesc1:setText( f4_local0, 0 )
		end
	end )
	self:addElement( ConsumableDesc1 )
	self.ConsumableDesc1 = ConsumableDesc1
	
	local ActivationsText1 = nil
	
	ActivationsText1 = LUI.UIText.new()
	ActivationsText1.id = "ActivationsText1"
	ActivationsText1:setText( Engine.Localize( "ZM_CONSUMABLES_ACTIVATIONS" ), 0 )
	ActivationsText1:SetFontSize( 30 * _1080p )
	ActivationsText1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	ActivationsText1:SetAlignment( LUI.Alignment.Left )
	ActivationsText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 155, _1080p * 265, _1080p * 133, _1080p * 163 )
	ActivationsText1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	self:addElement( ActivationsText1 )
	self.ActivationsText1 = ActivationsText1
	
	local Activations1 = nil
	
	Activations1 = LUI.UIText.new()
	Activations1.id = "Activations1"
	Activations1:SetFontSize( 30 * _1080p )
	Activations1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Activations1:SetAlignment( LUI.Alignment.Left )
	Activations1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 355, _1080p * 455, _1080p * 133, _1080p * 163 )
	Activations1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	Activations1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableUses1:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.consumableUses1:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			Activations1:setText( f5_local0, 0 )
		end
	end )
	self:addElement( Activations1 )
	self.Activations1 = Activations1
	
	local varText1 = nil
	
	varText1 = LUI.UIText.new()
	varText1.id = "varText1"
	varText1:SetFontSize( 30 * _1080p )
	varText1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	varText1:SetAlignment( LUI.Alignment.Left )
	varText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 322, _1080p * 432, _1080p * 106, _1080p * 136 )
	varText1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	varText1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableType1:GetModel( f1_local1 ), function ()
		local f6_local0 = DataSources.inGame.CP.zombies.consumableType1:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			varText1:setText( f6_local0, 0 )
		end
	end )
	self:addElement( varText1 )
	self.varText1 = varText1
	
	local LastsText1 = nil
	
	LastsText1 = LUI.UIText.new()
	LastsText1.id = "LastsText1"
	LastsText1:setText( Engine.Localize( "ZM_CONSUMABLES_LASTS" ), 0 )
	LastsText1:SetFontSize( 30 * _1080p )
	LastsText1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	LastsText1:SetAlignment( LUI.Alignment.Left )
	LastsText1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 155, _1080p * 255, _1080p * 106, _1080p * 136 )
	LastsText1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	self:addElement( LastsText1 )
	self.LastsText1 = LastsText1
	
	local Time1 = nil
	
	Time1 = LUI.UIText.new()
	Time1.id = "Time1"
	Time1:SetFontSize( 30 * _1080p )
	Time1:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Time1:SetAlignment( LUI.Alignment.Left )
	Time1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 255, _1080p * 355, _1080p * 106, _1080p * 136 )
	Time1:BindAlphaToModel( DataSources.inGame.CP.zombies.consumableAlpha1:GetModel( f1_local1 ) )
	Time1:SubscribeToModel( DataSources.inGame.CP.zombies.consumableTime1:GetModel( f1_local1 ), function ()
		local f7_local0 = DataSources.inGame.CP.zombies.consumableTime1:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			Time1:setText( f7_local0, 0 )
		end
	end )
	self:addElement( Time1 )
	self.Time1 = Time1
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 3,
		borderThicknessRight = _1080p * 3,
		borderThicknessTop = _1080p * 3,
		borderThicknessBottom = _1080p * 3
	} )
	Border.id = "Border"
	Border:SetRGBFromInt( 0, 0 )
	Border:SetBorderThicknessLeft( _1080p * 3, 0 )
	Border:SetBorderThicknessRight( _1080p * 3, 0 )
	Border:SetBorderThicknessTop( _1080p * 3, 0 )
	Border:SetBorderThicknessBottom( _1080p * 3, 0 )
	Border:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 585, _1080p * -3, _1080p * 168 )
	self:addElement( Border )
	self.Border = Border
	
	return self
end

MenuBuilder.registerType( "ZomConsumables", ZomConsumables )
LockTable( _M )
