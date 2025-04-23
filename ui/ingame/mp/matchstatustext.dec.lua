local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg2 < f1_arg1 then
		f1_arg0.MatchStatus:setText( Engine.Localize( "MPUI_WINNING_CAPS" ) )
		ACTIONS.AnimateSequence( f1_arg0, "MatchStatusTextWinning" )
	elseif f1_arg1 < f1_arg2 then
		f1_arg0.MatchStatus:setText( Engine.Localize( "MPUI_LOSING_CAPS" ) )
		ACTIONS.AnimateSequence( f1_arg0, "MatchStatusTextLosing" )
	elseif f1_arg1 == f1_arg2 then
		f1_arg0.MatchStatus:setText( Engine.Localize( "MPUI_TIED_CAPS" ) )
		ACTIONS.AnimateSequence( f1_arg0, "MatchStatusTextTied" )
	elseif f1_arg1 < f1_arg2 then
		f1_arg0.MatchStatus:setText( Engine.Localize( "MPUI_LOSING_CAPS" ) )
		ACTIONS.AnimateSequence( f1_arg0, "MatchStatusTextLosing" )
	elseif f1_arg2 < f1_arg1 then
		f1_arg0.MatchStatus:setText( Engine.Localize( "MPUI_WINNING_CAPS" ) )
		ACTIONS.AnimateSequence( f1_arg0, "MatchStatusTextWinning" )
	elseif f1_arg1 == f1_arg2 then
		f1_arg0.MatchStatus:setText( Engine.Localize( "MPUI_TIED_CAPS" ) )
		ACTIONS.AnimateSequence( f1_arg0, "MatchStatusTextTied" )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1 )
	f2_arg0.MatchMode:SetShadowUOffset( -0 )
	f2_arg0.MatchMode:SetShadowVOffset( -0 )
	f2_arg0.MatchMode:SetWordWrap( false )
	f2_arg0.MatchStatus:SetShadowUOffset( -0 )
	f2_arg0.MatchStatus:SetShadowVOffset( -0 )
	f2_arg0.MatchStatus:SetWordWrap( false )
	f2_arg0.UpdateStatusFunc = f0_local0
	f2_arg0.MatchStatus:SubscribeToModel( DataSources.inGame.MP.match.teamScoreFriendly:GetModel( f2_arg1 ), function ( f3_arg0 )
		local f3_local0 = DataModel.GetModelValue( f3_arg0 )
		local f3_local1 = DataSources.inGame.MP.match.teamScoreEnemy:GetValue( f2_arg1 )
		local f3_local2 = f3_local0
		local f3_local3 = f3_local1
		if CODCASTER.IsCODCaster() and Game.GetPlayerTeam( Game.GetPlayerstateClientnum() ) == Teams.axis then
			f3_local2 = f3_local1
			f3_local3 = f3_local0
		end
		if f3_local2 ~= nil and f3_local3 ~= nil then
			f0_local0( f2_arg0, f3_local2, f3_local3 )
		end
	end )
	f2_arg0.MatchStatus:SubscribeToModel( DataSources.inGame.MP.match.teamScoreEnemy:GetModel( f2_arg1 ), function ( f4_arg0 )
		local f4_local0 = DataSources.inGame.MP.match.teamScoreFriendly:GetValue( f2_arg1 )
		local f4_local1 = DataModel.GetModelValue( f4_arg0 )
		local f4_local2 = f4_local0
		local f4_local3 = f4_local1
		if CODCASTER.IsCODCaster() and Game.GetPlayerTeam( Game.GetPlayerstateClientnum() ) == Teams.axis then
			f4_local2 = f4_local1
			f4_local3 = f4_local0
		end
		if f4_local2 ~= nil and f4_local3 ~= nil then
			f0_local0( f2_arg0, f4_local2, f4_local3 )
		end
	end )
end

function MatchStatusText( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 138 * _1080p, 0, 22 * _1080p )
	self.id = "MatchStatusText"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local MatchMode = nil
	
	MatchMode = LUI.UIStyledText.new()
	MatchMode.id = "MatchMode"
	MatchMode:SetAlpha( 0, 0 )
	MatchMode:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MatchMode:SetFontSize( 22 * _1080p )
	MatchMode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchMode:SetAlignment( LUI.Alignment.Center )
	MatchMode:SetShadowMinDistance( -0.2, 0 )
	MatchMode:SetShadowMaxDistance( 0.2, 0 )
	self:addElement( MatchMode )
	self.MatchMode = MatchMode
	
	local MatchStatus = nil
	
	MatchStatus = LUI.UIStyledText.new()
	MatchStatus.id = "MatchStatus"
	MatchStatus:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	MatchStatus:setText( "", 0 )
	MatchStatus:SetFontSize( 22 * _1080p )
	MatchStatus:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MatchStatus:SetAlignment( LUI.Alignment.Center )
	MatchStatus:SetShadowMinDistance( -0.2, 0 )
	MatchStatus:SetShadowMaxDistance( 0.2, 0 )
	self:addElement( MatchStatus )
	self.MatchStatus = MatchStatus
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MatchStatus:RegisterAnimationSequence( "MatchStatusTextWinning", {
			{
				function ()
					return self.MatchStatus:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
				end
			}
		} )
		self._sequences.MatchStatusTextWinning = function ()
			MatchStatus:AnimateSequence( "MatchStatusTextWinning" )
		end
		
		MatchStatus:RegisterAnimationSequence( "MatchStatusTextLosing", {
			{
				function ()
					return self.MatchStatus:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
				end
			}
		} )
		self._sequences.MatchStatusTextLosing = function ()
			MatchStatus:AnimateSequence( "MatchStatusTextLosing" )
		end
		
		MatchStatus:RegisterAnimationSequence( "MatchStatusTextTied", {
			{
				function ()
					return self.MatchStatus:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
				end
			}
		} )
		self._sequences.MatchStatusTextTied = function ()
			MatchStatus:AnimateSequence( "MatchStatusTextTied" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchStatusText", MatchStatusText )
LockTable( _M )
