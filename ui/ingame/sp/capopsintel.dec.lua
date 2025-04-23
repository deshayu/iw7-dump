local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "ingame.SP.CaptainsComputer.Intel"
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.alwaysLoaded.playerData.SP.spData.captainComputerAudioState
	local f1_local1 = ShipCribUtils.CapCompBuildTabData( CSV.CapCompIntel, f1_local0, f1_arg1 )
	local f1_local2 = LUI.DataSourceFromList.new( #f1_local1 )
	f1_local2.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = f0_local0 .. ".intel" .. f2_arg1 + 1
		local f2_local1 = f1_local1[f2_arg1 + 1]
		return {
			stateDataSource = f1_local0[f2_local1.ref],
			index = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".index", f2_local1.index ),
			title = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".title", Engine.Localize( f2_local1.title ) ),
			subtitle = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".subtitle", Engine.Localize( f2_local1.subtitle ) ),
			repImage = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".repImage", f2_local1.repImage ),
			idImage = LUI.DataSourceInGlobalModel.new( f2_local0 .. ".idImage", f2_local1.idImage ),
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
			 ),
			contentType = f2_local1.contentType,
			contentName = f2_local1.contentName,
			indexValue = f2_local1.index
		}
	end
	
	f1_local2.GetDefaultFocusIndex = function ()
		return 0
	end
	
	f1_arg0.intelsDataSource = f1_local2
	assert( f1_arg0.IntelGrid )
	assert( f1_arg0.CapOpsIntelDetails )
	f1_arg0.IntelGrid:SetGridDataSource( f1_local2, f1_arg1 )
	Engine.NotifyServer( "intel_tab", 1 )
end

