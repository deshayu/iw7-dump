local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.SP.loadouts.weaponSelect"
f0_local1 = "inGame.SP.loadouts.weaponSelectTab"
f0_local2 = "inGame.SP.loadouts.weaponSelectStats"
local f0_local3 = "inGame.SP.loadouts.weaponSelectEquipped"
function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
	WipeGlobalModelsAtPath( f0_local1 )
	WipeGlobalModelsAtPath( f0_local2 )
	WipeGlobalModelsAtPath( f0_local3 )
end

local f0_local4 = function ( f2_arg0, f2_arg1, f2_arg2 )
	return f2_arg0 == f2_arg1.weapon:GetValue( f2_arg2 )
end

local f0_local5 = function ( f3_arg0 )
	local f3_local0
	if f3_arg0 then
		f3_local0 = 1
		if not f3_local0 then
		
		else
			return f3_local0
		end
	end
	f3_local0 = 0
end

local f0_local6 = function ( f4_arg0, f4_arg1 )
	return f4_arg0 == Cac.scannedWeaponStates.UNLOCKED
end

local f0_local7 = function ( f5_arg0, f5_arg1 )
	return f5_arg0 == Cac.scannedWeaponStates.SCANNED
end

local f0_local8 = function ( f6_arg0, f6_arg1 )
	return f6_arg0 == Cac.scannedWeaponStates.LOCKED
end

local f0_local9 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = f7_arg3[f7_arg1 + 1]
	assert( f7_local0 )
	return {
		fireMode = {
			name = f7_arg0:GetDataSourceForSubmodel( "name", Engine.Localize( f7_local0.name:GetValue( f7_arg2 ) ) ),
			icon = f7_local0.image
		}
	}
end

function GetBaseWeaponDecorator( f8_arg0, f8_arg1 )
	return function ( f9_arg0, f9_arg1, f9_arg2 )
		assert( f9_arg1.name )
		assert( f9_arg1.image )
		local f9_local0 = f9_arg1.ref:GetValue( f9_arg2 )
		local f9_local1 = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f9_local0 .. ".equipped", f0_local4( f9_local0, f8_arg0, f9_arg2 ) )
		local f9_local2 = f9_local1:Filter( "equippedAlpha", f0_local5 )
		local f9_local3 = DataSources.inGame.SP.player.weaponsScanned[f9_local0]
		local f9_local4 = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f9_local0 .. ".scannedState" )
		local f9_local5 = f9_local3:FilterTo( f9_local4, "isUnlocked", f0_local6 )
		local f9_local6 = f9_local3:FilterTo( f9_local4, "isScanned", f0_local7 )
		local f9_local7 = f9_local3:FilterTo( f9_local4, "isDisabled", f0_local8 )
		local f9_local8 = LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f9_local0 .. ".isEnergyWeapon", Cac.GetIsEnergyWeapon( f9_local0 ) )
		local f9_local9 = Cac.GetFireModesForWeapon( f9_local0 )
		local f9_local10 = LUI.DataSourceFromList.new( #f9_local9 )
		f9_local10.MakeDataSourceAtIndex = function ( f10_arg0, f10_arg1, f10_arg2 )
			return f0_local9( LUI.DataSourceInGlobalModel.new( f0_local1 .. "." .. f9_local0 .. ".fireMode" .. f10_arg1, f10_arg1 ), f10_arg1, f10_arg2, f9_local9 )
		end
		
		return {
			weapon = {
				weapon = {
					slot = f8_arg0.slot,
					name = f9_arg1.name,
					image = f9_arg1.image,
					fullImage = f9_arg1.fullImage,
					qualityColor = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".color", GetIntForColor( SWATCHES.CAC.defaultItemHeader ) ),
					desc = f9_arg1.desc,
					isUnlocked = f9_local5,
					isScanned = f9_local6,
					isDisabled = f9_local7,
					baseWeaponRef = f9_arg1.ref,
					equipped = f9_local1,
					equippedAlpha = f9_local2,
					cost = f9_arg1.cost,
					fireModes = f9_local10,
					ref = f9_arg1.ref,
					isLoot = LUI.DataSourceInGlobalModel.new( f0_local1 .. ".isLoot", false ),
					isEnergyWeapon = f9_local8
				}
			},
			isUnlocked = f9_local5,
			isScanned = f9_local6,
			isDisabled = f9_local7,
			equipped = f9_local1,
			equippedAlpha = f9_local2
		}
	end
	
end

