local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function FateCardSelectionWidget( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 219 * _1080p, 0, 284 * _1080p )
	self.id = "FateCardSelectionWidget"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ZomHighlightedConsumable = nil
	
	ZomHighlightedConsumable = MenuBuilder.BuildRegisteredType( "ZomHighlightedConsumable", {
		controllerIndex = f1_local1
	} )
	ZomHighlightedConsumable.id = "ZomHighlightedConsumable"
	ZomHighlightedConsumable:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 136, 0, _1080p * 189 )
	self:addElement( ZomHighlightedConsumable )
	self.ZomHighlightedConsumable = ZomHighlightedConsumable
	
	return self
end

MenuBuilder.registerType( "FateCardSelectionWidget", FateCardSelectionWidget )
LockTable( _M )
