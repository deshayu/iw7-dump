local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.SP.loadouts.jackalEquipSelect"
f0_local1 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0 )
	return f2_arg0 == Cac.spLockStates.LOCKED
end

local f0_local3 = function ( f3_arg0 )
	return f3_arg0 ~= Cac.spLockStates.LOCKED
end

local f0_local4 = function ( f4_arg0 )
	return f4_arg0 == Cac.spLockStates.SCANNED
end

local f0_local5 = function ( f5_arg0, f5_arg1 )
	return function ( f6_arg0, f6_arg1 )
		local f6_local0
		if f6_arg0 == f5_arg0 then
			f6_local0 = not f5_arg1
		else
			f6_local0 = false
		end
		return f6_local0
	end
	
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	return function ( f8_arg0, f8_arg1, f8_arg2 )
		assert( f8_arg1.ref )
		assert( f8_arg1.name )
		assert( f8_arg1.image )
		assert( f8_arg1.desc )
		assert( f8_arg1.fullImage )
		local f8_local0 = f8_arg1.ref:GetValue( f8_arg2 )
		local f8_local1 = LUI.DataSourceInGlobalModel.new( f0_local0 .. "." .. f8_local0 )
		local f8_local2 = nil
		if f7_arg1 == Cac.JackalEquipSlot.primary then
			f8_local2 = DataSources.inGame.SP.player.jackalPrimaryState[f8_local0]
		elseif f7_arg1 == Cac.JackalEquipSlot.secondary then
			f8_local2 = DataSources.inGame.SP.player.jackalSecondaryState[f8_local0]
		elseif f7_arg1 == Cac.JackalEquipSlot.upgrade then
			f8_local2 = DataSources.inGame.SP.player.jackalUpgradeState[f8_local0]
		elseif f7_arg1 == Cac.JackalEquipSlot.decal then
			f8_local2 = DataSources.inGame.SP.player.jackalDecalState[f8_local0]
		end
		local f8_local3 = f8_local2:FilterTo( f8_local1, "disabled", f0_local2 )
		local f8_local4 = f8_local2:FilterTo( f8_local1, "scanned", f0_local4 )
		local f8_local5 = f8_local2:FilterTo( f8_local1, "unlocked", f0_local3 )
		local f8_local6 = f7_arg0.ref:FilterTo( f8_local1, "selected", f0_local5( f8_local0, f8_local3:GetValue( f8_arg2 ) ) )
		return {
			jackalItem = {
				ref = f8_arg1.ref,
				name = f8_arg1.name,
				desc = f8_arg1.desc,
				image = f8_arg1.image,
				fullImage = f8_arg1.fullImage,
				unlockText = f8_arg1.unlockText,
				selected = f8_local6,
				isScanned = f8_local4,
				isUnlocked = f8_local5,
				isDisabled = f8_local3
			},
			selected = f8_local6,
			isScanned = f8_local4,
			isUnlocked = f8_local5,
			isDisabled = f8_local3,
			itemStateDataSource = f8_local2
		}
	end
	
end

local f0_local7 = function ( f9_arg0, f9_arg1, f9_arg2 )
	assert( f9_arg0.MenuTitle )
	local f9_local0 = GetProgressionLoadoutDataSources()
	f9_arg0.loadoutDataSource = f9_local0:GetDataSourceAtIndex( f9_arg2.loadoutIndex )
	f9_arg0.equippedSlotDataSource = f9_arg2.equippedSlotDataSource
	f9_local0 = f9_arg0.equippedSlotDataSource.slot:GetValue( f9_arg1 )
	local f9_local1 = DataSources.inGame.SP.loadouts.jackalItems[f9_local0]:Decorate( f0_local6( f9_arg0.equippedSlotDataSource, f9_local0 ) )
	f9_local1:SetCachingEnabled( true )
	f9_local1.GetDefaultFocusIndex = function ()
		local f10_local0 = f9_arg0.equippedSlotDataSource.ref:GetValue( f9_arg1 )
		if f10_local0 ~= Cac.jackalEquipNone then
			for f10_local4, f10_local5 in ipairs( REG4 ) do
				if f10_local5.ref:GetValue( f9_arg1 ) == f10_local0 then
					return f10_local4 - 1
				end
			end
		end
		return nil
	end
	
	f9_arg0:SetDataSource( {
		jackalSelectContent = f9_local1
	}, f9_arg1 )
	f9_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_ARMORY" ) .. " / " .. Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) .. " / " .. f9_arg0.loadoutDataSource.name:GetValue( f9_arg1 ) ), 0 )
