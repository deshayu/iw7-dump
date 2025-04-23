local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MatchStatusScoreBar )
	local f1_local0 = DataSources.inGame.MP.match.teamScoreFriendlyWinRatio
	local f1_local1 = function ()
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			f1_arg0.MatchStatusScoreBar.Fill:SetAnchorsAndPosition( 0, LUI.clamp( 1 - f2_local0, 0, 1 ), 0, 0, 0, -1, 0, 0, 100 )
		end
	end
	
	f1_local1()
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), f1_local1, true )
end

function MatchStatusFriendlyScoreBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 8 * _1080p )
	self.id = "MatchStatusFriendlyScoreBar"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local MatchStatusScoreBar = nil
	
	MatchStatusScoreBar = MenuBuilder.BuildRegisteredType( "MatchStatusScoreBar", {
		controllerIndex = f3_local1
	} )
	MatchStatusScoreBar.id = "MatchStatusScoreBar"
	MatchStatusScoreBar.Fill:SetRGBFromTable( SWATCHES.HUD.friendlyTeam, 0 )
	MatchStatusScoreBar:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( MatchStatusScoreBar )
	self.MatchStatusScoreBar = MatchStatusScoreBar
	
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MatchStatusFriendlyScoreBar", MatchStatusFriendlyScoreBar )
LockTable( _M )
