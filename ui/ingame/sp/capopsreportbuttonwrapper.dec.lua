local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = f1_arg0.CapOpsReportButton0
end

function CapOpsReportButtonWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 900 * _1080p, 0, 100 * _1080p )
	self.id = "CapOpsReportButtonWrapper"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CapOpsReportButton0 = nil
	
	CapOpsReportButton0 = MenuBuilder.BuildRegisteredType( "CapOpsReportButton", {
		controllerIndex = f2_local1
	} )
	CapOpsReportButton0.id = "CapOpsReportButton0"
	CapOpsReportButton0:SetDataSourceThroughElement( self, nil )
	CapOpsReportButton0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 900, 0, _1080p * 100 )
	self:addElement( CapOpsReportButton0 )
	self.CapOpsReportButton0 = CapOpsReportButton0
	
	CapOpsReportButton0:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "CapOpsReportButtonWrapper", CapOpsReportButtonWrapper )
LockTable( _M )
