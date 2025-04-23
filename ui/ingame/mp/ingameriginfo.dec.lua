local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InGameRigInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 255 * _1080p )
	self.id = "InGameRigInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local RigBacker = nil
	
	RigBacker = LUI.UIImage.new()
	RigBacker.id = "RigBacker"
	RigBacker:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	RigBacker:SetAlpha( 0.5, 0 )
	RigBacker:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 100 )
	self:addElement( RigBacker )
	self.RigBacker = RigBacker
	
	local SuperBacker = nil
	
	SuperBacker = LUI.UIImage.new()
	SuperBacker.id = "SuperBacker"
	SuperBacker:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	SuperBacker:SetAlpha( 0.5, 0 )
	SuperBacker:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 222.5, _1080p * -150, 0 )
	self:addElement( SuperBacker )
	self.SuperBacker = SuperBacker
	
	local TraitBacker = nil
	
	TraitBacker = LUI.UIImage.new()
	TraitBacker.id = "TraitBacker"
	TraitBacker:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	TraitBacker:SetAlpha( 0.5, 0 )
	TraitBacker:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -222.5, 0, _1080p * -150, 0 )
	self:addElement( TraitBacker )
	self.TraitBacker = TraitBacker
	
	local RigIcon = nil
	
	RigIcon = LUI.UIImage.new()
	RigIcon.id = "RigIcon"
	RigIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7, _1080p * 155, _1080p * 13.5, _1080p * 87.5 )
	RigIcon:SubscribeToModelThroughElement( self, "rigIcon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.rigIcon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RigIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( RigIcon )
	self.RigIcon = RigIcon
	
	local RigName = nil
	
	RigName = LUI.UIStyledText.new()
	RigName.id = "RigName"
	RigName:SetFontSize( 45 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RigName:SetAlignment( LUI.Alignment.Left )
	RigName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 155, _1080p * 442, _1080p * 28, _1080p * 73 )
	RigName:SubscribeToModelThroughElement( self, "name", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.name:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			RigName:setText( f3_local0, 0 )
		end
	end )
	self:addElement( RigName )
	self.RigName = RigName
	
	local SuperIcon = nil
	
	SuperIcon = LUI.UIImage.new()
	SuperIcon.id = "SuperIcon"
	SuperIcon:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 69.12, _1080p * 153.38, _1080p * -98.25, _1080p * -14 )
	SuperIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.icon:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			SuperIcon:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( SuperIcon )
	self.SuperIcon = SuperIcon
	
	local SuperName = nil
	
	SuperName = LUI.UIStyledText.new()
	SuperName.id = "SuperName"
	SuperName:SetFontSize( 32 * _1080p )
	SuperName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	SuperName:SetAlignment( LUI.Alignment.Center )
	SuperName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 8, _1080p * 214.5, _1080p * 113, _1080p * 145 )
	SuperName:SubscribeToModelThroughElement( self, "superName", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.superName:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			SuperName:setText( f5_local0, 0 )
		end
	end )
	self:addElement( SuperName )
	self.SuperName = SuperName
	
	local TraitIcon = nil
	
	TraitIcon = LUI.UIImage.new()
	TraitIcon.id = "TraitIcon"
	TraitIcon:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -153.38, _1080p * -69.12, _1080p * -98.25, _1080p * -14 )
	TraitIcon:SubscribeToModelThroughElement( self, "archetypePerk.icon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.archetypePerk.icon:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			TraitIcon:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( TraitIcon )
	self.TraitIcon = TraitIcon
	
	local TraitName = nil
	
	TraitName = LUI.UIStyledText.new()
	TraitName.id = "TraitName"
	TraitName:SetFontSize( 32 * _1080p )
	TraitName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TraitName:SetAlignment( LUI.Alignment.Center )
	TraitName:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -214.5, _1080p * -8, _1080p * 113, _1080p * 145 )
	TraitName:SubscribeToModelThroughElement( self, "archetypePerk.name", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.archetypePerk.name:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			TraitName:setText( f7_local0, 0 )
		end
	end )
	self:addElement( TraitName )
	self.TraitName = TraitName
	
	return self
end

MenuBuilder.registerType( "InGameRigInfo", InGameRigInfo )
LockTable( _M )
