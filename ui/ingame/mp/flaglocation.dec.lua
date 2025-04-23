local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 then
		f1_arg0.FlagIconFriendly:SetRGBFromInt( CODCASTER.GetTeam1Color( f1_arg0:getRootController() ), 0 )
		f1_arg0.FlagIconEnemy:SetRGBFromInt( CODCASTER.GetTeam2Color( f1_arg0:getRootController() ), 0 )
	else
		f1_arg0.FlagIconFriendly:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
		f1_arg0.FlagIconEnemy:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.ResetTeamColor = f0_local0
	f2_arg0:SetYRotation( 20 * MP.SplitScreenRotModifier )
	f2_arg0:SetXRotation( 5 * MP.SplitScreenRotModifier )
	f2_arg0.LocationTextFriendly:SetShadowUOffset( -0 )
	f2_arg0.LocationTextFriendly:SetShadowVOffset( -0 )
	f2_arg0.LocationTextEnemy:SetShadowUOffset( -0 )
	f2_arg0.LocationTextEnemy:SetShadowVOffset( -0 )
end

function FlagLocation( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 424 * _1080p, 0, 28 * _1080p )
	self.id = "FlagLocation"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local LocationTextFriendly = nil
	
	LocationTextFriendly = LUI.UIStyledText.new()
	LocationTextFriendly.id = "LocationTextFriendly"
	LocationTextFriendly:SetFontSize( 22 * _1080p )
	LocationTextFriendly:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LocationTextFriendly:SetAlignment( LUI.Alignment.Left )
	LocationTextFriendly:SetOptOutRightToLeftAlignmentFlip( true )
	LocationTextFriendly:SetShadowMinDistance( -0.2, 0 )
	LocationTextFriendly:SetShadowMaxDistance( 0.2, 0 )
	LocationTextFriendly:SetShadowRGBFromInt( 0, 0 )
	LocationTextFriendly:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 60, 0, _1080p * 3, _1080p * 25 )
	LocationTextFriendly:SubscribeToModel( DataSources.inGame.HUD.ctfAlliesFlagStatus:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.HUD.ctfAlliesFlagStatus:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			LocationTextFriendly:setText( f4_local0, 0 )
		end
	end )
	self:addElement( LocationTextFriendly )
	self.LocationTextFriendly = LocationTextFriendly
	
	local FlagIconFriendly = nil
	
	FlagIconFriendly = LUI.UIImage.new()
	FlagIconFriendly.id = "FlagIconFriendly"
	FlagIconFriendly:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
	FlagIconFriendly:setImage( RegisterMaterial( "hud_icon_ctf_flag" ), 0 )
	FlagIconFriendly:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, _1080p * -12, _1080p * 40 )
	self:addElement( FlagIconFriendly )
	self.FlagIconFriendly = FlagIconFriendly
	
	local LocationTextEnemy = nil
	
	LocationTextEnemy = LUI.UIStyledText.new()
	LocationTextEnemy.id = "LocationTextEnemy"
	LocationTextEnemy:SetFontSize( 22 * _1080p )
	LocationTextEnemy:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LocationTextEnemy:SetAlignment( LUI.Alignment.Left )
	LocationTextEnemy:SetOptOutRightToLeftAlignmentFlip( true )
	LocationTextEnemy:SetShadowMinDistance( -0.2, 0 )
	LocationTextEnemy:SetShadowMaxDistance( 0.2, 0 )
	LocationTextEnemy:SetShadowRGBFromInt( 0, 0 )
	LocationTextEnemy:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 60, 0, _1080p * 53, _1080p * 75 )
	LocationTextEnemy:SubscribeToModel( DataSources.inGame.HUD.ctfAxisFlagStatus:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.HUD.ctfAxisFlagStatus:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			LocationTextEnemy:setText( f5_local0, 0 )
		end
	end )
	self:addElement( LocationTextEnemy )
	self.LocationTextEnemy = LocationTextEnemy
	
	local FlagIconEnemy = nil
	
	FlagIconEnemy = LUI.UIImage.new()
	FlagIconEnemy.id = "FlagIconEnemy"
	FlagIconEnemy:SetRGBFromTable( SWATCHES.HUD.enemyTeam, 0 )
	FlagIconEnemy:setImage( RegisterMaterial( "hud_icon_ctf_flag" ), 0 )
	FlagIconEnemy:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 50, _1080p * 40, _1080p * 92 )
	self:addElement( FlagIconEnemy )
	self.FlagIconEnemy = FlagIconEnemy
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "FlagLocation", FlagLocation )
LockTable( _M )
