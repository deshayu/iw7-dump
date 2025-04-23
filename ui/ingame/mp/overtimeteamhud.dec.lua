local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OvertimeTeamHUD( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "OvertimeTeamHUD"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAlpha( 0.6, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 1790, _1080p * 321.5, _1080p * 671.5 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local Vs = nil
	
	Vs = LUI.UIText.new()
	Vs.id = "Vs"
	Vs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_VERSUS" ) ), 0 )
	Vs:SetFontSize( 48 * _1080p )
	Vs:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Vs:SetAlignment( LUI.Alignment.Center )
	Vs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 842, _1080p * 1078, _1080p * 515, _1080p * 563 )
	self:addElement( Vs )
	self.Vs = Vs
	
	local OvertimeFriendlyTeam = nil
	
	OvertimeFriendlyTeam = MenuBuilder.BuildRegisteredType( "OvertimeTeamInfo", {
		controllerIndex = f1_local1
	} )
	OvertimeFriendlyTeam.id = "OvertimeFriendlyTeam"
	OvertimeFriendlyTeam.BackgroundColorTop:SetLeft( _1080p * 827, 0 )
	OvertimeFriendlyTeam.BackgroundColorTop:SetRight( _1080p * 0, 0 )
	OvertimeFriendlyTeam.BackgroundColorTop:SetTop( _1080p * 5, 0 )
	OvertimeFriendlyTeam.BackgroundColorTop:SetRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
	OvertimeFriendlyTeam.OvertimeTeamTimer:SetLeft( _1080p * 17, 0 )
	OvertimeFriendlyTeam.OvertimeTeamTimer:SetRight( _1080p * 792, 0 )
	OvertimeFriendlyTeam.OvertimeTeamTimer.CountdownElement:setEndTime( 0 )
	OvertimeFriendlyTeam:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 960, _1080p * 321.5, _1080p * 671.5 )
	self:addElement( OvertimeFriendlyTeam )
	self.OvertimeFriendlyTeam = OvertimeFriendlyTeam
	
	local OvertimeEnemyTeam = nil
	
	OvertimeEnemyTeam = MenuBuilder.BuildRegisteredType( "OvertimeTeamInfo", {
		controllerIndex = f1_local1
	} )
	OvertimeEnemyTeam.id = "OvertimeEnemyTeam"
	OvertimeEnemyTeam.BackgroundColorTop:SetLeft( _1080p * 0, 0 )
	OvertimeEnemyTeam.BackgroundColorTop:SetRight( _1080p * 830, 0 )
	OvertimeEnemyTeam.BackgroundColorTop:SetTop( _1080p * 5, 0 )
	OvertimeEnemyTeam.BackgroundColorTop:SetRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
	OvertimeEnemyTeam.OvertimeTeamTimer:SetLeft( _1080p * 511, 0 )
	OvertimeEnemyTeam.OvertimeTeamTimer:SetRight( _1080p * 462, 0 )
	OvertimeEnemyTeam.OvertimeTeamTimer.CountdownElement:setEndTime( 0 )
	OvertimeEnemyTeam:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 960, _1080p * 1790, _1080p * 321, _1080p * 671 )
	self:addElement( OvertimeEnemyTeam )
	self.OvertimeEnemyTeam = OvertimeEnemyTeam
	
	local Header = nil
	
	Header = LUI.UIImage.new()
	Header.id = "Header"
	Header:setImage( RegisterMaterial( "widg_teamscore_header" ), 0 )
	Header:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 130, _1080p * -130, _1080p * 321.5, _1080p * 457.5 )
	self:addElement( Header )
	self.Header = Header
	
	local RoundEndTitleText = nil
	
	RoundEndTitleText = LUI.UIText.new()
	RoundEndTitleText.id = "RoundEndTitleText"
	RoundEndTitleText:SetDotPitchEnabled( true )
	RoundEndTitleText:SetDotPitchX( 2, 0 )
	RoundEndTitleText:SetDotPitchY( 2, 0 )
	RoundEndTitleText:SetDotPitchContrast( 0, 0 )
	RoundEndTitleText:SetDotPitchMode( 0 )
	RoundEndTitleText:setText( ToUpperCase( Engine.Localize( "MP_OVERTIME" ) ), 0 )
	RoundEndTitleText:SetFontSize( 105 * _1080p )
	RoundEndTitleText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	RoundEndTitleText:SetAlignment( LUI.Alignment.Center )
	RoundEndTitleText:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -260, _1080p * 260, _1080p * 365, _1080p * 424 )
	self:addElement( RoundEndTitleText )
	self.RoundEndTitleText = RoundEndTitleText
	
	local RoundEndReason = nil
	
	RoundEndReason = LUI.UIStyledText.new()
	RoundEndReason.id = "RoundEndReason"
	RoundEndReason:SetFontSize( 26 * _1080p )
	RoundEndReason:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RoundEndReason:SetAlignment( LUI.Alignment.Center )
	RoundEndReason:SetDecodeUseSystemTime( false )
	RoundEndReason:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -830, _1080p * 830, _1080p * 323, _1080p * 349 )
	RoundEndReason:SubscribeToModel( DataSources.inGame.MP.roundEnd.roundEndReason:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.MP.roundEnd.roundEndReason:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			RoundEndReason:setText( ToUpperCase( LocalizeString( f2_local0 ) ), 0 )
		end
	end )
	self:addElement( RoundEndReason )
	self.RoundEndReason = RoundEndReason
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		RoundEndTitleText:RegisterAnimationSequence( "showMatchBonus", {
			{
				function ()
					return self.RoundEndTitleText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.showMatchBonus = function ()
			RoundEndTitleText:AnimateSequence( "showMatchBonus" )
		end
		
		RoundEndTitleText:RegisterAnimationSequence( "hideMatchBonus", {
			{
				function ()
					return self.RoundEndTitleText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.hideMatchBonus = function ()
			RoundEndTitleText:AnimateSequence( "hideMatchBonus" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "OvertimeTeamHUD", OvertimeTeamHUD )
LockTable( _M )
