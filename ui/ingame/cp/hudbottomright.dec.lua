local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	if CONDITIONS.IsSplitscreen( f1_arg0 ) then
		f1_arg0.ZomWeaponInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1300, _1080p * 1593, _1080p * 921, _1080p * 1026 )
	end
end

function HudBottomRight( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HudBottomRight"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local WonderCardFillWidget = nil
	
	WonderCardFillWidget = MenuBuilder.BuildRegisteredType( "WonderCardFillWidget", {
		controllerIndex = f2_local1
	} )
	WonderCardFillWidget.id = "WonderCardFillWidget"
	WonderCardFillWidget:SetYRotation( -16, 0 )
	WonderCardFillWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1706, _1080p * 1822, _1080p * 25, _1080p * 697 )
	self:addElement( WonderCardFillWidget )
	self.WonderCardFillWidget = WonderCardFillWidget
	
	local ZomWeaponInfo = nil
	
	ZomWeaponInfo = MenuBuilder.BuildRegisteredType( "ZomWeaponInfo", {
		controllerIndex = f2_local1
	} )
	ZomWeaponInfo.id = "ZomWeaponInfo"
	ZomWeaponInfo:SetYRotation( -16, 0 )
	ZomWeaponInfo:SetZRotation( -3, 0 )
	ZomWeaponInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1337.08, _1080p * 1630.08, _1080p * 921, _1080p * 1026 )
	self:addElement( ZomWeaponInfo )
	self.ZomWeaponInfo = ZomWeaponInfo
	
	local FateCardWidget = nil
	
	FateCardWidget = MenuBuilder.BuildRegisteredType( "FateCardWidget", {
		controllerIndex = f2_local1
	} )
	FateCardWidget.id = "FateCardWidget"
	FateCardWidget:SetYRotation( -16, 0 )
	FateCardWidget:SetZRotation( -3, 0 )
	FateCardWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1635.08, _1080p * 1888.08, _1080p * 660, _1080p * 1049 )
	self:addElement( FateCardWidget )
	self.FateCardWidget = FateCardWidget
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HudBottomRight", HudBottomRight )
LockTable( _M )
