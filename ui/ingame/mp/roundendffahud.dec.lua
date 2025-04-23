local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	if IsLanguageEnglish() then
		f1_arg0.RoundEndTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -864, _1080p * 864, _1080p * 205.29, _1080p * 373.5 )
	else
		f1_arg0.RoundEndTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -864, _1080p * 864, _1080p * 239.29, _1080p * 329.29 )
	end
	if CODCASTER.IsCODCaster() then
		local f1_local0 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 1, GameX.GetGameMode(), false )
		if f1_local0 then
			f1_arg0.FirstPlaceName:setText( f1_local0.name )
		end
		local f1_local1 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 2, GameX.GetGameMode(), false )
		if f1_local1 then
			f1_arg0.SecondPlaceName:setText( f1_local1.name )
		end
		local f1_local2 = GameX.GetPlayerScoreInfoAtRankForGameMode( Teams.free, 3, GameX.GetGameMode(), false )
		if f1_local2 then
			f1_arg0.ThirdPlaceName:setText( f1_local2.name )
		end
	end
	local f1_local0 = DataSources.inGame.MP.roundEnd.roundEndFFAFirstPlaceName:GetValue( f1_arg1 )
	local f1_local1 = DataSources.inGame.MP.roundEnd.roundEndFFASecondPlaceName:GetValue( f1_arg1 )
	local f1_local2 = DataSources.inGame.MP.roundEnd.roundEndFFAThirdPlaceName:GetValue( f1_arg1 )
	if f1_local0 ~= nil then
		if Engine.IsPC() then
			f1_local0 = Engine.TruncateToGlyphCount( f1_local0, 16 )
		end
		f1_arg0.FirstPlaceName:setText( f1_local0 )
	end
	if f1_local1 ~= nil then
		if Engine.IsPC() then
			f1_local1 = Engine.TruncateToGlyphCount( f1_local1, 16 )
		end
		f1_arg0.SecondPlaceName:setText( f1_local1 )
	end
	if f1_local2 ~= nil then
		if Engine.IsPC() then
			f1_local2 = Engine.TruncateToGlyphCount( f1_local2, 16 )
		end
		f1_arg0.ThirdPlaceName:setText( f1_local2 )
	end
end

