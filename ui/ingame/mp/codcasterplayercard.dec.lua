local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateSpectator( f1_arg0, f1_arg1 )
	local f1_local0 = Game.GetPlayerstateClientnum()
	local f1_local1 = Game.GetPlayerName( f1_local0 )
	if Game.GetPlayerClientnum() ~= f1_local0 then
		f1_arg0:SetVisibility( f1_arg1, true )
		f1_arg0.PlayerName:setText( f1_local1 )
		local f1_local2 = Game.GetPlayerTeam( f1_local0 )
		local f1_local3 = ""
		local f1_local4 = 0
		if f1_local2 == Teams.allies then
			f1_local3 = CODCASTER.GetTeam1Name( f1_arg1 )
			f1_local4 = CODCASTER.GetTeam1Color( f1_arg1 )
		elseif f1_local2 == Teams.axis then
			f1_local3 = CODCASTER.GetTeam2Name( f1_arg1 )
			f1_local4 = CODCASTER.GetTeam2Color( f1_arg1 )
		end
		f1_arg0.TeamName:setText( f1_local3 )
		f1_arg0.TempBottom:SetRGBFromInt( f1_local4 )
		f1_arg0.Health.Fill:SetRGBFromInt( 16777215 )
		local f1_local5 = MLG.GetClientLoadoutInfo( f1_local0 )
		f1_arg0.RigName:setText( Engine.Localize( Engine.TableLookup( CSV.battleRigs.file, CSV.battleRigs.cols.index, f1_local5.archetypeIndex, CSV.battleRigs.cols.name ) ), 0 )
		if f1_arg0.current_client_num ~= f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "SwitchPlayer" )
		end
		f1_arg0.current_client_num = f1_local0
	end
end

function UpdateSpectatorEvent( f2_arg0 )
	return function ( f3_arg0, f3_arg1 )
		UpdateSpectator( f3_arg0, f2_arg0 )
	end
	
end

function SetPlayerSwitchVisibility( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0.PlayerSwitch
	local f4_local1 = f4_local0
	f4_local0 = f4_local0.SetAlpha
	local f4_local2
	if f4_arg1 then
		f4_local2 = 1
		if not f4_local2 then
		
		else
			f4_local0( f4_local1, f4_local2 )
		end
	end
	f4_local2 = 0
end

function SetVisibility( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = LUI.CodcasterLayer.GetInstance()
	if f5_arg2 and Game.GetPlayerstateClientnum() ~= Game.GetPlayerClientnum() and not f5_local0.isScoreboardOpen then
		f5_arg0:SetAlpha( MLG.ShoutcasterProfileVarBool( f5_arg1, "shoutcaster_qs_playercard" ) and 1 or 0 )
	else
		f5_arg0:SetAlpha( 0 )
	end
end

function SetTeamNameVisibility( f6_arg0, f6_arg1 )
	f6_arg0.TeamName:SetAlpha( f6_arg1 )
end

f0_local0 = function ( f7_arg0 )
	f7_arg0:RegisterAnimationSequence( "MoveDown", {
		{
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080, 0 )
			end,
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 30, _1080p * 1110, 150 )
			end
		}
	} )
	f7_arg0:RegisterAnimationSequence( "MoveUp", {
		{
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080, 0 )
			end,
			function ()
				return f7_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * -30, _1080p * 1050, 150 )
			end
		}
	} )
end