end

function JackalEquipSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "JackalEquipSelect"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	self:playSound( "menu_open" )
	local f11_local2 = self
	local BaseJackalEquips = nil
	
	BaseJackalEquips = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 5,
		controllerIndex = f11_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "JackalSelectButton", {
				controllerIndex = f11_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 250,
		rowHeight = _1080p * 140,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	BaseJackalEquips.id = "BaseJackalEquips"
	BaseJackalEquips:setUseStencil( true )
	BaseJackalEquips:SetGridDataSourceThroughElement( self, "jackalSelectContent" )
	BaseJackalEquips:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 146, _1080p * 396, _1080p * 216, _1080p * 956 )
	self:addElement( BaseJackalEquips )
	self.BaseJackalEquips = BaseJackalEquips
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f11_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 1010, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f11_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_JACKAL_LOADOUT" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_LOADOUT_EDIT" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local EquipImage = nil
	
	EquipImage = LUI.UIImage.new()
	EquipImage.id = "EquipImage"
	EquipImage:SetDotPitchEnabled( true )
	EquipImage:SetDotPitchX( 0, 0 )
	EquipImage:SetDotPitchY( 0, 0 )
	EquipImage:SetDotPitchContrast( 0, 0 )
	EquipImage:SetDotPitchMode( 0 )
	EquipImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1306, _1080p * -282, _1080p * 346, _1080p * 858 )
	EquipImage:SubscribeToModelThroughElement( BaseJackalEquips, "jackalItem.fullImage", function ()
		local f13_local0 = BaseJackalEquips:GetDataSource()
		f13_local0 = f13_local0.jackalItem.fullImage:GetValue( f11_local1 )
		if f13_local0 ~= nil then
			EquipImage:setImage( RegisterMaterial( f13_local0 ), 0 )
		end
	end )
	self:addElement( EquipImage )
	self.EquipImage = EquipImage
	
	local JackalEquipDetails = nil
	
	JackalEquipDetails = MenuBuilder.BuildRegisteredType( "JackalEquipDetails", {
		controllerIndex = f11_local1
	} )
	JackalEquipDetails.id = "JackalEquipDetails"
	JackalEquipDetails:SetDataSourceThroughElement( BaseJackalEquips, "jackalItem" )
	JackalEquipDetails:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 413, _1080p * 1920, _1080p * 216, _1080p * 416 )
	self:addElement( JackalEquipDetails )
	self.JackalEquipDetails = JackalEquipDetails
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		EquipImage:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.EquipImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1073, _1080p * -49, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.EquipImage:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1306, _1080p * -282, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			EquipImage:AnimateSequence( "MenuOpen" )
		end
		
		EquipImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.EquipImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.EquipImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.EquipImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.EquipImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.EquipImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.EquipImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.EquipImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.EquipImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EquipImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.EquipImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.EquipImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.EquipImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			EquipImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	JackalEquipDetails:SetDataSourceThroughElement( BaseJackalEquips, "jackalItem" )
	self.addButtonHelperFunction = function ( f32_arg0, f32_arg1 )
		f32_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f32_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f33_arg0, f33_arg1 )
		local f33_local0 = f33_arg1.controller or f11_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( BaseJackalEquips, "jackalItem.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	f0_local7( self, f11_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	return self
end

MenuBuilder.registerType( "JackalEquipSelect", JackalEquipSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "JackalEquipSelect", f0_local1 )
LockTable( _M )
