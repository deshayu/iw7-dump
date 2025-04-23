local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.DisableMousePointerForMenu( "CaptainsComputerMenu" )
LUI.FlowManager.AlwaysVisibleForMenu( "CaptainsComputerMenu" )
LUI.FlowManager.DisableLetterboxForMenu( "CaptainsComputerMenu" )
f0_local0 = "ingame.SP.CaptainsComputer"
f0_local1 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	table.insert( f1_arg0, {
		name = LUI.DataSourceInGlobalModel.new( f0_local0 .. f1_arg1, Engine.Localize( f1_arg2 ) ),
		focusFunction = GetBuildMenuFocusFunction( function ()
			if f1_arg3 == nil then
				return LUI.UIElement.new()
			else
				return MenuBuilder.BuildRegisteredType( f1_arg3, {
					controllerIndex = f1_arg4
				} )
			end
		end
		 )
	} )
end

function PopFunc()
	WipeGlobalModelsAtPath( f0_local0 )
end

function PostLoadFunc( f4_arg0, f4_arg1 )
	f4_arg0:SetupInWorldElement( {} )
	f4_arg0:SetInWorldScale( 0.02 )
	f4_arg0:SetAlpha( 0 )
	f4_arg0:SetHandleMouse( false )
	f4_arg0.processEvent = function ( f5_arg0, f5_arg1 )
		if f5_arg1.name == "mouseup" then
			if f5_arg1.button == "left" then
				LUI.UIElement.processEvent( f5_arg0, {
					name = "gamepad_button",
					button = "primary",
					qualifier = "keyboard",
					down = true,
					controller = f5_arg1.controller
				} )
			elseif f5_arg1.button == "right" then
				f5_arg0:processEvent( {
					name = "button_secondary",
					controller = f4_arg1
				} )
			end
			return true
		elseif f5_arg1.name ~= "mousemove" and f5_arg1.name ~= "mousedown" then
			return LUI.UIElement.processEvent( f5_arg0, f5_arg1 )
		else
			
		end
	end
	
	f4_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		if event.qualifier == "mousewheel" then
			return true
		elseif Engine.IsPC() then
			if event.button == "w" then
				event.button = "up"
			elseif event.button == "s" then
				event.button = "down"
			end
		end
		return false
	end )
	local f4_local0 = function ( f7_arg0, f7_arg1 )
		local f7_local0 = Game.GetOmnvar( "ui_inworld_menu_ent" )
		f7_arg0:SetEntityNum( f7_local0 )
		f7_arg0:SetFollowTagAngles( true )
		DebugPrint( "monitor ent is == " .. f7_local0 )
		f7_arg0:SetTagSpacePosition( -1.2, -6.9, 3.7 )
		f7_arg0:SetTagSpaceYaw( 90 )
		f7_arg0:SetAlpha( 1 )
	end
	
	f4_arg0:registerOmnvarHandler( "ui_inworld_menu_ent", f4_local0 )
	f4_local0( f4_arg0, {} )
	local f4_local1 = 2018 * _1080p / 2
	local f4_local2 = 1080 * _1080p / 2
	f4_arg0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -f4_local1 / 2, f4_local1 / 2, -f4_local2 / 2, f4_local2 / 2 )
	WipeGlobalModelsAtPath( f0_local0 )
	assert( f4_arg0.Tabs )
	local f4_local3 = {}
	local f4_local4 = LUI.DataSourceFromList.new( 3 )
	f4_local4.MakeDataSourceAtIndex = function ( f8_arg0, f8_arg1 )
		return f4_local3[f8_arg1 + 1]
	end
	
	f0_local1( f4_local3, ".intelTabName", "CAPCOMP_TAB_INTEL", "CapOpsIntel", f4_arg1 )
	f0_local1( f4_local3, ".aarTabName", "CAPCOMP_TAB_AAR", "CapOpsReport", f4_arg1 )
	f0_local1( f4_local3, ".personnelTabName", "CAPCOMP_TAB_PERSONNEL", "CapOpsPersonnel", f4_arg1 )
	f4_arg0.Tabs:SetTabManagerDataSource( f4_local4 )
	if Engine.IsPC() and not CONDITIONS.IsGamepadEnabled( f4_arg0 ) then
		local f4_local5 = f4_arg0.Tabs._tabNavigator
		assert( f4_local5 )
		local self = nil
		self = LUI.UIStyledText.new()
		self.id = "leftLabel"
		self:setText( Engine.Localize( "PLATFORM_KB_DPAD_LEFT_BUTTON" ), 0 )
		self:SetFontSize( 30 * _1080p )
		self:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		self:SetAlignment( LUI.Alignment.Center )
		self:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1250, _1080p * 1350, _1080p * 0, _1080p * 30 )
		self:setPriority( -1 )
		f4_local5:addElement( self )
		local f4_local7 = nil
		f4_local7 = LUI.UIStyledText.new()
		f4_local7.id = "rightLabel"
		f4_local7:setText( Engine.Localize( "PLATFORM_KB_DPAD_RIGHT_BUTTON" ), 0 )
		f4_local7:SetFontSize( 30 * _1080p )
		f4_local7:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
		f4_local7:SetAlignment( LUI.Alignment.Center )
		f4_local7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * 1300, _1080p * 1400, _1080p * 0, _1080p * 30 )
		f4_local7:setPriority( 1 )
		f4_local5:addElement( f4_local7 )
		local f4_local8 = f4_arg0.Tabs:getChildById( "bindButton" )
		f4_local8:registerEventHandler( "button_left", function ( element, event )
			if not f4_arg0.Tabs._isAllDisabled then
				local f9_local0 = f4_arg0.Tabs:GetNextEnabledTab( event.controller, -1, false )
				if f9_local0 then
					f4_arg0.Tabs:FocusTab( f9_local0, FocusType.Gamepad )
				else
					f4_arg0.Tabs:playSound( "deny" )
				end
			end
			return true
		end )
		f4_local8:registerEventHandler( "button_right", function ( element, event )
			if not f4_arg0.Tabs._isAllDisabled then
				local f10_local0 = f4_arg0.Tabs:GetNextEnabledTab( event.controller, 1, false )
				if f10_local0 then
					f4_arg0.Tabs:FocusTab( f10_local0, FocusType.Gamepad )
				else
					f4_arg0.Tabs:playSound( "deny" )
				end
			end
			return true
		end )
	end
	local f4_local5 = Engine.GetLuiRoot()
	LUI.UIRoot.BlockButtonInput( f4_local5, true, "LeaveCapopsMenu" )
	f4_arg0:SubscribeToModel( DataSources.inGame.SP.loadoutDisableInput:GetModel( f4_arg1 ), function ()
		if Game.GetOmnvar( "ui_loadouts_menu_disabled" ) then
			LUI.UIRoot.BlockButtonInput( f4_local5, true, "LeaveCapopsMenu" )
			DebugPrint( "locked loadout input" )
		else
			LUI.UIRoot.BlockButtonInput( f4_local5, false, "LeaveCapopsMenu" )
			DebugPrint( "un-locked" )
		end
	end )
	f4_arg0.bindButton:addEventHandler( "button_secondary", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f4_arg1
		Engine.SetDvarInt( "leave_menu", 1 )
	end )
	f4_arg0.bindButton:addEventHandler( "button_start", function ( f13_arg0, f13_arg1 )
		ACTIONS.PauseGame( f13_arg0, true )
	end )