function PostLoadFunc( f12_arg0, f12_arg1, f12_arg2 )
	f0_local0( f12_arg0 )
	f12_arg0.SetPlayerSwitchVisibility = SetPlayerSwitchVisibility
	f12_arg0.SetTeamNameVisibility = SetTeamNameVisibility
	f12_arg0.SetVisibility = SetVisibility
	UpdateSpectator( f12_arg0, f12_arg1 )
	f12_arg0.UpdateSpectator = UpdateSpectator
	f12_arg0:SubscribeToModel( DataSources.inGame.player.health:GetModel( f12_arg1 ), function ()
		local f13_local0 = DataSources.inGame.player.health:GetValue( f12_arg1 )
		local f13_local1 = DataSources.inGame.player.maxHealth:GetValue( f12_arg1 )
		if f13_local0 ~= nil and f13_local1 ~= nil then
			if f13_local0 == 0 then
				f12_arg0.Health:SetAlpha( 0 )
			else
				f12_arg0.Health:SetAlpha( 1 )
			end
			local f13_local2 = nil
			if f13_local1 == 0 then
				f13_local2 = 0
			else
				f13_local2 = f13_local0 / f13_local1
			end
			if f13_local2 < 0 then
				f13_local2 = 0
			elseif f13_local2 > 1 then
				f13_local2 = 1
			end
			f12_arg0.Health.Fill:SetRightAnchor( 1 - f13_local2 )
		end
	end )
	f12_arg0.FollowDroneEnabled:SetAlpha( 0 )
	f12_arg0:SubscribeToModel( DataSources.inGame.MP.spectating.followDroneActive:GetModel( f12_arg1 ), function ()
		local f14_local0 = Engine.GetDvarString( "ui_gametype" )
		if f14_local0 == MP.GameMode.BallGameType or f14_local0 == MP.GameMode.TDefGameType then
			local f14_local1 = DataSources.inGame.MP.spectating.followDroneActive:GetValue( f12_arg1 )
			if f14_local1 ~= nil then
				local f14_local2 = ""
				if not Engine.IsPC() then
					f14_local2 = Engine.Localize( "PLATFORM_RIGHT_STICK_NOSWAP" ) .. " "
				end
				if f14_local1 then
					f12_arg0.FollowDroneEnabled:setText( f14_local2 .. Engine.Localize( "CODCASTER_FOLLOW_DRONE_ENABLED" ), 0 )
					f12_arg0.FollowDroneEnabled:SetAlpha( 1 )
				else
					f12_arg0.FollowDroneEnabled:setText( f14_local2 .. Engine.Localize( "CODCASTER_ENABLE_FOLLOW_DRONE" ), 0 )
					f12_arg0.FollowDroneEnabled:SetAlpha( 0.35 )
				end
			end
		else
			f12_arg0.FollowDroneEnabled:SetAlpha( 0 )
		end
	end )
end

function CodcasterPlayerCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodcasterPlayerCard"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	local f15_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 0.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 452.5, _1080p * 918.25, _1080p * 1022.25 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local TempBottom = nil
	
	TempBottom = LUI.UIImage.new()
	TempBottom.id = "TempBottom"
	TempBottom:SetAlpha( 0.8, 0 )
	TempBottom:SetDotPitchEnabled( true )
	TempBottom:SetDotPitchX( 6, 0 )
	TempBottom:SetDotPitchY( 3, 0 )
	TempBottom:SetDotPitchContrast( 0.15, 0 )
	TempBottom:SetDotPitchMode( 0 )
	TempBottom:setImage( RegisterMaterial( "codcaster_playercard_bg" ), 0 )
	TempBottom:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -120, _1080p * 452.5, _1080p * 898, _1080p * 1026 )
	self:addElement( TempBottom )
	self.TempBottom = TempBottom
	
	local PlayerSelectBG = nil
	
	PlayerSelectBG = LUI.UIImage.new()
	PlayerSelectBG.id = "PlayerSelectBG"
	PlayerSelectBG:SetAlpha( 0.5, 0 )
	PlayerSelectBG:SetBlendMode( BLEND_MODE.add )
	PlayerSelectBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 54, _1080p * 442, _1080p * 918.25, _1080p * 944.75 )
	self:addElement( PlayerSelectBG )
	self.PlayerSelectBG = PlayerSelectBG
	
	local PlayerSwitch = nil
	
	PlayerSwitch = MenuBuilder.BuildRegisteredType( "CodcasterPlayerCardPlayerSwitch", {
		controllerIndex = f15_local1
	} )
	PlayerSwitch.id = "PlayerSwitch"
	PlayerSwitch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 153.25, _1080p * 353.25, _1080p * 887.75, _1080p * 921.75 )
	self:addElement( PlayerSwitch )
	self.PlayerSwitch = PlayerSwitch
	
	local TeamName = nil
	
	TeamName = LUI.UIText.new()
	TeamName.id = "TeamName"
	TeamName:setText( "", 0 )
	TeamName:SetFontSize( 24 * _1080p )
	TeamName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	TeamName:SetAlignment( LUI.Alignment.Left )
	TeamName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66.25, _1080p * 392.25, _1080p * 959.5, _1080p * 983.5 )
	self:addElement( TeamName )
	self.TeamName = TeamName
	
	local RigName = nil
	
	RigName = LUI.UIText.new()
	RigName.id = "RigName"
	RigName:setText( Engine.Localize( "LUA_MENU_MP_RIG" ), 0 )
	RigName:SetFontSize( 24 * _1080p )
	RigName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	RigName:SetAlignment( LUI.Alignment.Left )
	RigName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66.25, _1080p * 392.25, _1080p * 993.5, _1080p * 1017.5 )
	self:addElement( RigName )
	self.RigName = RigName
	
	local PlayerName = nil
	
	PlayerName = LUI.UIText.new()
	PlayerName.id = "PlayerName"
	PlayerName:SetRGBFromInt( 0, 0 )
	PlayerName:setText( "PlayerName", 0 )
	PlayerName:SetFontSize( 24 * _1080p )
	PlayerName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PlayerName:SetAlignment( LUI.Alignment.Left )
	PlayerName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 66.75, _1080p * 425.75, _1080p * 921.75, _1080p * 945.75 )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromInt( 0, 0 )
	Highlight:setImage( RegisterMaterial( "codcaster_shine" ), 0 )
	Highlight:SetUMin( 0.1, 0 )
	Highlight:SetUMax( 0.9, 0 )
	Highlight:SetVMin( 0.2, 0 )
	Highlight:SetVMax( 0.8, 0 )
	Highlight:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 62.5, _1080p * 442, _1080p * 944.75, _1080p * 1022.25 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local Health = nil
	
	Health = MenuBuilder.BuildRegisteredType( "PlayerHealthbar", {
		controllerIndex = f15_local1
	} )
	Health.id = "Health"
	Health:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 55, _1080p * 442, _1080p * 950, _1080p * 956 )
	self:addElement( Health )
	self.Health = Health
	
	local FollowDroneEnabled = nil
	
	FollowDroneEnabled = LUI.UIText.new()
	FollowDroneEnabled.id = "FollowDroneEnabled"
	FollowDroneEnabled:setText( Engine.Localize( "CODCASTER_ENABLE_FOLLOW_DRONE" ), 0 )
	FollowDroneEnabled:SetFontSize( 19 * _1080p )
	FollowDroneEnabled:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FollowDroneEnabled:setTextStyle( CoD.TextStyle.Shadowed )
	FollowDroneEnabled:SetAlignment( LUI.Alignment.Center )
	FollowDroneEnabled:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 452.5, _1080p * 871, _1080p * 890 )
	self:addElement( FollowDroneEnabled )
	self.FollowDroneEnabled = FollowDroneEnabled
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "SwitchPlayer", {
			{
				function ()
					return self.Highlight:SetUMin( 0.7, 0 )
				end,
				function ()
					return self.Highlight:SetUMin( -0.5, 620 )
				end
			},
			{
				function ()
					return self.Highlight:SetUMax( 1.5, 0 )
				end,
				function ()
					return self.Highlight:SetUMax( 0.3, 620 )
				end
			},
			{
				function ()
					return self.Highlight:SetRGBFromInt( 0, 50 )
				end,
				function ()
					return self.Highlight:SetRGBFromInt( 16777215, 190 )
				end,
				function ()
					return self.Highlight:SetRGBFromInt( 4210752, 160 )
				end,
				function ()
					return self.Highlight:SetRGBFromInt( 0, 160 )
				end
			}
		} )
		self._sequences.SwitchPlayer = function ()
			Highlight:AnimateSequence( "SwitchPlayer" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f15_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterPlayerCard", CodcasterPlayerCard )
LockTable( _M )