function UpdateEquippedWeaponData( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg0.equippedWeaponDatasource.weapon
	local f11_local1 = f11_arg0.weaponDataSource.weapon:GetValue( f11_arg1 )
	f11_local0.name:SetValue( f11_arg1, Cac.GetWeaponName( f11_local1 ) )
	f11_local0.image:SetValue( f11_arg1, Cac.GetWeaponImage( f11_local1 ) )
	f11_local0.fullImage:SetValue( f11_arg1, Cac.GetWeaponFullImage( f11_local1 ) )
	f11_local0.desc:SetValue( f11_arg1, Cac.GetWeaponDesc( f11_local1 ) )
	f11_local0.baseWeaponRef:SetValue( f11_arg1, f11_local1 )
	f11_arg0.equippedWeaponDatasource.stats.weaponRef:SetValue( f11_arg1, f11_local1 )
	f11_local0.ref:SetValue( f11_arg1, f11_local1 )
end

function InitEquippedWeaponDataSources( f12_arg0, f12_arg1 )
	f12_arg0.equippedWeaponDatasource = {
		weapon = {
			ref = LUI.DataSourceInGlobalModel.new( f0_local3, f12_arg0.weaponDataSource.weapon:GetValue( f12_arg1 ) ),
			name = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".name", "" ),
			image = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".icon", "" ),
			fullImage = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".fullImage", "" ),
			desc = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".desc", "" ),
			baseWeaponRef = f12_arg0.weaponDataSource.weapon
		},
		stats = {
			weaponRef = f12_arg0.weaponDataSource.weapon,
			attachmentOneRef = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".stats.attachment0", "none" ),
			attachmentTwoRef = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".stats.attachment1", "none" ),
			attachmentThreeRef = LUI.DataSourceInGlobalModel.new( f0_local3 .. ".stats.attachment2", "none" )
		}
	}
	UpdateEquippedWeaponData( f12_arg0, f12_arg1 )
	f12_arg0.weaponCompareArchetypeData = {
		weaponOne = f12_arg0.equippedWeaponDatasource,
		weaponTwo = f12_arg0.equippedWeaponDatasource
	}
end

