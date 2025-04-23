local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.SP.loadouts.attachmentSelect"
f0_local1 = function ( f1_arg0 )
	return function ( f2_arg0, f2_arg1 )
		local f2_local0 = f1_arg0:GetValue( f2_arg1 )
		if not f2_local0 then
			f2_local0 = f2_arg0 == Cac.spLockStates.LOCKED
		end
		return f2_local0
	end
	
end

f0_local2 = function ( f3_arg0 )
	return f3_arg0 ~= Cac.spLockStates.LOCKED
end

local f0_local3 = function ( f4_arg0 )
	return f4_arg0 == Cac.spLockStates.SCANNED
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	return function ( f6_arg0 )
		return Cac.GetAttachmentSlotDataSourceByEquippedRef( f6_arg0, f5_arg1, f5_arg3 ) ~= nil
	end
	
end

local f0_local5 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	return function ( f8_arg0 )
		local f8_local0 = Cac.GetAttachmentSlotDataSourceByEquippedRef( f8_arg0, f7_arg1, f7_arg3 )
		if f8_local0 and f8_local0 == f7_arg0.attachmentDataSources[f7_arg2 + 1] then
			return 1
		elseif f8_local0 then
			return 0
		else
			return 0
		end
	end
	
end

local f0_local6 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = Cac.GetCategorizedAttachmentList( f9_arg1, f9_arg3 )
	f9_arg0.attachments = {
		categories = {}
	}
	local f9_local1 = DataSources.alwaysLoaded.playerData.SP.spData.scrapCount:GetValue( f9_arg3 )
	local f9_local2 = {
		f9_arg1.attachments.attachmentSlotOne,
		f9_arg1.attachments.attachmentSlotTwo,
		f9_arg1.attachments.attachmentSlotThree
	}
	for f9_local15, f9_local16 in pairs( f9_local0 ) do
		f9_arg0.attachments.categories[f9_local15] = {}
		f9_arg0.attachments.categories[f9_local15].attachmentList = LUI.DataSourceFromList.new( f9_local16.attachmentCount )
		f9_arg0.attachments.categories[f9_local15].attachmentList:SetCachingEnabled( true )
		f9_arg0.attachments.categories[f9_local15].categoryName = f9_local15
		f9_arg0.attachments.categories[f9_local15].attachmentList.MakeDataSourceAtIndex = function ( f10_arg0, f10_arg1, f10_arg2 )
			return f9_arg0.attachments.categories[f9_local15].attachmentList["weapon" .. f10_arg1]
		end
		
		local f9_local13 = 0
		for f9_local14 = 1, f9_local16.attachmentCount, 1 do
			local f9_local6 = f9_local16.attachments[f9_local14]
			local f9_local7 = f9_local6.ref
			local f9_local8 = f0_local0 .. ".attachments." .. f9_local15 .. "." .. f9_local7
			local f9_local9 = DataSources.inGame.SP.player.attachmentsState[f9_local6.baseRef]
			local f9_local10 = LUI.AggregateDataSource.new( f9_arg0.menuDataModel, f9_local2, f9_local8 .. ".isEquipped", f0_local4( f9_arg0, f9_arg1, f9_arg2, f9_local6.baseRef ) )
			local f9_local11 = f9_arg1.slot:GetValue( f9_arg3 )
			local f9_local12 = Engine.Localize( "MENU_SP_REQUIRES_SCRAP", (tonumber( Engine.TableLookup( CSV.scrapUnlocks.file, CSV.scrapUnlocks.cols.name, f9_local6.baseRef, CSV.scrapUnlocks.cols.scrapCost ) ) or 0) - f9_local1 )
			if f9_local10:GetValue( f9_arg3 ) then
				f9_arg0.attachments.categories[f9_local15].attachmentList.GetDefaultFocusIndex = function ()
					for f11_local0 = 0, f9_local13 - 1, 1 do
						local f11_local3 = f9_arg0.attachments.categories[f9_local15].attachmentList["weapon" .. f11_local0]
						if f11_local3.equipped:GetValue( f9_arg3 ) then
							local f11_local4 = nil
							if f9_arg2 == 0 then
								f11_local4 = f9_arg1.attachments.attachmentSlotOne
							elseif f9_arg2 == 1 then
								f11_local4 = f9_arg1.attachments.attachmentSlotTwo
							else
								f11_local4 = f9_arg1.attachments.attachmentSlotThree
							end
							if f11_local4.ref:GetValue( f9_arg3 ) == f11_local3.baseRef then
								return f11_local0
							end
						end
					end
					return 0
				end
				
			end
			f9_arg0.attachments.categories[f9_local15].attachmentList["weapon" .. f9_local13] = {
				slot = f9_arg2,
				weaponSlot = f9_local11,
				ref = f9_local7,
				baseRef = f9_local6.baseRef,
				unlockText = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".unlockText", f9_local12 ),
				name = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".name", f9_local6.name ),
				desc = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".desc", f9_local6.desc ),
				icon = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".icon", f9_local6.image ),
				imageFull = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".largeIcon", f9_local6.fullImage ),
				equipped = f9_local10,
				equipIconAlpha = LUI.AggregateDataSource.new( f9_arg0.menuDataModel, f9_local2, f9_local8 .. ".equipAlpha", f0_local5( f9_arg0, f9_arg1, f9_arg2, f9_local6.baseRef ) ),
				disabled = f9_local9:FilterTo( f9_arg0.menuDataModel, f9_local8 .. ".disabled", f0_local1( f9_local10 ) ),
				isUnlocked = f9_local9:FilterTo( f9_arg0.menuDataModel, f9_local8 .. ".isUnlocked", f0_local2 ),
				isScanned = f9_local9:FilterTo( f9_arg0.menuDataModel, f9_local8 .. ".isScanned", f0_local3 ),
				stats = {
					accuracy = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".stats.accuracy", Cac.GetAttachmentStatAccuracy( f9_local7 ) ),
					damage = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".stats.damage", Cac.GetAttachmentStatDamage( f9_local7 ) ),
					range = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".stats.range", Cac.GetAttachmentStatRange( f9_local7 ) ),
					fireRate = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".stats.fireRate", Cac.GetAttachmentStatFireRate( f9_local7 ) ),
					mobility = LUI.DataSourceInGlobalModel.new( f9_local8 .. ".stats.mobility", Cac.GetAttachmentStatMobility( f9_local7 ) )
				}
			}
			f9_local13 = f9_local13 + 1
		end
	end
	for f9_local15, f9_local16 in pairs( Cac.AttachmentCategories ) do
		if not f9_arg0.attachments.categories[f9_local16] then
			f9_arg0.attachments.categories[f9_local16] = {}
			f9_arg0.attachments.categories[f9_local16].attachmentList = LUI.DataSourceFromList.new( 0 )
		end
	end
