local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.MP.rigSelect.supers"
f0_local1 = function ()
	WipeControllerModelsAtPath( f0_local0 )
end

f0_local2 = function ( f2_arg0, f2_arg1 )
	DataSources.inGame.MP.rigSelectTitle:SetValue( f2_arg1, Engine.Localize( "LUA_MENU_MP_INGAME_SUPER_SELECT_TITLE" ) )
	ACTIONS.AnimateSequence( f2_arg0, "DefaultSequence" )
end

local f0_local3 = function ( f3_arg0, f3_arg1, f3_arg2 )
	DataSources.inGame.MP.rigSelectTitle:SetValue( f3_arg1, Engine.Localize( "LUA_MENU_MP_INGAME_SUPER_SELECT_TITLE" ) )
	f3_arg0.becomeActiveRigSelectMenu = f0_local2
	f3_arg0.parentRigSelectMenu = f3_arg2.parentRigSelectMenu
	local f3_local0 = f3_arg2.rigRef
	local f3_local1 = {}
	local f3_local2 = Engine.TableGetRowCount( CSV.supers.file )
	for self = 0, f3_local2 - 1, 1 do
		if f3_local0 == Engine.TableLookupByRow( CSV.supers.file, self, CSV.supers.cols.rigRef ) then
			local f3_local6 = CSV.ReadRow( CSV.supers, self )
			f3_local6.row = self
			f3_local1[#f3_local1 + 1] = f3_local6
		end
	end
	DataSources.inGame.MP.rigSelect.supers = LUI.DataSourceFromList.new( #f3_local1 )
	DataSources.inGame.MP.rigSelect.supers.GetDefaultFocusIndex = function ()
		local f4_local0 = Game.GetOmnvar( "ui_selected_super" )
		for f4_local4, f4_local5 in pairs( f3_local1 ) do
			if f4_local0 == f4_local5.row then
				return f4_local4 - 1
			end
		end
		return 0
	end
	
	DataSources.inGame.MP.rigSelect.supers.MakeDataSourceAtIndex = function ( f5_arg0, f5_arg1, f5_arg2 )
		local f5_local0 = f3_local1[f5_arg1 + 1]
		local f5_local1 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".name" .. f5_arg1, Engine.Localize( f5_local0.uiName ) )
		local f5_local2 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".desc" .. f5_arg1, Engine.Localize( f5_local0.uiDesc ) )
		local f5_local3 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".ref" .. f5_arg1, f5_local0.ref )
		return {
			name = f5_local1,
			desc = f5_local2,
			ref = f5_local3,
			index = LUI.DataSourceInControllerModel.new( f0_local0 .. ".index" .. f5_arg1, f5_local0.row ),
			parentRigRef = LUI.DataSourceInControllerModel.new( f0_local0 .. ".parentRigRef" .. f5_arg1, f3_local0 ),
			isUnlocked = LUI.DataSourceInControllerModel.new( f0_local0 .. ".isUnlocked" .. f5_arg1, Engine.IsUnlocked( f5_arg2, "super", f5_local0.ref ) ),
			fullImage = f5_local3:Filter( "fullImage", Cac.GetSuperImage )
		}
	end
	
	f3_arg0:SetDataSource( DataSources.inGame.MP.rigSelect.supers, f3_arg1 )
	f3_arg0:addEventHandler( "rig_perk_select_closed", function ( f6_arg0, f6_arg1 )
		f0_local2( f6_arg0, f3_arg1 )
	end )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f3_arg0:addElement( self )
end

local f0_local4 = function ( f7_arg0, f7_arg1, f7_arg2 )
	f7_arg0.bindButton:addEventHandler( "button_secondary", function ( f8_arg0, f8_arg1 )
		local f8_local0 = f8_arg1.controller or f7_arg1
		ACTIONS.LeaveMenu( f7_arg0 )
		f7_arg0:dispatchEventToRoot( {
			name = "super_select_closed",
			immediate = true
		} )
	end )
end

function InGameSuperSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "InGameSuperSelect"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	f0_local3( self, f9_local1, controller )
	self:playSound( "menu_open" )
	local f9_local2 = self
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
		controllerIndex = f9_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "InGameSuperSelectButton", {
				controllerIndex = f9_local1
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
	DataSourcedGridLayout0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 503, _1080p * 853, _1080p * 373, _1080p * 693 )
	self:addElement( DataSourcedGridLayout0 )
	self.DataSourcedGridLayout0 = DataSourcedGridLayout0
	
	local ButtonHelperBar0 = nil
	
	ButtonHelperBar0 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f9_local1
	} )
	ButtonHelperBar0.id = "ButtonHelperBar0"
	ButtonHelperBar0:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar0 )
	self.ButtonHelperBar0 = ButtonHelperBar0
	
	self._animationSets.DefaultAnimationSet = function ()
		Background:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Background:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Background:AnimateSequence( "DefaultSequence" )
		end
		
		Background:RegisterAnimationSequence( "BackgroundMenu", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.BackgroundMenu = function ()
			Background:AnimateSequence( "BackgroundMenu" )
		end
		
		DataSourcedGridLayout0:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DataSourcedGridLayout0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 503, _1080p * 853, _1080p * 170, _1080p * 490, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			DataSourcedGridLayout0:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f18_arg0, f18_arg1 )
		f18_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
		f18_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "lose_focus", function ( f19_arg0, f19_arg1 )
		local f19_local0 = f19_arg1.controller or f9_local1
		ACTIONS.AnimateSequence( self, "BackgroundMenu" )
	end )
	f0_local4( self, f9_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "InGameSuperSelect", InGameSuperSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "InGameSuperSelect", f0_local1 )
LockTable( _M )