function PostLoadFunc( f13_arg0, f13_arg1, f13_arg2 )
	assert( f13_arg2 )
	if Engine.IsDevelopmentBuild() then
		if not f13_arg2.weaponDataSource then
			DebugPrint( "WARNING: Missing \"weaponDataSource\" option for WeaponSelect menu. Only OK after a MyChanges." )
			local f13_local0 = DataSources.inGame.SP.loadouts:GetDataSourceAtIndex( 0 )
			f13_arg2.weaponDataSource = f13_local0.weaponSlotOne
		end
		if not f13_arg2.loadoutDataSource then
			DebugPrint( "WARNING: Missing \"loadoutDataSource\" option for WeaponSelect menu. Only OK after a MyChanges." )
			local f13_local0 = GetProgressionLoadoutDataSources()
			f13_arg2.loadoutDataSource = f13_local0:GetDataSourceAtIndex( 0 )
		end
	end
	assert( f13_arg2.weaponDataSource )
	assert( f13_arg2.loadoutDataSource )
	f13_arg0.weaponDataSource = f13_arg2.weaponDataSource
	f13_arg0.loadoutDataSource = f13_arg2.loadoutDataSource
	local f13_local0 = f13_arg0.weaponDataSource.slot:GetValue( f13_arg1 )
	local f13_local1 = assert
	local f13_local2
	if f13_local0 ~= 0 and f13_local0 ~= 1 then
		f13_local2 = false
	else
		f13_local2 = true
	end
	f13_local1( f13_local2 )
	f13_local1 = f13_local0
	if f13_local0 == Cac.PrimaryWeaponSlot then
		f13_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_TITLE_PRIMARY_WEAPON" ), 0 )
		Engine.SetDvarString( "loadout_tut_string", "choose_primary_page" )
	elseif f13_local0 == Cac.SecondaryWeaponSlot then
		f13_arg0.MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_TITLE_SECONDARY_WEAPON" ), 0 )
	end
	f13_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY" ) .. " / " .. Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) .. " / " .. f13_arg0.loadoutDataSource.name:GetValue( f13_arg1 ) ), 0 )
	local f13_local3 = {}
	local f13_local4 = Cac.GetWeaponRowList()
	local f13_local5 = Cac.GetWeaponClasses( f13_local1 )
	for f13_local12, f13_local13 in ipairs( f13_local5 ) do
		for f13_local9, f13_local10 in pairs( f13_local4[f13_local13.ref] ) do
			if Engine.TableLookup( CSV.weapons.file, CSV.weapons.cols.ref, f13_local9, CSV.weapons.cols.isHiddenWhenLocked ) == "TRUE" and f0_local8( DataSources.inGame.SP.player.weaponsScanned[f13_local9]:GetValue( f13_arg1 ), f13_arg1 ) then
				f13_local3[f13_local9] = true
			end
		end
	end
	f13_local7 = LOADOUT.MakeBaseWeaponsListDataSource( f0_local0 .. ".baseWeapons", f13_local5, f13_local4, {
		filterOut = function ( f14_arg0 )
			return f13_local3[f14_arg0]
		end
	} )
	f13_local13 = f13_local7:Decorate( Cac.GetWeaponTabDecorator( f13_arg0.weaponDataSource, f13_arg2.loadoutDataSource, GetBaseWeaponDecorator( f13_arg0.weaponDataSource, f13_arg2.loadoutDataSource ), f0_local1 ) )
	f13_local13:SetCachingEnabled( true )
	f13_local13.GetDefaultFocusIndex = function ( f15_arg0 )
		local f15_local0 = Cac.GetEquippedWeaponClass( f13_arg0.weaponDataSource, f13_arg1 )
		if Cac.IsWeaponInRowList( f13_arg0.weaponDataSource.weapon:GetValue( f13_arg1 ) ) then
			return Cac.GetWeaponClassIndex( f15_local0 ) - 1
		else
			
		end
	end
	
	local f13_local14 = {
		tabs = f13_local13,
		selectedWeapon = {
			weaponRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".weaponRef", f13_arg0.weaponDataSource.weapon:GetValue( f13_arg1 ) ),
			attachmentOneRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment0", "none" ),
			attachmentTwoRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment1", "none" ),
			attachmentThreeRef = LUI.DataSourceInGlobalModel.new( f0_local2 .. ".attachment2", "none" )
		}
	}
	f13_arg0:SetDataSource( f13_local14, f13_arg1 )
	f13_arg0:SubscribeToModelThroughElement( f13_arg0.Weapon, "weapon.baseWeaponRef", function ()
		local f16_local0 = f13_arg0.Weapon:GetDataSource()
		f13_local14.selectedWeapon.weaponRef:SetValue( f13_arg1, f16_local0.weapon.baseWeaponRef:GetValue( f13_arg1 ) )
		local f16_local1 = f13_arg0.weaponCompareArchetypeData
		local f16_local2 = {}
		local f16_local3 = f13_arg0.Weapon:GetDataSource()
		f16_local2.weapon = f16_local3.weapon
		f16_local2.stats = f13_local14.selectedWeapon
		f16_local1.weaponTwo = f16_local2
	end )
	assert( f13_arg0.BaseWeapons )
	f13_arg0:SubscribeToDataSourceThroughElement( f13_arg0.BaseWeapons, nil, function ()
		local f17_local0 = f13_arg0.BaseWeapons:GetDataSource()
		f17_local0 = f17_local0.weapon.weapon.ref:GetValue( f13_arg1 )
		Engine.NotifyServer( f17_local0, 1 )
		Engine.SetDvarString( "loadout_weapon_string", f17_local0 )
	end )
	InitEquippedWeaponDataSources( f13_arg0, f13_arg1 )
	f13_arg0:registerOmnvarHandler( "ui_open_loadout_menu", function ( f18_arg0, f18_arg1 )
		if not f18_arg1.value then
			LUI.FlowManager.RequestCloseAllMenus()
		end
	end )
	if Engine.GetDvarString( "ui_mapname" ) == "shipcrib_moon" then
		local f13_local10 = MenuBuilder.BuildRegisteredType( "LoadoutTutorialText", {
			controllerIndex = f13_arg1
		} )
		f13_local10.id = "LoadoutTutorialText"
		f13_local10:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f13_arg0:addElement( f13_local10 )
		f13_arg0.loadoutTutorialText = f13_local10
	end
end

function SPWeaponSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "SPWeaponSelect"
	self._animationSets = {}
	self._sequences = {}
	local f19_local1 = controller and controller.controllerIndex
	if not f19_local1 and not Engine.InFrontend() then
		f19_local1 = self:getRootController()
	end
	assert( f19_local1 )
	self:playSound( "menu_open" )
	local f19_local2 = self
	local Tabs = nil
	
	Tabs = MenuBuilder.BuildRegisteredType( "SubMenuTabsBar", {
		controllerIndex = f19_local1
	} )
	Tabs.id = "Tabs"
	Tabs.Tabs:SetTabManagerDataSourceThroughElement( self, "tabs" )
	Tabs:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 145, _1080p * 185 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f19_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local BaseWeapons = nil
	
	BaseWeapons = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f19_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "BaseWeapon", {
				controllerIndex = f19_local1
			} )
		end,
		wrapX = false,
		wrapY = false,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 133.2,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Center,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseWeapons.id = "BaseWeapons"
	BaseWeapons:setUseStencil( true )
	BaseWeapons:SetGridDataSourceThroughElement( Tabs.Tabs, "baseWeapons" )
	BaseWeapons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 147, _1080p * 397, _1080p * 216, _1080p * 906 )
	self:addElement( BaseWeapons )
	self.BaseWeapons = BaseWeapons
	
	local WeaponDetails = nil
	
	WeaponDetails = MenuBuilder.BuildRegisteredType( "WeaponDetails", {
		controllerIndex = f19_local1
	} )
	WeaponDetails.id = "WeaponDetails"
	WeaponDetails:SetDataSourceThroughElement( BaseWeapons, "weapon" )
	WeaponDetails:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 413, 0, _1080p * 216, _1080p * 676 )
	self:addElement( WeaponDetails )
	self.WeaponDetails = WeaponDetails
	
	local BaseWeaponsScrollbar = nil
	
	BaseWeaponsScrollbar = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbar", {
		controllerIndex = f19_local1
	} )
	BaseWeaponsScrollbar.id = "BaseWeaponsScrollbar"
	BaseWeaponsScrollbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 146, _1080p * 216, _1080p * 940 )
	self:addElement( BaseWeaponsScrollbar )
	self.BaseWeaponsScrollbar = BaseWeaponsScrollbar
	
	local StatsPanel = nil
	
	StatsPanel = MenuBuilder.BuildRegisteredType( "WeaponStatsPanel", {
		controllerIndex = f19_local1
	} )
	StatsPanel.id = "StatsPanel"
	StatsPanel:SetDataSourceThroughElement( self, "selectedWeapon" )
	StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 856.5, _1080p * 1476.5, _1080p * -232, _1080p * -132 )
	self:addElement( StatsPanel )
	self.StatsPanel = StatsPanel
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f19_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "MENU_NEW" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_NEW" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Weapon = nil
	
	Weapon = MenuBuilder.BuildRegisteredType( "Weapon", {
		controllerIndex = f19_local1
	} )
	Weapon.id = "Weapon"
	Weapon:SetAlpha( 0, 0 )
	Weapon:SetDataSourceThroughElement( BaseWeapons, "weapon" )
	Weapon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 575.51, _1080p * 1575.51, _1080p * 380, _1080p * 830 )
	self:addElement( Weapon )
	self.Weapon = Weapon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		StatsPanel:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 1055.5, _1080p * 1675.5, _1080p * -232, _1080p * -132, 0 )
				end,
				function ()
					return self.StatsPanel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 856.5, _1080p * 1476.5, _1080p * -232, _1080p * -132, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			StatsPanel:AnimateSequence( "MenuOpen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BaseWeapons:addEventHandler( "gain_focus", function ( f26_arg0, f26_arg1 )
		ACTIONS.GainFocus( self, "Weapon", f26_arg1.controller or f19_local1 )
	end )
	BaseWeapons:addEventHandler( "lose_focus", function ( f27_arg0, f27_arg1 )
		ACTIONS.LoseFocus( self, "Weapon", f27_arg1.controller or f19_local1 )
	end )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	WeaponDetails:SetDataSourceThroughElement( BaseWeapons, "weapon" )
	StatsPanel:SetDataSourceThroughElement( self, "selectedWeapon" )
	Weapon:SetDataSourceThroughElement( BaseWeapons, "weapon" )
	local f19_local11 = LUI.UIScrollbar.new
	local bindButton = {
		direction = LUI.DIRECTION.vertical,
		eventListener = BaseWeaponsScrollbar,
		startCap = BaseWeaponsScrollbar.startCap,
		endCap = BaseWeaponsScrollbar.endCap
	}
	local f19_local13 = BaseWeaponsScrollbar.sliderArea
	if f19_local13 then
		f19_local13 = BaseWeaponsScrollbar.sliderArea.slider
	end
	bindButton.slider = f19_local13
	f19_local13 = BaseWeaponsScrollbar.sliderArea
	if f19_local13 then
		f19_local13 = BaseWeaponsScrollbar.sliderArea.fixedSizeSlider
	end
	bindButton.fixedSizeSlider = f19_local13
	BaseWeapons:AddScrollbar( f19_local11( bindButton ) )
	self.addButtonHelperFunction = function ( f28_arg0, f28_arg1 )
		f28_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f28_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f19_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	PostLoadFunc( self, f19_local1, controller )
	return self
end

MenuBuilder.registerType( "SPWeaponSelect", SPWeaponSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "SPWeaponSelect", PopFunc )
LockTable( _M )
