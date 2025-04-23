local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1 then
		f1_arg0.BackgroundFriendly:SetRGBFromInt( CODCASTER.GetTeam1Color( f1_arg0:getRootController() ), 0 )
		f1_arg0.BackgroundEnemy:SetRGBFromInt( CODCASTER.GetTeam2Color( f1_arg0:getRootController() ), 0 )
		f1_arg0.FriendlyIcon:UnsubscribeFromAllModels()
		f1_arg0.EnemyIcon:UnsubscribeFromAllModels()
		f1_arg0.FriendlyIcon:setImage( RegisterMaterial( CODCASTER.GetTeam1LogoMaterial( f1_arg0:getRootController() ) ), 0 )
		f1_arg0.EnemyIcon:setImage( RegisterMaterial( CODCASTER.GetTeam2LogoMaterial( f1_arg0:getRootController() ) ), 0 )
	else
		f1_arg0.FriendlyIcon:SubscribeToModel( DataSources.inGame.MP.match.teamIcon:GetModel( f1_arg0:getRootController() ), function ()
			local f2_local0 = DataSources.inGame.MP.match.teamIcon:GetValue( f1_arg0:getRootController() )
			if f2_local0 ~= nil then
				f1_arg0.FriendlyIcon:setImage( RegisterMaterial( f2_local0 ), 0 )
			end
		end )
		f1_arg0.EnemyIcon:SubscribeToModel( DataSources.inGame.MP.match.enemyIcon:GetModel( f1_arg0:getRootController() ), function ()
			local f3_local0 = DataSources.inGame.MP.match.enemyIcon:GetValue( f1_arg0:getRootController() )
			if f3_local0 ~= nil then
				f1_arg0.EnemyIcon:setImage( RegisterMaterial( f3_local0 ), 0 )
			end
		end )
		f1_arg0.BackgroundFriendly:SetRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
		f1_arg0.BackgroundEnemy:SetRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
	end
end

f0_local1 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.ResetTeamColor = f0_local0
end