end

function PopFunc()
	Engine.StopMenuVideo()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local7 = function ( f13_arg0, f13_arg1, f13_arg2 )
	if Engine.IsDevelopmentBuild() then
		f13_arg2.attachmentSlot = f13_arg2.attachmentSlot or 0
		local f13_local0 = f13_arg2.currentWeaponDataSource
		if not f13_local0 then
			f13_local0 = GetProgressionLoadoutDataSources()
			f13_local0 = f13_local0[0].weaponSlotOne
		end
		f13_arg2.currentWeaponDataSource = f13_local0
		f13_local0 = f13_arg2.loadoutDataSource
		if not f13_local0 then
			f13_local0 = GetProgressionLoadoutDataSources()
			f13_local0 = f13_local0[0]
		end
		f13_arg2.loadoutDataSource = f13_local0
	end
	assert( f13_arg2.currentWeaponDataSource )
	assert( f13_arg2.loadoutDataSource )
	assert( f13_arg2.attachmentSlot )
	local f13_local0 = f13_arg2.currentWeaponDataSource
	f13_arg0.playerDataWeaponDataSource = f13_arg2.currentWeaponDataSource
	f13_arg0.menuDataModel = LUI.DataSourceInGlobalModel.new( f0_local0 )
	f13_arg0.loadoutDataSource = f13_arg2.loadoutDataSource
	f13_arg0.attachmentSlot = f13_arg2.attachmentSlot
	f13_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_ARMORY" ) .. " / " .. Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) .. " / " .. f13_arg0.loadoutDataSource.name:GetValue( f13_arg1 ) ), 0 )
	f0_local6( f13_arg0, f13_local0, f13_arg0.attachmentSlot, f13_arg1 )
	f13_arg0.attachmentDataSources = {}
	local f13_local1 = {}
	table.insert( f13_arg0.attachmentDataSources, f13_local0.attachments.attachmentSlotOne )
	table.insert( f13_arg0.attachmentDataSources, f13_local0.attachments.attachmentSlotTwo )
	table.insert( f13_arg0.attachmentDataSources, f13_local0.attachments.attachmentSlotThree )
	f13_arg0.selectedStatsInfo = {
		accuracy = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.accuracy", 0 ),
		damage = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.damage", 0 ),
		range = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.range", 0 ),
		fireRate = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.fireRate", 0 ),
		mobility = LUI.DataSourceInGlobalModel.new( f0_local0 .. "selectedAttachment.mobility", 0 )
	}
	local f13_local2 = f13_local0.attachments
	local f13_local3 = {
		content = f13_arg0.attachments.categories[Cac.GetCategoryBySlotIndex( f13_arg0.attachmentSlot )].attachmentList,
		currentWeapon = {
			weaponRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.baseWeaponRef", f13_local0.weapon:GetValue( f13_arg1 ) ),
			attachmentOneRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment0", f13_local0.attachments.attachmentSlotOne:GetValue( f13_arg1 ) ),
			attachmentTwoRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment1", f13_local0.attachments.attachmentSlotTwo:GetValue( f13_arg1 ) ),
			attachmentThreeRef = LUI.DataSourceInGlobalModel.new( f0_local0 .. ".statsData.attachment2", f13_local0.attachments.attachmentSlotThree:GetValue( f13_arg1 ) )
		}
	}
	f13_arg0:SetDataSource( f13_local3, f13_arg1 )
	f13_arg0:SubscribeToModelThroughElement( f13_arg0.AttachmentList, "name", function ()
		local f14_local0 = f13_arg0.AttachmentList:GetDataSource()
		local f14_local1 = f13_arg0.attachmentSlot
		local f14_local2 = f14_local0.ref
		local f14_local3 = f13_local3.currentWeapon.attachmentOneRef
		local f14_local4 = f14_local3
		f14_local3 = f14_local3.SetValue
		local f14_local5 = f13_arg1
		if f14_local1 == 0 then
			local f14_local6 = f14_local2
		end
		f14_local3( f14_local4, f14_local5, f14_local6 or f13_local0.attachments.attachmentSlotOne:GetValue( f13_arg1 ) )
		f14_local3 = f13_local3.currentWeapon.attachmentTwoRef
		f14_local4 = f14_local3
		f14_local3 = f14_local3.SetValue
		f14_local5 = f13_arg1
		if f14_local1 == 1 then
			local f14_local7 = f14_local2
		end
		f14_local3( f14_local4, f14_local5, f14_local7 or f13_local0.attachments.attachmentSlotTwo:GetValue( f13_arg1 ) )
		f14_local3 = f13_local3.currentWeapon.attachmentThreeRef
		f14_local4 = f14_local3
		f14_local3 = f14_local3.SetValue
		f14_local5 = f13_arg1
		if f14_local1 == 2 then
			local f14_local8 = f14_local2
		end
		f14_local3( f14_local4, f14_local5, f14_local8 or f13_local0.attachments.attachmentSlotThree:GetValue( f13_arg1 ) )
	end )
	f13_arg0:registerOmnvarHandler( "ui_open_loadout_menu", function ( f15_arg0, f15_arg1 )
		if not f15_arg1.value then
			LUI.FlowManager.RequestCloseAllMenus()
		end
	end )
	if Engine.GetDvarString( "ui_mapname" ) == "shipcrib_moon" then
		local f13_local4 = MenuBuilder.BuildRegisteredType( "LoadoutTutorialText", {
			controllerIndex = f13_arg1
		} )
		f13_local4.id = "LoadoutTutorialText"
		f13_local4:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		f13_arg0:addElement( f13_local4 )
		f13_arg0.loadoutTutorialText = f13_local4
	end
