local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MapName )
	f1_arg0.MapName:SetShadowUOffset( -0 )
	f1_arg0.MapName:SetShadowVOffset( -0 )
	assert( f1_arg0.Minimap )
	local f1_local0 = DataSources.inGame.map:GetValue( f1_arg1 )
	if f1_local0 == "mp_neon" or f1_local0 == "mp_prime" then
		f1_arg0.Minimap:SetScale( 0, 0 )
	end
	if IsOnlineMatch() then
		if Engine.GetDvarBool( "sv_running" ) then
			f1_arg0.Node:SetRGBFromInt( 6710886, 0 )
		elseif Engine.IsDedi() then
			f1_arg0.Node:SetRGBFromInt( 14540032, 0 )
		end
	end
	if GameX.IsHardcoreMode() then
		assert( f1_arg0.Minimap )
		local f1_local1 = function ()
			if Game.GetOmnvar( "ui_show_hardcore_minimap" ) then
				f1_arg0.Minimap:SetAlpha( 1 )
			else
				f1_arg0.Minimap:SetAlpha( 0 )
			end
		end
		
		f1_local1()
		f1_arg0:registerOmnvarHandler( "ui_show_hardcore_minimap", f1_local1 )
	end
end

function GameDetails( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 675 * _1080p )
	self.id = "GameDetails"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	self.soundSet = "inGame"
	local f3_local2 = self
	local Minimap = nil
	
	Minimap = MenuBuilder.BuildRegisteredType( "MinimapContent", {
		mapAlpha = 0.5,
		compassType = CoD.CompassType.Full,
		controllerIndex = f3_local1
	} )
	Minimap.id = "Minimap"
	Minimap:SetScale( 0.25, 0 )
	Minimap:setImage( RegisterMaterial( "compass_map_mp_proto" ), 0 )
	Minimap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 228, _1080p * 740, _1080p * 24, _1080p * 536 )
	self:addElement( Minimap )
	self.Minimap = Minimap
	
	local DarkBase = nil
	
	DarkBase = LUI.UIImage.new()
	DarkBase.id = "DarkBase"
	DarkBase:SetRGBFromInt( 0, 0 )
	DarkBase:SetAlpha( 0.25, 0 )
	DarkBase:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 6, 0, _1080p * -84, 0 )
	self:addElement( DarkBase )
	self.DarkBase = DarkBase
	
	local DarkHeader = nil
	
	DarkHeader = LUI.UIImage.new()
	DarkHeader.id = "DarkHeader"
	DarkHeader:SetRGBFromInt( 0, 0 )
	DarkHeader:SetAlpha( 0.6, 0 )
	DarkHeader:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 6, 0, _1080p * -150, _1080p * -84 )
	self:addElement( DarkHeader )
	self.DarkHeader = DarkHeader
	
	local DarkTab = nil
	
	DarkTab = LUI.UIImage.new()
	DarkTab.id = "DarkTab"
	DarkTab:SetRGBFromInt( 0, 0 )
	DarkTab:SetAlpha( 0.6, 0 )
	DarkTab:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 6, _1080p * -150, 0 )
	self:addElement( DarkTab )
	self.DarkTab = DarkTab
	
	local Node = nil
	
	Node = LUI.UIImage.new()
	Node.id = "Node"
	Node:SetRGBFromInt( 14277081, 0 )
	Node:SetAnchorsAndPosition( 0, 1, 1, 0, 0, _1080p * 15, _1080p * -150, _1080p * -146 )
	self:addElement( Node )
	self.Node = Node
	
	local GameModeDesc = nil
	
	GameModeDesc = LUI.UIText.new()
	GameModeDesc.id = "GameModeDesc"
	GameModeDesc:SetFontSize( 22 * _1080p )
	GameModeDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameModeDesc:SetAlignment( LUI.Alignment.Left )
	GameModeDesc:SetOptOutRightToLeftAlignmentFlip( true )
	GameModeDesc:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 18, _1080p * -50, _1080p * -47, _1080p * -25 )
	GameModeDesc:SubscribeToModel( DataSources.inGame.MP.match.gameModeDescription:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.MP.match.gameModeDescription:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			GameModeDesc:setText( f4_local0, 0 )
		end
	end )
	self:addElement( GameModeDesc )
	self.GameModeDesc = GameModeDesc
	
	local GameMode = nil
	
	GameMode = LUI.UIText.new()
	GameMode.id = "GameMode"
	GameMode:SetFontSize( 22 * _1080p )
	GameMode:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	GameMode:SetAlignment( LUI.Alignment.Left )
	GameMode:SetOptOutRightToLeftAlignmentFlip( true )
	GameMode:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 18, _1080p * -50, _1080p * -77, _1080p * -55 )
	GameMode:SubscribeToModel( DataSources.inGame.MP.match.gameMode:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.MP.match.gameMode:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			GameMode:setText( ToUpperCase( f5_local0 ), 0 )
		end
	end )
	self:addElement( GameMode )
	self.GameMode = GameMode
	
	local MapName = nil
	
	MapName = LUI.UIStyledText.new()
	MapName.id = "MapName"
	MapName:SetFontSize( 50 * _1080p )
	MapName:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	MapName:SetAlignment( LUI.Alignment.Left )
	MapName:SetOptOutRightToLeftAlignmentFlip( true )
	MapName:SetDecodeUseSystemTime( false )
	MapName:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 18, _1080p * -50, _1080p * -142, _1080p * -92 )
	MapName:SubscribeToModel( DataSources.inGame.mapName:GetModel( f3_local1 ), function ()
		local f6_local0 = DataSources.inGame.mapName:GetValue( f3_local1 )
		if f6_local0 ~= nil then
			MapName:setText( ToUpperCase( f6_local0 ), 0 )
		end
	end )
	self:addElement( MapName )
	self.MapName = MapName
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Minimap:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Minimap:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 637, _1080p * 1149, _1080p * -350, _1080p * 162, 0 )
				end
			}
		} )
		DarkBase:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DarkBase:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 170, _1080p * 164, _1080p * -477, _1080p * -393, 0 )
				end
			}
		} )
		DarkHeader:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DarkHeader:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 170, _1080p * 164, _1080p * -543, _1080p * -477, 0 )
				end
			}
		} )
		DarkTab:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DarkTab:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 164, _1080p * 170, _1080p * -543, _1080p * -393, 0 )
				end
			}
		} )
		Node:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Node:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 164, _1080p * 179, _1080p * -543, _1080p * -539, 0 )
				end
			}
		} )
		GameModeDesc:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.GameModeDesc:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 182, _1080p * 114, _1080p * -440, _1080p * -418, 0 )
				end
			}
		} )
		GameMode:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.GameMode:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 182, _1080p * 114, _1080p * -470, _1080p * -448, 0 )
				end
			}
		} )
		MapName:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.MapName:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 182, _1080p * 114, _1080p * -535, _1080p * -485, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			Minimap:AnimateSequence( "Splitscreen" )
			DarkBase:AnimateSequence( "Splitscreen" )
			DarkHeader:AnimateSequence( "Splitscreen" )
			DarkTab:AnimateSequence( "Splitscreen" )
			Node:AnimateSequence( "Splitscreen" )
			GameModeDesc:AnimateSequence( "Splitscreen" )
			GameMode:AnimateSequence( "Splitscreen" )
			MapName:AnimateSequence( "Splitscreen" )
		end
		
		Minimap:RegisterAnimationSequence( "HideMiniMap", {
			{
				function ()
					return self.Minimap:SetAlpha( 0, 10 )
				end
			}
		} )
		self._sequences.HideMiniMap = function ()
			Minimap:AnimateSequence( "HideMiniMap" )
		end
		
		Minimap:RegisterAnimationSequence( "ShowMiniMap", {
			{
				function ()
					return self.Minimap:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.Minimap:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.ShowMiniMap = function ()
			Minimap:AnimateSequence( "ShowMiniMap" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Minimap:SubscribeToModel( DataSources.inGame.MP.killcam.isVictim:GetModel( f3_local1 ), function ()
		if CONDITIONS.IsBombGametype( self ) and CONDITIONS.InKillCam( self ) then
			ACTIONS.AnimateSequence( self, "HideMiniMap" )
		end
	end )
	Minimap:SubscribeToModel( DataSources.inGame.player.health:GetModel( f3_local1 ), function ()
		if DataSources.inGame.player.health:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.health:GetValue( f3_local1 ) <= 0 and CONDITIONS.IsBombGametype( self ) and not CONDITIONS.IsSpectating( self ) then
			ACTIONS.AnimateSequence( self, "HideMiniMap" )
		end
	end )
	Minimap:SubscribeToModel( DataSources.inGame.MP.spectating.isSpectating:GetModel( f3_local1 ), function ()
		if CONDITIONS.IsBombGametype( self ) and not CONDITIONS.InKillCam( self ) then
			ACTIONS.AnimateSequence( self, "ShowMiniMap" )
		end
	end )
	Minimap:SubscribeToModel( DataSources.inGame.MP.killcam.countdown:GetModel( f3_local1 ), function ()
		if DataSources.inGame.MP.killcam.countdown:GetValue( f3_local1 ) ~= nil and DataSources.inGame.MP.killcam.countdown:GetValue( f3_local1 ) <= 0 and CONDITIONS.IsBombGametype( self ) then
			ACTIONS.AnimateSequence( self, "ShowMiniMap" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "GameDetails", GameDetails )
LockTable( _M )
