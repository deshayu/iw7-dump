local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function SpiderbotControls( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "SpiderbotControls"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local LT = nil
	
	LT = LUI.UIText.new()
	LT.id = "LT"
	LT:setText( Engine.Localize( "LUA_MENU_MP_SPIDERBOT_FIRE" ), 0 )
	LT:SetFontSize( 50 * _1080p )
	LT:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LT:SetAlignment( LUI.Alignment.Left )
	LT:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 604, _1080p * 1216, _1080p * 723, _1080p * 773 )
	LT:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.spiderBotVisible:GetModel( f1_local1 ) )
	self:addElement( LT )
	self.LT = LT
	
	local RT = nil
	
	RT = LUI.UIText.new()
	RT.id = "RT"
	RT:setText( Engine.Localize( "LUA_MENU_MP_SPIDERBOT_DETONATE" ), 0 )
	RT:SetFontSize( 50 * _1080p )
	RT:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RT:SetAlignment( LUI.Alignment.Left )
	RT:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1049, _1080p * 1553, _1080p * 723, _1080p * 773 )
	RT:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.spiderBotVisible:GetModel( f1_local1 ) )
	self:addElement( RT )
	self.RT = RT
	
	local A = nil
	
	A = LUI.UIText.new()
	A.id = "A"
	A:setText( Engine.Localize( "LUA_MENU_MP_SPIDERBOT_JUMP" ), 0 )
	A:SetFontSize( 50 * _1080p )
	A:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	A:SetAlignment( LUI.Alignment.Left )
	A:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1049, _1080p * 1549, _1080p * 807, _1080p * 857 )
	A:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.spiderBotVisible:GetModel( f1_local1 ) )
	self:addElement( A )
	self.A = A
	
	local Reticle = nil
	
	Reticle = LUI.UIImage.new()
	Reticle.id = "Reticle"
	Reticle:SetRGBFromInt( 16711680, 0 )
	Reticle:setImage( RegisterMaterial( "hud_reticle_trophy_system" ), 0 )
	Reticle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 839, _1080p * 1081, _1080p * 419, _1080p * 661 )
	Reticle:BindAlphaToModel( DataSources.inGame.MP.scorestreakHuds.spiderBotVisible:GetModel( f1_local1 ) )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	return self
end

MenuBuilder.registerType( "SpiderbotControls", SpiderbotControls )
LockTable( _M )
