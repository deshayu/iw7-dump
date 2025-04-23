local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 10
f0_local1 = 100
f0_local2 = 2
local f0_local3 = 0
local f0_local4 = 1
LUI.FlowManager.RequestSetStack( "InGameLoadoutSelect", {
	{
		name = "MPPauseMenu"
	}
} )
local f0_local5 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = LUI.DataSourceFromList.new( f0_local0 )
	f1_local0.MakeDataSourceAtIndex = function ( f2_arg0, f2_arg1, f2_arg2 )
		local f2_local0 = f1_arg2.loadouts:GetDataSourceAtIndex( f2_arg1, f2_arg2 )
		f2_local0.scriptLoadoutID = f2_arg1
		return f2_local0
	end
	
	f1_local0 = f1_local0:Decorate( DecorateLoadout( true ) )
	f1_local0.GetDefaultFocusIndex = function ()
		if f1_arg0.overrideLoadoutSelection then
			local f3_local0 = f1_arg0.overrideLoadoutSelection
			f1_arg0.overrideLoadoutSelection = nil
			return f3_local0
		else
			local f3_local0 = DataSources.inGame.MP.selectedLoadout:GetValue( f1_arg1 )
			if not f3_local0 then
				return 0
			else
				return f3_local0
			end
		end
	end
	
	return f1_local0
end

local f0_local6 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = f0_local0 - LOADOUT.DefaultClassCount
	local f4_local1 = LUI.DataSourceFromList.new( f0_local0 )
	f4_local1.MakeDataSourceAtIndex = function ( f5_arg0, f5_arg1, f5_arg2 )
		if f5_arg1 < f4_local0 then
			local f5_local0 = f4_arg2.loadouts:GetDataSourceAtIndex( f5_arg1, f5_arg2 )
			f5_local0.scriptLoadoutID = f5_arg1
			return f5_local0
		else
			local f5_local0 = f5_arg1 - f4_local0
			local f5_local1 = LOADOUT.BuildDefaltClassDataSource( f5_local0, f5_arg2 )
			assert( f5_local0 < LOADOUT.DefaultClassCount )
			f5_local1.scriptLoadoutID = f0_local1 + f5_local0
			return f5_local1
		end
	end
	
	f4_local1 = f4_local1:Decorate( DecorateLoadout( false ) )
	f4_local1.GetDefaultFocusIndex = function ()
		if f4_arg0.overrideLoadoutSelection then
			local f6_local0 = f4_arg0.overrideLoadoutSelection
			f4_arg0.overrideLoadoutSelection = nil
			return f6_local0
		end
		local f6_local0 = DataSources.inGame.MP.selectedLoadout:GetValue( f4_arg1 )
		if not f6_local0 then
			return 0
		end
		local f6_local1 = nil
		if f0_local1 <= f6_local0 then
			f6_local1 = f6_local0 - f0_local1 + f4_local0
		else
			f6_local1 = f6_local0
		end
		return f6_local1
	end
	
	return f4_local1
end

local f0_local7 = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = LUI.DataSourceFromList.new( f0_local2 )
	f7_local0.MakeDataSourceAtIndex = function ( f8_arg0, f8_arg1, f8_arg2 )
		local f8_local0, f8_local1 = nil
		local f8_local2 = false
		if f8_arg1 == f0_local3 then
			f8_local1 = LUI.DataSourceFromList.new( f7_arg2.loadouts:GetCountValue( f8_arg2 ) )
			f8_local1.MakeDataSourceAtIndex = function ( f9_arg0, f9_arg1, f9_arg2 )
				local f9_local0 = f7_arg2.loadouts:GetDataSourceAtIndex( f9_arg1, f9_arg2 )
				f9_local0.scriptLoadoutID = f9_arg1
				return f9_local0
			end
			
			f8_local0 = Engine.Localize( "MP_INGAME_ONLY_LOADOUT_TAB_CUSTOM" )
			f8_local2 = true
		elseif f8_arg1 == f0_local4 then
			f8_local1 = LUI.DataSourceFromList.new( LOADOUT.DefaultClassCount )
			f8_local1.MakeDataSourceAtIndex = function ( f10_arg0, f10_arg1, f10_arg2 )
				local f10_local0 = LOADOUT.BuildDefaltClassDataSource( f10_arg1, f10_arg2 )
				f10_local0.scriptLoadoutID = f0_local1 + f10_arg1
				return f10_local0
			end
			
			f8_local0 = Engine.Localize( "MP_INGAME_ONLY_LOADOUT_TAB_DEFAULT" )
		else
			assert( false, "Unsupported number of tabs in loadout list" )
		end
		f8_local1 = f8_local1:Decorate( DecorateLoadout( f8_local2 ) )
		f8_local1.name = LUI.DataSourceInControllerModel.new( "inGameLoadoutSelect.tabs." .. f8_arg1 .. ".name", f8_local0 )
		f8_local1.focusFunction = function ( f11_arg0, f11_arg1, f11_arg2 )
			
		end
		
		f8_local1.GetDefaultFocusIndex = function ()
			if f7_arg0.overrideLoadoutSelection then
				local f12_local0 = f7_arg0.overrideLoadoutSelection
				f7_arg0.overrideLoadoutSelection = nil
				return f12_local0
			else
				local f12_local0 = DataSources.inGame.MP.selectedLoadout:GetValue( f8_arg2 )
				if not f12_local0 then
					return 0
				else
					local f12_local1 = nil
					if f0_local1 <= f12_local0 then
						if f8_arg1 == f0_local4 then
							return f12_local0 - f0_local1
						else
							return 0
						end
					elseif f8_arg1 == f0_local3 then
						return f12_local0
					else
						return 0
					end
				end
			end
		end
		
		return f8_local1
	end
	
	f7_local0.GetDefaultFocusIndex = function ()
		if DataSources.inGame.MP.selectedLoadout:GetValue( f7_arg1 ) then
			return f0_local1 and f0_local4 or f0_local3
		else
			return 0
		end
	end
	
	return f7_local0