end

function CaptainsComputerMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CaptainsComputerMenu"
	self._animationSets = {}
	self._sequences = {}
	local f14_local1 = controller and controller.controllerIndex
	if not f14_local1 and not Engine.InFrontend() then
		f14_local1 = self:getRootController()
	end
	assert( f14_local1 )
	self:playSound( "menu_open" )
	local f14_local2 = self
	local BGImage = nil
	
	BGImage = LUI.UIImage.new()
	BGImage.id = "BGImage"
	BGImage:SetDotPitchEnabled( true )
	BGImage:SetDotPitchX( 0, 0 )
	BGImage:SetDotPitchY( 0, 0 )
	BGImage:SetDotPitchContrast( 0, 0 )
	BGImage:SetDotPitchMode( 0 )
	BGImage:setImage( RegisterMaterial( "hud_captain_computer_bg" ), 0 )
	BGImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 2018, 0, _1080p * 1080 )
	self:addElement( BGImage )
	self.BGImage = BGImage
	
	local DesktopImage = nil
	
	DesktopImage = LUI.UIImage.new()
	DesktopImage.id = "DesktopImage"
	DesktopImage:SetAlpha( 0, 0 )
	DesktopImage:setImage( RegisterMaterial( "hud_opsmap_titan" ), 0 )
	DesktopImage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 2018, 0, _1080p * 1080 )
	self:addElement( DesktopImage )
	self.DesktopImage = DesktopImage
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "CaptainsComputerMenuTitle", {
		controllerIndex = f14_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle:SetDotPitchEnabled( true )
	MenuTitle:SetDotPitchX( 0, 0 )
	MenuTitle:SetDotPitchY( 0, 0 )
	MenuTitle:SetDotPitchContrast( 0, 0 )
	MenuTitle:SetDotPitchMode( 0 )
	MenuTitle.MenuTitle:setText( Engine.Localize( "CAPCOMP_TAB_HOME" ), 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 596, _1080p * 54, _1080p * 96 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local Tabs = nil
	
	Tabs = LUI.TabManager.new( nil, {
		tabHeight = _1080p * 50,
		wrap = false,
		spacing = 6,
		buildTab = function ()
			return MenuBuilder.BuildRegisteredType( "CapOpsTab", {
				controllerIndex = f14_local1
			} )
		end,
		controllerIndex = f14_local1
	} )
	Tabs.id = "Tabs"
	Tabs:SetDotPitchEnabled( true )
	Tabs:SetDotPitchX( 0, 0 )
	Tabs:SetDotPitchY( 0, 0 )
	Tabs:SetDotPitchContrast( 0, 0 )
	Tabs:SetDotPitchMode( 0 )
	Tabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1824, _1080p * 130, _1080p * 180 )
	self:addElement( Tabs )
	self.Tabs = Tabs
	
	local Bar = nil
	
	Bar = LUI.UIImage.new()
	Bar.id = "Bar"
	Bar:SetRGBFromInt( 2763821, 0 )
	Bar:SetDotPitchEnabled( true )
	Bar:SetDotPitchX( 0, 0 )
	Bar:SetDotPitchY( 0, 0 )
	Bar:SetDotPitchContrast( 0, 0 )
	Bar:SetDotPitchMode( 0 )
	Bar:setImage( RegisterMaterial( "ui_default_white" ), 0 )
	Bar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 672.5, _1080p * 1883.5, _1080p * 54, _1080p * 96 )
	self:addElement( Bar )
	self.Bar = Bar
	
	local Header = nil
	
	Header = LUI.UIText.new()
	Header.id = "Header"
	Header:SetDotPitchEnabled( true )
	Header:SetDotPitchX( 0, 0 )
	Header:SetDotPitchY( 0, 0 )
	Header:SetDotPitchContrast( 0, 0 )
	Header:SetDotPitchMode( 0 )
	Header:setText( ToUpperCase( Engine.Localize( "CAPCOMP_HEADER_TEXT" ) ), 0 )
	Header:SetFontSize( 32 * _1080p )
	Header:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Header:SetAlignment( LUI.Alignment.Right )
	Header:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1278, _1080p * 1790, _1080p * 60, _1080p * 92 )
	self:addElement( Header )
	self.Header = Header
	
	local HelperBarCapLeft = nil
	
	HelperBarCapLeft = LUI.UIImage.new()
	HelperBarCapLeft.id = "HelperBarCapLeft"
	HelperBarCapLeft:SetDotPitchEnabled( true )
	HelperBarCapLeft:SetDotPitchX( 0, 0 )
	HelperBarCapLeft:SetDotPitchY( 0, 0 )
	HelperBarCapLeft:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeft:SetDotPitchMode( 0 )
	HelperBarCapLeft:setImage( RegisterMaterial( "hud_captain_computer_cap_left" ), 0 )
	HelperBarCapLeft:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 10.27, _1080p * 26.27, _1080p * 1017, _1080p * 1070 )
	self:addElement( HelperBarCapLeft )
	self.HelperBarCapLeft = HelperBarCapLeft
	
	local HelperBarCapLeftCopy0 = nil
	
	HelperBarCapLeftCopy0 = LUI.UIImage.new()
	HelperBarCapLeftCopy0.id = "HelperBarCapLeftCopy0"
	HelperBarCapLeftCopy0:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy0:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy0:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy0:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy0:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy0:setImage( RegisterMaterial( "hud_captain_computer_cap_right" ), 0 )
	HelperBarCapLeftCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 325.27, _1080p * 340.97, _1080p * 1017, _1080p * 1070 )
	self:addElement( HelperBarCapLeftCopy0 )
	self.HelperBarCapLeftCopy0 = HelperBarCapLeftCopy0
	
	local HelperBarStart = nil
	
	HelperBarStart = LUI.UIImage.new()
	HelperBarStart.id = "HelperBarStart"
	HelperBarStart:SetRGBFromInt( 1776411, 0 )
	HelperBarStart:SetDotPitchEnabled( true )
	HelperBarStart:SetDotPitchX( 0, 0 )
	HelperBarStart:SetDotPitchY( 0, 0 )
	HelperBarStart:SetDotPitchContrast( 0, 0 )
	HelperBarStart:SetDotPitchMode( 0 )
	HelperBarStart:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 25.27, _1080p * 326.27, _1080p * 1017, _1080p * 1069.25 )
	self:addElement( HelperBarStart )
	self.HelperBarStart = HelperBarStart
	
	local HelperBarCapLeftCopy1 = nil
	
	HelperBarCapLeftCopy1 = LUI.UIImage.new()
	HelperBarCapLeftCopy1.id = "HelperBarCapLeftCopy1"
	HelperBarCapLeftCopy1:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy1:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy1:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy1:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy1:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy1:setImage( RegisterMaterial( "hud_captain_computer_cap_left" ), 0 )
	HelperBarCapLeftCopy1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 344.27, _1080p * 360.27, _1080p * 1017, _1080p * 1070 )
	self:addElement( HelperBarCapLeftCopy1 )
	self.HelperBarCapLeftCopy1 = HelperBarCapLeftCopy1
	
	local HelperBarStartCopy0 = nil
	
	HelperBarStartCopy0 = LUI.UIImage.new()
	HelperBarStartCopy0.id = "HelperBarStartCopy0"
	HelperBarStartCopy0:SetRGBFromInt( 1776411, 0 )
	HelperBarStartCopy0:SetDotPitchEnabled( true )
	HelperBarStartCopy0:SetDotPitchX( 0, 0 )
	HelperBarStartCopy0:SetDotPitchY( 0, 0 )
	HelperBarStartCopy0:SetDotPitchContrast( 0, 0 )
	HelperBarStartCopy0:SetDotPitchMode( 0 )
	HelperBarStartCopy0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 359.27, _1080p * 1927.15, _1080p * 1017, _1080p * 1069.25 )
	self:addElement( HelperBarStartCopy0 )
	self.HelperBarStartCopy0 = HelperBarStartCopy0
	
	local HelperBarCapLeftCopy6 = nil
	
	HelperBarCapLeftCopy6 = LUI.UIImage.new()
	HelperBarCapLeftCopy6.id = "HelperBarCapLeftCopy6"
	HelperBarCapLeftCopy6:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy6:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy6:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy6:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy6:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy6:setImage( RegisterMaterial( "hud_captain_computer_cap_right" ), 0 )
	HelperBarCapLeftCopy6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1919.3, _1080p * 1935, _1080p * 1017, _1080p * 1070 )
	self:addElement( HelperBarCapLeftCopy6 )
	self.HelperBarCapLeftCopy6 = HelperBarCapLeftCopy6
	
	local HelperBarStartCopy3 = nil
	
	HelperBarStartCopy3 = LUI.UIImage.new()
	HelperBarStartCopy3.id = "HelperBarStartCopy3"
	HelperBarStartCopy3:SetDotPitchEnabled( true )
	HelperBarStartCopy3:SetDotPitchX( 0, 0 )
	HelperBarStartCopy3:SetDotPitchY( 0, 0 )
	HelperBarStartCopy3:SetDotPitchContrast( 0, 0 )
	HelperBarStartCopy3:SetDotPitchMode( 0 )
	HelperBarStartCopy3:setImage( RegisterMaterial( "hud_captain_computer_start" ), 0 )
	HelperBarStartCopy3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 60.77, _1080p * 290.77, _1080p * 1021.56, _1080p * 1064.69 )
	self:addElement( HelperBarStartCopy3 )
	self.HelperBarStartCopy3 = HelperBarStartCopy3
	
	local HelperBarStartCopy4 = nil
	
	HelperBarStartCopy4 = LUI.UIImage.new()
	HelperBarStartCopy4.id = "HelperBarStartCopy4"
	HelperBarStartCopy4:SetDotPitchEnabled( true )
	HelperBarStartCopy4:SetDotPitchX( 0, 0 )
	HelperBarStartCopy4:SetDotPitchY( 0, 0 )
	HelperBarStartCopy4:SetDotPitchContrast( 0, 0 )
	HelperBarStartCopy4:SetDotPitchMode( 0 )
	HelperBarStartCopy4:setImage( RegisterMaterial( "hud_captain_computer_start_icons" ), 0 )
	HelperBarStartCopy4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1700.15, _1080p * 1927.15, _1080p * 1021.56, _1080p * 1071.56 )
	self:addElement( HelperBarStartCopy4 )
	self.HelperBarStartCopy4 = HelperBarStartCopy4
	
	local HelperBarStartCopy5 = nil
	
	HelperBarStartCopy5 = LUI.UIImage.new()
	HelperBarStartCopy5.id = "HelperBarStartCopy5"
	HelperBarStartCopy5:SetDotPitchEnabled( true )
	HelperBarStartCopy5:SetDotPitchX( 0, 0 )
	HelperBarStartCopy5:SetDotPitchY( 0, 0 )
	HelperBarStartCopy5:SetDotPitchContrast( 0, 0 )
	HelperBarStartCopy5:SetDotPitchMode( 0 )
	HelperBarStartCopy5:setImage( RegisterMaterial( "hud_captain_computer_sidebar_cap" ), 0 )
	HelperBarStartCopy5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1935, _1080p * 1995, _1080p * 1017, _1080p * 1069.25 )
	self:addElement( HelperBarStartCopy5 )
	self.HelperBarStartCopy5 = HelperBarStartCopy5
	
	local HelperBarStartCopy6 = nil
	
	HelperBarStartCopy6 = LUI.UIImage.new()
	HelperBarStartCopy6.id = "HelperBarStartCopy6"
	HelperBarStartCopy6:SetRGBFromInt( 1644826, 0 )
	HelperBarStartCopy6:SetDotPitchEnabled( true )
	HelperBarStartCopy6:SetDotPitchX( 0, 0 )
	HelperBarStartCopy6:SetDotPitchY( 0, 0 )
	HelperBarStartCopy6:SetDotPitchContrast( 0, 0 )
	HelperBarStartCopy6:SetDotPitchMode( 0 )
	HelperBarStartCopy6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1935, _1080p * 1995, _1080p * 54, _1080p * 1019 )
	self:addElement( HelperBarStartCopy6 )
	self.HelperBarStartCopy6 = HelperBarStartCopy6
	
	local HelperBarStartCopy7 = nil
	
	HelperBarStartCopy7 = LUI.UIImage.new()
	HelperBarStartCopy7.id = "HelperBarStartCopy7"
	HelperBarStartCopy7:SetDotPitchEnabled( true )
	HelperBarStartCopy7:SetDotPitchX( 0, 0 )
	HelperBarStartCopy7:SetDotPitchY( 0, 0 )
	HelperBarStartCopy7:SetDotPitchContrast( 0, 0 )
	HelperBarStartCopy7:SetDotPitchMode( 0 )
	HelperBarStartCopy7:setImage( RegisterMaterial( "hud_captain_computer_sidebar_cap" ), 0 )
	HelperBarStartCopy7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1935, _1080p * 1995, _1080p * 1.75, _1080p * 54 )
	self:addElement( HelperBarStartCopy7 )
	self.HelperBarStartCopy7 = HelperBarStartCopy7
	
	local HelperBarCapLeftCopy7 = nil
	
	HelperBarCapLeftCopy7 = LUI.UIImage.new()
	HelperBarCapLeftCopy7.id = "HelperBarCapLeftCopy7"
	HelperBarCapLeftCopy7:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy7:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy7:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy7:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy7:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy7:setImage( RegisterMaterial( "hud_captain_computer_cap_right" ), 0 )
	HelperBarCapLeftCopy7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 431, _1080p * 446.7, _1080p * 916, _1080p * 1017 )
	self:addElement( HelperBarCapLeftCopy7 )
	self.HelperBarCapLeftCopy7 = HelperBarCapLeftCopy7
	
	local TechA = nil
	
	TechA = LUI.UIImage.new()
	TechA.id = "TechA"
	TechA:setImage( RegisterMaterial( "hud_captain_computer_techy_a" ), 0 )
	TechA:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 127, _1080p * 432, _1080p * 916, _1080p * 1017 )
	self:addElement( TechA )
	self.TechA = TechA
	
	local HelperBarCapLeftCopy8 = nil
	
	HelperBarCapLeftCopy8 = LUI.UIImage.new()
	HelperBarCapLeftCopy8.id = "HelperBarCapLeftCopy8"
	HelperBarCapLeftCopy8:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy8:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy8:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy8:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy8:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy8:setImage( RegisterMaterial( "hud_captain_computer_cap_left" ), 0 )
	HelperBarCapLeftCopy8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 111, _1080p * 127, _1080p * 916, _1080p * 1017 )
	self:addElement( HelperBarCapLeftCopy8 )
	self.HelperBarCapLeftCopy8 = HelperBarCapLeftCopy8
	
	local HelperBarCapLeftCopy14 = nil
	
	HelperBarCapLeftCopy14 = LUI.UIImage.new()
	HelperBarCapLeftCopy14.id = "HelperBarCapLeftCopy14"
	HelperBarCapLeftCopy14:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy14:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy14:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy14:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy14:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy14:setImage( RegisterMaterial( "hud_captain_computer_cap_right" ), 0 )
	HelperBarCapLeftCopy14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1881.33, _1080p * 1897.03, _1080p * 916, _1080p * 1017 )
	self:addElement( HelperBarCapLeftCopy14 )
	self.HelperBarCapLeftCopy14 = HelperBarCapLeftCopy14
	
	local TechACopy2 = nil
	
	TechACopy2 = LUI.UIImage.new()
	TechACopy2.id = "TechACopy2"
	TechACopy2:setImage( RegisterMaterial( "hud_captain_computer_techy_d" ), 0 )
	TechACopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1339.33, _1080p * 1896.33, _1080p * 917, _1080p * 1015 )
	self:addElement( TechACopy2 )
	self.TechACopy2 = TechACopy2
	
	local HelperBarCapLeftCopy13 = nil
	
	HelperBarCapLeftCopy13 = LUI.UIImage.new()
	HelperBarCapLeftCopy13.id = "HelperBarCapLeftCopy13"
	HelperBarCapLeftCopy13:SetDotPitchEnabled( true )
	HelperBarCapLeftCopy13:SetDotPitchX( 0, 0 )
	HelperBarCapLeftCopy13:SetDotPitchY( 0, 0 )
	HelperBarCapLeftCopy13:SetDotPitchContrast( 0, 0 )
	HelperBarCapLeftCopy13:SetDotPitchMode( 0 )
	HelperBarCapLeftCopy13:setImage( RegisterMaterial( "hud_captain_computer_cap_left" ), 0 )
	HelperBarCapLeftCopy13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1323.33, _1080p * 1339.33, _1080p * 916, _1080p * 1017 )
	self:addElement( HelperBarCapLeftCopy13 )
	self.HelperBarCapLeftCopy13 = HelperBarCapLeftCopy13
	
	local CapopsTechyB = nil
	
	CapopsTechyB = MenuBuilder.BuildRegisteredType( "CapopsTechyB", {
		controllerIndex = f14_local1
	} )
	CapopsTechyB.id = "CapopsTechyB"
	CapopsTechyB:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 446.7, _1080p * 967.85, _1080p * 916, _1080p * 1017 )
	self:addElement( CapopsTechyB )
	self.CapopsTechyB = CapopsTechyB
	
	local CapOpsTechyC = nil
	
	CapOpsTechyC = MenuBuilder.BuildRegisteredType( "CapOpsTechyC", {
		controllerIndex = f14_local1
	} )
	CapOpsTechyC.id = "CapOpsTechyC"
	CapOpsTechyC:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 999.47, _1080p * 1323.33, _1080p * 916, _1080p * 1017 )
	self:addElement( CapOpsTechyC )
	self.CapOpsTechyC = CapOpsTechyC
	
	local Image0 = nil
	
	Image0 = LUI.UIImage.new()
	Image0.id = "Image0"
	Image0:SetRGBFromInt( 13623526, 0 )
	Image0:SetDotPitchEnabled( true )
	Image0:SetDotPitchX( 0, 0 )
	Image0:SetDotPitchY( 0, 0 )
	Image0:SetDotPitchContrast( 0, 0 )
	Image0:SetDotPitchMode( 0 )
	Image0:SetBlendMode( BLEND_MODE.multiply )
	Image0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 2018, 0, _1080p * 1080 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MenuTitle:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.MenuTitle:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MenuTitle:SetAlpha( 0, 300 )
				end,
				function ()
					return self.MenuTitle:SetAlpha( 1, 10 )
				end,
				function ()
					return self.MenuTitle:SetAlpha( 0, 10 )
				end,
				function ()
					return self.MenuTitle:SetAlpha( 1, 20 )
				end,
				function ()
					return self.MenuTitle:SetAlpha( 0, 10 )
				end,
				function ()
					return self.MenuTitle:SetAlpha( 1, 30 )
				end
			}
		} )
		Tabs:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.Tabs:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Tabs:SetAlpha( 0, 550 )
				end,
				function ()
					return self.Tabs:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Tabs:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Tabs:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Tabs:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Tabs:SetAlpha( 1, 30 )
				end
			}
		} )
		Bar:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.Bar:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Bar:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Bar:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Bar:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Bar:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Bar:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Bar:SetAlpha( 1, 30 )
				end
			}
		} )
		Header:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.Header:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 390 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 50 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 10 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 20 )
				end,
				function ()
					return self.Header:SetAlpha( 0, 10 )
				end,
				function ()
					return self.Header:SetAlpha( 1, 30 )
				end
			}
		} )
		HelperBarCapLeftCopy7:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.HelperBarCapLeftCopy7:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HelperBarCapLeftCopy7:SetAlpha( 1, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy7:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy7:SetAlpha( 1, 20 )
				end,
				function ()
					return self.HelperBarCapLeftCopy7:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy7:SetAlpha( 1, 30 )
				end
			}
		} )
		TechA:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.TechA:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TechA:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TechA:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TechA:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TechA:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TechA:SetAlpha( 1, 30 )
				end
			}
		} )
		HelperBarCapLeftCopy8:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.HelperBarCapLeftCopy8:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HelperBarCapLeftCopy8:SetAlpha( 1, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy8:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy8:SetAlpha( 1, 20 )
				end,
				function ()
					return self.HelperBarCapLeftCopy8:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy8:SetAlpha( 1, 30 )
				end
			}
		} )
		HelperBarCapLeftCopy14:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 0, 150 )
				end,
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 1, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 1, 20 )
				end,
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy14:SetAlpha( 1, 30 )
				end
			}
		} )
		TechACopy2:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.TechACopy2:SetAlpha( 0, 0 )
				end,
				function ()
					return self.TechACopy2:SetAlpha( 0, 150 )
				end,
				function ()
					return self.TechACopy2:SetAlpha( 1, 10 )
				end,
				function ()
					return self.TechACopy2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TechACopy2:SetAlpha( 1, 20 )
				end,
				function ()
					return self.TechACopy2:SetAlpha( 0, 10 )
				end,
				function ()
					return self.TechACopy2:SetAlpha( 1, 30 )
				end
			}
		} )
		HelperBarCapLeftCopy13:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 0, 150 )
				end,
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 1, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 1, 20 )
				end,
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 0, 10 )
				end,
				function ()
					return self.HelperBarCapLeftCopy13:SetAlpha( 1, 30 )
				end
			}
		} )
		CapopsTechyB:RegisterAnimationSequence( "ComputerOn", {
			{
				function ()
					return self.CapopsTechyB:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CapopsTechyB:SetAlpha( 0, 80 )
				end,
				function ()
					return self.CapopsTechyB:SetAlpha( 1, 10 )
				end,
				function ()
					return self.CapopsTechyB:SetAlpha( 0, 10 )
				end,
				function ()
					return self.CapopsTechyB:SetAlpha( 1, 20 )
				end,
				function ()
					return self.CapopsTechyB:SetAlpha( 0, 10 )
				end,
				function ()
					return self.CapopsTechyB:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.ComputerOn = function ()
			MenuTitle:AnimateSequence( "ComputerOn" )
			Tabs:AnimateSequence( "ComputerOn" )
			Bar:AnimateSequence( "ComputerOn" )
			Header:AnimateSequence( "ComputerOn" )
			HelperBarCapLeftCopy7:AnimateSequence( "ComputerOn" )
			TechA:AnimateSequence( "ComputerOn" )
			HelperBarCapLeftCopy8:AnimateSequence( "ComputerOn" )
			HelperBarCapLeftCopy14:AnimateSequence( "ComputerOn" )
			TechACopy2:AnimateSequence( "ComputerOn" )
			HelperBarCapLeftCopy13:AnimateSequence( "ComputerOn" )
			CapopsTechyB:AnimateSequence( "ComputerOn" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f94_arg0, f94_arg1 )
		f94_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f95_arg0, f95_arg1 )
		local f95_local0 = f95_arg1.controller or f14_local1
		ACTIONS.LeaveMenu( self )
		ACTIONS.ScriptNotify( "menu_quit", 1 )
	end )
	self:addEventHandler( "menu_create", function ( f96_arg0, f96_arg1 )
		local f96_local0 = f96_arg1.controller or f14_local1
		ACTIONS.AnimateSequence( self, "ComputerOn" )
	end )
	PostLoadFunc( self, f14_local1, controller )
	return self
end

MenuBuilder.registerType( "CaptainsComputerMenu", CaptainsComputerMenu )
LUI.FlowManager.RegisterStackPopBehaviour( "CaptainsComputerMenu", PopFunc )
LockTable( _M )