function RoundEndFFAHUD( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "RoundEndFFAHUD"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetGlitchEnabled( true )
	Blur:SetGlitchAmount( 1, 0 )
	Blur:SetGlitchBlockWidth( 50, 0 )
	Blur:SetGlitchBlockHeight( 50, 0 )
	Blur:SetGlitchDistortionRange( 16, 0 )
	Blur:SetGlitchScanlinePitch( 1, 0 )
	Blur:SetGlitchMaskPitch( 1, 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 2.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -319, _1080p * -146 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local BlurCopy = nil
	
	BlurCopy = LUI.UIBlur.new()
	BlurCopy.id = "BlurCopy"
	BlurCopy:SetGlitchEnabled( true )
	BlurCopy:SetGlitchAmount( 1, 0 )
	BlurCopy:SetGlitchBlockWidth( 50, 0 )
	BlurCopy:SetGlitchBlockHeight( 50, 0 )
	BlurCopy:SetGlitchDistortionRange( 16, 0 )
	BlurCopy:SetGlitchScanlinePitch( 1, 0 )
	BlurCopy:SetGlitchMaskPitch( 1, 0 )
	BlurCopy:SetUseAA( true )
	BlurCopy:SetBlurStrength( 2.75, 0 )
	BlurCopy:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 286, _1080p * 329 )
	self:addElement( BlurCopy )
	self.BlurCopy = BlurCopy
	
	local RoundEndTitleBG = nil
	
	RoundEndTitleBG = LUI.UIImage.new()
	RoundEndTitleBG.id = "RoundEndTitleBG"
	RoundEndTitleBG:SetRGBFromInt( 0, 0 )
	RoundEndTitleBG:SetAlpha( 0.4, 0 )
	RoundEndTitleBG:SetGlitchEnabled( true )
	RoundEndTitleBG:SetGlitchAmount( 1, 0 )
	RoundEndTitleBG:SetGlitchBlockWidth( 50, 0 )
	RoundEndTitleBG:SetGlitchBlockHeight( 50, 0 )
	RoundEndTitleBG:SetGlitchDistortionRange( 16, 0 )
	RoundEndTitleBG:SetGlitchScanlinePitch( 1, 0 )
	RoundEndTitleBG:SetGlitchMaskPitch( 1, 0 )
	RoundEndTitleBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 227, _1080p * 394 )
	self:addElement( RoundEndTitleBG )
	self.RoundEndTitleBG = RoundEndTitleBG
	
	local MatchBonusBG = nil
	
	MatchBonusBG = LUI.UIImage.new()
	MatchBonusBG.id = "MatchBonusBG"
	MatchBonusBG:SetRGBFromInt( 0, 0 )
	MatchBonusBG:SetAlpha( 0.4, 0 )
	MatchBonusBG:SetGlitchEnabled( true )
	MatchBonusBG:SetGlitchAmount( 1, 0 )
	MatchBonusBG:SetGlitchBlockWidth( 50, 0 )
	MatchBonusBG:SetGlitchBlockHeight( 50, 0 )
	MatchBonusBG:SetGlitchDistortionRange( 16, 0 )
	MatchBonusBG:SetGlitchScanlinePitch( 1, 0 )
	MatchBonusBG:SetGlitchMaskPitch( 1, 0 )
	MatchBonusBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 828, _1080p * 869 )
	self:addElement( MatchBonusBG )
	self.MatchBonusBG = MatchBonusBG
	
	local MatchBonusTopBG = nil
	
	MatchBonusTopBG = LUI.UIImage.new()
	MatchBonusTopBG.id = "MatchBonusTopBG"
	MatchBonusTopBG:SetRGBFromInt( 8421504, 0 )
	MatchBonusTopBG:SetAlpha( 0.75, 0 )
	MatchBonusTopBG:SetGlitchEnabled( true )
	MatchBonusTopBG:SetGlitchAmount( 1, 0 )
	MatchBonusTopBG:SetGlitchBlockWidth( 50, 0 )
	MatchBonusTopBG:SetGlitchBlockHeight( 50, 0 )
	MatchBonusTopBG:SetGlitchDistortionRange( 16, 0 )
	MatchBonusTopBG:SetGlitchScanlinePitch( 1, 0 )
	MatchBonusTopBG:SetGlitchMaskPitch( 1, 0 )
	MatchBonusTopBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 826, _1080p * 828 )
	self:addElement( MatchBonusTopBG )
	self.MatchBonusTopBG = MatchBonusTopBG
	
	local RoundEndTitleBGTop = nil
	
	RoundEndTitleBGTop = LUI.UIImage.new()
	RoundEndTitleBGTop.id = "RoundEndTitleBGTop"
	RoundEndTitleBGTop:SetRGBFromInt( 8421504, 0 )
	RoundEndTitleBGTop:SetAlpha( 0.75, 0 )
	RoundEndTitleBGTop:SetGlitchEnabled( true )
	RoundEndTitleBGTop:SetGlitchAmount( 1, 0 )
	RoundEndTitleBGTop:SetGlitchBlockWidth( 50, 0 )
	RoundEndTitleBGTop:SetGlitchBlockHeight( 50, 0 )
	RoundEndTitleBGTop:SetGlitchDistortionRange( 16, 0 )
	RoundEndTitleBGTop:SetGlitchScanlinePitch( 1, 0 )
	RoundEndTitleBGTop:SetGlitchMaskPitch( 1, 0 )
	RoundEndTitleBGTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 221, _1080p * 227 )
	self:addElement( RoundEndTitleBGTop )
	self.RoundEndTitleBGTop = RoundEndTitleBGTop
	
	local RoundEndTitleText = nil
	
	RoundEndTitleText = LUI.UIText.new()
	RoundEndTitleText.id = "RoundEndTitleText"
	RoundEndTitleText:SetGlitchEnabled( true )
	RoundEndTitleText:SetGlitchAmount( 1, 0 )
	RoundEndTitleText:SetGlitchBlockWidth( 50, 0 )
	RoundEndTitleText:SetGlitchBlockHeight( 50, 0 )
	RoundEndTitleText:SetGlitchDistortionRange( 16, 0 )
	RoundEndTitleText:SetGlitchScanlinePitch( 1, 0 )
	RoundEndTitleText:SetGlitchMaskPitch( 1, 0 )
	RoundEndTitleText:SetFontSize( 105 * _1080p )
	RoundEndTitleText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RoundEndTitleText:SetAlignment( LUI.Alignment.Center )
	RoundEndTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -864, _1080p * 864, _1080p * 205.29, _1080p * 373.5 )
	RoundEndTitleText:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndTitle:GetModel( f2_local1 ), function ()
		local f3_local0 = DataSources.inGame.MP.roundEnd.roundEndTitle:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			RoundEndTitleText:setText( LocalizeString( f3_local0 ), 0 )
		end
	end )
	self:addElement( RoundEndTitleText )
	self.RoundEndTitleText = RoundEndTitleText
	
	local RoundEndReasonText = nil
	
	RoundEndReasonText = LUI.UIText.new()
	RoundEndReasonText.id = "RoundEndReasonText"
	RoundEndReasonText:SetRGBFromInt( 13421772, 0 )
	RoundEndReasonText:SetGlitchEnabled( true )
	RoundEndReasonText:SetGlitchAmount( 1, 0 )
	RoundEndReasonText:SetGlitchBlockWidth( 50, 0 )
	RoundEndReasonText:SetGlitchBlockHeight( 50, 0 )
	RoundEndReasonText:SetGlitchDistortionRange( 16, 0 )
	RoundEndReasonText:SetGlitchScanlinePitch( 1, 0 )
	RoundEndReasonText:SetGlitchMaskPitch( 1, 0 )
	RoundEndReasonText:SetFontSize( 50 * _1080p )
	RoundEndReasonText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RoundEndReasonText:SetAlignment( LUI.Alignment.Center )
	RoundEndReasonText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -700, _1080p * 700, _1080p * 348.5, _1080p * 398.5 )
	RoundEndReasonText:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndReason:GetModel( f2_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.roundEnd.roundEndReason:GetValue( f2_local1 )
		if f4_local0 ~= nil then
			RoundEndReasonText:setText( LocalizeString( f4_local0 ), 0 )
		end
	end )
	self:addElement( RoundEndReasonText )
	self.RoundEndReasonText = RoundEndReasonText
	
	local ThirdPlaceBackground = nil
	
	ThirdPlaceBackground = MenuBuilder.BuildRegisteredType( "FFAVictoryPlayerNameBG", {
		controllerIndex = f2_local1
	} )
	ThirdPlaceBackground.id = "ThirdPlaceBackground"
	ThirdPlaceBackground:SetGlitchEnabled( true )
	ThirdPlaceBackground:SetGlitchAmount( 1, 0 )
	ThirdPlaceBackground:SetGlitchBlockWidth( 50, 0 )
	ThirdPlaceBackground:SetGlitchBlockHeight( 50, 0 )
	ThirdPlaceBackground:SetGlitchDistortionRange( 16, 0 )
	ThirdPlaceBackground:SetGlitchScanlinePitch( 1, 0 )
	ThirdPlaceBackground:SetGlitchMaskPitch( 1, 0 )
	ThirdPlaceBackground.Background:SetAlpha( 0.4, 0 )
	ThirdPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167, _1080p * 595, _1080p * 680, _1080p * 738.48 )
	self:addElement( ThirdPlaceBackground )
	self.ThirdPlaceBackground = ThirdPlaceBackground
	
	local SecondPlaceBackground = nil
	
	SecondPlaceBackground = MenuBuilder.BuildRegisteredType( "FFAVictoryPlayerNameBG", {
		controllerIndex = f2_local1
	} )
	SecondPlaceBackground.id = "SecondPlaceBackground"
	SecondPlaceBackground:SetGlitchEnabled( true )
	SecondPlaceBackground:SetGlitchAmount( 1, 0 )
	SecondPlaceBackground:SetGlitchBlockWidth( 50, 0 )
	SecondPlaceBackground:SetGlitchBlockHeight( 50, 0 )
	SecondPlaceBackground:SetGlitchDistortionRange( 16, 0 )
	SecondPlaceBackground:SetGlitchScanlinePitch( 1, 0 )
	SecondPlaceBackground:SetGlitchMaskPitch( 1, 0 )
	SecondPlaceBackground.Background:SetAlpha( 0.4, 0 )
	SecondPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167, _1080p * 595, _1080p * 592.26, _1080p * 652.74 )
	self:addElement( SecondPlaceBackground )
	self.SecondPlaceBackground = SecondPlaceBackground
	
	local FirstPlaceBackground = nil
	
	FirstPlaceBackground = MenuBuilder.BuildRegisteredType( "FFAVictoryPlayerNameBG", {
		controllerIndex = f2_local1
	} )
	FirstPlaceBackground.id = "FirstPlaceBackground"
	FirstPlaceBackground:SetGlitchEnabled( true )
	FirstPlaceBackground:SetGlitchAmount( 1, 0 )
	FirstPlaceBackground:SetGlitchBlockWidth( 50, 0 )
	FirstPlaceBackground:SetGlitchBlockHeight( 50, 0 )
	FirstPlaceBackground:SetGlitchDistortionRange( 16, 0 )
	FirstPlaceBackground:SetGlitchScanlinePitch( 1, 0 )
	FirstPlaceBackground:SetGlitchMaskPitch( 1, 0 )
	FirstPlaceBackground.Background:SetAlpha( 0.5, 0 )
	FirstPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 146.5, _1080p * 683.5, _1080p * 468, _1080p * 548 )
	self:addElement( FirstPlaceBackground )
	self.FirstPlaceBackground = FirstPlaceBackground
	
	local FirstPlaceLabel = nil
	
	FirstPlaceLabel = LUI.UIStyledText.new()
	FirstPlaceLabel.id = "FirstPlaceLabel"
	FirstPlaceLabel:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	FirstPlaceLabel:SetGlitchEnabled( true )
	FirstPlaceLabel:SetGlitchAmount( 1, 0 )
	FirstPlaceLabel:SetGlitchBlockWidth( 50, 0 )
	FirstPlaceLabel:SetGlitchBlockHeight( 50, 0 )
	FirstPlaceLabel:SetGlitchDistortionRange( 16, 0 )
	FirstPlaceLabel:SetGlitchScanlinePitch( 1, 0 )
	FirstPlaceLabel:SetGlitchMaskPitch( 1, 0 )
	FirstPlaceLabel:setText( Engine.Localize( "LUA_MENU_1ST" ), 0 )
	FirstPlaceLabel:SetFontSize( 64 * _1080p )
	FirstPlaceLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FirstPlaceLabel:SetAlignment( LUI.Alignment.Center )
	FirstPlaceLabel:SetOutlineMinDistance( -0.3, 0 )
	FirstPlaceLabel:SetOutlineMaxDistance( 0.3, 0 )
	FirstPlaceLabel:SetOutlineRGBFromInt( 16767744, 0 )
	FirstPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 152.5, _1080p * 272, _1080p * 477, _1080p * 541 )
	self:addElement( FirstPlaceLabel )
	self.FirstPlaceLabel = FirstPlaceLabel
	
	local SecondPlaceLabel = nil
	
	SecondPlaceLabel = LUI.UIText.new()
	SecondPlaceLabel.id = "SecondPlaceLabel"
	SecondPlaceLabel:SetGlitchEnabled( true )
	SecondPlaceLabel:SetGlitchAmount( 1, 0 )
	SecondPlaceLabel:SetGlitchBlockWidth( 50, 0 )
	SecondPlaceLabel:SetGlitchBlockHeight( 50, 0 )
	SecondPlaceLabel:SetGlitchDistortionRange( 16, 0 )
	SecondPlaceLabel:SetGlitchScanlinePitch( 1, 0 )
	SecondPlaceLabel:SetGlitchMaskPitch( 1, 0 )
	SecondPlaceLabel:setText( Engine.Localize( "LUA_MENU_2ND" ), 0 )
	SecondPlaceLabel:SetFontSize( 38 * _1080p )
	SecondPlaceLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SecondPlaceLabel:SetAlignment( LUI.Alignment.Center )
	SecondPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167, _1080p * 287, _1080p * 603.5, _1080p * 641.5 )
	self:addElement( SecondPlaceLabel )
	self.SecondPlaceLabel = SecondPlaceLabel
	
	local ThirdPlaceLabel = nil
	
	ThirdPlaceLabel = LUI.UIText.new()
	ThirdPlaceLabel.id = "ThirdPlaceLabel"
	ThirdPlaceLabel:SetGlitchEnabled( true )
	ThirdPlaceLabel:SetGlitchAmount( 1, 0 )
	ThirdPlaceLabel:SetGlitchBlockWidth( 50, 0 )
	ThirdPlaceLabel:SetGlitchBlockHeight( 50, 0 )
	ThirdPlaceLabel:SetGlitchDistortionRange( 16, 0 )
	ThirdPlaceLabel:SetGlitchScanlinePitch( 1, 0 )
	ThirdPlaceLabel:SetGlitchMaskPitch( 1, 0 )
	ThirdPlaceLabel:setText( Engine.Localize( "LUA_MENU_3RD" ), 0 )
	ThirdPlaceLabel:SetFontSize( 38 * _1080p )
	ThirdPlaceLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ThirdPlaceLabel:SetAlignment( LUI.Alignment.Center )
	ThirdPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 167, _1080p * 287, _1080p * 689.24, _1080p * 727.24 )
	self:addElement( ThirdPlaceLabel )
	self.ThirdPlaceLabel = ThirdPlaceLabel
	
	local FirstPlaceName = nil
	
	FirstPlaceName = LUI.UIText.new()
	FirstPlaceName.id = "FirstPlaceName"
	FirstPlaceName:SetGlitchEnabled( true )
	FirstPlaceName:SetGlitchAmount( 1, 0 )
	FirstPlaceName:SetGlitchBlockWidth( 50, 0 )
	FirstPlaceName:SetGlitchBlockHeight( 50, 0 )
	FirstPlaceName:SetGlitchDistortionRange( 16, 0 )
	FirstPlaceName:SetGlitchScanlinePitch( 1, 0 )
	FirstPlaceName:SetGlitchMaskPitch( 1, 0 )
	FirstPlaceName:setText( "", 0 )
	FirstPlaceName:SetFontSize( 32 * _1080p )
	FirstPlaceName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FirstPlaceName:SetAlignment( LUI.Alignment.Left )
	FirstPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 298, _1080p * 665, _1080p * 493, _1080p * 525 )
	self:addElement( FirstPlaceName )
	self.FirstPlaceName = FirstPlaceName
	
	local SecondPlaceName = nil
	
	SecondPlaceName = LUI.UIText.new()
	SecondPlaceName.id = "SecondPlaceName"
	SecondPlaceName:SetGlitchEnabled( true )
	SecondPlaceName:SetGlitchAmount( 1, 0 )
	SecondPlaceName:SetGlitchBlockWidth( 50, 0 )
	SecondPlaceName:SetGlitchBlockHeight( 50, 0 )
	SecondPlaceName:SetGlitchDistortionRange( 16, 0 )
	SecondPlaceName:SetGlitchScanlinePitch( 1, 0 )
	SecondPlaceName:SetGlitchMaskPitch( 1, 0 )
	SecondPlaceName:setText( "", 0 )
	SecondPlaceName:SetFontSize( 24 * _1080p )
	SecondPlaceName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	SecondPlaceName:SetAlignment( LUI.Alignment.Left )
	SecondPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 298, _1080p * 595, _1080p * 610.5, _1080p * 634.5 )
	self:addElement( SecondPlaceName )
	self.SecondPlaceName = SecondPlaceName
	
	local ThirdPlaceName = nil
	
	ThirdPlaceName = LUI.UIText.new()
	ThirdPlaceName.id = "ThirdPlaceName"
	ThirdPlaceName:SetGlitchEnabled( true )
	ThirdPlaceName:SetGlitchAmount( 1, 0 )
	ThirdPlaceName:SetGlitchBlockWidth( 50, 0 )
	ThirdPlaceName:SetGlitchBlockHeight( 50, 0 )
	ThirdPlaceName:SetGlitchDistortionRange( 16, 0 )
	ThirdPlaceName:SetGlitchScanlinePitch( 1, 0 )
	ThirdPlaceName:SetGlitchMaskPitch( 1, 0 )
	ThirdPlaceName:setText( "", 0 )
	ThirdPlaceName:SetFontSize( 22 * _1080p )
	ThirdPlaceName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ThirdPlaceName:SetAlignment( LUI.Alignment.Left )
	ThirdPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 298, _1080p * 595, _1080p * 697.24, _1080p * 719.24 )
	self:addElement( ThirdPlaceName )
	self.ThirdPlaceName = ThirdPlaceName
	
	local MatchBonusValueText = nil
	
	MatchBonusValueText = LUI.UIText.new()
	MatchBonusValueText.id = "MatchBonusValueText"
	MatchBonusValueText:SetGlitchEnabled( true )
	MatchBonusValueText:SetGlitchAmount( 1, 0 )
	MatchBonusValueText:SetGlitchBlockWidth( 50, 0 )
	MatchBonusValueText:SetGlitchBlockHeight( 50, 0 )
	MatchBonusValueText:SetGlitchDistortionRange( 16, 0 )
	MatchBonusValueText:SetGlitchScanlinePitch( 1, 0 )
	MatchBonusValueText:SetGlitchMaskPitch( 1, 0 )
	MatchBonusValueText:SetFontSize( 38 * _1080p )
	MatchBonusValueText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MatchBonusValueText:SetAlignment( LUI.Alignment.Left )
	MatchBonusValueText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 65.33, _1080p * 267.33, _1080p * 828.5, _1080p * 866.5 )
	MatchBonusValueText:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndMatchBonus:GetModel( f2_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.roundEnd.roundEndMatchBonus:GetValue( f2_local1 )
		if f5_local0 ~= nil then
			MatchBonusValueText:setText( f5_local0, 0 )
		end
	end )
	self:addElement( MatchBonusValueText )
	self.MatchBonusValueText = MatchBonusValueText
	
	local MatchBonusTitleText = nil
	
	MatchBonusTitleText = LUI.UIText.new()
	MatchBonusTitleText.id = "MatchBonusTitleText"
	MatchBonusTitleText:SetGlitchEnabled( true )
	MatchBonusTitleText:SetGlitchAmount( 1, 0 )
	MatchBonusTitleText:SetGlitchBlockWidth( 50, 0 )
	MatchBonusTitleText:SetGlitchBlockHeight( 50, 0 )
	MatchBonusTitleText:SetGlitchDistortionRange( 16, 0 )
	MatchBonusTitleText:SetGlitchScanlinePitch( 1, 0 )
	MatchBonusTitleText:SetGlitchMaskPitch( 1, 0 )
	MatchBonusTitleText:setText( ToUpperCase( Engine.Localize( "MP_MATCH_BONUS" ) ), 0 )
	MatchBonusTitleText:SetFontSize( 38 * _1080p )
	MatchBonusTitleText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	MatchBonusTitleText:SetAlignment( LUI.Alignment.Right )
	MatchBonusTitleText:SetOptOutRightToLeftAlignmentFlip( true )
	MatchBonusTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -579, _1080p * 45.33, _1080p * 828.5, _1080p * 866.5 )
	self:addElement( MatchBonusTitleText )
	self.MatchBonusTitleText = MatchBonusTitleText
	
	local Stub = nil
	
	Stub = LUI.UIImage.new()
	Stub.id = "Stub"
	Stub:SetGlitchEnabled( true )
	Stub:SetGlitchAmount( 1, 0 )
	Stub:SetGlitchBlockWidth( 50, 0 )
	Stub:SetGlitchBlockHeight( 50, 0 )
	Stub:SetGlitchDistortionRange( 16, 0 )
	Stub:SetGlitchScanlinePitch( 1, 0 )
	Stub:SetGlitchMaskPitch( 1, 0 )
	Stub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 136, _1080p * 468, _1080p * 548 )
	self:addElement( Stub )
	self.Stub = Stub
	
	local f2_local23 = nil
	if CONDITIONS.IsCorePublicMatch( self ) then
		f2_local23 = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
			controllerIndex = f2_local1
		} )
		f2_local23.id = "DoubleXPNotifications"
		f2_local23:SetScale( -0.5, 0 )
		f2_local23:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 32, _1080p * 288, _1080p * 22, _1080p * 150 )
		self:addElement( f2_local23 )
		self.DoubleXPNotifications = f2_local23
	end
	self._animationSets.DefaultAnimationSet = function ()
		BlurCopy:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BlurCopy:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 286, _1080p * 328, 0 )
				end
			}
		} )
		MatchBonusBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MatchBonusBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 828, _1080p * 869, 0 )
				end
			}
		} )
		MatchBonusTopBG:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MatchBonusTopBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 826, _1080p * 828, 0 )
				end
			}
		} )
		ThirdPlaceBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ThirdPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 178, _1080p * 606, _1080p * 680, _1080p * 738.48, 0 )
				end
			}
		} )
		SecondPlaceBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 178, _1080p * 606, _1080p * 592.26, _1080p * 652.74, 0 )
				end
			}
		} )
		FirstPlaceBackground:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FirstPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156.34, _1080p * 693.34, _1080p * 468, _1080p * 548, 0 )
				end
			}
		} )
		FirstPlaceLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FirstPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 156.34, _1080p * 275.84, _1080p * 483, _1080p * 533, 0 )
				end
			}
		} )
		SecondPlaceLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 178, _1080p * 298, _1080p * 597.5, _1080p * 647.5, 0 )
				end
			}
		} )
		ThirdPlaceLabel:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ThirdPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 178, _1080p * 298, _1080p * 684.24, _1080p * 734.24, 0 )
				end
			}
		} )
		FirstPlaceName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.FirstPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 307.84, _1080p * 674.84, _1080p * 493, _1080p * 523, 0 )
				end
			}
		} )
		SecondPlaceName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SecondPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 309, _1080p * 606, _1080p * 610.5, _1080p * 634.5, 0 )
				end
			}
		} )
		ThirdPlaceName:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ThirdPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 309, _1080p * 606, _1080p * 697.24, _1080p * 719.24, 0 )
				end
			}
		} )
		MatchBonusTitleText:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.MatchBonusTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -607.83, _1080p * 57.5, _1080p * 829.5, _1080p * 865.5, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			BlurCopy:AnimateSequence( "DefaultSequence" )
			MatchBonusBG:AnimateSequence( "DefaultSequence" )
			MatchBonusTopBG:AnimateSequence( "DefaultSequence" )
			ThirdPlaceBackground:AnimateSequence( "DefaultSequence" )
			SecondPlaceBackground:AnimateSequence( "DefaultSequence" )
			FirstPlaceBackground:AnimateSequence( "DefaultSequence" )
			FirstPlaceLabel:AnimateSequence( "DefaultSequence" )
			SecondPlaceLabel:AnimateSequence( "DefaultSequence" )
			ThirdPlaceLabel:AnimateSequence( "DefaultSequence" )
			FirstPlaceName:AnimateSequence( "DefaultSequence" )
			SecondPlaceName:AnimateSequence( "DefaultSequence" )
			ThirdPlaceName:AnimateSequence( "DefaultSequence" )
			MatchBonusTitleText:AnimateSequence( "DefaultSequence" )
		end
		
		BlurCopy:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.BlurCopy:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 18, _1080p * 60, 0 )
				end
			}
		} )
		MatchBonusBG:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MatchBonusBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 560, _1080p * 600.5, 0 )
				end
			}
		} )
		MatchBonusTopBG:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MatchBonusTopBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 558, _1080p * 560, 0 )
				end
			}
		} )
		ThirdPlaceBackground:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ThirdPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1426, _1080p * 1854, _1080p * 446.76, _1080p * 505.24, 0 )
				end
			}
		} )
		SecondPlaceBackground:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.SecondPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 339, _1080p * 767, _1080p * 445.76, _1080p * 506.24, 0 )
				end
			}
		} )
		FirstPlaceBackground:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FirstPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 837, _1080p * 1374, _1080p * 436, _1080p * 516, 0 )
				end
			}
		} )
		FirstPlaceLabel:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FirstPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 837, _1080p * 956.5, _1080p * 451, _1080p * 501, 0 )
				end
			}
		} )
		SecondPlaceLabel:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.SecondPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 339, _1080p * 459, _1080p * 451, _1080p * 501, 0 )
				end
			}
		} )
		ThirdPlaceLabel:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ThirdPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1426, _1080p * 1546, _1080p * 451, _1080p * 501, 0 )
				end
			}
		} )
		FirstPlaceName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.FirstPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 988.5, _1080p * 1355.5, _1080p * 461, _1080p * 491, 0 )
				end
			}
		} )
		SecondPlaceName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.SecondPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 470, _1080p * 767, _1080p * 464, _1080p * 488, 0 )
				end
			}
		} )
		ThirdPlaceName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ThirdPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1557, _1080p * 1854, _1080p * 464, _1080p * 486, 0 )
				end
			}
		} )
		MatchBonusValueText:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MatchBonusValueText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 66.5, _1080p * 268.5, _1080p * 561.5, _1080p * 597.5, 0 )
				end
			}
		} )
		MatchBonusTitleText:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MatchBonusTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -556, _1080p * 66.5, _1080p * 561.5, _1080p * 597.5, 0 )
				end
			}
		} )
		Stub:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Stub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 820.5, _1080p * 826.5, _1080p * 436, _1080p * 516, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			BlurCopy:AnimateSequence( "Splitscreen" )
			MatchBonusBG:AnimateSequence( "Splitscreen" )
			MatchBonusTopBG:AnimateSequence( "Splitscreen" )
			ThirdPlaceBackground:AnimateSequence( "Splitscreen" )
			SecondPlaceBackground:AnimateSequence( "Splitscreen" )
			FirstPlaceBackground:AnimateSequence( "Splitscreen" )
			FirstPlaceLabel:AnimateSequence( "Splitscreen" )
			SecondPlaceLabel:AnimateSequence( "Splitscreen" )
			ThirdPlaceLabel:AnimateSequence( "Splitscreen" )
			FirstPlaceName:AnimateSequence( "Splitscreen" )
			SecondPlaceName:AnimateSequence( "Splitscreen" )
			ThirdPlaceName:AnimateSequence( "Splitscreen" )
			MatchBonusValueText:AnimateSequence( "Splitscreen" )
			MatchBonusTitleText:AnimateSequence( "Splitscreen" )
			Stub:AnimateSequence( "Splitscreen" )
		end
		
		BlurCopy:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.BlurCopy:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 287, _1080p * 329, 0 )
				end
			}
		} )
		MatchBonusBG:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.MatchBonusBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 828, _1080p * 869, 0 )
				end
			}
		} )
		MatchBonusTopBG:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.MatchBonusTopBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 826, _1080p * 828, 0 )
				end
			}
		} )
		ThirdPlaceBackground:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ThirdPlaceBackground:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.ThirdPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1314.75, _1080p * 1742.75, _1080p * 680, _1080p * 738.48, 0 )
				end
			}
		} )
		SecondPlaceBackground:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.SecondPlaceBackground:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.SecondPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1314.75, _1080p * 1742.75, _1080p * 592.26, _1080p * 652.74, 0 )
				end
			}
		} )
		FirstPlaceBackground:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.FirstPlaceBackground:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.FirstPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1229.75, _1080p * 1766.75, _1080p * 475, _1080p * 555, 0 )
				end
			}
		} )
		FirstPlaceLabel:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.FirstPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1647.25, _1080p * 1766.75, _1080p * 490, _1080p * 540, 0 )
				end
			}
		} )
		SecondPlaceLabel:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.SecondPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1622.75, _1080p * 1742.75, _1080p * 597.5, _1080p * 647.5, 0 )
				end
			}
		} )
		ThirdPlaceLabel:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ThirdPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1622.75, _1080p * 1742.75, _1080p * 684.24, _1080p * 734.24, 0 )
				end
			}
		} )
		FirstPlaceName:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.FirstPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1255.75, _1080p * 1622.75, _1080p * 500, _1080p * 530, 0 )
				end
			}
		} )
		SecondPlaceName:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.SecondPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1320.25, _1080p * 1617.25, _1080p * 610.5, _1080p * 634.5, 0 )
				end
			}
		} )
		ThirdPlaceName:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.ThirdPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1320.25, _1080p * 1617.25, _1080p * 697.24, _1080p * 719.24, 0 )
				end
			}
		} )
		MatchBonusValueText:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.MatchBonusValueText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -231.5, _1080p * -29.5, _1080p * 829.5, _1080p * 865.5, 0 )
				end
			}
		} )
		MatchBonusTitleText:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.MatchBonusTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -20, _1080p * 280, _1080p * 829.5, _1080p * 865.5, 0 )
				end
			}
		} )
		Stub:RegisterAnimationSequence( "RightToLeft", {
			{
				function ()
					return self.Stub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1778.25, _1080p * 1784.25, _1080p * 475, _1080p * 555, 0 )
				end
			}
		} )
		self._sequences.RightToLeft = function ()
			BlurCopy:AnimateSequence( "RightToLeft" )
			MatchBonusBG:AnimateSequence( "RightToLeft" )
			MatchBonusTopBG:AnimateSequence( "RightToLeft" )
			ThirdPlaceBackground:AnimateSequence( "RightToLeft" )
			SecondPlaceBackground:AnimateSequence( "RightToLeft" )
			FirstPlaceBackground:AnimateSequence( "RightToLeft" )
			FirstPlaceLabel:AnimateSequence( "RightToLeft" )
			SecondPlaceLabel:AnimateSequence( "RightToLeft" )
			ThirdPlaceLabel:AnimateSequence( "RightToLeft" )
			FirstPlaceName:AnimateSequence( "RightToLeft" )
			SecondPlaceName:AnimateSequence( "RightToLeft" )
			ThirdPlaceName:AnimateSequence( "RightToLeft" )
			MatchBonusValueText:AnimateSequence( "RightToLeft" )
			MatchBonusTitleText:AnimateSequence( "RightToLeft" )
			Stub:AnimateSequence( "RightToLeft" )
		end
		
		BlurCopy:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.BlurCopy:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * 18, _1080p * 60, 0 )
				end
			}
		} )
		MatchBonusBG:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.MatchBonusBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 560, _1080p * 600.5, 0 )
				end
			}
		} )
		MatchBonusTopBG:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.MatchBonusTopBG:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 558, _1080p * 560, 0 )
				end
			}
		} )
		ThirdPlaceBackground:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.ThirdPlaceBackground:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.ThirdPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1426, _1080p * 1854, _1080p * 446.76, _1080p * 505.24, 0 )
				end
			}
		} )
		SecondPlaceBackground:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.SecondPlaceBackground:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.SecondPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 339, _1080p * 767, _1080p * 445.76, _1080p * 506.24, 0 )
				end
			}
		} )
		FirstPlaceBackground:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.FirstPlaceBackground:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.FirstPlaceBackground:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 837, _1080p * 1374, _1080p * 436, _1080p * 516, 0 )
				end
			}
		} )
		FirstPlaceLabel:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.FirstPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1254.5, _1080p * 1374, _1080p * 451, _1080p * 501, 0 )
				end
			}
		} )
		SecondPlaceLabel:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.SecondPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 647.5, _1080p * 767.5, _1080p * 451, _1080p * 501, 0 )
				end
			}
		} )
		ThirdPlaceLabel:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.ThirdPlaceLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1734.5, _1080p * 1854.5, _1080p * 451, _1080p * 501, 0 )
				end
			}
		} )
		FirstPlaceName:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.FirstPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 860.5, _1080p * 1227.5, _1080p * 461, _1080p * 491, 0 )
				end
			}
		} )
		SecondPlaceName:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.SecondPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 342, _1080p * 639, _1080p * 464, _1080p * 488, 0 )
				end
			}
		} )
		ThirdPlaceName:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.ThirdPlaceName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1429, _1080p * 1726, _1080p * 464, _1080p * 486, 0 )
				end
			}
		} )
		MatchBonusValueText:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.MatchBonusValueText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -200.5, _1080p * 1.5, _1080p * 561.5, _1080p * 597.5, 0 )
				end
			}
		} )
		MatchBonusTitleText:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.MatchBonusTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 9, _1080p * 354.25, _1080p * 561.5, _1080p * 597.5, 0 )
				end
			}
		} )
		Stub:RegisterAnimationSequence( "SpiltscreenRightToLeft", {
			{
				function ()
					return self.Stub:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1381.5, _1080p * 1387.5, _1080p * 436, _1080p * 516, 0 )
				end
			}
		} )
		self._sequences.SpiltscreenRightToLeft = function ()
			BlurCopy:AnimateSequence( "SpiltscreenRightToLeft" )
			MatchBonusBG:AnimateSequence( "SpiltscreenRightToLeft" )
			MatchBonusTopBG:AnimateSequence( "SpiltscreenRightToLeft" )
			ThirdPlaceBackground:AnimateSequence( "SpiltscreenRightToLeft" )
			SecondPlaceBackground:AnimateSequence( "SpiltscreenRightToLeft" )
			FirstPlaceBackground:AnimateSequence( "SpiltscreenRightToLeft" )
			FirstPlaceLabel:AnimateSequence( "SpiltscreenRightToLeft" )
			SecondPlaceLabel:AnimateSequence( "SpiltscreenRightToLeft" )
			ThirdPlaceLabel:AnimateSequence( "SpiltscreenRightToLeft" )
			FirstPlaceName:AnimateSequence( "SpiltscreenRightToLeft" )
			SecondPlaceName:AnimateSequence( "SpiltscreenRightToLeft" )
			ThirdPlaceName:AnimateSequence( "SpiltscreenRightToLeft" )
			MatchBonusValueText:AnimateSequence( "SpiltscreenRightToLeft" )
			MatchBonusTitleText:AnimateSequence( "SpiltscreenRightToLeft" )
			Stub:AnimateSequence( "SpiltscreenRightToLeft" )
		end
		
		Blur:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Blur:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Blur:SetGlitchAmount( 1, 200 )
				end,
				function ()
					return self.Blur:SetGlitchAmount( 0, 330 )
				end,
				function ()
					return self.Blur:SetGlitchAmount( 0, 170 )
				end
			},
			{
				function ()
					return self.Blur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Blur:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Blur:SetAlpha( 1, 330 )
				end,
				function ()
					return self.Blur:SetAlpha( 1, 170 )
				end
			}
		} )
		BlurCopy:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.BlurCopy:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BlurCopy:SetAlpha( 0, 200 )
				end,
				function ()
					return self.BlurCopy:SetAlpha( 1, 330 )
				end,
				function ()
					return self.BlurCopy:SetAlpha( 1, 170 )
				end
			},
			{
				function ()
					return self.BlurCopy:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.BlurCopy:SetGlitchAmount( 1, 200 )
				end,
				function ()
					return self.BlurCopy:SetGlitchAmount( 0, 330 )
				end,
				function ()
					return self.BlurCopy:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		RoundEndTitleBG:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RoundEndTitleBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RoundEndTitleBG:SetAlpha( 0, 200 )
				end,
				function ()
					return self.RoundEndTitleBG:SetAlpha( 0.5, 330 )
				end
			},
			{
				function ()
					return self.RoundEndTitleBG:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.RoundEndTitleBG:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.RoundEndTitleBG:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		MatchBonusBG:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.MatchBonusBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MatchBonusBG:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MatchBonusBG:SetAlpha( 0.5, 330 )
				end
			},
			{
				function ()
					return self.MatchBonusBG:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MatchBonusBG:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.MatchBonusBG:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		MatchBonusTopBG:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.MatchBonusTopBG:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MatchBonusTopBG:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MatchBonusTopBG:SetAlpha( 0.75, 330 )
				end
			},
			{
				function ()
					return self.MatchBonusTopBG:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MatchBonusTopBG:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.MatchBonusTopBG:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		RoundEndTitleBGTop:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RoundEndTitleBGTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RoundEndTitleBGTop:SetAlpha( 0, 200 )
				end,
				function ()
					return self.RoundEndTitleBGTop:SetAlpha( 0.75, 330 )
				end
			},
			{
				function ()
					return self.RoundEndTitleBGTop:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.RoundEndTitleBGTop:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.RoundEndTitleBGTop:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		RoundEndTitleText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RoundEndTitleText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RoundEndTitleText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.RoundEndTitleText:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.RoundEndTitleText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.RoundEndTitleText:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.RoundEndTitleText:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		RoundEndReasonText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.RoundEndReasonText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.RoundEndReasonText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.RoundEndReasonText:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.RoundEndReasonText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.RoundEndReasonText:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.RoundEndReasonText:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		ThirdPlaceBackground:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ThirdPlaceBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThirdPlaceBackground:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ThirdPlaceBackground:SetAlpha( 1, 330 )
				end,
				function ()
					return self.ThirdPlaceBackground:SetAlpha( 1, 170 )
				end
			},
			{
				function ()
					return self.ThirdPlaceBackground:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.ThirdPlaceBackground:SetGlitchAmount( 1, 200 )
				end,
				function ()
					return self.ThirdPlaceBackground:SetGlitchAmount( 1, 330 )
				end,
				function ()
					return self.ThirdPlaceBackground:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		SecondPlaceBackground:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.SecondPlaceBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondPlaceBackground:SetAlpha( 0, 200 )
				end,
				function ()
					return self.SecondPlaceBackground:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.SecondPlaceBackground:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.SecondPlaceBackground:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.SecondPlaceBackground:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		FirstPlaceBackground:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FirstPlaceBackground:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FirstPlaceBackground:SetAlpha( 0, 200 )
				end,
				function ()
					return self.FirstPlaceBackground:SetAlpha( 1, 330 )
				end,
				function ()
					return self.FirstPlaceBackground:SetAlpha( 1, 170 )
				end
			},
			{
				function ()
					return self.FirstPlaceBackground:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FirstPlaceBackground:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.FirstPlaceBackground:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		FirstPlaceLabel:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FirstPlaceLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FirstPlaceLabel:SetAlpha( 0, 200 )
				end,
				function ()
					return self.FirstPlaceLabel:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.FirstPlaceLabel:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FirstPlaceLabel:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.FirstPlaceLabel:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		SecondPlaceLabel:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.SecondPlaceLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondPlaceLabel:SetAlpha( 0, 200 )
				end,
				function ()
					return self.SecondPlaceLabel:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.SecondPlaceLabel:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.SecondPlaceLabel:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.SecondPlaceLabel:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		ThirdPlaceLabel:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ThirdPlaceLabel:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThirdPlaceLabel:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ThirdPlaceLabel:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.ThirdPlaceLabel:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.ThirdPlaceLabel:SetGlitchAmount( 1, 200 )
				end,
				function ()
					return self.ThirdPlaceLabel:SetGlitchAmount( 1, 330 )
				end,
				function ()
					return self.ThirdPlaceLabel:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		FirstPlaceName:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.FirstPlaceName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FirstPlaceName:SetAlpha( 0, 200 )
				end,
				function ()
					return self.FirstPlaceName:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.FirstPlaceName:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.FirstPlaceName:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.FirstPlaceName:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		SecondPlaceName:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.SecondPlaceName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.SecondPlaceName:SetAlpha( 0, 200 )
				end,
				function ()
					return self.SecondPlaceName:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.SecondPlaceName:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.SecondPlaceName:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.SecondPlaceName:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		ThirdPlaceName:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ThirdPlaceName:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ThirdPlaceName:SetAlpha( 0, 200 )
				end,
				function ()
					return self.ThirdPlaceName:SetAlpha( 1, 330 )
				end,
				function ()
					return self.ThirdPlaceName:SetAlpha( 1, 170 )
				end
			},
			{
				function ()
					return self.ThirdPlaceName:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.ThirdPlaceName:SetGlitchAmount( 1, 200 )
				end,
				function ()
					return self.ThirdPlaceName:SetGlitchAmount( 0, 330 )
				end,
				function ()
					return self.ThirdPlaceName:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		MatchBonusValueText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.MatchBonusValueText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MatchBonusValueText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MatchBonusValueText:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.MatchBonusValueText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MatchBonusValueText:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.MatchBonusValueText:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		MatchBonusTitleText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.MatchBonusTitleText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MatchBonusTitleText:SetAlpha( 0, 200 )
				end,
				function ()
					return self.MatchBonusTitleText:SetAlpha( 1, 330 )
				end
			},
			{
				function ()
					return self.MatchBonusTitleText:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.MatchBonusTitleText:SetGlitchAmount( 1, 530 )
				end,
				function ()
					return self.MatchBonusTitleText:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		Stub:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Stub:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Stub:SetAlpha( 0, 200 )
				end,
				function ()
					return self.Stub:SetAlpha( 1, 330 )
				end,
				function ()
					return self.Stub:SetAlpha( 1, 170 )
				end
			},
			{
				function ()
					return self.Stub:SetGlitchAmount( 1, 0 )
				end,
				function ()
					return self.Stub:SetGlitchAmount( 0, 530 )
				end,
				function ()
					return self.Stub:SetGlitchAmount( 0, 170 )
				end
			}
		} )
		self._sequences.Intro = function ()
			Blur:AnimateSequence( "Intro" )
			BlurCopy:AnimateSequence( "Intro" )
			RoundEndTitleBG:AnimateSequence( "Intro" )
			MatchBonusBG:AnimateSequence( "Intro" )
			MatchBonusTopBG:AnimateSequence( "Intro" )
			RoundEndTitleBGTop:AnimateSequence( "Intro" )
			RoundEndTitleText:AnimateSequence( "Intro" )
			RoundEndReasonText:AnimateSequence( "Intro" )
			ThirdPlaceBackground:AnimateSequence( "Intro" )
			SecondPlaceBackground:AnimateSequence( "Intro" )
			FirstPlaceBackground:AnimateSequence( "Intro" )
			FirstPlaceLabel:AnimateSequence( "Intro" )
			SecondPlaceLabel:AnimateSequence( "Intro" )
			ThirdPlaceLabel:AnimateSequence( "Intro" )
			FirstPlaceName:AnimateSequence( "Intro" )
			SecondPlaceName:AnimateSequence( "Intro" )
			ThirdPlaceName:AnimateSequence( "Intro" )
			MatchBonusValueText:AnimateSequence( "Intro" )
			MatchBonusTitleText:AnimateSequence( "Intro" )
			Stub:AnimateSequence( "Intro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "Intro" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	if CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "RightToLeft" )
	end
	if CONDITIONS.IsSplitscreen( self ) and CONDITIONS.IsArabic( self ) then
		ACTIONS.AnimateSequence( self, "SpiltscreenRightToLeft" )
	end
	return self
end

MenuBuilder.registerType( "RoundEndFFAHUD", RoundEndFFAHUD )
LockTable( _M )
