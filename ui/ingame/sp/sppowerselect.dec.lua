local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.SP.loadouts.powerSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0 )
	local f2_local0
	if f2_arg0 then
		f2_local0 = 1
		if not f2_local0 then
		
		else
			return f2_local0
		end
	end
	f2_local0 = 0
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	return function ( f4_arg0, f4_arg1 )
		local f4_local0
		if f3_arg1.power.ref:GetValue( f4_arg1 ) ~= f3_arg0 and f3_arg1.extraPower.ref:GetValue( f4_arg1 ) ~= f3_arg0 then
			f4_local0 = false
		else
			f4_local0 = true
		end
		return f4_local0
	end
	
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	return f5_arg0 == Cac.SPPowerState.LOCKED
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	return f6_arg0 == Cac.SPPowerState.SCANNED
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0
	if f7_arg0 ~= Cac.SPPowerState.UNLOCKED and f7_arg0 ~= Cac.SPPowerState.UPGRADE_ONE then
		f7_local0 = false
	else
		f7_local0 = true
	end
	return f7_local0
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	local f8_local0 = DataSources.inGame.SP.player.equipmentState[f8_arg0]:GetValue( f8_arg1 )
	if f8_local0 == Cac.SPPowerState.UPGRADE_ONE then
		return Cac.GetPowerUpgradeOneDesc( f8_arg0 )
	elseif f8_local0 == Cac.SPPowerState.UPGRADE_TWO then
		return Cac.GetPowerUpgradeTwoDesc( f8_arg0 )
	else
		return ""
	end
end

local f0_local8 = function ( f9_arg0 )
	return function ( f10_arg0, f10_arg1 )
		local f10_local0 = 0
		if f10_arg0 == Cac.SPPowerState.UNLOCKED then
			f10_local0 = f9_arg0.upgradeOneCost:GetValue( f10_arg1 )
		elseif f10_arg0 == Cac.SPPowerState.UPGRADE_ONE then
			f10_local0 = f9_arg0.upgradeTwoCost:GetValue( f10_arg1 )
		end
		return Engine.Localize( "LUA_MENU_OPS_COST", f10_local0 )
	end
	
end

local f0_local9 = function ( f11_arg0, f11_arg1 )
	return function ( f12_arg0, f12_arg1 )
		local f12_local0 = f11_arg1.power.ref:GetValue( f12_arg1 )
		local f12_local1 = f11_arg1.extraPower.ref:GetValue( f12_arg1 )
		if f11_arg0 == f12_local0 then
			return Engine.Localize( "LUA_MENU_PRIMARY" )
		elseif f11_arg0 == f12_local1 then
			return Engine.Localize( "LUA_MENU_SECONDARY" )
		else
			
		end
	end
	
end

