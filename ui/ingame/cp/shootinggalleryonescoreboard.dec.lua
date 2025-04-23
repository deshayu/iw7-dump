local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.25 )
	f1_arg0:SetWorldSpacePosition( -802, 1085, 406 )
	f1_arg0:SetWorldSpacePitch( 0 )
	f1_arg0:SetWorldSpaceYaw( -90 )
	f1_arg0:SetWorldSpaceRoll( 0 )
end

function shootingGalleryOneScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "shootingGalleryOneScoreboard"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local TicketEarnedValue = nil
	
	TicketEarnedValue = LUI.UIText.new()
	TicketEarnedValue.id = "TicketEarnedValue"
	TicketEarnedValue:SetRGBFromTable( SWATCHES.CAC.weaponMeterBetter, 0 )
	TicketEarnedValue:SetScale( 0.5, 0 )
	TicketEarnedValue:SetFontSize( 36 * _1080p )
	TicketEarnedValue:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	TicketEarnedValue:SetAlignment( LUI.Alignment.Center )
	TicketEarnedValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 573.25, _1080p * 691.25, _1080p * 606.5, _1080p * 642.5 )
	TicketEarnedValue:BindAlphaToModel( DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha:GetModel( f2_local1 ) )
	TicketEarnedValue:SubscribeToModel( DataSources.inGame.CP.zombies.arcadeGameTicketEarned:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.CP.zombies.arcadeGameTicketEarned:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			TicketEarnedValue:setText( f3_local0, 0 )
		end
	end )
	self:addElement( TicketEarnedValue )
	self.TicketEarnedValue = TicketEarnedValue
	
	local TimeRemainingValue = nil
	
	TimeRemainingValue = LUI.UIText.new()
	TimeRemainingValue.id = "TimeRemainingValue"
	TimeRemainingValue:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	TimeRemainingValue:SetScale( 0.5, 0 )
	TimeRemainingValue:SetFontSize( 36 * _1080p )
	TimeRemainingValue:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	TimeRemainingValue:SetAlignment( LUI.Alignment.Center )
	TimeRemainingValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 891, _1080p * 1009, _1080p * 605, _1080p * 644 )
	TimeRemainingValue:BindAlphaToModel( DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha:GetModel( f2_local1 ) )
	TimeRemainingValue:SubscribeToModel( DataSources.inGame.CP.zombies.arcadeGameTime:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.CP.zombies.arcadeGameTime:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			TimeRemainingValue:setText( f4_local0, 0 )
		end
	end )
	self:addElement( TimeRemainingValue )
	self.TimeRemainingValue = TimeRemainingValue
	
	local TicketsEarnedTitle = nil
	
	TicketsEarnedTitle = LUI.UIText.new()
	TicketsEarnedTitle.id = "TicketsEarnedTitle"
	TicketsEarnedTitle:SetRGBFromTable( SWATCHES.aliens.chaosFreeze, 0 )
	TicketsEarnedTitle:SetScale( 0.1, 0 )
	TicketsEarnedTitle:setText( "Tickets Earned", 0 )
	TicketsEarnedTitle:SetFontSize( 30 * _1080p )
	TicketsEarnedTitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TicketsEarnedTitle:SetAlignment( LUI.Alignment.Center )
	TicketsEarnedTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 505, _1080p * 759.5, _1080p * 551.5, _1080p * 581.5 )
	TicketsEarnedTitle:BindAlphaToModel( DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha:GetModel( f2_local1 ) )
	self:addElement( TicketsEarnedTitle )
	self.TicketsEarnedTitle = TicketsEarnedTitle
	
	local TimeRemainingTitle = nil
	
	TimeRemainingTitle = LUI.UIText.new()
	TimeRemainingTitle.id = "TimeRemainingTitle"
	TimeRemainingTitle:SetRGBFromTable( SWATCHES.aliens.chaosFreeze, 0 )
	TimeRemainingTitle:SetScale( 0.1, 0 )
	TimeRemainingTitle:setText( "Time Remaining", 0 )
	TimeRemainingTitle:SetFontSize( 30 * _1080p )
	TimeRemainingTitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TimeRemainingTitle:SetAlignment( LUI.Alignment.Left )
	TimeRemainingTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 864.69, _1080p * 1093.06, _1080p * 551.5, _1080p * 581.5 )
	TimeRemainingTitle:BindAlphaToModel( DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha:GetModel( f2_local1 ) )
	self:addElement( TimeRemainingTitle )
	self.TimeRemainingTitle = TimeRemainingTitle
	
	local ShotRemainingTitle = nil
	
	ShotRemainingTitle = LUI.UIText.new()
	ShotRemainingTitle.id = "ShotRemainingTitle"
	ShotRemainingTitle:SetRGBFromTable( SWATCHES.aliens.chaosFreeze, 0 )
	ShotRemainingTitle:SetScale( 0.1, 0 )
	ShotRemainingTitle:setText( "Shot Remaining", 0 )
	ShotRemainingTitle:SetFontSize( 30 * _1080p )
	ShotRemainingTitle:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	ShotRemainingTitle:SetAlignment( LUI.Alignment.Left )
	ShotRemainingTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1218.5, _1080p * 1446.88, _1080p * 551.5, _1080p * 581.5 )
	ShotRemainingTitle:BindAlphaToModel( DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha:GetModel( f2_local1 ) )
	self:addElement( ShotRemainingTitle )
	self.ShotRemainingTitle = ShotRemainingTitle
	
	local ShotRemainingValue = nil
	
	ShotRemainingValue = LUI.UIText.new()
	ShotRemainingValue.id = "ShotRemainingValue"
	ShotRemainingValue:SetRGBFromTable( SWATCHES.HUD.inactive, 0 )
	ShotRemainingValue:SetScale( 0.5, 0 )
	ShotRemainingValue:SetFontSize( 36 * _1080p )
	ShotRemainingValue:SetFont( FONTS.GetFont( FONTS.Digital.File ) )
	ShotRemainingValue:SetAlignment( LUI.Alignment.Center )
	ShotRemainingValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1248, _1080p * 1366, _1080p * 599, _1080p * 635 )
	ShotRemainingValue:BindAlphaToModel( DataSources.inGame.CP.zombies.shootingGallery1WidgetAlpha:GetModel( f2_local1 ) )
	ShotRemainingValue:SubscribeToModel( DataSources.inGame.CP.zombies.arcadeGameShotRemaining:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.CP.zombies.arcadeGameShotRemaining:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			ShotRemainingValue:setText( f5_local0, 0 )
		end
	end )
	self:addElement( ShotRemainingValue )
	self.ShotRemainingValue = ShotRemainingValue
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "shootingGalleryOneScoreboard", shootingGalleryOneScoreboard )
LockTable( _M )
