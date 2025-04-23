local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "ingame.SP.loadouts.perks"
f0_local1 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.PerkGrid )
	local f1_local0 = f1_arg0.PerkGrid:getFirstChild()
	while f1_local0 do
		assert( f1_local0.Description )
		f1_local0.Description:SetAlpha( f1_arg1, 100 )
		f1_local0 = f1_local0:getNextSibling()
	end
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	f2_arg0 = string.gsub( f2_arg0, "specialty_", "" )
	local f2_local0 = false
	if DataSources.inGame.SP.player.suitUpgradeState[f2_arg0] ~= nil then
		f2_local0 = DataSources.inGame.SP.player.suitUpgradeState[f2_arg0]:GetValue( f2_arg1 ) ~= Cac.spLockStates.LOCKED
	end
	return f2_local0
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	f3_arg0 = string.gsub( f3_arg0, "specialty_", "" )
	local f3_local0 = false
	if DataSources.inGame.SP.player.suitUpgradeState[f3_arg0] ~= nil then
		f3_local0 = DataSources.inGame.SP.player.suitUpgradeState[f3_arg0]:GetValue( f3_arg1 ) == Cac.spLockStates.SCANNED
	end
	return f3_local0
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	for f4_local3, f4_local4 in ipairs( f4_arg0 ) do
		local f4_local5 = Engine.TableLookupByRow( CSV.SPPerks.file, f4_local4, CSV.SPPerks.cols.ref )
		if f0_local3( f4_local5, f4_arg1 ) then
			DataSources.inGame.SP.player.suitUpgradeState[string.gsub( f4_local5, "specialty_", "" )]:SetValue( f4_arg1, Cac.spLockStates.UNLOCKED )
		end
	end
end

local f0_local5 = function ()
	WipeGlobalModelsAtPath( f0_local0 )
end

local f0_local6 = function ( f6_arg0, f6_arg1, f6_arg2 )
	assert( f6_arg0.PerkGrid )
	WipeGlobalModelsAtPath( f0_local0 )
	local f6_local0 = {}
	local f6_local1 = 0
	for f6_local2 = 0, Engine.TableGetRowCount( CSV.SPPerks.file ), 1 do
		if Engine.TableLookupByRow( CSV.SPPerks.file, f6_local2, CSV.SPPerks.cols.type ) == "perk" then
			if f0_local2( Engine.TableLookupByRow( CSV.SPPerks.file, f6_local2, CSV.SPPerks.cols.ref ), f6_arg1 ) then
				table.insert( f6_local0, 1, f6_local2 )
			else
				table.insert( f6_local0, f6_local2 )
			end
		end
	end
	local f6_local2 = LUI.DataSourceFromList.new( #f6_local0 )
	f6_local2.MakeDataSourceAtIndex = function ( f7_arg0, f7_arg1 )
		local f7_local0 = f6_local0[f7_arg1 + 1]
		local f7_local1 = Engine.Localize( Engine.TableLookupByRow( CSV.SPPerks.file, f7_local0, CSV.SPPerks.cols.name ), 0 )
		local f7_local2 = Engine.TableLookupByRow( CSV.SPPerks.file, f7_local0, CSV.SPPerks.cols.image )
		local f7_local3 = Engine.TableLookupByRow( CSV.SPPerks.file, f7_local0, CSV.SPPerks.cols.ref )
		local f7_local4 = f0_local2( f7_local3, f6_arg1 )
		local f7_local5 = f0_local3( f7_local3, f6_arg1 )
		local f7_local6 = ""
		if f7_local4 then
			f7_local6 = Engine.Localize( Engine.TableLookupByRow( CSV.SPPerks.file, f7_local0, CSV.SPPerks.cols.desc ) )
		else
			f7_local6 = Engine.Localize( Engine.TableLookupByRow( CSV.SPPerks.file, f7_local0, CSV.SPPerks.cols.lockedDesc ) )
		end
		local f7_local7 = f0_local0 .. "." .. f7_arg1
		return {
			name = LUI.DataSourceInGlobalModel.new( f7_local7 .. ".name", f7_local1 ),
			icon = LUI.DataSourceInGlobalModel.new( f7_local7 .. ".icon", f7_local2 ),
			desc = LUI.DataSourceInGlobalModel.new( f7_local7 .. ".desc", f7_local6 ),
			isUnlocked = LUI.DataSourceInGlobalModel.new( f7_local7 .. ".isUnlocked", f7_local4 ),
			isScanned = LUI.DataSourceInGlobalModel.new( f7_local7 .. ".isScanned", f7_local5 )
		}
	end
	
	f6_arg0.PerkGrid:SetGridDataSource( f6_local2, f6_arg1 )
	f6_arg0.ClearScannedPerksFunc = function ()
		f0_local4( f6_local0, f6_arg1 )
	end
	
end

function SPLoadoutPerkGrid( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 514 * _1080p, 0, 743 * _1080p )
	self.id = "SPLoadoutPerkGrid"
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	local ListBlur = nil
	
	ListBlur = LUI.UIBlur.new()
	ListBlur.id = "ListBlur"
	ListBlur:SetBlurStrength( 2.75, 0 )
	ListBlur:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -10, 0, _1080p * -10, 0 )
	self:addElement( ListBlur )
	self.ListBlur = ListBlur
	
	local PerkGrid = nil
	
	PerkGrid = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 11,
		controllerIndex = f9_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "SPPerkButton", {
				controllerIndex = f9_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 5,
		spacingY = _1080p * 5,
		columnWidth = _1080p * 514,
		rowHeight = _1080p * 60,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	PerkGrid.id = "PerkGrid"
	PerkGrid:setUseStencil( true )
	PerkGrid:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 33, _1080p * 743 )
	self:addElement( PerkGrid )
	self.PerkGrid = PerkGrid
	
	local PerkTitle = nil
	
	PerkTitle = LUI.UIStyledText.new()
	PerkTitle.id = "PerkTitle"
	PerkTitle:SetRGBFromTable( SWATCHES.genericButton.textDefault, 0 )
	PerkTitle:setText( Engine.Localize( "MENU_ACTIVE_SUIT_UPGRADES" ), 0 )
	PerkTitle:SetFontSize( 30 * _1080p )
	PerkTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	PerkTitle:SetAlignment( LUI.Alignment.Left )
	PerkTitle:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 496, _1080p * -4.39, _1080p * 25.61 )
	self:addElement( PerkTitle )
	self.PerkTitle = PerkTitle
	
	f0_local6( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "SPLoadoutPerkGrid", SPLoadoutPerkGrid )
LUI.FlowManager.RegisterStackPopBehaviour( "SPLoadoutPerkGrid", f0_local5 )
LockTable( _M )
