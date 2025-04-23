local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "ingame.SP.CaptainsComputer.AARReports"
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.alwaysLoaded.playerData.SP.spData.captainComputerMissionState
	local f1_local1 = ShipCribUtils.CapCompBuildTabData( CSV.CapCompAAR, f1_local0, f1_arg1 )
	local f1_local2 = LUI.DataSourceFromList.new( #f1_local1 )
	f1_local2.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = f0_local0 .. ".report" .. f2_arg1 + 1
		local f2_local1 = f1_local1[f2_arg1 + 1]
		return {
			stateDataSource = f1_local0[f2_local1.ref],
			index = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".index", f2_local1.index ),
			title = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".title", Engine.Localize( f2_local1.title ) ),
			subtitle = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".subtitle", Engine.Localize( f2_local1.subtitle ) ),
			brief = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".brief", Engine.Localize( f2_local1.brief ) ),
			details = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".details", Engine.Localize( f2_local1.details ) ),
			repImage = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".repImage", f2_local1.repImage ),
			isNewAlpha = f1_local0[f2_local1.ref]:Filter( "isNew", function ( f3_arg0, f3_arg1 )
				local f3_local0
				if f3_arg0 == ShipCribUtils.CapCompStates.OPEN then
					f3_local0 = 1
					if not f3_local0 then
					
					else
						return f3_local0
					end
				end
				f3_local0 = 0
			end
			 )
		}
	end
	
	f1_local2.GetDefaultFocusIndex = function ()
		return 0
	end
	
	assert( f1_arg0.AARGrid )
	assert( f1_arg0.CapOpsReportDetails )
	f1_arg0.AARGrid:SetGridDataSource( f1_local2, f1_arg1 )
	f1_arg0.CapOpsReportDetails:SetDataSourceThroughElement( f1_arg0.AARGrid, nil )
	Engine.NotifyServer( "report_tab", 1 )
end

function CapOpsReport( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1700 * _1080p, 0, 800 * _1080p )
	self.id = "CapOpsReport"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local ButtonHolder = nil
	
	ButtonHolder = LUI.UIImage.new()
	ButtonHolder.id = "ButtonHolder"
	ButtonHolder:SetRGBFromInt( 1776411, 0 )
	ButtonHolder:SetAlpha( 0.85, 0 )
	ButtonHolder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 875, _1080p * 40, _1080p * 509 )
	self:addElement( ButtonHolder )
	self.ButtonHolder = ButtonHolder
	
	local ButtonHolderCopy2 = nil
	
	ButtonHolderCopy2 = LUI.UIImage.new()
	ButtonHolderCopy2.id = "ButtonHolderCopy2"
	ButtonHolderCopy2:SetRGBFromInt( 2171169, 0 )
	ButtonHolderCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 855, _1080p * 875, _1080p * 40, _1080p * 509 )
	self:addElement( ButtonHolderCopy2 )
	self.ButtonHolderCopy2 = ButtonHolderCopy2
	
	local CapOpsReportDetails = nil
	
	CapOpsReportDetails = MenuBuilder.BuildRegisteredType( "CapOpsReportDetails", {
		controllerIndex = f5_local1
	} )
	CapOpsReportDetails.id = "CapOpsReportDetails"
	CapOpsReportDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -795, _1080p * 105, _1080p * 40, _1080p * 740 )
	self:addElement( CapOpsReportDetails )
	self.CapOpsReportDetails = CapOpsReportDetails
	
	local AARGrid = nil
	
	AARGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CapOpsReportButtonWrapper", {
				controllerIndex = f5_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 7,
		spacingY = _1080p * 7,
		columnWidth = _1080p * 900,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 4000,
		maxVelocity = 5000
	} )
	AARGrid.id = "AARGrid"
	AARGrid:setUseStencil( true )
	AARGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 922, _1080p * 88, _1080p * 509 )
	self:addElement( AARGrid )
	self.AARGrid = AARGrid
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f5_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 830, _1080p * 850, _1080p * 469, _1080p * 509 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f5_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 705.78, _1080p * 725.78, _1080p * 469, _1080p * 509 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 20 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 725.78, _1080p * 830, _1080p * -319.5, _1080p * -296.5 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ButtonHolderCopy3 = nil
	
	ButtonHolderCopy3 = LUI.UIImage.new()
	ButtonHolderCopy3.id = "ButtonHolderCopy3"
	ButtonHolderCopy3:SetRGBFromInt( 3947581, 0 )
	ButtonHolderCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33, _1080p * 875, _1080p * 40, _1080p * 70 )
	self:addElement( ButtonHolderCopy3 )
	self.ButtonHolderCopy3 = ButtonHolderCopy3
	
	local ButtonHolderCopy4 = nil
	
	ButtonHolderCopy4 = LUI.UIImage.new()
	ButtonHolderCopy4.id = "ButtonHolderCopy4"
	ButtonHolderCopy4:SetRGBFromInt( 5526870, 0 )
	ButtonHolderCopy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 33, _1080p * 40, _1080p * 70 )
	self:addElement( ButtonHolderCopy4 )
	self.ButtonHolderCopy4 = ButtonHolderCopy4
	
	local ArchiveBar = nil
	
	ArchiveBar = LUI.UIText.new()
	ArchiveBar.id = "ArchiveBar"
	ArchiveBar:SetRGBFromInt( 8421504, 0 )
	ArchiveBar:setText( Engine.Localize( "CAPCOMP_ARCHIVE" ), 0 )
	ArchiveBar:SetFontSize( 20 * _1080p )
	ArchiveBar:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ArchiveBar:SetAlignment( LUI.Alignment.Left )
	ArchiveBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33, _1080p * 633, _1080p * 45, _1080p * 65 )
	self:addElement( ArchiveBar )
	self.ArchiveBar = ArchiveBar
	
	local ArchiveBarCopy0 = nil
	
	ArchiveBarCopy0 = LUI.UIText.new()
	ArchiveBarCopy0.id = "ArchiveBarCopy0"
	ArchiveBarCopy0:SetRGBFromInt( 8421504, 0 )
	ArchiveBarCopy0:setText( Engine.Localize( "CAPCOMP_REPORTBAR" ), 0 )
	ArchiveBarCopy0:SetFontSize( 20 * _1080p )
	ArchiveBarCopy0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ArchiveBarCopy0:SetAlignment( LUI.Alignment.Left )
	ArchiveBarCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 922, _1080p * 1422, _1080p * 45, _1080p * 65 )
	self:addElement( ArchiveBarCopy0 )
	self.ArchiveBarCopy0 = ArchiveBarCopy0
	
	local CapOpsTextFeed0 = nil
	
	CapOpsTextFeed0 = MenuBuilder.BuildRegisteredType( "CapOpsTextFeed", {
		controllerIndex = f5_local1
	} )
	CapOpsTextFeed0.id = "CapOpsTextFeed0"
	CapOpsTextFeed0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 875, _1080p * 527, _1080p * 740 )
	self:addElement( CapOpsTextFeed0 )
	self.CapOpsTextFeed0 = CapOpsTextFeed0
	
	AARGrid:AddArrow( ArrowUp )
	AARGrid:AddArrow( ArrowDown )
	AARGrid:AddItemNumbers( ListCount )
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.GainFocus( self, "AARGrid", f5_local1 )
	return self
end

MenuBuilder.registerType( "CapOpsReport", CapOpsReport )
LockTable( _M )
