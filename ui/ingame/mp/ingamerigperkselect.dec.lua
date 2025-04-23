local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.MP.rigSelect.rigPerks"
f0_local1 = function ()
	WipeControllerModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	DataSources.inGame.MP.rigSelectTitle:SetValue( f2_arg1, Engine.Localize( "LUA_MENU_MP_INGAME_RIG_PERK_SELECT" ) )
	f2_arg0.parentRigSelectMenu = f2_arg2.parentRigSelectMenu
	local f2_local0 = f2_arg2.rigRef
	local f2_local1 = {}
	local f2_local2 = Engine.TableGetRowCount( CSV.menuRigPerks.file )
	for self = 0, f2_local2 - 1, 1 do
		if f2_local0 == Engine.TableLookupByRow( CSV.menuRigPerks.file, self, CSV.menuRigPerks.cols.rig ) then
			local f2_local6 = CSV.ReadRow( CSV.perks, Engine.TableLookupGetRowNum( CSV.perks.file, CSV.perks.cols.ref, Engine.TableLookupByRow( CSV.menuRigPerks.file, self, CSV.menuRigPerks.cols.ref ) ) )
			f2_local6.row = self
			table.insert( f2_local1, f2_local6 )
		end
	end
	DataSources.inGame.MP.rigSelect.rigPerks = LUI.DataSourceFromList.new( #f2_local1 )
	DataSources.inGame.MP.rigSelect.rigPerks.GetDefaultFocusIndex = function ()
		local f3_local0 = Game.GetOmnvar( "ui_selected_trait" )
		for f3_local4, f3_local5 in pairs( f2_local1 ) do
			if f3_local0 == tonumber( f3_local5.index ) then
				return f3_local4 - 1
			end
		end
		return 0
	end
	
	DataSources.inGame.MP.rigSelect.rigPerks.MakeDataSourceAtIndex = function ( f4_arg0, f4_arg1, f4_arg2 )
		local f4_local0 = f2_local1[f4_arg1 + 1]
		local f4_local1 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".name" .. f4_arg1, Engine.Localize( f4_local0.name ) )
		local f4_local2 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".ref" .. f4_arg1, f4_local0.ref )
		return {
			name = f4_local1,
			desc = LUI.DataSourceInControllerModel.new( f0_local0 .. ".desc" .. f4_arg1, f4_local0.index ),
			ref = f4_local2,
			index = LUI.DataSourceInControllerModel.new( f0_local0 .. ".index" .. f4_arg1, f4_local0.index ),
			isUnlocked = LUI.DataSourceInControllerModel.new( f0_local0 .. ".isUnlocked" .. f4_arg1, Engine.IsUnlocked( f4_arg2, "trait", f4_local0.ref ) ),
			icon = f4_local2:Filter( "fullImage", Cac.GetPerkImage )
		}
	end
	
	f2_arg0:SetDataSource( DataSources.inGame.MP.rigSelect.rigPerks, f2_arg1 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f2_arg0:addElement( self )
end

local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2 )
	f5_arg0.bindButton:addEventHandler( "button_secondary", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f5_arg1
		ACTIONS.LeaveMenu( f5_arg0 )
		f5_arg0:dispatchEventToRoot( {
			name = "rig_perk_select_closed",
			immediate = true
		} )
	end )
end

function InGameRigPerkSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "InGameRigPerkSelect"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	f0_local2( self, f7_local1, controller )
	self:playSound( "menu_open" )
	local f7_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local DataSourcedGridLayout0 = nil
	
	DataSourcedGridLayout0 = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 3,
		controllerIndex = f7_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "InGameRigPerkSelectButton", {
				controllerIndex = f7_local1
			} )
		end,
		wrapX = true,
		wrapY = true,
		spacingX = _1080p * 10,
		spacingY = _1080p * 10,
		columnWidth = _1080p * 350,
		rowHeight = _1080p * 100,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		adjustSizeToContent = false,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	DataSourcedGridLayout0.id = "DataSourcedGridLayout0"
	DataSourcedGridLayout0:setUseStencil( true )
	DataSourcedGridLayout0:SetGridDataSourceThroughElement( self, nil )
	DataSourcedGridLayout0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 879, _1080p * 1229, _1080p * 373, _1080p * 693 )
	self:addElement( DataSourcedGridLayout0 )
	self.DataSourcedGridLayout0 = DataSourcedGridLayout0
	
	local ButtonHelperBar0 = nil
	
	ButtonHelperBar0 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f7_local1
	} )
	ButtonHelperBar0.id = "ButtonHelperBar0"
	ButtonHelperBar0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar0 )
	self.ButtonHelperBar0 = ButtonHelperBar0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DataSourcedGridLayout0:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DataSourcedGridLayout0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 879, _1080p * 1229, _1080p * 170, _1080p * 490, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			DataSourcedGridLayout0:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f13_arg0, f13_arg1 )
		f13_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f13_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f7_local1
		ACTIONS.LeaveMenu( self )
	end )
	f0_local3( self, f7_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "InGameRigPerkSelect", InGameRigPerkSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "InGameRigPerkSelect", f0_local1 )
LockTable( _M )
