local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Players )
	SCOREBOARD.SetupScoreboard( f1_arg0, {
		numPlayersFunction = function ( f2_arg0 )
			return Game.GetCPNumScoreboardPlayers() - 1
		end
	} )
	f1_arg0:SetTeam( Teams.allies )
	local self = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "refreshScores"
	} )
	self.id = "ScoreboardTimer"
	f1_arg0:addElement( self )
	f1_arg0:registerEventHandler( "refreshScores", function ( element, event )
		element:RefreshRows()
	end )
	f1_arg0:processEvent( {
		name = "refreshScores"
	} )
end

function PlayerCash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 164 * _1080p, 0, 153 * _1080p )
	self.id = "PlayerCash"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	local f4_local2 = self
	local Players = nil
	
	Players = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f4_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CPPlayerInfo", {
				controllerIndex = f4_local1
			} )
		end,
		refreshChild = function ( f6_arg0, f6_arg1, f6_arg2 )
			
		end,
		numRows = 3,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 1,
		spacingY = _1080p * 1,
		columnWidth = _1080p * 165,
		rowHeight = _1080p * 50,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Right,
		verticalAlignment = LUI.Alignment.Bottom,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Players.id = "Players"
	Players:setUseStencil( false )
	Players:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 164, 0, _1080p * 173 )
	self:addElement( Players )
	self.Players = Players
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "PlayerCash", PlayerCash )
LockTable( _M )
