local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function UpdateGameModeIcon( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if f1_arg0.clientNum ~= nil then
		if f1_arg0.clientNum == f1_arg2:GetValue( f1_arg1 ) then
			f1_arg0.gameModeIcons[f1_arg3]:SetAlpha( 1, 0 )
		else
			f1_arg0.gameModeIcons[f1_arg3]:SetAlpha( 0, 0 )
		end
	end
end

function SetPlayerNumberVisibility( f2_arg0, f2_arg1 )
	if f2_arg1 then
		f2_arg0.PlayerIndex:SetAlpha( 1 )
	else
		f2_arg0.PlayerIndex:SetAlpha( 0 )
	end
end

function UpdateAnimationState( f3_arg0, f3_arg1, f3_arg2 )
	if not f3_arg0.animationNames[f3_arg1] then
		f3_arg0.animationNames[f3_arg1] = true
		f3_arg0.animationNames[f3_arg2] = false
		ACTIONS.AnimateSequence( f3_arg0, f3_arg1 )
	end
end

function SetSelected( f4_arg0, f4_arg1 )
	local f4_local0
	if f4_arg1 then
		f4_local0 = COLORS.black
		if not f4_local0 then
		
		else
			for f4_local1 = 1, #f4_arg0.newColumns, 1 do
				f4_arg0.newColumns[f4_local1].Field:SetRGBFromTable( f4_local0, 0 )
			end
		end
	end
	f4_local0 = COLORS.white
end

function RefreshRowContent( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = Game.GetScoreboardRowData( f5_arg2, f5_arg3 )
	assert( f5_local0 )
	f5_arg0.clientNum = f5_local0.clientNum
	assert( f5_local0.name )
	local f5_local1 = f5_local0.name
	local f5_local2 = f5_local0.clanTag
	if f5_local1 and f5_local2 and #f5_local2 > 0 then
		f5_local1 = "[" .. f5_local2 .. "]" .. f5_local1
	end
	f5_arg0.Name.Field:setText( f5_local1, 0 )
	f5_arg0.newColumns[1].Field:setText( f5_local0.kills .. " / " .. f5_local0.deaths, 0 )
	f5_arg0.newColumns[2].Field:setText( f5_local0.consecutiveKills, 0 )
	local f5_local3 = function ( f6_arg0 )
		local f6_local0 = f6_arg0:getParent()
		local f6_local1 = f6_local0:getParent()
		f6_local1:UpdateHardpointsColor( f5_arg1 )
	end
	
	f5_local3( f5_arg0 )
	if f5_local0.isDead == true then
		for f5_local3 = 1, #f5_arg0.gameModeIcons, 1 do
			f5_arg0.gameModeIcons[f5_local3]:SetAlpha( 0, 0 )
		end
		UpdateAnimationState( f5_arg0, "PlayerDead", "PlayerNotDead" )
	else
		UpdateAnimationState( f5_arg0, "PlayerNotDead", "PlayerDead" )
	end
	f5_local3 = DataSources.inGame.MP.match.gameType:GetValue( f5_arg1 )
	if f5_local0.isGametypeVIP and not f5_local0.isDead then
		if f5_local3 == "ctf" then
			UpdateAnimationState( f5_arg0, "FlagCarry", "NotFlagCarry" )
		elseif f5_local3 == "koth" then
			UpdateAnimationState( f5_arg0, "PlayerOnHardpoint", "PlayerNotOnHardpoint" )
		elseif f5_local3 == "ball" then
			f5_arg0.gameModeIcons[1]:SetAlpha( 1 )
		end
	elseif f5_local3 == "ctf" then
		UpdateAnimationState( f5_arg0, "NotFlagCarry", "FlagCarry" )
	elseif f5_local3 == "koth" then
		UpdateAnimationState( f5_arg0, "PlayerNotOnHardpoint", "PlayerOnHardpoint" )
	elseif f5_local3 == "ball" then
		f5_arg0.gameModeIcons[1]:SetAlpha( 0 )
	end
	f5_arg0.SuperMeterFill:SetProgress( f5_local0.superMeterProgress )
	if f5_local0.superMeterProgress == 1 then
		f5_arg0.isSuperCharging = false
		UpdateAnimationState( f5_arg0, "Super_Ready", "Super_NotReady" )
	elseif f5_local0.isSpecialActive == true and f5_arg0.isSpecialActive == false then
		UpdateAnimationState( f5_arg0, "Super_Active", "Super_Ready" )
		f5_arg0.isSpecialActive = true
		f5_arg0.isSuperCharging = false
	elseif f5_local0.isSpecialActive == false then
		f5_arg0.isSpecialActive = false
		UpdateAnimationState( f5_arg0, "Super_NotReady", "Super_Active" )
	end
	if f5_local0.isSpecialActive == true then
		f5_arg0.isSuperCharging = false
		f5_arg0.SuperMeterFill:SetRGBFromInt( 1810175, 0 )
	elseif f5_local0.superMeterProgress == 1 and f5_arg0.isSpecialActive == false then
		f5_arg0.isSuperCharging = false
		f5_arg0.SuperMeterFill:SetRGBFromInt( 16770560, 0 )
	elseif f5_local0.superMeterProgress < 1 and f5_arg0.isSuperCharging == false then
		f5_arg0.isSpecialActive = false
		f5_arg0.isSuperCharging = true
		f5_arg0.SuperMeterFill:SetRGBFromInt( 16777215, 0 )
	end
	if f5_arg2 == Teams.free then
		if f5_arg3 < 9 then
			f5_arg0.PlayerIndex.Field:setText( f5_arg3 + 1, 0 )
		elseif f5_arg3 == 9 then
			f5_arg0.PlayerIndex.Field:setText( 0, 0 )
		elseif f5_arg3 > 9 then
			f5_arg0.PlayerIndex.Field:setText( "", 0 )
		end
	else
		local f5_local4 = 4
		if f5_arg3 < f5_local4 then
			f5_arg0.PlayerIndex.Field:setText( (2 - f5_arg2) * f5_local4 + f5_arg3 + 1, 0 )
		else
			f5_arg0.PlayerIndex.Field:setText( "", 0 )
		end
	end
	local f5_local4 = CODCASTER.gameModeColumnSettings[f5_local3][CODCASTER.columnSettingSetupFunction]
	if f5_local4 then
		f5_local4( f5_arg0, f5_arg0.newColumns[3], f5_arg1, f5_local0 )
	end
end

function PostLoadFunc( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = {
		"0 / 0",
		"0"
	}
	local f7_local1 = CODCASTER.fixedColumnsWidth
	f7_arg0.newColumns = {}
	f7_arg0.isFollowed = false
	f7_arg0.isDpadSelected = false
	f7_arg0.animationNames = {}
	f7_arg0.isSpecialActive = false
	f7_arg0.isSuperCharging = false
	f7_local0[3] = CODCASTER.gameModeColumnSettings[GameX.GetGameMode()][CODCASTER.columnSettingDefaultValue]
	for f7_local2 = 1, #CODCASTER.extraColumnsWidths, 1 do
		f7_local1 = CODCASTER.AddPlayerListColumn( f7_arg0, f7_local1, f7_arg1, f7_local0[f7_local2], CODCASTER.extraColumnsWidths[f7_local2], f7_local2 )
	end
	f7_arg0:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
		if f7_arg0.clientNum ~= nil then
			Game.TogglePlayerMute( f7_arg0.clientNum )
		end
	end )
	f7_arg0:addEventHandler( "button_up", function ()
		if not f7_arg0.isFollowed then
			ACTIONS.AnimateSequence( f7_arg0, "ScrollUp" )
			SetPlayerNumberVisibility( f7_arg0, MLG.ShoutcasterProfileVarBool( f7_arg1, "shoutcaster_qs_playernumbers" ) )
		end
	end )
	f7_arg0:addEventHandler( "button_over", function ()
		if not f7_arg0.isFollowed then
			ACTIONS.AnimateSequence( f7_arg0, "ScrollOver" )
			SetPlayerNumberVisibility( f7_arg0, MLG.ShoutcasterProfileVarBool( f7_arg1, "shoutcaster_qs_playernumbers" ) )
		end
	end )
	f7_arg0:setGainFocusSFX( nil )
	local f7_local2 = DataSources.inGame.MP.match.gameType:GetValue( f7_arg1 )
	if f7_local2 == "dm" then
		local self = nil
		self = LUI.UIImage.new()
		self.id = "BackgroundAlternate"
		self:SetAnchors( 0, 0, 0, 0, 0 )
		self:SetLeft( _1080p * 0, 0 )
		self:SetRight( _1080p * 0, 0 )
		self:SetTop( _1080p * 0, 0 )
		self:SetBottom( _1080p * 0, 0 )
		self:SetRGBFromTable( SWATCHES.Scoreboard.backgroundFFA, 0 )
		self:SubscribeToModelThroughElement( f7_arg0, "rowBgAlpha", function ()
			local f11_local0 = f7_arg0:GetDataSource()
			f11_local0 = f11_local0.rowBgAlpha:GetValue( f7_arg1 )
			if f11_local0 ~= nil then
				self:SetAlpha( f11_local0, 0 )
			end
		end )
		self:setPriority( -1000 )
		f7_arg0:addElement( self )
		f7_arg0.BackgroundAlternate = self
	end
	self = function ( f12_arg0, f12_arg1 )
		local self = nil
		if not Engine.InFrontend() then
			self = LUI.UIImage.new()
			self.id = "gameModeIcon" .. #f12_arg0.gameModeIcons
			self:SetAlpha( 0, 0 )
			self:SetScale( -0.2, 0 )
			self:setImage( RegisterMaterial( f12_arg1 ), 0 )
			self:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 2, _1080p * 36, _1080p * -2, _1080p * 2 )
			f12_arg0:addElement( self )
			f12_arg0.gameModeIcons[#f12_arg0.gameModeIcons + 1] = self
		end
	end
	
	f7_arg0.gameModeIcons = {}
	local f7_local4 = {}
	if f7_local2 == "sd" then
		f7_local4[1] = DataSources.inGame.HUD.bombCarrier
		f7_local4[2] = DataSources.inGame.HUD.bombDefuser
		self( f7_arg0, CODCASTER.gameModeColumnSettings.sd[CODCASTER.columnSettingImageName] )
		self( f7_arg0, CODCASTER.gameModeColumnSettings.sd[CODCASTER.columnSettingImageName] )
	elseif f7_local2 == "ball" then
		self( f7_arg0, CODCASTER.gameModeColumnSettings.ball[CODCASTER.columnSettingImageName] )
	elseif f7_local2 == "dom" then
		f7_local4[1] = nil
	end
	for f7_local5 = 1, #f7_local4, 1 do
		local f7_local8 = f7_local5
		f7_arg0:SubscribeToModel( f7_local4[f7_local8]:GetModel( f7_arg1 ), function ()
			UpdateGameModeIcon( f7_arg0, f7_arg1, f7_local4[f7_local8], f7_local8 )
		end )
	end
	f7_arg0.SetPlayerNumberVisibility = SetPlayerNumberVisibility
	f7_arg0.RefreshRowContent = RefreshRowContent
	f7_arg0.SetSelected = SetSelected
	SetPlayerNumberVisibility( f7_arg0, MLG.ShoutcasterProfileVarBool( f7_arg1, "shoutcaster_qs_playernumbers" ) )
end

function CodCasterPlayerListRowWidget( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 542 * _1080p, 0, 25 * _1080p )
	self.id = "CodCasterPlayerListRowWidget"
	self._animationSets = {}
	self._sequences = {}
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	local f14_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetDotPitchEnabled( true )
	Blur:SetDotPitchX( 6, 0 )
	Blur:SetDotPitchY( 3, 0 )
	Blur:SetDotPitchContrast( 0.15, 0 )
	Blur:SetDotPitchMode( 0 )
	Blur:SetUseAA( true )
	Blur:SetBlurStrength( 0.75, 0 )
	Blur:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 542, _1080p * -542, _1080p * 25, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 8421504, 0 )
	Background:SetAlpha( 0.75, 0 )
	Background:SetDotPitchEnabled( true )
	Background:SetDotPitchX( 6, 0 )
	Background:SetDotPitchY( 3, 0 )
	Background:SetDotPitchContrast( 0.15, 0 )
	Background:SetDotPitchMode( 0 )
	Background:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 25 )
	self:addElement( Background )
	self.Background = Background
	
	local Selection = nil
	
	Selection = LUI.UIImage.new()
	Selection.id = "Selection"
	Selection:SetRGBFromInt( 0, 0 )
	Selection:SetAlpha( 0, 0 )
	Selection:SetDotPitchEnabled( true )
	Selection:SetDotPitchX( 6, 0 )
	Selection:SetDotPitchY( 3, 0 )
	Selection:SetDotPitchContrast( 0.15, 0 )
	Selection:SetDotPitchMode( 0 )
	Selection:SetBlendMode( BLEND_MODE.blend )
	Selection:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 25 )
	self:addElement( Selection )
	self.Selection = Selection
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetDotPitchEnabled( true )
	Highlight:SetDotPitchX( 6, 0 )
	Highlight:SetDotPitchY( 3, 0 )
	Highlight:SetDotPitchContrast( 0.15, 0 )
	Highlight:SetDotPitchMode( 0 )
	Highlight:SetBlendMode( BLEND_MODE.add )
	Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 25 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f14_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, _1080p * 0.5, _1080p * 25 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	local SuperMeterBG = nil
	
	SuperMeterBG = LUI.UIImage.new()
	SuperMeterBG.id = "SuperMeterBG"
	SuperMeterBG:SetRGBFromInt( 0, 0 )
	SuperMeterBG:SetAlpha( 0.25, 0 )
	SuperMeterBG:setImage( RegisterMaterial( "codcaster_playerlist_circle_bg" ), 0 )
	SuperMeterBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -238.5, _1080p * -215.5, _1080p * -12, _1080p * 11 )
	self:addElement( SuperMeterBG )
	self.SuperMeterBG = SuperMeterBG
	
	local SuperMeterFill = nil
	
	SuperMeterFill = MenuBuilder.BuildRegisteredType( "UIRadialProgressBar", {
		segmentCount = 3,
		segmentMaterial = "codcaster_playerlist_circle_segment",
		maskMaterial = "codcaster_playerlist_circle_mask",
		snapToMultiplesOfAngle = 0,
		controllerIndex = f14_local1
	} )
	SuperMeterFill.id = "SuperMeterFill"
	SuperMeterFill:setImage( RegisterMaterial( "codcaster_playerlist_circle_segment" ), 0 )
	SuperMeterFill:SetProgress( 0.3 )
	SuperMeterFill:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -239.5, _1080p * -214.5, _1080p * -13, _1080p * 12 )
	self:addElement( SuperMeterFill )
	self.SuperMeterFill = SuperMeterFill
	
	local BorderMiddle = nil
	
	BorderMiddle = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 0,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	BorderMiddle.id = "BorderMiddle"
	BorderMiddle:SetAlpha( 0.3, 0 )
	BorderMiddle:SetBorderThicknessLeft( _1080p * 0, 0 )
	BorderMiddle:SetBorderThicknessTop( _1080p * 0, 0 )
	BorderMiddle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 32, 0, 0, _1080p * 25 )
	self:addElement( BorderMiddle )
	self.BorderMiddle = BorderMiddle
	
	local BorderLeft = nil
	
	BorderLeft = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 0,
		borderThicknessBottom = _1080p * 1
	} )
	BorderLeft.id = "BorderLeft"
	BorderLeft:SetAlpha( 0.3, 0 )
	BorderLeft:SetBorderThicknessTop( _1080p * 0, 0 )
	BorderLeft:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 32, 0, _1080p * 25 )
	self:addElement( BorderLeft )
	self.BorderLeft = BorderLeft
	
	local Name = nil
	
	Name = MenuBuilder.BuildRegisteredType( "CodCasterTextField", {
		controllerIndex = f14_local1
	} )
	Name.id = "Name"
	Name:SetAlpha( 0.9, 0 )
	Name.Field:SetTop( _1080p * -10, 0 )
	Name.Field:SetBottom( _1080p * 10, 0 )
	Name.Field:setText( "{WWWW}WWWWWWWWWWWWWWWWW", 0 )
	Name.Field:SetAlignment( LUI.Alignment.Left )
	Name:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 49, _1080p * 390, _1080p * -1, 0 )
	self:addElement( Name )
	self.Name = Name
	
	local PlayerIndex = nil
	
	PlayerIndex = MenuBuilder.BuildRegisteredType( "CodCasterTextField", {
		controllerIndex = f14_local1
	} )
	PlayerIndex.id = "PlayerIndex"
	PlayerIndex:SetAlpha( 0.9, 0 )
	PlayerIndex.Field:SetTop( _1080p * -9, 0 )
	PlayerIndex.Field:SetBottom( _1080p * 9, 0 )
	PlayerIndex.Field:setText( "88", 0 )
	PlayerIndex.Field:SetAlignment( LUI.Alignment.Center )
	PlayerIndex:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -238.5, _1080p * -215.5, _1080p * -12, _1080p * 11 )
	self:addElement( PlayerIndex )
	self.PlayerIndex = PlayerIndex
	
	local OnHardpointIcon = nil
	
	OnHardpointIcon = LUI.UIImage.new()
	OnHardpointIcon.id = "OnHardpointIcon"
	OnHardpointIcon:SetAlpha( 0, 0 )
	OnHardpointIcon:SetScale( -0.2, 0 )
	OnHardpointIcon:setImage( RegisterMaterial( "gamemode_hardpoint" ), 0 )
	OnHardpointIcon:SetBlendMode( BLEND_MODE.addWithAlpha )
	OnHardpointIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 30, _1080p * -1.5, _1080p * 26.5 )
	self:addElement( OnHardpointIcon )
	self.OnHardpointIcon = OnHardpointIcon
	
	local FlagCarryIcon = nil
	
	FlagCarryIcon = LUI.UIImage.new()
	FlagCarryIcon.id = "FlagCarryIcon"
	FlagCarryIcon:SetAlpha( 0, 0 )
	FlagCarryIcon:SetScale( -0.2, 0 )
	FlagCarryIcon:setImage( RegisterMaterial( "gamemode_capture_the_flag" ), 0 )
	FlagCarryIcon:SetBlendMode( BLEND_MODE.addWithAlpha )
	FlagCarryIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 30, _1080p * -1.5, _1080p * 26.5 )
	self:addElement( FlagCarryIcon )
	self.FlagCarryIcon = FlagCarryIcon
	
	local f14_local16 = nil
	if not Engine.InFrontend() then
		f14_local16 = LUI.UIImage.new()
		f14_local16.id = "DeathIcon"
		f14_local16:SetAlpha( 0, 0 )
		f14_local16:SetScale( -0.2, 0 )
		f14_local16:setImage( RegisterMaterial( "codcaster_playerlist_dead_icon" ), 0 )
		f14_local16:SetBlendMode( BLEND_MODE.addWithAlpha )
		f14_local16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 30, _1080p * -1.5, _1080p * 26.5 )
		self:addElement( f14_local16 )
		self.DeathIcon = f14_local16
	end
	self._animationSets.DefaultAnimationSet = function ()
		SuperMeterFill:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.SuperMeterFill:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			SuperMeterFill:AnimateSequence( "DefaultSequence" )
		end
		
		self._sequences.MicOn = function ()
			
		end
		
		self._sequences.MicOff = function ()
			
		end
		
		if not Engine.InFrontend() then
			f14_local16:RegisterAnimationSequence( "PlayerDead", {
				{
					function ()
						return self.DeathIcon:SetAlpha( 0, 0 )
					end,
					function ()
						return self.DeathIcon:SetAlpha( 0.7, 50 )
					end
				}
			} )
		end
		self._sequences.PlayerDead = function ()
			if not Engine.InFrontend() then
				f14_local16:AnimateSequence( "PlayerDead" )
			end
		end
		
		if not Engine.InFrontend() then
			f14_local16:RegisterAnimationSequence( "PlayerNotDead", {
				{
					function ()
						return self.DeathIcon:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.PlayerNotDead = function ()
			if not Engine.InFrontend() then
				f14_local16:AnimateSequence( "PlayerNotDead" )
			end
		end
		
		Highlight:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Highlight:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 0, 50 )
				end
			}
		} )
		SuperMeterBG:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SuperMeterBG:SetAlpha( 0.25, 0 )
				end
			}
		} )
		SuperMeterFill:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Name:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.Name:SetRGBFromInt( 16777215, 50 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Name:SetAlpha( 0.9, 50 )
				end
			}
		} )
		PlayerIndex:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.PlayerIndex:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PlayerIndex:SetAlpha( 0.9, 50 )
				end
			},
			{
				function ()
					return self.PlayerIndex.Field:SetRGBFromInt( 0, 0 )
				end,
				function ()
					return self.PlayerIndex.Field:SetRGBFromInt( 16777215, 50 )
				end
			}
		} )
		OnHardpointIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.OnHardpointIcon:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			}
		} )
		FlagCarryIcon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.FlagCarryIcon:SetBlendMode( BLEND_MODE.addWithAlpha )
				end
			}
		} )
		if not Engine.InFrontend() then
			f14_local16:RegisterAnimationSequence( "ButtonUp", {
				{
					function ()
						return self.DeathIcon:SetBlendMode( BLEND_MODE.addWithAlpha )
					end
				}
			} )
		end
		self._sequences.ButtonUp = function ()
			Highlight:AnimateSequence( "ButtonUp" )
			SuperMeterBG:AnimateSequence( "ButtonUp" )
			SuperMeterFill:AnimateSequence( "ButtonUp" )
			Name:AnimateSequence( "ButtonUp" )
			PlayerIndex:AnimateSequence( "ButtonUp" )
			OnHardpointIcon:AnimateSequence( "ButtonUp" )
			FlagCarryIcon:AnimateSequence( "ButtonUp" )
			if not Engine.InFrontend() then
				f14_local16:AnimateSequence( "ButtonUp" )
			end
		end
		
		Highlight:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Highlight:SetAlpha( 0.5, 150 )
				end
			}
		} )
		SuperMeterBG:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.SuperMeterBG:SetAlpha( 0.5, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Name:SetRGBFromInt( 0, 100 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.Name:SetAlpha( 1, 100 )
				end
			}
		} )
		PlayerIndex:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.PlayerIndex:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.PlayerIndex:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.PlayerIndex.Field:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PlayerIndex.Field:SetRGBFromInt( 0, 100 )
				end
			}
		} )
		OnHardpointIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.OnHardpointIcon:SetBlendMode( BLEND_MODE.blend )
				end
			}
		} )
		FlagCarryIcon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.FlagCarryIcon:SetBlendMode( BLEND_MODE.blend )
				end
			}
		} )
		if not Engine.InFrontend() then
			f14_local16:RegisterAnimationSequence( "ButtonOver", {
				{
					function ()
						return self.DeathIcon:SetBlendMode( BLEND_MODE.blend )
					end
				}
			} )
		end
		self._sequences.ButtonOver = function ()
			Highlight:AnimateSequence( "ButtonOver" )
			SuperMeterBG:AnimateSequence( "ButtonOver" )
			Name:AnimateSequence( "ButtonOver" )
			PlayerIndex:AnimateSequence( "ButtonOver" )
			OnHardpointIcon:AnimateSequence( "ButtonOver" )
			FlagCarryIcon:AnimateSequence( "ButtonOver" )
			if not Engine.InFrontend() then
				f14_local16:AnimateSequence( "ButtonOver" )
			end
		end
		
		self._sequences.MicMuted = function ()
			
		end
		
		Highlight:RegisterAnimationSequence( "ButtonUpPlayer", {
			{
				function ()
					return self.Highlight:SetAlpha( 0, 0 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ButtonUpPlayer", {
			{
				function ()
					return self.Name:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end
			}
		} )
		PlayerIndex:RegisterAnimationSequence( "ButtonUpPlayer", {
			{
				function ()
					return self.PlayerIndex:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
				end
			},
			{
				function ()
					return self.PlayerIndex:SetAlpha( 0.9, 0 )
				end
			}
		} )
		self._sequences.ButtonUpPlayer = function ()
			Highlight:AnimateSequence( "ButtonUpPlayer" )
			Name:AnimateSequence( "ButtonUpPlayer" )
			PlayerIndex:AnimateSequence( "ButtonUpPlayer" )
		end
		
		Highlight:RegisterAnimationSequence( "ButtonOverFrontEnd", {
			{
				function ()
					return self.Highlight:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 25, 0 )
				end
			}
		} )
		self._sequences.ButtonOverFrontEnd = function ()
			Highlight:AnimateSequence( "ButtonOverFrontEnd" )
		end
		
		OnHardpointIcon:RegisterAnimationSequence( "PlayerOnHardpoint", {
			{
				function ()
					return self.OnHardpointIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OnHardpointIcon:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.PlayerOnHardpoint = function ()
			OnHardpointIcon:AnimateSequence( "PlayerOnHardpoint" )
		end
		
		OnHardpointIcon:RegisterAnimationSequence( "PlayerNotOnHardpoint", {
			{
				function ()
					return self.OnHardpointIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.PlayerNotOnHardpoint = function ()
			OnHardpointIcon:AnimateSequence( "PlayerNotOnHardpoint" )
		end
		
		FlagCarryIcon:RegisterAnimationSequence( "FlagCarry", {
			{
				function ()
					return self.FlagCarryIcon:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FlagCarryIcon:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.FlagCarry = function ()
			FlagCarryIcon:AnimateSequence( "FlagCarry" )
		end
		
		FlagCarryIcon:RegisterAnimationSequence( "NotFlagCarry", {
			{
				function ()
					return self.FlagCarryIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotFlagCarry = function ()
			FlagCarryIcon:AnimateSequence( "NotFlagCarry" )
		end
		
		Selection:RegisterAnimationSequence( "ScrollUp", {
			{
				function ()
					return self.Selection:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Selection:SetAlpha( 0, 50 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ScrollUp", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Name:SetRGBFromInt( 16777215, 50 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Name:SetAlpha( 0.9, 50 )
				end
			}
		} )
		PlayerIndex:RegisterAnimationSequence( "ScrollUp", {
			{
				function ()
					return self.PlayerIndex:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PlayerIndex:SetRGBFromInt( 16777215, 50 )
				end
			},
			{
				function ()
					return self.PlayerIndex:SetAlpha( 1, 0 )
				end,
				function ()
					return self.PlayerIndex:SetAlpha( 0.9, 50 )
				end
			}
		} )
		self._sequences.ScrollUp = function ()
			Selection:AnimateSequence( "ScrollUp" )
			Name:AnimateSequence( "ScrollUp" )
			PlayerIndex:AnimateSequence( "ScrollUp" )
		end
		
		Selection:RegisterAnimationSequence( "ScrollOver", {
			{
				function ()
					return self.Selection:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Selection:SetAlpha( 0.5, 150 )
				end
			}
		} )
		Name:RegisterAnimationSequence( "ScrollOver", {
			{
				function ()
					return self.Name:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Name:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.Name:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.Name:SetAlpha( 1, 100 )
				end
			}
		} )
		PlayerIndex:RegisterAnimationSequence( "ScrollOver", {
			{
				function ()
					return self.PlayerIndex:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.PlayerIndex:SetRGBFromInt( 16777215, 100 )
				end
			},
			{
				function ()
					return self.PlayerIndex:SetAlpha( 0.9, 0 )
				end,
				function ()
					return self.PlayerIndex:SetAlpha( 1, 100 )
				end
			}
		} )
		self._sequences.ScrollOver = function ()
			Selection:AnimateSequence( "ScrollOver" )
			Name:AnimateSequence( "ScrollOver" )
			PlayerIndex:AnimateSequence( "ScrollOver" )
		end
		
		SuperMeterFill:RegisterAnimationSequence( "Super_Ready", {
			{
				function ()
					return self.SuperMeterFill:SetRGBFromInt( 16764672, 0 )
				end,
				function ()
					return self.SuperMeterFill:SetRGBFromInt( 16776517, 150 )
				end,
				function ()
					return self.SuperMeterFill:SetRGBFromInt( 16764672, 450 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetScale( -0.02, 0 )
				end,
				function ()
					return self.SuperMeterFill:SetScale( 0.05, 150 )
				end,
				function ()
					return self.SuperMeterFill:SetScale( -0.02, 450 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 0.8, 0 )
				end,
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 150 )
				end,
				function ()
					return self.SuperMeterFill:SetAlpha( 0.8, 450 )
				end
			}
		} )
		self._sequences.Super_Ready = function ()
			SuperMeterFill:AnimateLoop( "Super_Ready" )
		end
		
		SuperMeterFill:RegisterAnimationSequence( "Super_NotReady", {
			{
				function ()
					return self.SuperMeterFill:SetRGBFromInt( 16777215, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.Super_NotReady = function ()
			SuperMeterFill:AnimateSequence( "Super_NotReady" )
		end
		
		SuperMeterFill:RegisterAnimationSequence( "Super_Active", {
			{
				function ()
					return self.SuperMeterFill:SetRGBFromInt( 3565311, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.SuperMeterFill:SetScale( 0, 0 )
				end
			}
		} )
		self._sequences.Super_Active = function ()
			SuperMeterFill:AnimateSequence( "Super_Active" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f14_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "CodCasterPlayerListRowWidget", CodCasterPlayerListRowWidget )
LockTable( _M )
