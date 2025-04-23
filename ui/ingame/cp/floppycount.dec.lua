local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function floppyCount( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 94 * _1080p, 0, 46 * _1080p )
	self.id = "floppyCount"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local floppyCount = nil
	
	floppyCount = LUI.UIText.new()
	floppyCount.id = "floppyCount"
	floppyCount:SetFontSize( 45 * _1080p )
	floppyCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	floppyCount:SetAlignment( LUI.Alignment.Left )
	floppyCount:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 46, 0, _1080p * 45 )
	floppyCount:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.floppyCount:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.dlc4.floppyCount:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			floppyCount:setText( f2_local0, 0 )
		end
	end )
	self:addElement( floppyCount )
	self.floppyCount = floppyCount
	
	local floppyMax = nil
	
	floppyMax = LUI.UIText.new()
	floppyMax.id = "floppyMax"
	floppyMax:setText( "/4", 0 )
	floppyMax:SetFontSize( 45 * _1080p )
	floppyMax:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	floppyMax:SetAlignment( LUI.Alignment.Left )
	floppyMax:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31.86, _1080p * 94.26, 0, _1080p * 45 )
	self:addElement( floppyMax )
	self.floppyMax = floppyMax
	
	return self
end

MenuBuilder.registerType( "floppyCount", floppyCount )
LockTable( _M )
