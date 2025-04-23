local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0.AttachmentsOne.SlotOne:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotOne" )
		f2_arg0.AttachmentsOne.SlotTwo:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotTwo" )
		f2_arg0.AttachmentsOne.SlotThree:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotThree" )
		if f2_arg1 then
			f2_arg0.Overkill:SetDataSourceThroughElement( f1_arg0, "overkill" )
			f2_arg0.AttachmentsTwo.SlotTwo:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotFour" )
			f2_arg0.AttachmentsTwo.SlotThree:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotFive" )
		else
			f2_arg0.AttachmentsTwo.SlotOne:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotFour" )
			f2_arg0.AttachmentsTwo.SlotTwo:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotFive" )
			f2_arg0.AttachmentsTwo.SlotThree:SetDataSourceThroughElement( f2_arg0, "attachments.attachmentSlotSix" )
		end
	end
	
	f1_local0( f1_arg0.WeaponOne, false )
	f1_local0( f1_arg0.WeaponTwo, true )
end

function CACSplitscreenWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 885 * _1080p, 0, 418 * _1080p )
	self.id = "CACSplitscreenWrapper"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if Engine.InFrontend() then
		f3_local3 = LUI.UIBlur.new()
		f3_local3.id = "LoadoutBlur"
		f3_local3:SetBlurStrength( 2.75, 0 )
		self:addElement( f3_local3 )
		self.LoadoutBlur = f3_local3
	end
	local f3_local4 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local4 = LUI.UIImage.new()
		f3_local4.id = "AttachmentPrimaryBacker"
		f3_local4:SetRGBFromInt( 5066061, 0 )
		f3_local4:SetAlpha( 0.6, 0 )
		f3_local4:setImage( RegisterMaterial( "pick10_grid_6" ), 0 )
		f3_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 590, _1080p * 24, _1080p * 206 )
		self:addElement( f3_local4 )
		self.AttachmentPrimaryBacker = f3_local4
	end
	local f3_local5 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local5 = LUI.UIImage.new()
		f3_local5.id = "PrimaryWeaponBacker"
		f3_local5:SetRGBFromInt( 5066061, 0 )
		f3_local5:SetAlpha( 0.6, 0 )
		f3_local5:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 24, _1080p * 206 )
		self:addElement( f3_local5 )
		self.PrimaryWeaponBacker = f3_local5
	end
	local WeaponOne = nil
	
	WeaponOne = MenuBuilder.BuildRegisteredType( "FramedWeapon", {
		controllerIndex = f3_local1
	} )
	WeaponOne.id = "WeaponOne"
	WeaponOne:SetDataSourceThroughElement( self, "weaponSlotOne" )
	WeaponOne:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 590, 0, _1080p * 206 )
	self:addElement( WeaponOne )
	self.WeaponOne = WeaponOne
	
	local f3_local7 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local7 = LUI.UIImage.new()
		f3_local7.id = "AttachmentSecondaryBacker"
		f3_local7:SetRGBFromInt( 5066061, 0 )
		f3_local7:SetAlpha( 0.6, 0 )
		f3_local7:setImage( RegisterMaterial( "pick10_grid_6" ), 0 )
		f3_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 301, _1080p * 590, _1080p * 236, _1080p * 418 )
		self:addElement( f3_local7 )
		self.AttachmentSecondaryBacker = f3_local7
	end
	local f3_local8 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local8 = LUI.UIImage.new()
		f3_local8.id = "SecondaryWeaponBacker"
		f3_local8:SetRGBFromInt( 5066061, 0 )
		f3_local8:SetAlpha( 0.6, 0 )
		f3_local8:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 295, _1080p * 236, _1080p * 418 )
		self:addElement( f3_local8 )
		self.SecondaryWeaponBacker = f3_local8
	end
	local WeaponTwo = nil
	
	WeaponTwo = MenuBuilder.BuildRegisteredType( "OverkillWeapon", {
		controllerIndex = f3_local1
	} )
	WeaponTwo.id = "WeaponTwo"
	WeaponTwo:SetDataSourceThroughElement( self, "weaponSlotTwo" )
	WeaponTwo.FrameLabel:setText( Engine.Localize( "MPUI_SECONDARY_WEAPON_CAPS" ), 0 )
	WeaponTwo:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 590, _1080p * 212, _1080p * 418 )
	self:addElement( WeaponTwo )
	self.WeaponTwo = WeaponTwo
	
	local f3_local10 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local10 = LUI.UIImage.new()
		f3_local10.id = "PerksBacker"
		f3_local10:SetRGBFromInt( 5066061, 0 )
		f3_local10:SetAlpha( 0.6, 0 )
		f3_local10:setImage( RegisterMaterial( "pick10_grid_6" ), 0 )
		f3_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 596, _1080p * 885, _1080p * 236, _1080p * 418 )
		self:addElement( f3_local10 )
		self.PerksBacker = f3_local10
	end
	local PerkOne = nil
	
	PerkOne = MenuBuilder.BuildRegisteredType( "FramedPerks", {
		controllerIndex = f3_local1
	} )
	PerkOne.id = "PerkOne"
	PerkOne:SetDataSourceThroughElement( self, "perkSlotOne" )
	PerkOne.FrameLabel:setText( Engine.Localize( "LUA_MENU_MP_PERK_SLOT_ONE_SHORT_CAPS" ), 0 )
	PerkOne:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 596, _1080p * 691, _1080p * 212, _1080p * 418 )
	self:addElement( PerkOne )
	self.PerkOne = PerkOne
	
	local PerkTwo = nil
	
	PerkTwo = MenuBuilder.BuildRegisteredType( "FramedPerks", {
		controllerIndex = f3_local1
	} )
	PerkTwo.id = "PerkTwo"
	PerkTwo:SetDataSourceThroughElement( self, "perkSlotTwo" )
	PerkTwo.FrameLabel:setText( Engine.Localize( "LUA_MENU_MP_PERK_SLOT_TWO_SHORT_CAPS" ), 0 )
	PerkTwo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 693, _1080p * 788, _1080p * 212, _1080p * 418 )
	self:addElement( PerkTwo )
	self.PerkTwo = PerkTwo
	
	local PerkThree = nil
	
	PerkThree = MenuBuilder.BuildRegisteredType( "FramedPerks", {
		controllerIndex = f3_local1
	} )
	PerkThree.id = "PerkThree"
	PerkThree:SetDataSourceThroughElement( self, "perkSlotThree" )
	PerkThree.FrameLabel:setText( Engine.Localize( "LUA_MENU_MP_PERK_SLOT_THREE_SHORT_CAPS" ), 0 )
	PerkThree:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 790, _1080p * 885, _1080p * 212, _1080p * 418 )
	self:addElement( PerkThree )
	self.PerkThree = PerkThree
	
	local f3_local14 = nil
	if not CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local14 = LUI.UIImage.new()
		f3_local14.id = "PowersBacker"
		f3_local14:SetRGBFromInt( 5066061, 0 )
		f3_local14:SetAlpha( 0.6, 0 )
		f3_local14:setImage( RegisterMaterial( "pick10_grid_4" ), 0 )
		f3_local14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 596, _1080p * 890, _1080p * 24, _1080p * 206 )
		self:addElement( f3_local14 )
		self.PowersBacker = f3_local14
	end
	local Equipment = nil
	
	Equipment = MenuBuilder.BuildRegisteredType( "LoadoutEquipment", {
		controllerIndex = f3_local1
	} )
	Equipment.id = "Equipment"
	Equipment:SetDataSourceThroughElement( self, nil )
	Equipment:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 596, _1080p * 885, 0, _1080p * 206 )
	self:addElement( Equipment )
	self.Equipment = Equipment
	
	WeaponOne:SetDataSourceThroughElement( self, "weaponSlotOne" )
	WeaponTwo:SetDataSourceThroughElement( self, "weaponSlotTwo" )
	PerkOne:SetDataSourceThroughElement( self, "perkSlotOne" )
	PerkTwo:SetDataSourceThroughElement( self, "perkSlotTwo" )
	PerkThree:SetDataSourceThroughElement( self, "perkSlotThree" )
	Equipment:SetDataSourceThroughElement( self, nil )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CACSplitscreenWrapper", CACSplitscreenWrapper )
LockTable( _M )
