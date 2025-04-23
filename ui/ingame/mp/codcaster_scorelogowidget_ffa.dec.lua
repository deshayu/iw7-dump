local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function codcaster_ScoreLogoWidget_FFA( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 270 * _1080p, 0, 190 * _1080p )
	self.id = "codcaster_ScoreLogoWidget_FFA"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamColor = nil
	
	TeamColor = LUI.UIBlur.new()
	TeamColor.id = "TeamColor"
	TeamColor:SetDotPitchEnabled( true )
	TeamColor:SetDotPitchX( 6, 0 )
	TeamColor:SetDotPitchY( 3, 0 )
	TeamColor:SetDotPitchContrast( 0.15, 0 )
	TeamColor:SetDotPitchMode( 0 )
	TeamColor:setImage( RegisterMaterial( "codcaster_scoreboard_ffa_bg" ), 0 )
	TeamColor:SetBlurStrength( 1, 0 )
	TeamColor:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -135, _1080p * 135, 0, _1080p * -14.25 )
	self:addElement( TeamColor )
	self.TeamColor = TeamColor
	
	local ScoreBG = nil
	
	ScoreBG = LUI.UIImage.new()
	ScoreBG.id = "ScoreBG"
	ScoreBG:setImage( RegisterMaterial( "codcaster_scoreboard_timer_bg" ), 0 )
	ScoreBG:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -80, _1080p * 80, _1080p * 86.25, _1080p * -19.75 )
	self:addElement( ScoreBG )
	self.ScoreBG = ScoreBG
	
	local PlayerName = nil
	
	PlayerName = LUI.UIText.new()
	PlayerName.id = "PlayerName"
	PlayerName:setText( "", 0 )
	PlayerName:SetFontSize( 22 * _1080p )
	PlayerName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PlayerName:setTextStyle( CoD.TextStyle.Shadowed )
	PlayerName:SetAlignment( LUI.Alignment.Center )
	PlayerName:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerName:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -160, _1080p * 160, _1080p * -16, _1080p * 6 )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local PlayerScore = nil
	
	PlayerScore = LUI.UIStyledText.new()
	PlayerScore.id = "PlayerScore"
	PlayerScore:setText( "00", 0 )
	PlayerScore:SetFontSize( 90 * _1080p )
	PlayerScore:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	PlayerScore:SetAlignment( LUI.Alignment.Center )
	PlayerScore:SetShadowMinDistance( -0.5, 0 )
	PlayerScore:SetShadowMaxDistance( 0.5, 0 )
	PlayerScore:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -65, _1080p * 65, _1080p * 80.75, _1080p * -14.25 )
	self:addElement( PlayerScore )
	self.PlayerScore = PlayerScore
	
	return self
end

MenuBuilder.registerType( "codcaster_ScoreLogoWidget_FFA", codcaster_ScoreLogoWidget_FFA )
LockTable( _M )
