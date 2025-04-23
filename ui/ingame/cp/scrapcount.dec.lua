local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function scrapCount( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 94 * _1080p, 0, 46 * _1080p )
	self.id = "scrapCount"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local scrapCount = nil
	
	scrapCount = LUI.UIText.new()
	scrapCount.id = "scrapCount"
	scrapCount:SetFontSize( 45 * _1080p )
	scrapCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	scrapCount:SetAlignment( LUI.Alignment.Left )
	scrapCount:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 46, 0, _1080p * 45 )
	scrapCount:SubscribeToModel( DataSources.inGame.CP.zombies.dlc4.scrapCount:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.CP.zombies.dlc4.scrapCount:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			scrapCount:setText( f2_local0, 0 )
		end
	end )
	self:addElement( scrapCount )
	self.scrapCount = scrapCount
	
	local scrapMax = nil
	
	scrapMax = LUI.UIText.new()
	scrapMax.id = "scrapMax"
	scrapMax:setText( "/3", 0 )
	scrapMax:SetFontSize( 45 * _1080p )
	scrapMax:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	scrapMax:SetAlignment( LUI.Alignment.Left )
	scrapMax:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 31.86, _1080p * 94.26, 0, _1080p * 45 )
	self:addElement( scrapMax )
	self.scrapMax = scrapMax
	
	return self
end

MenuBuilder.registerType( "scrapCount", scrapCount )
LockTable( _M )