function TeamAliveCounter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 140 * _1080p )
	self.id = "TeamAliveCounter"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local BackgroundEnemy = nil
	
	BackgroundEnemy = LUI.UIImage.new()
	BackgroundEnemy.id = "BackgroundEnemy"
	BackgroundEnemy:SetRGBFromTable( SWATCHES.Scoreboard.enemyTeam, 0 )
	BackgroundEnemy:SetAlpha( 0.5, 0 )
	BackgroundEnemy:SetUseAA( true )
	BackgroundEnemy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 28, _1080p * 170, _1080p * 41.75, _1080p * 69.73 )
	self:addElement( BackgroundEnemy )
	self.BackgroundEnemy = BackgroundEnemy
	
	local BackgroundFriendly = nil
	
	BackgroundFriendly = LUI.UIImage.new()
	BackgroundFriendly.id = "BackgroundFriendly"
	BackgroundFriendly:SetRGBFromTable( SWATCHES.Scoreboard.friendlyTeam, 0 )
	BackgroundFriendly:SetAlpha( 0.5, 0 )
	BackgroundFriendly:SetUseAA( true )
	BackgroundFriendly:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 30, _1080p * 170, _1080p * 9, _1080p * 37 )
	self:addElement( BackgroundFriendly )
	self.BackgroundFriendly = BackgroundFriendly
	
	local EnemyTeamAlive = nil
	
	EnemyTeamAlive = MenuBuilder.BuildRegisteredType( "TeamAliveCounterTracker", {
		controllerIndex = f5_local1
	} )
	EnemyTeamAlive.id = "EnemyTeamAlive"
	EnemyTeamAlive.TeamScore:SetTop( _1080p * -11, 0 )
	EnemyTeamAlive.TeamScore:SetBottom( _1080p * 11, 0 )
	EnemyTeamAlive.TeamScore:SetFontSize( 18 * _1080p )
	EnemyTeamAlive:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 71, _1080p * 41.75, _1080p * 69.73 )
	EnemyTeamAlive:SubscribeToModel( DataSources.inGame.HUD.enemyTeamAlive:GetModel( f5_local1 ), function ()
		local f6_local0 = DataSources.inGame.HUD.enemyTeamAlive:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			EnemyTeamAlive.TeamScore:setText( f6_local0, 0 )
		end
	end )
	self:addElement( EnemyTeamAlive )
	self.EnemyTeamAlive = EnemyTeamAlive
	
	local FriendlyTeamAlive = nil
	
	FriendlyTeamAlive = MenuBuilder.BuildRegisteredType( "TeamAliveCounterTracker", {
		controllerIndex = f5_local1
	} )
	FriendlyTeamAlive.id = "FriendlyTeamAlive"
	FriendlyTeamAlive.TeamScore:SetTop( _1080p * -11, 0 )
	FriendlyTeamAlive.TeamScore:SetBottom( _1080p * 11, 0 )
	FriendlyTeamAlive:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 34, _1080p * 71, _1080p * 9, _1080p * 37 )
	FriendlyTeamAlive:SubscribeToModel( DataSources.inGame.HUD.friendlyTeamAlive:GetModel( f5_local1 ), function ()
		local f7_local0 = DataSources.inGame.HUD.friendlyTeamAlive:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			FriendlyTeamAlive.TeamScore:setText( f7_local0, 0 )
		end
	end )
	self:addElement( FriendlyTeamAlive )
	self.FriendlyTeamAlive = FriendlyTeamAlive
	
	local TeamAliveTextFriendly = nil
	
	TeamAliveTextFriendly = MenuBuilder.BuildRegisteredType( "TeamAliveCounterTracker", {
		controllerIndex = f5_local1
	} )
	TeamAliveTextFriendly.id = "TeamAliveTextFriendly"
	TeamAliveTextFriendly.TeamScore:SetTop( _1080p * -11, 0 )
	TeamAliveTextFriendly.TeamScore:SetBottom( _1080p * 11, 0 )
	TeamAliveTextFriendly.TeamScore:setText( Engine.Localize( "LUA_MENU_MP_ALIVE" ), 0 )
	TeamAliveTextFriendly:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69, _1080p * 162, _1080p * 41.75, _1080p * 69.75 )
	self:addElement( TeamAliveTextFriendly )
	self.TeamAliveTextFriendly = TeamAliveTextFriendly
	
	local TeamAliveTextEnemy = nil
	
	TeamAliveTextEnemy = MenuBuilder.BuildRegisteredType( "TeamAliveCounterTracker", {
		controllerIndex = f5_local1
	} )
	TeamAliveTextEnemy.id = "TeamAliveTextEnemy"
	TeamAliveTextEnemy.TeamScore:SetTop( _1080p * -11, 0 )
	TeamAliveTextEnemy.TeamScore:SetBottom( _1080p * 11, 0 )
	TeamAliveTextEnemy.TeamScore:setText( Engine.Localize( "LUA_MENU_MP_ALIVE" ), 0 )
	TeamAliveTextEnemy:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 69, _1080p * 162, _1080p * 9, _1080p * 37 )
	self:addElement( TeamAliveTextEnemy )
	self.TeamAliveTextEnemy = TeamAliveTextEnemy
	
	local CapR = nil
	
	CapR = LUI.UIImage.new()
	CapR.id = "CapR"
	CapR:SetUseAA( true )
	CapR:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 170, _1080p * 173, _1080p * 41.75, _1080p * 69.75 )
	self:addElement( CapR )
	self.CapR = CapR
	
	local CapRCopy0 = nil
	
	CapRCopy0 = LUI.UIImage.new()
	CapRCopy0.id = "CapRCopy0"
	CapRCopy0:SetUseAA( true )
	CapRCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 170, _1080p * 173, _1080p * 9, _1080p * 37 )
	self:addElement( CapRCopy0 )
	self.CapRCopy0 = CapRCopy0
	
	local FriendlyIcon = nil
	
	FriendlyIcon = LUI.UIImage.new()
	FriendlyIcon.id = "FriendlyIcon"
	FriendlyIcon:SetUseAA( true )
	FriendlyIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7.25, _1080p * 42.25, _1080p * 5.5, _1080p * 40.5 )
	FriendlyIcon:SubscribeToModel( DataSources.inGame.MP.match.teamIcon:GetModel( f5_local1 ), function ()
		local f8_local0 = DataSources.inGame.MP.match.teamIcon:GetValue( f5_local1 )
		if f8_local0 ~= nil then
			FriendlyIcon:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	self:addElement( FriendlyIcon )
	self.FriendlyIcon = FriendlyIcon
	
	local EnemyIcon = nil
	
	EnemyIcon = LUI.UIImage.new()
	EnemyIcon.id = "EnemyIcon"
	EnemyIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 7.25, _1080p * 42.25, _1080p * 38.24, _1080p * 73.24 )
	EnemyIcon:SubscribeToModel( DataSources.inGame.MP.match.enemyIcon:GetModel( f5_local1 ), function ()
		local f9_local0 = DataSources.inGame.MP.match.enemyIcon:GetValue( f5_local1 )
		if f9_local0 ~= nil then
			EnemyIcon:setImage( RegisterMaterial( f9_local0 ), 0 )
		end
	end )
	self:addElement( EnemyIcon )
	self.EnemyIcon = EnemyIcon
	
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "TeamAliveCounter", TeamAliveCounter )
LockTable( _M )
