local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function NukeCountdown( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 240 * _1080p, 0, 120 * _1080p )
	self.id = "NukeCountdown"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CountdownBacking = nil
	
	CountdownBacking = LUI.UIImage.new()
	CountdownBacking.id = "CountdownBacking"
	CountdownBacking:setImage( RegisterMaterial( "nuke_countdown_backer" ), 0 )
	CountdownBacking:SetUseAA( true )
	CountdownBacking:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 240, 0, _1080p * 120 )
	self:addElement( CountdownBacking )
	self.CountdownBacking = CountdownBacking
	
	local CountdownElement = nil
	
	CountdownElement = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f1_local1
	} )
	CountdownElement.id = "CountdownElement"
	CountdownElement:SetRGBFromTable( SWATCHES.HUD.Countdown, 0 )
	CountdownElement:SetFontSize( 28 * _1080p )
	CountdownElement:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CountdownElement:SetAlignment( LUI.Alignment.Center )
	CountdownElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 50, _1080p * 190, _1080p * 56, _1080p * 85 )
	CountdownElement:SubscribeToModel( DataSources.inGame.MP.scorestreakHuds.nukeCountdown:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.scorestreakHuds.nukeCountdown:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CountdownElement:setEndTime( f2_local0 )
		end
	end )
	self:addElement( CountdownElement )
	self.CountdownElement = CountdownElement
	
	return self
end

MenuBuilder.registerType( "NukeCountdown", NukeCountdown )
LockTable( _M )
