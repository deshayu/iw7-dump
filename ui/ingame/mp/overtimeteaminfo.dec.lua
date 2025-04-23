local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OvertimeTeamInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 894 * _1080p, 0, 350 * _1080p )
	self.id = "OvertimeTeamInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BackgroundColorTop = nil
	
	BackgroundColorTop = LUI.UIImage.new()
	BackgroundColorTop.id = "BackgroundColorTop"
	BackgroundColorTop:SetAlpha( 0.6, 0 )
	BackgroundColorTop:setImage( RegisterMaterial( "widg_teamscore_background_top" ), 0 )
	BackgroundColorTop:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 895, 0, 0 )
	self:addElement( BackgroundColorTop )
	self.BackgroundColorTop = BackgroundColorTop
	
	local OvertimeTeamTimer = nil
	
	OvertimeTeamTimer = MenuBuilder.BuildRegisteredType( "OvertimeTeamTimer", {
		controllerIndex = f1_local1
	} )
	OvertimeTeamTimer.id = "OvertimeTeamTimer"
	OvertimeTeamTimer.CountdownElement:setEndTime( 0 )
	OvertimeTeamTimer:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 862, _1080p * 53, _1080p * 350 )
	self:addElement( OvertimeTeamTimer )
	self.OvertimeTeamTimer = OvertimeTeamTimer
	
	return self
end

MenuBuilder.registerType( "OvertimeTeamInfo", OvertimeTeamInfo )
LockTable( _M )
