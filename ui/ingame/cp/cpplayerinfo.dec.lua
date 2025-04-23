local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	return function ()
		assert( DataSources.inGame.CP.playerCharacter )
		assert( DataSources.inGame.CP.playerStatus )
		assert( f1_arg0.PlayerImage )
		if f1_arg0._clientNum then
			local f2_local0 = ZombiesUtils.GetZombiesPlayerPhoto( DataSources.inGame.CP.playerCharacter:GetValue( f1_arg0._controllerIndex ), DataSources.inGame.CP.playerStatus:GetValue( f1_arg0._controllerIndex ), f1_arg0._clientNum )
			if f2_local0 and f2_local0 ~= "" and CONDITIONS.CharacterImagesAreLoaded( f1_arg0._controllerIndex ) then
				if not f1_arg0.currentImage or f1_arg0.currentImage ~= f2_local0 then
					f1_arg0.PlayerImage:setImage( RegisterMaterial( f2_local0 ) )
					f1_arg0.currentImage = f2_local0
				end
				f1_arg0.PlayerImage:SetAlpha( 1, 200 )
			else
				f1_arg0.PlayerImage:SetAlpha( 0, 0 )
			end
		else
			f1_arg0.PlayerImage:SetAlpha( 0, 0 )
		end
	end
	
end

f0_local1 = function ( f3_arg0 )
	assert( f3_arg0._row )
	assert( f3_arg0.PlayerName )
	assert( f3_arg0.PlayerCash )
	assert( f3_arg0._controllerIndex )
	local f3_local0 = Game.GetCPScoreboardRowData( f3_arg0._row, Game.IsSpectating() and Game.GetPlayerstateClientnum() or Game.GetPlayerClientnum(), true )
	assert( f3_local0 )
	assert( f3_local0.clientNum )
	assert( f3_local0.name )
	assert( f3_local0.currency )
	f3_arg0._clientNum = f3_local0.clientNum
	assert( DataSources.inGame.CP.playerCharacter )
	assert( DataSources.inGame.CP.playerStatus )
	local f3_local1 = f0_local0( f3_arg0 )
	f3_local1()
	f3_arg0.PlayerName:setText( f3_local0.name )
	f3_arg0.PlayerCash:setText( f3_local0.currency )
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0._team = f4_arg1
	f4_arg0._row = f4_arg2
end

local f0_local3 = function ( f5_arg0 )
	return f5_arg0._clientNum
end

local f0_local4 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.PlayerImage )
	f6_arg0._controllerIndex = f6_arg1
	f6_arg0.RefreshRowContent = f0_local1
	f6_arg0.SetPlayer = f0_local2
	f6_arg0.GetClientNum = f0_local3
	f6_arg0.PlayerImage:SubscribeToModel( DataSources.inGame.CP.playerCharacter:GetModel( f6_arg1 ), f0_local0( f6_arg0 ) )
	f6_arg0.PlayerImage:SubscribeToModel( DataSources.inGame.CP.playerStatus:GetModel( f6_arg1 ), f0_local0( f6_arg0 ) )
end

function CPPlayerInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 186 * _1080p, 0, 50 * _1080p )
	self.id = "CPPlayerInfo"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local PlayerName = nil
	
	PlayerName = LUI.UIText.new()
	PlayerName.id = "PlayerName"
	PlayerName:SetRGBFromInt( 5362982, 0 )
	PlayerName:SetAlpha( 0, 0 )
	PlayerName:SetScale( -0.5, 0 )
	PlayerName:setText( "", 0 )
	PlayerName:SetFontSize( 34 * _1080p )
	PlayerName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PlayerName:SetAlignment( LUI.Alignment.Left )
	PlayerName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2.38, _1080p * 263.38, _1080p * -1.1, _1080p * 32.9 )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local PlayerImage = nil
	
	PlayerImage = LUI.UIImage.new()
	PlayerImage.id = "PlayerImage"
	PlayerImage:SetScale( -0.5, 0 )
	PlayerImage:setImage( RegisterMaterial( "zm_pc_score_team_plyr_1" ), 0 )
	PlayerImage:SetUseAA( true )
	PlayerImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -32, _1080p * 96, _1080p * -39.6, _1080p * 88.4 )
	self:addElement( PlayerImage )
	self.PlayerImage = PlayerImage
	
	local BackingBox = nil
	
	BackingBox = LUI.UIImage.new()
	BackingBox.id = "BackingBox"
	BackingBox:setImage( RegisterMaterial( "zm_pc_score_bg" ), 0 )
	BackingBox:SetUseAA( true )
	BackingBox:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 57.3, _1080p * 117.3, _1080p * 29.3, _1080p * 50.3 )
	self:addElement( BackingBox )
	self.BackingBox = BackingBox
	
	local PlayerCash = nil
	
	PlayerCash = LUI.UIText.new()
	PlayerCash.id = "PlayerCash"
	PlayerCash:SetScale( -0.3, 0 )
	PlayerCash:setText( "", 0 )
	PlayerCash:SetFontSize( 24 * _1080p )
	PlayerCash:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PlayerCash:SetAlignment( LUI.Alignment.Left )
	PlayerCash:SetOptOutRightToLeftAlignmentFlip( true )
	PlayerCash:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 46.8, _1080p * 210.3, _1080p * 27.8, _1080p * 51.8 )
	self:addElement( PlayerCash )
	self.PlayerCash = PlayerCash
	
	local dollarSign = nil
	
	dollarSign = LUI.UIText.new()
	dollarSign.id = "dollarSign"
	dollarSign:SetScale( -0.3, 0 )
	dollarSign:setText( "$", 0 )
	dollarSign:SetFontSize( 24 * _1080p )
	dollarSign:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	dollarSign:SetAlignment( LUI.Alignment.Left )
	dollarSign:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.3, _1080p * 72.3, _1080p * 27.8, _1080p * 51.8 )
	self:addElement( dollarSign )
	self.dollarSign = dollarSign
	
	f0_local4( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "CPPlayerInfo", CPPlayerInfo )
LockTable( _M )