end

local f0_local8 = function ()
	WipeCACPlayerDataModels()
	LOADOUT.WipeDefaultClassModels()
end

function PostLoadFunc( f15_arg0, f15_arg1, f15_arg2 )
	assert( f15_arg0.MenuTitle )
	assert( f15_arg0.LoadoutList )
	assert( f15_arg0.LoadoutList.Loadouts )
	assert( f15_arg0.InGameRigInfo )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f15_arg0:addElement( self )
	local f15_local1, f15_local2 = nil
	local f15_local3 = false
	if GameX.IsRankedMatch() then
		f15_local2 = DataSources.alwaysLoaded.playerData.MP.rankedloadouts.squadMembers
		f15_local3 = not (DataSources.alwaysLoaded.playerData.MP.ranked.progression.playerLevel.prestige:GetValue( f15_arg1 ) > 0)
	else
		f15_local2 = DataSources.alwaysLoaded.playerData.MP.privateloadouts.squadMembers
	end
	f15_local1 = GetCACPlayerDataDataSource( f15_local2 )
	assert( f15_local1 )
	if CONDITIONS.UseLoadoutRestrictions() then
		local f15_local4 = f0_local5( f15_arg0, f15_arg1, f15_local2 )
		f15_arg0.Tabs:close()
		f15_arg0.LoadoutList:SetDataSource( f15_local4, f15_arg1 )
		f15_arg0.LoadoutList.Loadouts:SetDataSource( f15_local4:GetDataSourceAtIndex( 0, f15_arg1 ), f15_arg1 )
	elseif f15_local3 then
		local f15_local4 = f0_local6( f15_arg0, f15_arg1, f15_local2 )
		f15_arg0.Tabs:close()
		f15_arg0.LoadoutList:SetDataSource( f15_local4, f15_arg1 )
		f15_arg0.LoadoutList.Loadouts:SetDataSource( f15_local4:GetDataSourceAtIndex( 0, f15_arg1 ), f15_arg1 )
	else
		f15_arg0.Tabs:SetTabManagerDataSource( f0_local7( f15_arg0, f15_arg1, f15_local2 ), f15_arg1 )
		f15_arg0.LoadoutList:SetDataSourceThroughElement( f15_arg0.Tabs )
		local f15_local5 = f15_arg0.LoadoutList:SubscribeToDataSourceThroughElement( f15_arg0.LoadoutList, nil, function ()
			local f16_local0 = f15_arg0.LoadoutList:GetDataSource()
			f15_arg0.LoadoutList.Loadouts:SetDataSource( f16_local0:GetDataSourceAtIndex( 0, f15_arg1 ), f15_arg1 )
		end )
		f15_local5.unlinkOnCallback = true
	end
	f15_arg0.statsGroupDataSource = f15_local1
	assert( f15_arg0.InGameRigInfo )
	f15_arg0.InGameRigInfo:SetDataSource( f15_local1.rig, f15_arg1 )
	f15_arg0.LoadoutList.navigation = {}
	f15_arg0.LoadoutList.navigation.up = f15_arg0.InGameRigInfo
	f15_arg0.LoadoutList.navigation.down = f15_arg0.InGameRigInfo
	f15_arg0.InGameRigInfo.navigation = {}
	f15_arg0.InGameRigInfo.navigation.up = f15_arg0.LoadoutList
	f15_arg0.InGameRigInfo.navigation.down = f15_arg0.LoadoutList
	local f15_local4 = true
	f15_arg0.InGameRigInfo:addEventHandler( "gamepad_button", function ( f17_arg0, f17_arg1 )
		if f17_arg1.down and f17_arg1.qualifier ~= "mousewheel" and f17_arg1.button == "up" then
			local f17_local0 = f17_arg0:getParent()
			if #f17_local0:getAllFocusedChildren() <= 0 then
				f17_local0 = f17_arg0:getParent()
				if f17_local0:isInFocus() then
				
				else
					
				end
			end
			f17_local0 = f15_arg0.LoadoutList.Loadouts
			local f17_local1 = f17_local0:GetGridDataSource()
			f15_arg0.overrideLoadoutSelection = f17_local1:GetCountValue( f15_arg1 ) - 1
			f17_local0:processEvent( {
				name = "gain_focus",
				controllerIndex = f15_arg1
			} )
			f15_arg0.InGameRigInfo:processEvent( {
				name = "lose_focus",
				controllerIndex = f15_arg1
			} )
		end
	end )
	f15_arg0.InGameRigInfo:addEventHandler( "gain_focus", function ()
		f15_arg0.overrideLoadoutSelection = 0
	end )
	local f15_local5 = function ( f19_arg0, f19_arg1 )
		if f15_arg0.loadoutHidden then
			if not CONDITIONS.IsSplitscreen( f15_arg0 ) then
				ACTIONS.AnimateSequence( f15_arg0, "ShowLoadout" )
			else
				ACTIONS.AnimateSequence( f15_arg0, "ShowSplitscreenLoadout" )
			end
			f15_arg0.loadoutHidden = false
		end
	end
	
	f15_arg0.LoadoutList.Loadouts:addEventHandler( "gain_focus", f15_local5 )
	f15_arg0.LoadoutList.Loadouts:addEventHandler( "restore_focus", f15_local5 )
	local f15_local6 = function ( f20_arg0, f20_arg1 )
		if not f15_arg0.loadoutHidden then
			if not CONDITIONS.IsSplitscreen( f15_arg0 ) then
				ACTIONS.AnimateSequence( f15_arg0, "HideLoadout" )
			else
				ACTIONS.AnimateSequence( f15_arg0, "HideSplitscreenLoadout" )
			end
			f15_arg0.loadoutHidden = true
		end
	end
	
	f15_arg0.LoadoutList.Loadouts:addEventHandler( "lose_focus", f15_local6 )
	f15_arg0.InGameRigInfo:addEventHandler( "gain_focus", f15_local6 )
	if Engine.IsPC() then
		f15_arg0.LoadoutList:SetHandleMouse( true )
		f15_arg0.LoadoutList:registerEventHandler( "mouseenter", function ()
			f15_arg0.LoadoutList:processEvent( {
				name = "gain_focus",
				controller = f15_arg1
			} )
		end )
	end
	if CONDITIONS.UseLoadoutRestrictions() then
		f15_arg0.InGameRigInfo:SetButtonDisabled( true )
	end
