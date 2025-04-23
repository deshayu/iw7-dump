local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.MK2Pattern:processEvent( {
		name = "mk2_wide_pattern"
	} )
	f1_arg0.QualityIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetModel( f1_arg1 ), function ()
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			local f2_local0 = tonumber( DataSources.inGame.MP.killcam.killedby.itemID:GetValue( f1_arg1 ) )
			local f2_local1 = DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetValue( f1_arg1 )
			if f2_local1 ~= nil and modelvalue ~= "icon_item_quality_0" then
				f1_arg0.QualityIcon.IconDuplicate:setImage( RegisterMaterial( f2_local1 .. "_mk2" ), 0 )
			end
			if DataSources.inGame.MP.killcam.killedby.isMk2:GetValue( f1_arg1 ) then
				f1_arg0.MK2:SetAlpha( 0.5, 0 )
				f1_arg0.MK2Pattern:SetAlpha( 1, 0 )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "QualityIcon",
					sequenceName = "LegendaryPulse",
					elementPath = "QualityIcon"
				} )
			else
				f1_arg0.QualityIcon.IconDuplicate:SetAlpha( 0, 0 )
				f1_arg0.MK2:SetAlpha( 0, 0 )
				f1_arg0.MK2Pattern:SetAlpha( 0, 0 )
				ACTIONS.AnimateSequenceByElement( f1_arg0, {
					elementName = "QualityIcon",
					sequenceName = "StopPulse",
					elementPath = "QualityIcon"
				} )
			end
		end
	end )
end

function KilledByLootWeaponNotification( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 100 * _1080p )
	self.id = "KilledByLootWeaponNotification"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAlpha( 0.5, 0 )
	Backing:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -288, _1080p * 285, 0, 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local LootColorFill = nil
	
	LootColorFill = LUI.UIImage.new()
	LootColorFill.id = "LootColorFill"
	LootColorFill:SetAlpha( 0.5, 0 )
	LootColorFill:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 65, _1080p * 285, 0, 0 )
	LootColorFill:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
	self:addElement( LootColorFill )
	self.LootColorFill = LootColorFill
	
	local WeaponIcon = nil
	
	WeaponIcon = LUI.UIImage.new()
	WeaponIcon.id = "WeaponIcon"
	WeaponIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 75, _1080p * 275, 0, 0 )
	WeaponIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponIcon:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.killcam.killedby.weaponIcon:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			WeaponIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( WeaponIcon )
	self.WeaponIcon = WeaponIcon
	
	local LootColorFillWeaponText = nil
	
	LootColorFillWeaponText = LUI.UIImage.new()
	LootColorFillWeaponText.id = "LootColorFillWeaponText"
	LootColorFillWeaponText:SetAlpha( 0.5, 0 )
	LootColorFillWeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -280, _1080p * 63, 0, _1080p * -50 )
	LootColorFillWeaponText:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
	self:addElement( LootColorFillWeaponText )
	self.LootColorFillWeaponText = LootColorFillWeaponText
	
	local LootColorFillPassives = nil
	
	LootColorFillPassives = LUI.UIImage.new()
	LootColorFillPassives.id = "LootColorFillPassives"
	LootColorFillPassives:SetAlpha( 0.3, 0 )
	LootColorFillPassives:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -280, _1080p * 63, _1080p * 50, 0 )
	LootColorFillPassives:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
	self:addElement( LootColorFillPassives )
	self.LootColorFillPassives = LootColorFillPassives
	
	local MK2Pattern = nil
	
	MK2Pattern = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
		controllerIndex = f3_local1
	} )
	MK2Pattern.id = "MK2Pattern"
	MK2Pattern:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 672, _1080p * -675, _1080p * -1, _1080p * 101 )
	MK2Pattern:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
	self:addElement( MK2Pattern )
	self.MK2Pattern = MK2Pattern
	
	local WeaponText = nil
	
	WeaponText = LUI.UIText.new()
	WeaponText.id = "WeaponText"
	WeaponText:SetFontSize( 28 * _1080p )
	WeaponText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponText:SetAlignment( LUI.Alignment.Left )
	WeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -275, _1080p * 57, 0, _1080p * 28 )
	WeaponText:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.itemName:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.killcam.killedby.itemName:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			WeaponText:setText( ToUpperCase( LocalizeString( f5_local0 ) ), 0 )
		end
	end )
	self:addElement( WeaponText )
	self.WeaponText = WeaponText
	
	local LootColorBarleft = nil
	
	LootColorBarleft = LUI.UIImage.new()
	LootColorBarleft.id = "LootColorBarleft"
	LootColorBarleft:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -288, _1080p * -280, 0, 0 )
	LootColorBarleft:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
	self:addElement( LootColorBarleft )
	self.LootColorBarleft = LootColorBarleft
	
	local MK2 = nil
	
	MK2 = LUI.UIImage.new()
	MK2.id = "MK2"
	MK2:SetAlpha( 0.5, 0 )
	MK2:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
	MK2:SetBlendMode( BLEND_MODE.addWithAlpha )
	MK2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 956, _1080p * 1020, _1080p * 22, _1080p * 54 )
	self:addElement( MK2 )
	self.MK2 = MK2
	
	local f3_local12 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f3_local12 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f3_local1
		} )
		f3_local12.id = "QualityIcon"
		f3_local12.IconShadow:SetAlpha( 0.2, 0 )
		f3_local12:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -270, _1080p * -225, _1080p * -48, _1080p * -3 )
		f3_local12:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetModel( f3_local1 ), function ()
			local f6_local0 = DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetValue( f3_local1 )
			if f6_local0 ~= nil then
				f3_local12.IconShadow:setImage( RegisterMaterial( f6_local0 ), 0 )
			end
		end )
		f3_local12.Icon:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
		f3_local12:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetModel( f3_local1 ), function ()
			local f7_local0 = DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetValue( f3_local1 )
			if f7_local0 ~= nil then
				f3_local12.Icon:setImage( RegisterMaterial( f7_local0 ), 0 )
			end
		end )
		f3_local12.IconDuplicate:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f3_local1 ) )
		self:addElement( f3_local12 )
		self.QualityIcon = f3_local12
	end
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "KilledByLootWeaponNotification", KilledByLootWeaponNotification )
LockTable( _M )
