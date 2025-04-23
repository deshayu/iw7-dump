local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.CapOpsReportButton0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetDataSource()
		local f2_local1 = f1_arg0:GetCurrentMenu()
		local f2_local2 = f2_local1.Tabs:GetCurrentTabMenu()
		f2_local2.CapOpsIntelDetails:SetDataSource( f2_local0, f1_arg1 )
	end )
end

function CapOpsIntelButtonWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 100 * _1080p )
	self.id = "CapOpsIntelButtonWrapper"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CapOpsReportButton0 = nil
	
	CapOpsReportButton0 = MenuBuilder.BuildRegisteredType( "CapOpsReportButton", {
		controllerIndex = f3_local1
	} )
	CapOpsReportButton0.id = "CapOpsReportButton0"
	CapOpsReportButton0:SetDataSourceThroughElement( self, nil )
	CapOpsReportButton0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 100 )
	self:addElement( CapOpsReportButton0 )
	self.CapOpsReportButton0 = CapOpsReportButton0
	
	CapOpsReportButton0:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "CapOpsIntelButtonWrapper", CapOpsIntelButtonWrapper )
LockTable( _M )
