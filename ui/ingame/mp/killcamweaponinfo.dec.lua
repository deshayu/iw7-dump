local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.KilledBy )
	assert( f1_arg0.VictimName )
	assert( f1_arg0.MK2Pattern )
	assert( f1_arg0.FactionIcon )
	f1_arg0.KilledBy:SetShadowUOffset( -0 )
	f1_arg0.KilledBy:SetShadowVOffset( -0 )
	f1_arg0.VictimName:SetShadowUOffset( -0 )
	f1_arg0.VictimName:SetShadowVOffset( -0 )
	f1_arg0.MK2Pattern:processEvent( {
		name = "mk2_wide_pattern"
	} )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.inKillCam:GetModel( f1_arg1 ), function ()
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
	local f1_local0 = function ()
		if GameX.gameModeIsFFA() then
			f1_arg0.FactionIcon:SetAlpha( 0 )
		else
			f1_arg0.FactionIcon:SetAlpha( 1 )
			local f3_local0 = DataSources.inGame.MP.match.enemyIcon:GetValue( f1_arg1 )
			local f3_local1 = DataSources.inGame.MP.killcam.killedby.clientId:GetValue( f1_arg1 )
			local f3_local2 = -1
			local f3_local3 = nil
			if f3_local1 ~= nil and f3_local1 >= 0 then
				f3_local2 = Game.GetPlayerTeam( f3_local1 )
				if f3_local2 == Teams.allies then
					f3_local3 = TeamLogos.allies
				elseif f3_local2 == Teams.axis then
					f3_local3 = TeamLogos.axis
				end
			end
			if f3_local0 ~= nil and f3_local3 == nil then
				f1_arg0.FactionIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
			elseif f3_local3 ~= nil then
				f1_arg0.FactionIcon:setImage( RegisterMaterial( f3_local3 ), 0 )
			end
		end
	end
	
	f1_arg0.FactionIcon:SubscribeToModel( DataSources.inGame.MP.match.enemyIcon:GetModel( f1_arg1 ), f1_local0 )
	f1_arg0.FactionIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.clientId:GetModel( f1_arg1 ), f1_local0 )
	local f1_local1 = DataSources.inGame.MP.killcam.killedby.weaponAlpha
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ()
		if f1_local1:GetValue( f1_arg1 ) == 1 then
			ACTIONS.AnimateSequence( f1_arg0, "DefaultLayout" )
		else
			ACTIONS.AnimateSequence( f1_arg0, "AlternateLayout" )
		end
	end )
	local f1_local2 = DataSources.inGame.MP.killcam.killedby.variantId
	f1_arg0:SubscribeToModel( f1_local2:GetModel( f1_arg1 ), function ()
		if f1_local2:GetValue( f1_arg1 ) > -1 then
			f1_arg0.QualityIcon:SetAlpha( 1, 0 )
		else
			f1_arg0.QualityIcon:SetAlpha( 0, 0 )
		end
	end )
	local f1_local3 = DataSources.inGame.MP.killcam.killedby.playerCard.fullName:GetValue( f1_arg1 )
	if f1_local3 ~= nil then
		if Engine.IsPC() then
			f1_local3 = Engine.TruncateToGlyphCount( f1_local3, 16 )
		end
		f1_arg0.KilledBy:setText( LocalizeIntoString( f1_local3, "CGAME_YOUWEREKILLED" ), 0 )
	end
	local f1_local4 = DataSources.inGame.MP.killcam.killedby.victimPlayerCard.fullName:GetValue( f1_arg1 )
	if f1_local4 ~= nil then
		if Engine.IsPC() then
			f1_local4 = Engine.TruncateToGlyphCount( f1_local4, 16 )
		end
		f1_arg0.VictimName:setText( LocalizeIntoString( f1_local4, "CGAME_VICTIM" ), 0 )
	end
end

function KillcamWeaponInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 100 * _1080p )
	self.id = "KillcamWeaponInfo"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local BottomOverlay = nil
	
	BottomOverlay = LUI.UIImage.new()
	BottomOverlay.id = "BottomOverlay"
	BottomOverlay:SetRGBFromInt( 0, 0 )
	BottomOverlay:SetAlpha( 0.5, 0 )
	BottomOverlay:SetUseAA( true )
	self:addElement( BottomOverlay )
	self.BottomOverlay = BottomOverlay
	
	local LootColorFillAttachments = nil
	
	LootColorFillAttachments = LUI.UIImage.new()
	LootColorFillAttachments.id = "LootColorFillAttachments"
	LootColorFillAttachments:SetAlpha( 0.5, 0 )
	LootColorFillAttachments:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 197, _1080p * 381, 0, 0 )
	LootColorFillAttachments:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( LootColorFillAttachments )
	self.LootColorFillAttachments = LootColorFillAttachments
	
	local LootColorFill = nil
	
	LootColorFill = LUI.UIImage.new()
	LootColorFill.id = "LootColorFill"
	LootColorFill:SetAlpha( 0.5, 0 )
	LootColorFill:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 195, 0, 0 )
	LootColorFill:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( LootColorFill )
	self.LootColorFill = LootColorFill
	
	local MK2Pattern = nil
	
	MK2Pattern = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
		controllerIndex = f6_local1
	} )
	MK2Pattern.id = "MK2Pattern"
	MK2Pattern:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 590, _1080p * -579, _1080p * -1, _1080p * 101 )
	MK2Pattern:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( MK2Pattern )
	self.MK2Pattern = MK2Pattern
	
	local PowerIcon = nil
	
	PowerIcon = LUI.UIImage.new()
	PowerIcon.id = "PowerIcon"
	PowerIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 95, 0, 0 )
	PowerIcon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.powerAlpha:GetModel( f6_local1 ) )
	PowerIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.powerIcon:GetModel( f6_local1 ), function ()
		local f7_local0 = DataSources.inGame.MP.killcam.killedby.powerIcon:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			PowerIcon:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( PowerIcon )
	self.PowerIcon = PowerIcon
	
	local KillstreakIcon = nil
	
	KillstreakIcon = LUI.UIImage.new()
	KillstreakIcon.id = "KillstreakIcon"
	KillstreakIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 95, 0, 0 )
	KillstreakIcon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.killstreakAlpha:GetModel( f6_local1 ) )
	KillstreakIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.killstreakIcon:GetModel( f6_local1 ), function ()
		local f8_local0 = DataSources.inGame.MP.killcam.killedby.killstreakIcon:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			KillstreakIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( KillstreakIcon )
	self.KillstreakIcon = KillstreakIcon
	
	local MiscIcon = nil
	
	MiscIcon = LUI.UIImage.new()
	MiscIcon.id = "MiscIcon"
	MiscIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 95, 0, 0 )
	MiscIcon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.miscAlpha:GetModel( f6_local1 ) )
	MiscIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.miscIcon:GetModel( f6_local1 ), function ()
		local f9_local0 = DataSources.inGame.MP.killcam.killedby.miscIcon:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			MiscIcon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( MiscIcon )
	self.MiscIcon = MiscIcon
	
	local SuperIcon = nil
	
	SuperIcon = LUI.UIImage.new()
	SuperIcon.id = "SuperIcon"
	SuperIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 95, 0, 0 )
	SuperIcon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.superAlpha:GetModel( f6_local1 ) )
	SuperIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.superIcon:GetModel( f6_local1 ), function ()
		local f10_local0 = DataSources.inGame.MP.killcam.killedby.superIcon:GetValue( f6_local1 )
		if f10_local0 ~= nil then
			SuperIcon:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( SuperIcon )
	self.SuperIcon = SuperIcon
	
	local LootColorFillPassives = nil
	
	LootColorFillPassives = LUI.UIImage.new()
	LootColorFillPassives.id = "LootColorFillPassives"
	LootColorFillPassives:SetAlpha( 0.3, 0 )
	LootColorFillPassives:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -370, _1080p * -27, _1080p * 50, 0 )
	LootColorFillPassives:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( LootColorFillPassives )
	self.LootColorFillPassives = LootColorFillPassives
	
	local LootColorFillWeaponText = nil
	
	LootColorFillWeaponText = LUI.UIImage.new()
	LootColorFillWeaponText.id = "LootColorFillWeaponText"
	LootColorFillWeaponText:SetAlpha( 0.5, 0 )
	LootColorFillWeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -370, _1080p * -27, 0, _1080p * -50 )
	LootColorFillWeaponText:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( LootColorFillWeaponText )
	self.LootColorFillWeaponText = LootColorFillWeaponText
	
	local LootColorBarRight = nil
	
	LootColorBarRight = LUI.UIImage.new()
	LootColorBarRight.id = "LootColorBarRight"
	LootColorBarRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 381, _1080p * 389, 0, 0 )
	LootColorBarRight:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( LootColorBarRight )
	self.LootColorBarRight = LootColorBarRight
	
	local LootColorBarleft = nil
	
	LootColorBarleft = LUI.UIImage.new()
	LootColorBarleft.id = "LootColorBarleft"
	LootColorBarleft:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -378, _1080p * -370, 0, 0 )
	LootColorBarleft:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
	self:addElement( LootColorBarleft )
	self.LootColorBarleft = LootColorBarleft
	
	local Attachment1 = nil
	
	Attachment1 = LUI.UIImage.new()
	Attachment1.id = "Attachment1"
	Attachment1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 207, _1080p * 255, _1080p * 2, _1080p * 50 )
	Attachment1:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.attachment1Alpha:GetModel( f6_local1 ) )
	Attachment1:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.attachment1Icon:GetModel( f6_local1 ), function ()
		local f11_local0 = DataSources.inGame.MP.killcam.killedby.attachment1Icon:GetValue( f6_local1 )
		if f11_local0 ~= nil then
			Attachment1:setImage( RegisterMaterial( f11_local0 ), 0 )
		end
	end )
	self:addElement( Attachment1 )
	self.Attachment1 = Attachment1
	
	local Attachment2 = nil
	
	Attachment2 = LUI.UIImage.new()
	Attachment2.id = "Attachment2"
	Attachment2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 265, _1080p * 313, _1080p * 2, _1080p * 50 )
	Attachment2:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.attachment2Alpha:GetModel( f6_local1 ) )
	Attachment2:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.attachment2Icon:GetModel( f6_local1 ), function ()
		local f12_local0 = DataSources.inGame.MP.killcam.killedby.attachment2Icon:GetValue( f6_local1 )
		if f12_local0 ~= nil then
			Attachment2:setImage( RegisterMaterial( f12_local0 ), 0 )
		end
	end )
	self:addElement( Attachment2 )
	self.Attachment2 = Attachment2
	
	local Attachment3 = nil
	
	Attachment3 = LUI.UIImage.new()
	Attachment3.id = "Attachment3"
	Attachment3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 323, _1080p * 371, _1080p * 2, _1080p * 50 )
	Attachment3:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.attachment3Alpha:GetModel( f6_local1 ) )
	Attachment3:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.attachment3Icon:GetModel( f6_local1 ), function ()
		local f13_local0 = DataSources.inGame.MP.killcam.killedby.attachment3Icon:GetValue( f6_local1 )
		if f13_local0 ~= nil then
			Attachment3:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	self:addElement( Attachment3 )
	self.Attachment3 = Attachment3
	
	local Attachment4 = nil
	
	Attachment4 = LUI.UIImage.new()
	Attachment4.id = "Attachment4"
	Attachment4:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 207, _1080p * 255, _1080p * -50, _1080p * -2 )
	Attachment4:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.attachment4Alpha:GetModel( f6_local1 ) )
	Attachment4:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.attachment4Icon:GetModel( f6_local1 ), function ()
		local f14_local0 = DataSources.inGame.MP.killcam.killedby.attachment4Icon:GetValue( f6_local1 )
		if f14_local0 ~= nil then
			Attachment4:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	self:addElement( Attachment4 )
	self.Attachment4 = Attachment4
	
	local Attachment5 = nil
	
	Attachment5 = LUI.UIImage.new()
	Attachment5.id = "Attachment5"
	Attachment5:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 265, _1080p * 313, _1080p * -50, _1080p * -2 )
	Attachment5:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.attachment5Alpha:GetModel( f6_local1 ) )
	Attachment5:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.attachment5Icon:GetModel( f6_local1 ), function ()
		local f15_local0 = DataSources.inGame.MP.killcam.killedby.attachment5Icon:GetValue( f6_local1 )
		if f15_local0 ~= nil then
			Attachment5:setImage( RegisterMaterial( f15_local0 ), 0 )
		end
	end )
	self:addElement( Attachment5 )
	self.Attachment5 = Attachment5
	
	local Attachment6 = nil
	
	Attachment6 = LUI.UIImage.new()
	Attachment6.id = "Attachment6"
	Attachment6:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 323, _1080p * 371, _1080p * -50, _1080p * -2 )
	Attachment6:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.attachment6Alpha:GetModel( f6_local1 ) )
	Attachment6:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.attachment6Icon:GetModel( f6_local1 ), function ()
		local f16_local0 = DataSources.inGame.MP.killcam.killedby.attachment6Icon:GetValue( f6_local1 )
		if f16_local0 ~= nil then
			Attachment6:setImage( RegisterMaterial( f16_local0 ), 0 )
		end
	end )
	self:addElement( Attachment6 )
	self.Attachment6 = Attachment6
	
	local WeaponIcon = nil
	
	WeaponIcon = LUI.UIImage.new()
	WeaponIcon.id = "WeaponIcon"
	WeaponIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -15, _1080p * 185, 0, 0 )
	WeaponIcon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.weaponAlpha:GetModel( f6_local1 ) )
	WeaponIcon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponIcon:GetModel( f6_local1 ), function ()
		local f17_local0 = DataSources.inGame.MP.killcam.killedby.weaponIcon:GetValue( f6_local1 )
		if f17_local0 ~= nil then
			WeaponIcon:setImage( RegisterMaterial( f17_local0 ), 0 )
		end
	end )
	self:addElement( WeaponIcon )
	self.WeaponIcon = WeaponIcon
	
	local WeaponText = nil
	
	WeaponText = LUI.UIText.new()
	WeaponText.id = "WeaponText"
	WeaponText:SetFontSize( 24 * _1080p )
	WeaponText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	WeaponText:SetAlignment( LUI.Alignment.Left )
	WeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -365, _1080p * -33, 0, _1080p * 24 )
	WeaponText:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.itemName:GetModel( f6_local1 ), function ()
		local f18_local0 = DataSources.inGame.MP.killcam.killedby.itemName:GetValue( f6_local1 )
		if f18_local0 ~= nil then
			WeaponText:setText( ToUpperCase( LocalizeString( f18_local0 ) ), 0 )
		end
	end )
	self:addElement( WeaponText )
	self.WeaponText = WeaponText
	
	local Passive1Icon = nil
	
	Passive1Icon = LUI.UIImage.new()
	Passive1Icon.id = "Passive1Icon"
	Passive1Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -305, _1080p * -260, _1080p * -48, _1080p * -3 )
	Passive1Icon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.passive1IconAlpha:GetModel( f6_local1 ) )
	Passive1Icon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.passive1Icon:GetModel( f6_local1 ), function ()
		local f19_local0 = DataSources.inGame.MP.killcam.killedby.passive1Icon:GetValue( f6_local1 )
		if f19_local0 ~= nil then
			Passive1Icon:setImage( RegisterMaterial( f19_local0 ), 0 )
		end
	end )
	self:addElement( Passive1Icon )
	self.Passive1Icon = Passive1Icon
	
	local Passive2Icon = nil
	
	Passive2Icon = LUI.UIImage.new()
	Passive2Icon.id = "Passive2Icon"
	Passive2Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -250, _1080p * -205, _1080p * -48, _1080p * -3 )
	Passive2Icon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.passive2IconAlpha:GetModel( f6_local1 ) )
	Passive2Icon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.passive2Icon:GetModel( f6_local1 ), function ()
		local f20_local0 = DataSources.inGame.MP.killcam.killedby.passive2Icon:GetValue( f6_local1 )
		if f20_local0 ~= nil then
			Passive2Icon:setImage( RegisterMaterial( f20_local0 ), 0 )
		end
	end )
	self:addElement( Passive2Icon )
	self.Passive2Icon = Passive2Icon
	
	local Passive3Icon = nil
	
	Passive3Icon = LUI.UIImage.new()
	Passive3Icon.id = "Passive3Icon"
	Passive3Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -195, _1080p * -150, _1080p * -48, _1080p * -3 )
	Passive3Icon:BindAlphaToModel( DataSources.inGame.MP.killcam.killedby.passive3IconAlpha:GetModel( f6_local1 ) )
	Passive3Icon:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.passive3Icon:GetModel( f6_local1 ), function ()
		local f21_local0 = DataSources.inGame.MP.killcam.killedby.passive3Icon:GetValue( f6_local1 )
		if f21_local0 ~= nil then
			Passive3Icon:setImage( RegisterMaterial( f21_local0 ), 0 )
		end
	end )
	self:addElement( Passive3Icon )
	self.Passive3Icon = Passive3Icon
	
	local KillcamPerkInfoContainer = nil
	
	KillcamPerkInfoContainer = MenuBuilder.BuildRegisteredType( "KillcamPerkInfoContainer", {
		controllerIndex = f6_local1
	} )
	KillcamPerkInfoContainer.id = "KillcamPerkInfoContainer"
	KillcamPerkInfoContainer:SetDataSource( DataSources.inGame.MP.killcam.killedby.perkList, f6_local1 )
	KillcamPerkInfoContainer:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 420, _1080p * 804, 0, 0 )
	self:addElement( KillcamPerkInfoContainer )
	self.KillcamPerkInfoContainer = KillcamPerkInfoContainer
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 0,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	Border:SetRGBFromTable( SWATCHES.genericMenu.border, 0 )
	Border:SetBorderThicknessLeft( _1080p * 0, 0 )
	Border:SetBorderThicknessRight( _1080p * 0, 0 )
	Border:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * 1 )
	self:addElement( Border )
	self.Border = Border
	
	local PlayerCard = nil
	
	PlayerCard = MenuBuilder.BuildRegisteredType( "SmallPlayerCard", {
		controllerIndex = f6_local1
	} )
	PlayerCard.id = "PlayerCard"
	PlayerCard:SetScale( -0.15, 0 )
	PlayerCard:SetDataSource( DataSources.inGame.MP.killcam.killedby.playerCard, f6_local1 )
	PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -846, _1080p * -428, _1080p * -9.5, _1080p * 9.5 )
	self:addElement( PlayerCard )
	self.PlayerCard = PlayerCard
	
	local KilledBy = nil
	
	KilledBy = LUI.UIStyledText.new()
	KilledBy.id = "KilledBy"
	KilledBy:setText( "", 0 )
	KilledBy:SetFontSize( 26 * _1080p )
	KilledBy:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	KilledBy:SetAlignment( LUI.Alignment.Left )
	KilledBy:SetShadowMinDistance( -0.2, 0 )
	KilledBy:SetShadowMaxDistance( 0.2, 0 )
	KilledBy:SetShadowRGBFromInt( 0, 0 )
	KilledBy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 573, _1080p * -35.5, _1080p * -9.5 )
	self:addElement( KilledBy )
	self.KilledBy = KilledBy
	
	local FactionIcon = nil
	
	FactionIcon = LUI.UIImage.new()
	FactionIcon.id = "FactionIcon"
	FactionIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 28, _1080p * 128, _1080p * -50, _1080p * 50 )
	self:addElement( FactionIcon )
	self.FactionIcon = FactionIcon
	
	local MK2 = nil
	
	MK2 = LUI.UIImage.new()
	MK2.id = "MK2"
	MK2:SetAlpha( 0.5, 0 )
	MK2:setImage( RegisterMaterial( "mk2_watermark_1" ), 0 )
	MK2:SetBlendMode( BLEND_MODE.addWithAlpha )
	MK2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 866, _1080p * 930, _1080p * 22, _1080p * 54 )
	self:addElement( MK2 )
	self.MK2 = MK2
	
	local f6_local32 = nil
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		f6_local32 = MenuBuilder.BuildRegisteredType( "QualityIcon", {
			controllerIndex = f6_local1
		} )
		f6_local32.id = "QualityIcon"
		f6_local32.IconShadow:SetAlpha( 0.2, 0 )
		f6_local32:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -360, _1080p * -315, _1080p * -48, _1080p * -3 )
		f6_local32:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetModel( f6_local1 ), function ()
			local f22_local0 = DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetValue( f6_local1 )
			if f22_local0 ~= nil then
				f6_local32.IconShadow:setImage( RegisterMaterial( f22_local0 ), 0 )
			end
		end )
		f6_local32.Icon:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
		f6_local32:SubscribeToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetModel( f6_local1 ), function ()
			local f23_local0 = DataSources.inGame.MP.killcam.killedby.weaponLootRarityIcon:GetValue( f6_local1 )
			if f23_local0 ~= nil then
				f6_local32.Icon:setImage( RegisterMaterial( f23_local0 ), 0 )
			end
		end )
		f6_local32.IconDuplicate:BindColorToModel( DataSources.inGame.MP.killcam.killedby.weaponLootRarityColor:GetModel( f6_local1 ) )
		self:addElement( f6_local32 )
		self.QualityIcon = f6_local32
	end
	local VictimName = nil
	
	VictimName = LUI.UIStyledText.new()
	VictimName.id = "VictimName"
	VictimName:SetAlpha( 0, 0 )
	VictimName:setText( "", 0 )
	VictimName:SetFontSize( 26 * _1080p )
	VictimName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	VictimName:SetAlignment( LUI.Alignment.Left )
	VictimName:SetShadowMinDistance( -0.2, 0 )
	VictimName:SetShadowMaxDistance( 0.2, 0 )
	VictimName:SetShadowRGBFromInt( 0, 0 )
	VictimName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 37, _1080p * 573, _1080p * -60.5, _1080p * -34.5 )
	self:addElement( VictimName )
	self.VictimName = VictimName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LootColorFillAttachments:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.LootColorFillAttachments:SetAlpha( 0.5, 0 )
				end
			},
			{
				function ()
					return self.LootColorFillAttachments:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 287, _1080p * 471, 0, 0, 0 )
				end
			}
		} )
		LootColorFill:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.LootColorFill:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 65, _1080p * 285, 0, 0, 0 )
				end
			}
		} )
		MK2Pattern:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.MK2Pattern:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 680, _1080p * -489, _1080p * -1, _1080p * 101, 0 )
				end
			}
		} )
		PowerIcon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.PowerIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 85, _1080p * 185, 0, 0, 0 )
				end
			}
		} )
		KillstreakIcon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.KillstreakIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 85, _1080p * 185, 0, 0, 0 )
				end
			}
		} )
		MiscIcon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.MiscIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 85, _1080p * 185, 0, 0, 0 )
				end
			}
		} )
		SuperIcon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.SuperIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 85, _1080p * 185, 0, 0, 0 )
				end
			}
		} )
		LootColorFillPassives:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.LootColorFillPassives:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -280, _1080p * 63, _1080p * 50, 0, 0 )
				end
			}
		} )
		LootColorFillWeaponText:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.LootColorFillWeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -280, _1080p * 63, 0, _1080p * -50, 0 )
				end
			}
		} )
		LootColorBarRight:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.LootColorBarRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 471, _1080p * 479, 0, 0, 0 )
				end
			}
		} )
		LootColorBarleft:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.LootColorBarleft:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -288, _1080p * -280, 0, 0, 0 )
				end
			}
		} )
		Attachment1:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Attachment1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 297, _1080p * 345, _1080p * 2, _1080p * 50, 0 )
				end
			}
		} )
		Attachment2:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Attachment2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 355, _1080p * 403, _1080p * 2, _1080p * 50, 0 )
				end
			}
		} )
		Attachment3:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Attachment3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 413, _1080p * 461, _1080p * 2, _1080p * 50, 0 )
				end
			}
		} )
		Attachment4:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Attachment4:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 297, _1080p * 345, _1080p * -50, _1080p * -2, 0 )
				end
			}
		} )
		Attachment5:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Attachment5:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 355, _1080p * 403, _1080p * -50, _1080p * -2, 0 )
				end
			}
		} )
		Attachment6:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Attachment6:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 413, _1080p * 461, _1080p * -50, _1080p * -2, 0 )
				end
			}
		} )
		WeaponIcon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.WeaponIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 75, _1080p * 275, 0, 0, 0 )
				end
			}
		} )
		WeaponText:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.WeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -275, _1080p * 57, 0, _1080p * 28, 0 )
				end
			}
		} )
		Passive1Icon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Passive1Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -215, _1080p * -170, _1080p * -48, _1080p * -3, 0 )
				end
			}
		} )
		Passive2Icon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Passive2Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -160, _1080p * -115, _1080p * -48, _1080p * -3, 0 )
				end
			}
		} )
		Passive3Icon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.Passive3Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -105, _1080p * -60, _1080p * -48, _1080p * -3, 0 )
				end
			}
		} )
		KillcamPerkInfoContainer:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.KillcamPerkInfoContainer:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 510, _1080p * 894, 0, 0, 0 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.PlayerCard:SetScale( -0.15, 0 )
				end
			},
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -754, _1080p * -336, _1080p * -9.5, _1080p * 9.5, 0 )
				end
			}
		} )
		KilledBy:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.KilledBy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 676, _1080p * -32, _1080p * -6, 0 )
				end
			}
		} )
		FactionIcon:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.FactionIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 126, _1080p * 226, _1080p * -50, _1080p * 50, 0 )
				end
			}
		} )
		MK2:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.MK2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 956, _1080p * 1020, _1080p * 22, _1080p * 54, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f6_local32:RegisterAnimationSequence( "DefaultLayout", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -270, _1080p * -225, _1080p * -48, _1080p * -3, 0 )
					end
				}
			} )
		end
		VictimName:RegisterAnimationSequence( "DefaultLayout", {
			{
				function ()
					return self.VictimName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 676, _1080p * -60.5, _1080p * -34.5, 0 )
				end
			}
		} )
		self._sequences.DefaultLayout = function ()
			LootColorFillAttachments:AnimateSequence( "DefaultLayout" )
			LootColorFill:AnimateSequence( "DefaultLayout" )
			MK2Pattern:AnimateSequence( "DefaultLayout" )
			PowerIcon:AnimateSequence( "DefaultLayout" )
			KillstreakIcon:AnimateSequence( "DefaultLayout" )
			MiscIcon:AnimateSequence( "DefaultLayout" )
			SuperIcon:AnimateSequence( "DefaultLayout" )
			LootColorFillPassives:AnimateSequence( "DefaultLayout" )
			LootColorFillWeaponText:AnimateSequence( "DefaultLayout" )
			LootColorBarRight:AnimateSequence( "DefaultLayout" )
			LootColorBarleft:AnimateSequence( "DefaultLayout" )
			Attachment1:AnimateSequence( "DefaultLayout" )
			Attachment2:AnimateSequence( "DefaultLayout" )
			Attachment3:AnimateSequence( "DefaultLayout" )
			Attachment4:AnimateSequence( "DefaultLayout" )
			Attachment5:AnimateSequence( "DefaultLayout" )
			Attachment6:AnimateSequence( "DefaultLayout" )
			WeaponIcon:AnimateSequence( "DefaultLayout" )
			WeaponText:AnimateSequence( "DefaultLayout" )
			Passive1Icon:AnimateSequence( "DefaultLayout" )
			Passive2Icon:AnimateSequence( "DefaultLayout" )
			Passive3Icon:AnimateSequence( "DefaultLayout" )
			KillcamPerkInfoContainer:AnimateSequence( "DefaultLayout" )
			PlayerCard:AnimateSequence( "DefaultLayout" )
			KilledBy:AnimateSequence( "DefaultLayout" )
			FactionIcon:AnimateSequence( "DefaultLayout" )
			MK2:AnimateSequence( "DefaultLayout" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f6_local32:AnimateSequence( "DefaultLayout" )
			end
			VictimName:AnimateSequence( "DefaultLayout" )
		end
		
		LootColorFillAttachments:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.LootColorFillAttachments:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.LootColorFillAttachments:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 242, _1080p * 426, 0, 0, 0 )
				end
			}
		} )
		LootColorFill:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.LootColorFill:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 205, _1080p * 345, 0, 0, 0 )
				end
			}
		} )
		MK2Pattern:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.MK2Pattern:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 685.5, _1080p * 1197.5, _1080p * -204, _1080p * 308, 0 )
				end
			}
		} )
		PowerIcon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.PowerIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 225, _1080p * 325, 0, 0, 0 )
				end
			}
		} )
		KillstreakIcon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.KillstreakIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 225, _1080p * 325, 0, 0, 0 )
				end
			}
		} )
		MiscIcon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.MiscIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 225, _1080p * 325, 0, 0, 0 )
				end
			}
		} )
		SuperIcon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.SuperIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 225, _1080p * 325, 0, 0, 0 )
				end
			}
		} )
		LootColorFillPassives:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.LootColorFillPassives:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -240, _1080p * 203, _1080p * 50, 0, 0 )
				end
			}
		} )
		LootColorFillWeaponText:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.LootColorFillWeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -240, _1080p * 203, 0, _1080p * -50, 0 )
				end
			}
		} )
		LootColorBarRight:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.LootColorBarRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 345, _1080p * 353, 0, 0, 0 )
				end
			}
		} )
		LootColorBarleft:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.LootColorBarleft:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -248, _1080p * -240, 0, 0, 0 )
				end
			}
		} )
		Attachment1:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Attachment1:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 252, _1080p * 300, _1080p * 2, _1080p * 50, 0 )
				end
			}
		} )
		Attachment2:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Attachment2:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 310, _1080p * 358, _1080p * 2, _1080p * 50, 0 )
				end
			}
		} )
		Attachment3:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Attachment3:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 368, _1080p * 416, _1080p * 2, _1080p * 50, 0 )
				end
			}
		} )
		Attachment4:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Attachment4:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 252, _1080p * 300, _1080p * -50, _1080p * -2, 0 )
				end
			}
		} )
		Attachment5:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Attachment5:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 310, _1080p * 358, _1080p * -50, _1080p * -2, 0 )
				end
			}
		} )
		Attachment6:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Attachment6:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * 368, _1080p * 416, _1080p * -50, _1080p * -2, 0 )
				end
			}
		} )
		WeaponIcon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.WeaponIcon:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 30, _1080p * 230, 0, 0, 0 )
				end
			}
		} )
		WeaponText:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.WeaponText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -236.5, _1080p * 95.5, 0, _1080p * 28, 0 )
				end
			}
		} )
		Passive1Icon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Passive1Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -180, _1080p * -135, _1080p * -48, _1080p * -3, 0 )
				end
			}
		} )
		Passive2Icon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Passive2Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -125, _1080p * -80, _1080p * -48, _1080p * -3, 0 )
				end
			}
		} )
		Passive3Icon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.Passive3Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -70, _1080p * -25, _1080p * -48, _1080p * -3, 0 )
				end
			}
		} )
		KillcamPerkInfoContainer:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.KillcamPerkInfoContainer:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * 390, _1080p * 774, 0, 0, 0 )
				end
			}
		} )
		PlayerCard:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.PlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -711, _1080p * -293, _1080p * -9.5, _1080p * 9.5, 0 )
				end
			}
		} )
		KilledBy:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.KilledBy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 159, _1080p * 729, _1080p * -54, _1080p * -28, 0 )
				end
			}
		} )
		FactionIcon:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.FactionIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 175, _1080p * 275, _1080p * -50, _1080p * 50, 0 )
				end
			}
		} )
		if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
			f6_local32:RegisterAnimationSequence( "AlternateLayout", {
				{
					function ()
						return self.QualityIcon:SetAlpha( 0, 0 )
					end
				},
				{
					function ()
						return self.QualityIcon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -235, _1080p * -190, _1080p * -48, _1080p * -3, 0 )
					end
				}
			} )
		end
		VictimName:RegisterAnimationSequence( "AlternateLayout", {
			{
				function ()
					return self.VictimName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 159, _1080p * 695, _1080p * -76.5, _1080p * -50.5, 0 )
				end
			}
		} )
		self._sequences.AlternateLayout = function ()
			LootColorFillAttachments:AnimateSequence( "AlternateLayout" )
			LootColorFill:AnimateSequence( "AlternateLayout" )
			MK2Pattern:AnimateSequence( "AlternateLayout" )
			PowerIcon:AnimateSequence( "AlternateLayout" )
			KillstreakIcon:AnimateSequence( "AlternateLayout" )
			MiscIcon:AnimateSequence( "AlternateLayout" )
			SuperIcon:AnimateSequence( "AlternateLayout" )
			LootColorFillPassives:AnimateSequence( "AlternateLayout" )
			LootColorFillWeaponText:AnimateSequence( "AlternateLayout" )
			LootColorBarRight:AnimateSequence( "AlternateLayout" )
			LootColorBarleft:AnimateSequence( "AlternateLayout" )
			Attachment1:AnimateSequence( "AlternateLayout" )
			Attachment2:AnimateSequence( "AlternateLayout" )
			Attachment3:AnimateSequence( "AlternateLayout" )
			Attachment4:AnimateSequence( "AlternateLayout" )
			Attachment5:AnimateSequence( "AlternateLayout" )
			Attachment6:AnimateSequence( "AlternateLayout" )
			WeaponIcon:AnimateSequence( "AlternateLayout" )
			WeaponText:AnimateSequence( "AlternateLayout" )
			Passive1Icon:AnimateSequence( "AlternateLayout" )
			Passive2Icon:AnimateSequence( "AlternateLayout" )
			Passive3Icon:AnimateSequence( "AlternateLayout" )
			KillcamPerkInfoContainer:AnimateSequence( "AlternateLayout" )
			PlayerCard:AnimateSequence( "AlternateLayout" )
			KilledBy:AnimateSequence( "AlternateLayout" )
			FactionIcon:AnimateSequence( "AlternateLayout" )
			if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
				f6_local32:AnimateSequence( "AlternateLayout" )
			end
			VictimName:AnimateSequence( "AlternateLayout" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	KillcamPerkInfoContainer:SetDataSource( DataSources.inGame.MP.killcam.killedby.perkList, f6_local1 )
	PlayerCard:SetDataSource( DataSources.inGame.MP.killcam.killedby.playerCard, f6_local1 )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "KillcamWeaponInfo", KillcamWeaponInfo )
LockTable( _M )
