local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionPopupSuccess( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 450 * _1080p, 0, 20 * _1080p )
	self.id = "MissionPopupSuccess"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local SuccessProbability = nil
	
	SuccessProbability = LUI.UIText.new()
	SuccessProbability.id = "SuccessProbability"
	SuccessProbability:SetRGBFromTable( SWATCHES.OpsMap.subtitle, 0 )
	SuccessProbability:setText( Engine.Localize( "OPS_MAP_SUCCESS_PROBABILITY_TITLE" ), 0 )
	SuccessProbability:SetFontSize( 20 * _1080p )
	SuccessProbability:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SuccessProbability:SetAlignment( LUI.Alignment.Right )
	SuccessProbability:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, _1080p * -10, 0, _1080p * 20 )
	self:addElement( SuccessProbability )
	self.SuccessProbability = SuccessProbability
	
	local Value = nil
	
	Value = LUI.UIText.new()
	Value.id = "Value"
	Value:setText( "", 0 )
	Value:SetFontSize( 45 * _1080p )
	Value:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Value:SetAlignment( LUI.Alignment.Right )
	Value:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 10, 0, _1080p * 22, _1080p * 62 )
	self:addElement( Value )
	self.Value = Value
	
	return self
end

MenuBuilder.registerType( "MissionPopupSuccess", MissionPopupSuccess )
LockTable( _M )