end

function InGameLoadoutSelect( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "InGameLoadoutSelect"
	self._animationSets = {}
	self._sequences = {}
	local f22_local1 = controller and controller.controllerIndex
	if not f22_local1 and not Engine.InFrontend() then
		f22_local1 = self:getRootController()
	end
	assert( f22_local1 )
	self:playSound( "menu_open" )
	local f22_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.5, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local LoadoutList = nil
	
	LoadoutList = MenuBuilder.BuildRegisteredType( "InGameLoadoutList", {
		controllerIndex = f22_local1
	} )
	LoadoutList.id = "LoadoutList"
	LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 421, _1080p * 811 )
	self:addElement( LoadoutList )
	self.LoadoutList = LoadoutList
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f22_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f22_local6 = nil
	if not CONDITIONS.IsSplitscreen( self ) then
		f22_local6 = MenuBuilder.BuildRegisteredType( "CACLoadoutWrapper", {
			controllerIndex = f22_local1
		} )
		f22_local6.id = "CACLoadoutWrapper"
		if not CONDITIONS.IsSplitscreen( self ) then
			f22_local6:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
		end
		f22_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1140, _1080p * 248, _1080p * 878 )
		self:addElement( f22_local6 )
		self.CACLoadoutWrapper = f22_local6
	end
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f22_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_LOADOUT_SELECT" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local InGameRigInfo = nil
	
	InGameRigInfo = MenuBuilder.BuildRegisteredType( "RigButton", {
		controllerIndex = f22_local1
	} )
	InGameRigInfo.id = "InGameRigInfo"
	InGameRigInfo.FrameLabel:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_CHANGE_RIG" ) ), 0 )
	InGameRigInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 221, _1080p * 381 )
	self:addElement( InGameRigInfo )
	self.InGameRigInfo = InGameRigInfo
	
	local f22_local9 = nil
	if CONDITIONS.IsSplitscreen( self ) then
		f22_local9 = MenuBuilder.BuildRegisteredType( "CACSplitscreenWrapper", {
			controllerIndex = f22_local1
		} )
		f22_local9.id = "CACSplitscreenWrapper"
		if CONDITIONS.IsSplitscreen( self ) then
			f22_local9:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
		end
		f22_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 550, _1080p * 1435, _1080p * 248, _1080p * 666 )
		self:addElement( f22_local9 )
		self.CACSplitscreenWrapper = f22_local9
	end
	local Tabs = nil
	
	Tabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 26,
		wrap = false,
		spacing = 2,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "InGameLoadoutTab", {
				controllerIndex = f22_local1
			} )
		end,
		buildSpacer = function ()
			return MenuBuilder.BuildRegisteredType( "TabsSpacer", {
				controllerIndex = f22_local1
			} )
		end,
		controllerIndex = f22_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -50, _1080p * 670, _1080p * 388, _1080p * 414 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		if not CONDITIONS.IsSplitscreen( self ) then
			f22_local6:RegisterAnimationSequence( "HideLoadout", {
				{
					function ()
						return self.CACLoadoutWrapper:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideLoadout = function ()
			if not CONDITIONS.IsSplitscreen( self ) then
				f22_local6:AnimateSequence( "HideLoadout" )
			end
		end
		
		if not CONDITIONS.IsSplitscreen( self ) then
			f22_local6:RegisterAnimationSequence( "ShowLoadout", {
				{
					function ()
						return self.CACLoadoutWrapper:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowLoadout = function ()
			if not CONDITIONS.IsSplitscreen( self ) then
				f22_local6:AnimateSequence( "ShowLoadout" )
			end
		end
		
		LoadoutList:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.LoadoutList:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 290, _1080p * 600, 0 )
				end
			}
		} )
		InGameRigInfo:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.InGameRigInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 490, _1080p * 90, _1080p * 250, 0 )
				end
			}
		} )
		if CONDITIONS.IsSplitscreen( self ) then
			f22_local9:RegisterAnimationSequence( "Splitscreen", {
				{
					function ()
						return self.CACSplitscreenWrapper:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 621, _1080p * 1506, _1080p * 102, _1080p * 520, 0 )
					end
				}
			} )
		end
		Tabs:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.Tabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 40, _1080p * 580, _1080p * 257, _1080p * 283, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			LoadoutList:AnimateSequence( "Splitscreen" )
			InGameRigInfo:AnimateSequence( "Splitscreen" )
			if CONDITIONS.IsSplitscreen( self ) then
				f22_local9:AnimateSequence( "Splitscreen" )
			end
			Tabs:AnimateSequence( "Splitscreen" )
		end
		
		if CONDITIONS.IsSplitscreen( self ) then
			f22_local9:RegisterAnimationSequence( "HideSplitscreenLoadout", {
				{
					function ()
						return self.CACSplitscreenWrapper:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.HideSplitscreenLoadout = function ()
			if CONDITIONS.IsSplitscreen( self ) then
				f22_local9:AnimateSequence( "HideSplitscreenLoadout" )
			end
		end
		
		if CONDITIONS.IsSplitscreen( self ) then
			f22_local9:RegisterAnimationSequence( "ShowSplitscreenLoadout", {
				{
					function ()
						return self.CACSplitscreenWrapper:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.ShowSplitscreenLoadout = function ()
			if CONDITIONS.IsSplitscreen( self ) then
				f22_local9:AnimateSequence( "ShowSplitscreenLoadout" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	InGameRigInfo:addEventHandler( "button_action", function ( f40_arg0, f40_arg1 )
		ACTIONS.OpenMenu( "InGameRigSelect", true, f40_arg1.controller or f22_local1 )
	end )
	if not CONDITIONS.IsSplitscreen( self ) then
		f22_local6:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
	end
	if CONDITIONS.IsSplitscreen( self ) then
		f22_local9:SetDataSourceThroughElement( LoadoutList.Loadouts, nil )
	end
	self.addButtonHelperFunction = function ( f41_arg0, f41_arg1 )
		f41_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -20,
			clickable = true
		} )
		f41_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f22_local1
		ACTIONS.LeaveMenu( self )
	end )
	self:addEventHandler( "menu_create", function ( f43_arg0, f43_arg1 )
		local f43_local0 = f43_arg1.controller or f22_local1
		if CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "Splitscreen" )
		end
	end )
	PostLoadFunc( self, f22_local1, controller )
	return self
end

MenuBuilder.registerType( "InGameLoadoutSelect", InGameLoadoutSelect )
LUI.FlowManager.RegisterStackPopBehaviour( "InGameLoadoutSelect", f0_local8 )
LockTable( _M )
