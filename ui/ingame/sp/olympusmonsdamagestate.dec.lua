local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OlympusMonsDamageState( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 76 * _1080p, 0, 194 * _1080p )
	self.id = "OlympusMonsDamageState"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Mons = nil
	
	Mons = LUI.UIImage.new()
	Mons.id = "Mons"
	Mons:setImage( RegisterMaterial( "radar_targeting_icon_mons" ), 0 )
	Mons:SetUseAA( true )
	Mons:SetBlendMode( BLEND_MODE.addWithAlpha )
	self:addElement( Mons )
	self.Mons = Mons
	
	local Dmg1 = nil
	
	Dmg1 = LUI.UIImage.new()
	Dmg1.id = "Dmg1"
	Dmg1:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_1" ), 0 )
	Dmg1:SetUseAA( true )
	Dmg1:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg1:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc1Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg1 )
	self.Dmg1 = Dmg1
	
	local Dmg2 = nil
	
	Dmg2 = LUI.UIImage.new()
	Dmg2.id = "Dmg2"
	Dmg2:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_2" ), 0 )
	Dmg2:SetUseAA( true )
	Dmg2:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg2:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc2Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg2 )
	self.Dmg2 = Dmg2
	
	local Dmg3 = nil
	
	Dmg3 = LUI.UIImage.new()
	Dmg3.id = "Dmg3"
	Dmg3:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_3" ), 0 )
	Dmg3:SetUseAA( true )
	Dmg3:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg3:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc3Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg3 )
	self.Dmg3 = Dmg3
	
	local Dmg4 = nil
	
	Dmg4 = LUI.UIImage.new()
	Dmg4.id = "Dmg4"
	Dmg4:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_4" ), 0 )
	Dmg4:SetUseAA( true )
	Dmg4:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg4:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc4Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg4 )
	self.Dmg4 = Dmg4
	
	local Dmg5 = nil
	
	Dmg5 = LUI.UIImage.new()
	Dmg5.id = "Dmg5"
	Dmg5:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_5" ), 0 )
	Dmg5:SetUseAA( true )
	Dmg5:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg5:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc5Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg5 )
	self.Dmg5 = Dmg5
	
	local Dmg6 = nil
	
	Dmg6 = LUI.UIImage.new()
	Dmg6.id = "Dmg6"
	Dmg6:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_6" ), 0 )
	Dmg6:SetUseAA( true )
	Dmg6:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg6:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc6Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg6 )
	self.Dmg6 = Dmg6
	
	local Dmg7 = nil
	
	Dmg7 = LUI.UIImage.new()
	Dmg7.id = "Dmg7"
	Dmg7:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_7" ), 0 )
	Dmg7:SetUseAA( true )
	Dmg7:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg7:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc7Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg7 )
	self.Dmg7 = Dmg7
	
	local Dmg8 = nil
	
	Dmg8 = LUI.UIImage.new()
	Dmg8.id = "Dmg8"
	Dmg8:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_8" ), 0 )
	Dmg8:SetUseAA( true )
	Dmg8:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg8:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc8Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg8 )
	self.Dmg8 = Dmg8
	
	local Dmg9 = nil
	
	Dmg9 = LUI.UIImage.new()
	Dmg9.id = "Dmg9"
	Dmg9:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_9" ), 0 )
	Dmg9:SetUseAA( true )
	Dmg9:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg9:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc9Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg9 )
	self.Dmg9 = Dmg9
	
	local Dmg10 = nil
	
	Dmg10 = LUI.UIImage.new()
	Dmg10.id = "Dmg10"
	Dmg10:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_10" ), 0 )
	Dmg10:SetUseAA( true )
	Dmg10:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg10:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc10Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg10 )
	self.Dmg10 = Dmg10
	
	local Dmg11 = nil
	
	Dmg11 = LUI.UIImage.new()
	Dmg11.id = "Dmg11"
	Dmg11:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_11" ), 0 )
	Dmg11:SetUseAA( true )
	Dmg11:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg11:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc11Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg11 )
	self.Dmg11 = Dmg11
	
	local Dmg12 = nil
	
	Dmg12 = LUI.UIImage.new()
	Dmg12.id = "Dmg12"
	Dmg12:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_12" ), 0 )
	Dmg12:SetUseAA( true )
	Dmg12:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg12:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc12Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg12 )
	self.Dmg12 = Dmg12
	
	local Dmg13 = nil
	
	Dmg13 = LUI.UIImage.new()
	Dmg13.id = "Dmg13"
	Dmg13:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_13" ), 0 )
	Dmg13:SetUseAA( true )
	Dmg13:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg13:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc13Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg13 )
	self.Dmg13 = Dmg13
	
	local Dmg14 = nil
	
	Dmg14 = LUI.UIImage.new()
	Dmg14.id = "Dmg14"
	Dmg14:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_14" ), 0 )
	Dmg14:SetUseAA( true )
	Dmg14:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg14:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc14Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg14 )
	self.Dmg14 = Dmg14
	
	local Dmg15 = nil
	
	Dmg15 = LUI.UIImage.new()
	Dmg15.id = "Dmg15"
	Dmg15:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_15" ), 0 )
	Dmg15:SetUseAA( true )
	Dmg15:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg15:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc15Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg15 )
	self.Dmg15 = Dmg15
	
	local Dmg16 = nil
	
	Dmg16 = LUI.UIImage.new()
	Dmg16.id = "Dmg16"
	Dmg16:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_16" ), 0 )
	Dmg16:SetUseAA( true )
	Dmg16:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg16:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc16Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg16 )
	self.Dmg16 = Dmg16
	
	local Dmg17 = nil
	
	Dmg17 = LUI.UIImage.new()
	Dmg17.id = "Dmg17"
	Dmg17:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_17" ), 0 )
	Dmg17:SetUseAA( true )
	Dmg17:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg17:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc17Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg17 )
	self.Dmg17 = Dmg17
	
	local Dmg18 = nil
	
	Dmg18 = LUI.UIImage.new()
	Dmg18.id = "Dmg18"
	Dmg18:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_18" ), 0 )
	Dmg18:SetUseAA( true )
	Dmg18:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg18:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc18Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg18 )
	self.Dmg18 = Dmg18
	
	local Dmg19 = nil
	
	Dmg19 = LUI.UIImage.new()
	Dmg19.id = "Dmg19"
	Dmg19:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_19" ), 0 )
	Dmg19:SetUseAA( true )
	Dmg19:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg19:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc19Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg19 )
	self.Dmg19 = Dmg19
	
	local Dmg20 = nil
	
	Dmg20 = LUI.UIImage.new()
	Dmg20.id = "Dmg20"
	Dmg20:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_20" ), 0 )
	Dmg20:SetUseAA( true )
	Dmg20:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg20:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc20Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg20 )
	self.Dmg20 = Dmg20
	
	local Dmg21 = nil
	
	Dmg21 = LUI.UIImage.new()
	Dmg21.id = "Dmg21"
	Dmg21:setImage( RegisterMaterial( "radar_targeting_icon_mons_dmg_21" ), 0 )
	Dmg21:SetUseAA( true )
	Dmg21:SetBlendMode( BLEND_MODE.addWithAlpha )
	Dmg21:BindAlphaToModel( DataSources.inGame.SP.heistSpace.olympusMonsDamageStateLoc21Alpha:GetModel( f1_local1 ) )
	self:addElement( Dmg21 )
	self.Dmg21 = Dmg21
	
	return self
end

MenuBuilder.registerType( "OlympusMonsDamageState", OlympusMonsDamageState )
LockTable( _M )
