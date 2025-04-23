local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPPerkIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 52 * _1080p, 0, 40 * _1080p )
	self.id = "CPPerkIcon"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local PerkIcon = nil
	
	PerkIcon = LUI.UIImage.new()
	PerkIcon.id = "PerkIcon"
	PerkIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -5, _1080p * 59, _1080p * -13, _1080p * 51 )
	PerkIcon:SubscribeToModelThroughElement( self, "icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			PerkIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( PerkIcon )
	self.PerkIcon = PerkIcon
	
	return self
end

MenuBuilder.registerType( "CPPerkIcon", CPPerkIcon )
LockTable( _M )