end

function SPAttachmentSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "SPAttachmentSelect"
	self._animationSets = {}
	self._sequences = {}
	local f16_local1 = controller and controller.controllerIndex
	if not f16_local1 and not Engine.InFrontend() then
		f16_local1 = self:getRootController()
	end
	assert( f16_local1 )
	self:playSound( "menu_open" )
	local f16_local2 = self
	local AttachmentList = nil
	
	AttachmentList = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 4,
		maxVisibleRows = 4,
		controllerIndex = f16_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "Attachment", {
				controllerIndex = f16_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 6,
		spacingY = _1080p * 6,
		columnWidth = _1080p * 143,
		rowHeight = _1080p * 150,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	AttachmentList.id = "AttachmentList"
	AttachmentList:setUseStencil( true )
	AttachmentList:SetGridDataSourceThroughElement( self, "content" )
	AttachmentList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 720, _1080p * 216, _1080p * 834 )
	self:addElement( AttachmentList )
	self.AttachmentList = AttachmentList
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f16_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local AttachmentImageFull = nil
	
	AttachmentImageFull = LUI.UIImage.new()
	AttachmentImageFull.id = "AttachmentImageFull"
	AttachmentImageFull:SetDotPitchEnabled( true )
	AttachmentImageFull:SetDotPitchX( 0, 0 )
	AttachmentImageFull:SetDotPitchY( 0, 0 )
	AttachmentImageFull:SetDotPitchContrast( 0, 0 )
	AttachmentImageFull:SetDotPitchMode( 0 )
	AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -834, _1080p * -322, _1080p * 346, _1080p * 858 )
	AttachmentImageFull:SubscribeToModelThroughElement( AttachmentList, "imageFull", function ()
		local f18_local0 = AttachmentList:GetDataSource()
		f18_local0 = f18_local0.imageFull:GetValue( f16_local1 )
		if f18_local0 ~= nil then
			AttachmentImageFull:setImage( RegisterMaterial( f18_local0 ), 0 )
		end
	end )
	self:addElement( AttachmentImageFull )
	self.AttachmentImageFull = AttachmentImageFull
	
	local AttachmentDetails = nil
	
	AttachmentDetails = MenuBuilder.BuildRegisteredType( "AttachmentDetails", {
		controllerIndex = f16_local1
	} )
	AttachmentDetails.id = "AttachmentDetails"
	AttachmentDetails:SetDataSourceThroughElement( AttachmentList, nil )
	AttachmentDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1183, 0, _1080p * 216, _1080p * 456 )
	self:addElement( AttachmentDetails )
	self.AttachmentDetails = AttachmentDetails
	
	local StatsPanel = nil
	
	StatsPanel = MenuBuilder.BuildRegisteredType( "WeaponStatsPanel", {
		controllerIndex = f16_local1
	} )
	StatsPanel.id = "StatsPanel"
	StatsPanel:SetDataSourceThroughElement( self, "currentWeapon" )
	StatsPanel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -888, _1080p * -268, _1080p * -232, _1080p * -132 )
	self:addElement( StatsPanel )
	self.StatsPanel = StatsPanel
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f16_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_TITLE_ATTACHMENTS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -10, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 80, 0 )
	MenuTitle.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AttachmentImageFull:RegisterAnimationSequence( "MenuOpen", {
			{
				function ()
					return self.AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -864.5, _1080p * -352.5, _1080p * 346, _1080p * 858, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -825.5, _1080p * -313.5, _1080p * 346, _1080p * 858, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.MenuOpen = function ()
			AttachmentImageFull:AnimateSequence( "MenuOpen" )
		end
		
		AttachmentImageFull:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 0, 30 )
				end,
				function ()
					return self.AttachmentImageFull:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			AttachmentImageFull:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	AttachmentDetails:SetDataSourceThroughElement( AttachmentList, nil )
	StatsPanel:SetDataSourceThroughElement( self, "currentWeapon" )
	self.addButtonHelperFunction = function ( f37_arg0, f37_arg1 )
		f37_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f37_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -20,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f38_arg0, f38_arg1 )
		local f38_local0 = f38_arg1.controller or f16_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:SubscribeToModelThroughElement( AttachmentList, "desc", function ()
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CACItemHeader",
			sequenceName = "UpdateDescription",
			elementPath = "AttachmentDetails.CACItemHeader"
		} )
	end )
	self:SubscribeToModelThroughElement( AttachmentList, "imageFull", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	f0_local7( self, f16_local1, controller )
	ACTIONS.AnimateSequence( self, "MenuOpen" )
	return self
end

MenuBuilder.registerType( "SPAttachmentSelect", SPAttachmentSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "SPAttachmentSelect", PopFunc )
LockTable( _M )
