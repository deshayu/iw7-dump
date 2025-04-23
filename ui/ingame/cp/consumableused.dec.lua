local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ConsumableUsed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 394 * _1080p, 0, 199 * _1080p )
	self.id = "ConsumableUsed"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local DescBox = nil
	
	DescBox = LUI.UIImage.new()
	DescBox.id = "DescBox"
	DescBox:SetRGBFromInt( 5131854, 0 )
	DescBox:SetAlpha( 0.75, 0 )
	DescBox:SetScale( -0.25, 0 )
	DescBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -27.64, _1080p * 450.36, _1080p * 60.45, _1080p * 216.45 )
	self:addElement( DescBox )
	self.DescBox = DescBox
	
	local NameBox = nil
	
	NameBox = LUI.UIImage.new()
	NameBox.id = "NameBox"
	NameBox:SetRGBFromInt( 0, 0 )
	NameBox:SetAlpha( 0.8, 0 )
	NameBox:SetScale( -0.25, 0 )
	NameBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -27.64, _1080p * 450.36, _1080p * 11.95, _1080p * 90.45 )
	self:addElement( NameBox )
	self.NameBox = NameBox
	
	local CardUsed = nil
	
	CardUsed = LUI.UIStyledText.new()
	CardUsed.id = "CardUsed"
	CardUsed:SetFontSize( 30 * _1080p )
	CardUsed:SetFont( FONTS.GetFont( FONTS.ZmClean.File ) )
	CardUsed:SetAlignment( LUI.Alignment.Left )
	CardUsed:SetShadowRGBFromInt( 65536, 0 )
	CardUsed:SetOutlineMinDistance( -0.04, 0 )
	CardUsed:SetOutlineRGBFromInt( 526344, 0 )
	CardUsed:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 108, _1080p * 383.3, _1080p * 24.2, _1080p * 54.2 )
	CardUsed:SubscribeToModel( DataSources.inGame.CP.zombies.consumableSlotUsedName:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.consumableSlotUsedName:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CardUsed:setText( ToUpperCase( f2_local0 ), 0 )
		end
	end )
	self:addElement( CardUsed )
	self.CardUsed = CardUsed
	
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetScale( -0.6, 0 )
	Icon:SetUseAA( true )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -75.8, _1080p * 180.2, _1080p * -76.8, _1080p * 179.2 )
	Icon:SubscribeToModel( DataSources.inGame.CP.zombies.consumableSlotUsedIcon:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.consumableSlotUsedIcon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			Icon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( Icon )
	self.Icon = Icon
	
	local desc = nil
	
	desc = LUI.UIText.new()
	desc.id = "desc"
	desc:SetFontSize( 22 * _1080p )
	desc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	desc:SetAlignment( LUI.Alignment.Left )
	desc:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 38.11, _1080p * 383.3, _1080p * 104.45, _1080p * 124.45 )
	desc:SubscribeToModel( DataSources.inGame.CP.zombies.consumableSlotUsedDesc:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.consumableSlotUsedDesc:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			desc:setText( f4_local0, 0 )
		end
	end )
	self:addElement( desc )
	self.desc = desc
	
	return self
end

MenuBuilder.registerType( "ConsumableUsed", ConsumableUsed )
LockTable( _M )
