local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function questRecorderWidgetSplash( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 312 * _1080p, 0, 106 * _1080p )
	self.id = "questRecorderWidgetSplash"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 312, 0, _1080p * 106 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local questRecorderWidget = nil
	
	questRecorderWidget = MenuBuilder.BuildRegisteredType( "questRecorderWidget", {
		controllerIndex = f1_local1
	} )
	questRecorderWidget.id = "questRecorderWidget"
	questRecorderWidget:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 312, 0, _1080p * 106 )
	self:addElement( questRecorderWidget )
	self.questRecorderWidget = questRecorderWidget
	
	return self
end

MenuBuilder.registerType( "questRecorderWidgetSplash", questRecorderWidgetSplash )
LockTable( _M )