local f0_local10 = function ( f13_arg0, f13_arg1 )
	return function ( f14_arg0, f14_arg1, f14_arg2 )
		assert( f14_arg1.ref )
		assert( f14_arg1.name )
		assert( f14_arg1.image )
		assert( f14_arg1.desc )
		assert( f14_arg1.fullImage )
		local f14_local0 = f14_arg1.ref:GetValue( f14_arg2 )
		local f14_local1 = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f14_local0 )
		local f14_local2 = DataSources.inGame.SP.player.equipmentState[f14_local0]
		local f14_local3 = f13_arg0.ref:FilterTo( f14_local1, "selected", f0_local3( f14_local0, f13_arg1 ) )
		local f14_local4 = f13_arg0.ref:FilterTo( f14_local1, "slotText", f0_local9( f14_local0, f13_arg1 ) )
		local f14_local5 = f14_local3:FilterTo( f14_local1, "selectedAlpha", f0_local2 )
		local f14_local6 = f14_local2:FilterTo( f14_local1, "disabled", f0_local4 )
		local f14_local7 = f14_local2:FilterTo( f14_local1, "scanned", f0_local5 )
		local f14_local8 = f14_local6:FilterTo( f14_local1, "unlocked", Not )
		return {
			power = {
				ref = f14_arg1.ref,
				name = f14_arg1.name,
				icon = f14_arg1.smallRender,
				fullImage = f14_arg1.fullImage,
				desc = f14_arg1.desc,
				qualityColor = f14_local1:GetDataSourceForSubmodel( "color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) ),
				basePowerRef = f14_local1:GetDataSourceForSubmodel( "powerRef", f14_local0 ),
				isScanned = f14_local7,
				isUnlocked = f14_local8,
				isDisabled = f14_local6,
				canUpgrade = f14_local2:FilterTo( f14_local1, "canUpgrade", f0_local6 ),
				upgradeCostText = f14_local2:FilterTo( f14_local1, "upgradeCostText", f0_local8( f14_arg1 ) ),
				selected = f14_local3,
				selectedAlpha = f14_local5,
				stateText = f14_local2:FilterTo( f14_local1, "stateText", Cac.GetSPPowerStateText ),
				slot = f13_arg0.handSlot,
				slotText = f14_local4,
				powerSlot = f13_arg0.slot,
				quip = f14_arg1.ref:FilterTo( f14_local1, "quipText", f0_local7 )
			},
			selected = f14_local3,
			selectedAlpha = f14_local5,
			isUnlocked = f14_local8,
			isDisabled = f14_local6
		}
	end
	
end

local f0_local11 = function ( f15_arg0, f15_arg1, f15_arg2 )
	assert( f15_arg2 )
	if Engine.IsDevelopmentBuild() then
		if not f15_arg2.equippedSlotDataSource then
			DebugPrint( "WARNING: Missing \"equippedSlotDataSource\" option for PowerSelect menu. Only OK after a MyChanges." )
			local f15_local0 = GetProgressionLoadoutDataSources()
			f15_local0 = f15_local0:GetDataSourceAtIndex( 0 )
			f15_arg2.equippedSlotDataSource = f15_local0.powers.power
		end
		if not f15_arg2.handDataSource then
			DebugPrint( "WARNING: Missing \"handDataSource\" option for PowerSelect menu. Only OK after a MyChanges." )
			local f15_local0 = GetProgressionLoadoutDataSources()
			f15_local0 = f15_local0:GetDataSourceAtIndex( 0 )
			f15_arg2.handDataSource = f15_local0.powers
		end
		if not f15_arg2.loadoutDataSource then
			DebugPrint( "WARNING: Missing \"loadoutDataSource\" option for SPPowerSelect menu. Only OK after a MyChanges." )
			local f15_local0 = GetProgressionLoadoutDataSources()
			f15_arg2.loadoutDataSource = f15_local0:GetDataSourceAtIndex( 0 )
		end
	end
	assert( f15_arg2.equippedSlotDataSource )
	assert( f15_arg2.loadoutDataSource )
	assert( f15_arg2.handDataSource )
	f15_arg0.equippedSlotDataSource = f15_arg2.equippedSlotDataSource
	f15_arg0.loadoutDataSource = f15_arg2.loadoutDataSource
	f15_arg0.handDataSource = f15_arg2.handDataSource
	f15_arg0.MenuTitle.MenuBreadcrumbs:setText( Engine.Localize( "LUA_MENU_BREADCRUMB_LOADOUT", f15_arg0.loadoutDataSource.name:GetValue( f15_arg1 ) ), 0 )
	local f15_local1 = DataSources.inGame.SP.loadouts.powers:GetDataSourceAtIndex( f15_arg0.equippedSlotDataSource.handSlot:GetValue( f15_arg1 ) )
	local f15_local2 = f15_local1:Decorate( f0_local10( f15_arg0.equippedSlotDataSource, f15_arg0.handDataSource ) )
	f15_local2:SetCachingEnabled( true )
	f15_local2.GetDefaultFocusIndex = function ()
		local f16_local0 = f15_arg0.equippedSlotDataSource.ref:GetValue( f15_arg1 )
		assert( f16_local0 and #f16_local0 > 0 )
		for f16_local4, f16_local5 in ipairs( f15_local1 ) do
			if f16_local5.ref:GetValue( f15_arg1 ) == f16_local0 then
				return f16_local4 - 1
			end
		end
		return nil
	end
	
	f15_arg0:SetDataSource( {
		powerSelectContent = f15_local2
	}, f15_arg1 )
	f15_arg0:registerOmnvarHandler( "ui_open_loadout_menu", function ( f17_arg0, f17_arg1 )
		if not f17_arg1.value then
			LUI.FlowManager.RequestCloseAllMenus()
		end
	end )
	if Engine.GetDvarString( "ui_mapname" ) == "shipcrib_moon" then
		local f15_local3 = MenuBuilder.BuildRegisteredType( "LoadoutTutorialText", {
			controllerIndex = f15_arg1
		} )
		f15_local3.id = "LoadoutTutorialText"
		f15_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f15_arg0:addElement( f15_local3 )
		f15_arg0.loadoutTutorialText = f15_local3
	end
	f15_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY" ) .. " / " .. Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) .. " / " .. f15_arg0.loadoutDataSource.name:GetValue( f15_arg1 ) ), 0 )
end

function SPPowerSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "SPPowerSelect"
	self._animationSets = {}
	self._sequences = {}
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local Powers = nil
	
	Powers = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f18_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "PowerSelectButton", {
				controllerIndex = f18_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 140,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Powers.id = "Powers"
	Powers:setUseStencil( true )
	Powers:SetGridDataSourceThroughElement( self, "powerSelectContent" )
	Powers:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 940 )
	self:addElement( Powers )
	self.Powers = Powers
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f18_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local PowerScrollbar = nil
	
	PowerScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f18_local1
	} )
	PowerScrollbar.id = "PowerScrollbar"
	PowerScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 147, _1080p * 216, _1080p * 940 )
	self:addElement( PowerScrollbar )
	self.PowerScrollbar = PowerScrollbar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f18_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_EQUIPMENT_SELECT" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local PowerImage = nil
	
	PowerImage = LUI.UIImage.new()
	PowerImage.id = "PowerImage"
	PowerImage:SetDotPitchEnabled( true )
	PowerImage:SetDotPitchX( 0, 0 )
	PowerImage:SetDotPitchY( 0, 0 )
	PowerImage:SetDotPitchContrast( 0, 0 )
	PowerImage:SetDotPitchMode( 0 )
	PowerImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1000, _1080p * -488, _1080p * 346, _1080p * 858 )
	PowerImage:SubscribeToModelThroughElement( Powers, "power.fullImage", function ()
		local f20_local0 = Powers:GetDataSource()
		f20_local0 = f20_local0.power.fullImage:GetValue( f18_local1 )
		if f20_local0 ~= nil then
			PowerImage:setImage( RegisterMaterial( f20_local0 ), 0 )
		end
	end )
	self:addElement( PowerImage )
	self.PowerImage = PowerImage
	
	local PowerDetails = nil
	PowerDetails = MenuBuilder.BuildRegisteredType( "PowerDetails", {
		controllerIndex = f18_local1
	} )
	PowerDetails.id = "PowerDetails"
	PowerDetails:SetDataSourceThroughElement( Powers, "power" )
	PowerDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 412, 0, _1080p * 216, _1080p * 416 )
	if not Engine.IsMultiplayer() and not Engine.InFrontend() then
		PowerDetails:SubscribeToModelThroughElement( Powers, "power.stateText", function ()
			local f21_local0 = Powers:GetDataSource()
			f21_local0 = f21_local0.power.stateText:GetValue( f18_local1 )
			if f21_local0 ~= nil then
				PowerDetails.UpgradeState:setText( f21_local0, 0 )
			end
		end )
	end
	self:addElement( PowerDetails )
	self.PowerDetails = PowerDetails
	
	local UpgradeState = nil
	
	UpgradeState = LUI.UIStyledText.new()
	UpgradeState.id = "UpgradeState"
	UpgradeState:SetAlpha( 0.4, 0 )
	UpgradeState:SetFontSize( 30 * _1080p )
	UpgradeState:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	UpgradeState:SetAlignment( LUI.Alignment.Center )
	UpgradeState:SetDecodeLetterLength( 25 )
	UpgradeState:SetDecodeMaxRandChars( 3 )
	UpgradeState:SetDecodeUpdatesPerLetter( 4 )
	UpgradeState:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 926, _1080p * 1426, _1080p * 900, _1080p * 930 )
	UpgradeState:SubscribeToModelThroughElement( Powers, "power.stateText", function ()
		local f22_local0 = Powers:GetDataSource()
		f22_local0 = f22_local0.power.stateText:GetValue( f18_local1 )
		if f22_local0 ~= nil then
			UpgradeState:setText( f22_local0, 0 )
		end
	end )
	self:addElement( UpgradeState )
	self.UpgradeState = UpgradeState
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PowerImage:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.PowerImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -817, _1080p * -305, _1080p * 346, _1080p * 858, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.PowerImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1000, _1080p * -488, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		UpgradeState:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.UpgradeState:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1109, _1080p * 1609, _1080p * 901, _1080p * 931, 0 )
				end,
				function ()
					return self.UpgradeState:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 926, _1080p * 1426, _1080p * 901, _1080p * 931, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			PowerImage:AnimateSequence( "MenuOpen" )
			UpgradeState:AnimateSequence( "MenuOpen" )
		end
		
		PowerImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.PowerImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.PowerImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.PowerImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.PowerImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			PowerImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PowerDetails:SetDataSourceThroughElement( Powers, "power" )
	local f18_local10 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = PowerScrollbar,
		startCap = PowerScrollbar.startCap,
		endCap = PowerScrollbar.endCap
	}
	local f18_local12 = PowerScrollbar.sliderArea
	if f18_local12 then
		f18_local12 = PowerScrollbar.sliderArea.slider
	end
	bindButton.slider = f18_local12
	f18_local12 = PowerScrollbar.sliderArea
	if f18_local12 then
		f18_local12 = PowerScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f18_local12
	Powers:AddScrollbar( f18_local10( bindButton ) )
	self.addButtonHelperFunction = function ( f43_arg0, f43_arg1 )
		f43_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f43_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -20,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f44_arg0, f44_arg1 )
		local f44_local0 = f44_arg1.controller or f18_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( Powers, "power.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	f0_local11( self, f18_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	return self
end

MenuBuilder.registerType( "SPPowerSelect", SPPowerSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "SPPowerSelect", f0_local1 )
LockTable( _M )
