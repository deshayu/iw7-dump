local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RoundEndTeamInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 894 * _1080p, 0, 350 * _1080p )
	self.id = "RoundEndTeamInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TeamInfo = nil
	
	TeamInfo = MenuBuilder.BuildRegisteredType( "TeamInfo", {
		controllerIndex = f1_local1
	} )
	TeamInfo.id = "TeamInfo"
	TeamInfo:SetScale( 0.17, 0 )
	TeamInfo:SetDataSourceThroughElement( self, nil )
	TeamInfo.Score:setText( "100", 0 )
	TeamInfo.TimeToBeat:setText( Engine.Localize( "MENU_NEW" ), 0 )
	TeamInfo:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 111, _1080p * 1, _1080p * 37.5, _1080p * 312.5 )
	self:addElement( TeamInfo )
	self.TeamInfo = TeamInfo
	
	TeamInfo:SetDataSourceThroughElement( self, nil )
	return self
end

MenuBuilder.registerType( "RoundEndTeamInfo", RoundEndTeamInfo )
LockTable( _M )
