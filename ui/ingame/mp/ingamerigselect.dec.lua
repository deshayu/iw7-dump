local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "inGame.MP.rigSelect.rigs"
f0_local1 = function ()
	WipeControllerModelsAtPath( f0_local0 )
end

function BecomeActiveRigSelectMenu( f2_arg0, f2_arg1 )
	DataSources.inGame.MP.rigSelectTitle:SetValue( f2_arg1, Engine.Localize( "LUA_MENU_MP_INGAME_RIG_SELECT_TITLE" ) )
	ACTIONS.AnimateSequence( f2_arg0, "DefaultSequence" )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	DataSources.inGame.MP.rigSelectTitle:SetValue( f3_arg1, Engine.Localize( "LUA_MENU_MP_INGAME_RIG_SELECT_TITLE" ) )
	f3_arg0.becomeActiveRigSelectMenu = BecomeActiveRigSelectMenu
	DataSources.inGame.MP.rigSelect = {}
	DataSources.inGame.MP.rigSelect.rigs = LUI.DataSourceFromList.new( Engine.TableGetRowCount( CSV.battleRigs.file ) )
	DataSources.inGame.MP.rigSelect.rigs.GetDefaultFocusIndex = function ()
		local f4_local0 = Game.GetOmnvar( "ui_selected_archetype" )
		local f4_local1 = 0
		for f4_local2 = 0, DataSources.inGame.MP.rigSelect.rigs:GetCountValue( f3_arg1 ) - 1, 1 do
			local f4_local5 = DataSources.inGame.MP.rigSelect.rigs:GetDataSourceAtIndex( f4_local2, f3_arg1 )
			if tonumber( f4_local5.index:GetValue( f3_arg1 ) ) == f4_local0 then
				f4_local1 = f4_local2
				break
			end
		end
		return f4_local1
	end
	
	DataSources.inGame.MP.rigSelect.rigs.MakeDataSourceAtIndex = function ( f5_arg0, f5_arg1, f5_arg2 )
		local f5_local0 = CSV.ReadRow( CSV.battleRigs, Engine.TableLookupGetRowNum( CSV.battleRigs.file, CSV.battleRigs.cols.index, f5_arg1 ) )
		local f5_local1 = LUI.DataSourceInControllerModel.new( f0_local0 .. ".ref" .. f5_arg1, f5_local0.ref )
		return {
			ref = f5_local1,
			name = LUI.DataSourceInControllerModel.new( f0_local0 .. ".name" .. f5_arg1, Engine.Localize( f5_local0.name ) ),
			desc = LUI.DataSourceInControllerModel.new( f0_local0 .. ".desc" .. f5_arg1, Engine.Localize( f5_local0.desc ) ),
			index = LUI.DataSourceInControllerModel.new( f0_local0 .. ".index" .. f5_arg1, f5_local0.index ),
			isUnlocked = LUI.DataSourceInControllerModel.new( f0_local0 .. ".isUnlocked" .. f5_arg1, Engine.IsUnlocked( f5_arg2, "rig", f5_local0.ref ) ),
			rigHeadshot = f5_local1:Filter( "headshot", Cac.GetRigHeadshot )
		}
	end
	
	f3_arg0:SetDataSource( DataSources.inGame.MP.rigSelect.rigs, f3_arg1 )
	f3_arg0:addEventHandler( "super_select_closed", function ( f6_arg0, f6_arg1 )
		BecomeActiveRigSelectMenu( f6_arg0, f3_arg1 )
	end )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f3_arg0:addElement( self )
end

function InGameRigSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "InGameRigSelect"
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
	Background:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 2, 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local DataSourcedGridLayout = nil
	
	DataSourcedGridLayout = LUI.UIDataSourceGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = SubtractForSplitscreen( 6, 3 ),
		controllerIndex = f7_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "InGameRigSelectButton", {
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
	DataSourcedGridLayout.id = "DataSourcedGridLayout"
	DataSourcedGridLayout:setUseStencil( true )
	DataSourcedGridLayout:SetGridDataSourceThroughElement( self, nil )
	DataSourcedGridLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 480, _1080p * 216, _1080p * 866 )
	self:addElement( DataSourcedGridLayout )
	self.DataSourcedGridLayout = DataSourcedGridLayout
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f7_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuBreadcrumbs:setText( "", 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 54, _1080p * 134 )
	MenuTitle:SubscribeToModel( DataSources.inGame.MP.rigSelectTitle:GetModel( f7_local1 ), function ()
		local f9_local0 = DataSources.inGame.MP.rigSelectTitle:GetValue( f7_local1 )
		if f9_local0 ~= nil then
			MenuTitle.MenuTitle:setText( f9_local0, 0 )
		end
	end )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f7_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local ArrowUp = nil
	
	ArrowUp = MenuBuilder.BuildRegisteredType( "ArrowUp", {
		controllerIndex = f7_local1
	} )
	ArrowUp.id = "ArrowUp"
	ArrowUp:SetAlpha( 0, 0 )
	ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 378, _1080p * 398, _1080p * 507, _1080p * 547 )
	self:addElement( ArrowUp )
	self.ArrowUp = ArrowUp
	
	local ArrowDown = nil
	
	ArrowDown = MenuBuilder.BuildRegisteredType( "ArrowDown", {
		controllerIndex = f7_local1
	} )
	ArrowDown.id = "ArrowDown"
	ArrowDown:SetAlpha( 0, 0 )
	ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 213, _1080p * 233, _1080p * 506, _1080p * 546 )
	self:addElement( ArrowDown )
	self.ArrowDown = ArrowDown
	
	local ListCount = nil
	
	ListCount = LUI.UIText.new()
	ListCount.id = "ListCount"
	ListCount:SetAlpha( 0, 0 )
	ListCount:setText( "1/15", 0 )
	ListCount:SetFontSize( 24 * _1080p )
	ListCount:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ListCount:SetAlignment( LUI.Alignment.Center )
	ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 232.5, _1080p * 377.5, _1080p * 514, _1080p * 538 )
	self:addElement( ListCount )
	self.ListCount = ListCount
	
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
		
		DataSourcedGridLayout:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.DataSourcedGridLayout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 480, _1080p * 170, _1080p * 820, 0 )
				end
			}
		} )
		ArrowUp:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ArrowUp:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ArrowUp:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 378, _1080p * 398, _1080p * 507, _1080p * 547, 0 )
				end
			}
		} )
		ArrowDown:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ArrowDown:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ArrowDown:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 213, _1080p * 233, _1080p * 506, _1080p * 546, 0 )
				end
			}
		} )
		ListCount:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.ListCount:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.ListCount:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 232, _1080p * 377, _1080p * 514, _1080p * 538, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			DataSourcedGridLayout:AnimateSequence( "Splitscreen" )
			ArrowUp:AnimateSequence( "Splitscreen" )
			ArrowDown:AnimateSequence( "Splitscreen" )
			ListCount:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	DataSourcedGridLayout:addEventHandler( "gain_focus", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "DefaultSequence" )
	end )
	DataSourcedGridLayout:AddArrow( ArrowUp )
	DataSourcedGridLayout:AddArrow( ArrowDown )
	DataSourcedGridLayout:AddItemNumbers( ListCount )
	self.addButtonHelperFunction = function ( f24_arg0, f24_arg1 )
		f24_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f24_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f25_arg0, f25_arg1 )
		local f25_local0 = f25_arg1.controller or f7_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:addEventHandler( "lose_focus", function ( f26_arg0, f26_arg1 )
		local f26_local0 = f26_arg1.controller or f7_local1
		ACTIONS.AnimateSequence( self, "BackgroundMenu" )
	end )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "InGameRigSelect", InGameRigSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "InGameRigSelect", f0_local1 )
LockTable( _M )
