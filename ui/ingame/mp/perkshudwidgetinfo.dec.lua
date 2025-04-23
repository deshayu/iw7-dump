local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.PerkText )
	local f1_local0 = f1_arg0.PerkText
	f1_local0:SetDecodeParams( 20, 5, 10 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
end

function PerksHUDWidgetInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 50 * _1080p )
	self.id = "PerksHUDWidgetInfo"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local PerkIcon = nil
	
	PerkIcon = LUI.UIImage.new()
	PerkIcon.id = "PerkIcon"
	PerkIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -64, 0, _1080p * -32, _1080p * 32 )
	PerkIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.icon:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			PerkIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( PerkIcon )
	self.PerkIcon = PerkIcon
	
	local PerkText = nil
	
	PerkText = LUI.UIStyledText.new()
	PerkText.id = "PerkText"
	PerkText:SetFontSize( 30 * _1080p )
	PerkText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PerkText:SetAlignment( LUI.Alignment.Right )
	PerkText:SetShadowMinDistance( -0.2, 0 )
	PerkText:SetShadowMaxDistance( 0.2, 0 )
	PerkText:SetShadowRGBFromInt( 0, 0 )
	PerkText:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -500, _1080p * -74, _1080p * -15, _1080p * 15 )
	PerkText:SubscribeToModelThroughElement( self, "name", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.name:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			PerkText:setText( f4_local0, 0 )
		end
	end )
	self:addElement( PerkText )
	self.PerkText = PerkText
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PerksHUDWidgetInfo", PerksHUDWidgetInfo )
LockTable( _M )