function CapOpsIntel( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1700 * _1080p, 0, 800 * _1080p )
	self.id = "CapOpsIntel"
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
	ButtonHolder:SetDotPitchEnabled( true )
	ButtonHolder:SetDotPitchX( 0, 0 )
	ButtonHolder:SetDotPitchY( 0, 0 )
	ButtonHolder:SetDotPitchContrast( 0, 0 )
	ButtonHolder:SetDotPitchMode( 0 )
	ButtonHolder:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 875, _1080p * 40, _1080p * 509 )
	self:addElement( ButtonHolder )
	self.ButtonHolder = ButtonHolder
	
	local ButtonHolderCopy2 = nil
	
	ButtonHolderCopy2 = LUI.UIImage.new()
	ButtonHolderCopy2.id = "ButtonHolderCopy2"
	ButtonHolderCopy2:SetRGBFromInt( 2171169, 0 )
	ButtonHolderCopy2:SetDotPitchEnabled( true )
	ButtonHolderCopy2:SetDotPitchX( 0, 0 )
	ButtonHolderCopy2:SetDotPitchY( 0, 0 )
	ButtonHolderCopy2:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy2:SetDotPitchMode( 0 )
	ButtonHolderCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 855, _1080p * 875, _1080p * 40, _1080p * 509 )
	self:addElement( ButtonHolderCopy2 )
	self.ButtonHolderCopy2 = ButtonHolderCopy2
	
	local CapOpsIntelDetails = nil
	
	CapOpsIntelDetails = MenuBuilder.BuildRegisteredType( "CapOpsIntelDetails", {
		controllerIndex = f5_local1
	} )
	CapOpsIntelDetails.id = "CapOpsIntelDetails"
	CapOpsIntelDetails:SetDotPitchEnabled( true )
	CapOpsIntelDetails:SetDotPitchX( 0, 0 )
	CapOpsIntelDetails:SetDotPitchY( 0, 0 )
	CapOpsIntelDetails:SetDotPitchContrast( 0, 0 )
	CapOpsIntelDetails:SetDotPitchMode( 0 )
	CapOpsIntelDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -796, _1080p * 104, _1080p * 40, _1080p * 740 )
	self:addElement( CapOpsIntelDetails )
	self.CapOpsIntelDetails = CapOpsIntelDetails
	
	local IntelGrid = nil
	
	IntelGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f5_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "CapOpsIntelButtonWrapper", {
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
	IntelGrid.id = "IntelGrid"
	IntelGrid:SetDotPitchEnabled( true )
	IntelGrid:SetDotPitchX( 0, 0 )
	IntelGrid:SetDotPitchY( 0, 0 )
	IntelGrid:SetDotPitchContrast( 0, 0 )
	IntelGrid:SetDotPitchMode( 0 )
	IntelGrid:setUseStencil( true )
	IntelGrid:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22, _1080p * 922, _1080p * 88, _1080p * 509 )
	self:addElement( IntelGrid )
	self.IntelGrid = IntelGrid
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f5_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetDotPitchEnabled( true )
	ArrowUp:SetDotPitchX( 0, 0 )
	ArrowUp:SetDotPitchY( 0, 0 )
	ArrowUp:SetDotPitchContrast( 0, 0 )
	ArrowUp:SetDotPitchMode( 0 )
	ArrowUp:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 830, _1080p * 850, _1080p * -331, _1080p * -291 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f5_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetDotPitchEnabled( true )
	ArrowDown:SetDotPitchX( 0, 0 )
	ArrowDown:SetDotPitchY( 0, 0 )
	ArrowDown:SetDotPitchContrast( 0, 0 )
	ArrowDown:SetDotPitchMode( 0 )
	ArrowDown:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 705.78, _1080p * 725.78, _1080p * -331, _1080p * -291 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:SetDotPitchEnabled( true )
	ListCount:SetDotPitchX( 0, 0 )
	ListCount:SetDotPitchY( 0, 0 )
	ListCount:SetDotPitchContrast( 0, 0 )
	ListCount:SetDotPitchMode( 0 )
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 22 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 725.78, _1080p * 830, _1080p * -318.5, _1080p * -296.5 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
	local ButtonHolderCopy3 = nil
	
	ButtonHolderCopy3 = LUI.UIImage.new()
	ButtonHolderCopy3.id = "ButtonHolderCopy3"
	ButtonHolderCopy3:SetRGBFromInt( 3947581, 0 )
	ButtonHolderCopy3:SetDotPitchEnabled( true )
	ButtonHolderCopy3:SetDotPitchX( 0, 0 )
	ButtonHolderCopy3:SetDotPitchY( 0, 0 )
	ButtonHolderCopy3:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy3:SetDotPitchMode( 0 )
	ButtonHolderCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 875, _1080p * 40, _1080p * 70 )
	self:addElement( ButtonHolderCopy3 )
	self.ButtonHolderCopy3 = ButtonHolderCopy3
	
	local ButtonHolderCopy4 = nil
	
	ButtonHolderCopy4 = LUI.UIImage.new()
	ButtonHolderCopy4.id = "ButtonHolderCopy4"
	ButtonHolderCopy4:SetRGBFromInt( 5526870, 0 )
	ButtonHolderCopy4:SetDotPitchEnabled( true )
	ButtonHolderCopy4:SetDotPitchX( 0, 0 )
	ButtonHolderCopy4:SetDotPitchY( 0, 0 )
	ButtonHolderCopy4:SetDotPitchContrast( 0, 0 )
	ButtonHolderCopy4:SetDotPitchMode( 0 )
	ButtonHolderCopy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16, _1080p * 33, _1080p * 40, _1080p * 70 )
	self:addElement( ButtonHolderCopy4 )
	self.ButtonHolderCopy4 = ButtonHolderCopy4
	
	local ArchiveBar = nil
	
	ArchiveBar = LUI.UIText.new()
	ArchiveBar.id = "ArchiveBar"
	ArchiveBar:SetRGBFromInt( 8421504, 0 )
	ArchiveBar:SetDotPitchEnabled( true )
	ArchiveBar:SetDotPitchX( 0, 0 )
	ArchiveBar:SetDotPitchY( 0, 0 )
	ArchiveBar:SetDotPitchContrast( 0, 0 )
	ArchiveBar:SetDotPitchMode( 0 )
	ArchiveBar:setText( Engine.Localize( "CAPCOMP_ARCHIVE" ), 0 )
	ArchiveBar:SetFontSize( 22 * _1080p )
	ArchiveBar:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ArchiveBar:SetAlignment( LUI.Alignment.Left )
	ArchiveBar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 33, _1080p * 520, _1080p * 44.5, _1080p * 66.5 )
	self:addElement( ArchiveBar )
	self.ArchiveBar = ArchiveBar
	
	local ArchiveBarCopy0 = nil
	
	ArchiveBarCopy0 = LUI.UIText.new()
	ArchiveBarCopy0.id = "ArchiveBarCopy0"
	ArchiveBarCopy0:SetRGBFromInt( 8421504, 0 )
	ArchiveBarCopy0:SetDotPitchEnabled( true )
	ArchiveBarCopy0:SetDotPitchX( 0, 0 )
	ArchiveBarCopy0:SetDotPitchY( 0, 0 )
	ArchiveBarCopy0:SetDotPitchContrast( 0, 0 )
	ArchiveBarCopy0:SetDotPitchMode( 0 )
	ArchiveBarCopy0:setText( Engine.Localize( "CAPCOMP_LOG_LABEL" ), 0 )
	ArchiveBarCopy0:SetFontSize( 22 * _1080p )
	ArchiveBarCopy0:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	ArchiveBarCopy0:SetAlignment( LUI.Alignment.Left )
	ArchiveBarCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 922, _1080p * 1409, _1080p * 44.5, _1080p * 66.5 )
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
	
	local f5_local15 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = ListCount,
		startCap = ListCount.startCap,
		endCap = ListCount.endCap
	}
	local f5_local17 = ListCount.sliderArea
	if f5_local17 then
		f5_local17 = ListCount.sliderArea.slider
	end
	bindButton.slider = f5_local17
	f5_local17 = ListCount.sliderArea
	if f5_local17 then
		f5_local17 = ListCount.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f5_local17
	IntelGrid:AddScrollbar( f5_local15( bindButton ) )
	IntelGrid:AddArrow( ArrowUp )
	IntelGrid:AddArrow( ArrowDown )
	IntelGrid:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f7_arg0, f7_arg1 )
		if #f7_arg0:getAllFocusedChildren() > 0 or f7_arg0:isInFocus() then
			f7_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "CAPCOMP_INTEL_PLAY" ),
				button_ref = "button_primary",
				side = "left",
				clickable = true
			} )
		end
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "gain_focus", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f5_local1
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "CAPCOMP_INTEL_PLAY" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end )
	self:addEventHandler( "lose_focus", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f5_local1
		f9_arg0:RemoveButtonHelperText( "button_primary", "left" )
		local f9_local1 = f9_arg0:getParent()
		while f9_local1 and not f9_local1.addButtonHelperFunction and f9_local1.id ~= f5_local2.id do
			f9_local1 = f9_local1:getParent()
		end
		if f9_local1 and f9_local1.addButtonHelperFunction then
			f9_local1.addButtonHelperFunction( f9_arg0, f9_arg1 )
		end
	end )
	PostLoadFunc( self, f5_local1, controller )
	ACTIONS.GainFocus( self, "IntelGrid", f5_local1 )
	return self
end

MenuBuilder.registerType( "CapOpsIntel", CapOpsIntel )
LockTable( _M )
