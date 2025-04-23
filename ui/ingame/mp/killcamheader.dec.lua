local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function KillcamHeader( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 145 * _1080p )
	self.id = "KillcamHeader"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetRGBFromTable( SWATCHES.killcam.topHeader, 0 )
	Overlay:SetUseAA( true )
	Overlay:SetBlendMode( BLEND_MODE.multiply )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local Text = nil
	
	Text = LUI.UIStyledText.new()
	Text.id = "Text"
	Text:setText( LocalizeIntoString( Engine.Localize( "LUA_MENU_KILLCAM_CAPS" ), "LUA_MENU_MP_KILLER_CAPS" ), 0 )
	Text:SetFontSize( 48 * _1080p )
	Text:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Text:SetAlignment( LUI.Alignment.Center )
	Text:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -93, _1080p * -45 )
	self:addElement( Text )
	self.Text = Text
	
	local CountdownTimer = nil
	
	CountdownTimer = MenuBuilder.BuildRegisteredType( "UICountdown", {
		controllerIndex = f1_local1
	} )
	CountdownTimer.id = "CountdownTimer"
	CountdownTimer:SetFontSize( 38 * _1080p )
	CountdownTimer:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	CountdownTimer:SetAlignment( LUI.Alignment.Center )
	CountdownTimer:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -48, _1080p * -10 )
	CountdownTimer:SubscribeToModel( DataSources.inGame.MP.killcam.countdown:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.killcam.countdown:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CountdownTimer:setEndTime( f2_local0 )
		end
	end )
	self:addElement( CountdownTimer )
	self.CountdownTimer = CountdownTimer
	
	return self
end

MenuBuilder.registerType( "KillcamHeader", KillcamHeader )
LockTable( _M )
