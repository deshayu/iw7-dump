local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg0._visibleMenu == "display" or f1_arg0._visibleMenu == "loadout" then
		local f1_local0 = nil
		if f1_arg0._visibleMenu == "loadout" then
			f1_local0 = "LoadoutSettings"
		else
			f1_local0 = "DisplaySettings"
		end
		if f1_arg2 then
			ACTIONS.GainFocus( f1_arg0, f1_local0, f1_arg1 )
			if f1_arg0._visibleMenu == "display" then
				f1_arg0.CodcasterSideSettingsTabs.DisplayTab.TabText:AnimateSequence( "Focused" )
				f1_arg0.CodcasterSideSettingsTabs.DisplayTab.BlurBackground:AnimateSequence( "Focused" )
				f1_arg0.CodcasterSideSettingsTabs.LoadoutTab.TabText:AnimateSequence( "UnFocused" )
				f1_arg0.CodcasterSideSettingsTabs.LoadoutTab.BlurBackground:AnimateSequence( "UnFocused" )
				f1_arg0.DisplaySettings:SetAlpha( 1 )
			else
				f1_arg0.CodcasterSideSettingsTabs.DisplayTab.TabText:AnimateSequence( "UnFocused" )
				f1_arg0.CodcasterSideSettingsTabs.DisplayTab.BlurBackground:AnimateSequence( "UnFocused" )
				f1_arg0.CodcasterSideSettingsTabs.LoadoutTab.TabText:AnimateSequence( "Focused" )
				f1_arg0.CodcasterSideSettingsTabs.LoadoutTab.BlurBackground:AnimateSequence( "Focused" )
				f1_arg0.LoadoutSettings:SetAlpha( 1 )
			end
		else
			ACTIONS.LoseFocus( f1_arg0, f1_local0, f1_arg1 )
			if f1_arg0._visibleMenu == "display" then
				f1_arg0.DisplaySettings:SetAlpha( 0 )
			else
				f1_arg0.LoadoutSettings:SetAlpha( 0 )
			end
		end
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0._visibleMenu == "loadout" then
		if f2_arg0.LoadoutSettings ~= nil then
			f2_arg0:UpdateFocus( f2_arg1, false )
			f2_arg0.LoadoutSettings:SetAlpha( 0 )
			f2_arg0.LoadoutSettings:closeChildren()
			f2_arg0.LoadoutSettings:close()
		end
		f2_arg0.LoadoutSettings = nil
		f2_arg0.LoadoutDescription:SetAlpha( 0 )
		if f2_arg0.DisplaySettings == nil then
			f2_arg0:CreateDisplaySettings( f2_arg1 )
		end
		f2_arg0.DisplaySettings:SetAlpha( 1 )
		f2_arg0.DisplayDescription:SetAlpha( 1 )
		f2_arg0._visibleMenu = "display"
		f2_arg0:UpdateFocus( f2_arg1, true )
		f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_DISPLAY_SETTINGS" ) ) )
	else
		f2_arg0:UpdateFocus( f2_arg1, false )
		if f2_arg0.DisplaySettings ~= nil then
			f2_arg0.DisplaySettings:SetAlpha( 0 )
			f2_arg0.DisplaySettings:closeChildren()
			f2_arg0.DisplaySettings:close()
			f2_arg0.DisplaySettings = nil
		end
		f2_arg0.DisplayDescription:SetAlpha( 0 )
		f2_arg0:CreateLoadoutSettings( f2_arg1 )
		f2_arg0.LoadoutSettings:SetAlpha( 1 )
		f2_arg0.LoadoutDescription:SetAlpha( 1 )
		f2_arg0._visibleMenu = "loadout"
		f2_arg0:UpdateFocus( f2_arg1, true )
		f2_arg0.MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_LOADOUT_SETTINGS" ) ) )
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local LoadoutSettings = nil
	
	LoadoutSettings = MenuBuilder.BuildRegisteredType( "CodCasterLoadoutSettingList", {
		controllerIndex = f3_arg1
	} )
	LoadoutSettings.id = "LoadoutSettings"
	LoadoutSettings:SetAnchors( 1, 0, 0, 1, 0 )
	LoadoutSettings:SetLeft( _1080p * -846, 0 )
	LoadoutSettings:SetRight( _1080p * -75, 0 )
	LoadoutSettings:SetTop( _1080p * 216, 0 )
	LoadoutSettings:SetBottom( _1080p * 1177, 0 )
	f3_arg0:addElement( LoadoutSettings )
	f3_arg0.LoadoutSettings = LoadoutSettings
	
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local DisplaySettings = nil
	
	DisplaySettings = MenuBuilder.BuildRegisteredType( "CodCasterDisplaySettingList", {
		controllerIndex = f4_arg1
	} )
	DisplaySettings.id = "DisplaySettings"
	DisplaySettings:SetAnchors( 0, 1, 0, 1, 0 )
	DisplaySettings:SetLeft( _1080p * 1073, 0 )
	DisplaySettings:SetRight( _1080p * 1826, 0 )
	DisplaySettings:SetTop( _1080p * 216, 0 )
	DisplaySettings:SetBottom( _1080p * 1177, 0 )
	f4_arg0:addElement( DisplaySettings )
	f4_arg0.DisplaySettings = DisplaySettings
	
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	f5_arg0.CodcasterSideSettingsTabs.DisplayTab.TabText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	f5_arg0.CodcasterSideSettingsTabs.DisplayTab.TabText:setText( ToUpperCase( Engine.Localize( "CODCASTER_DISPLAY_SETTINGS" ) ), 0 )
	f5_arg0.CodcasterSideSettingsTabs.DisplayTab.TabText:AnimateSequence( "Focused" )
	f5_arg0.CodcasterSideSettingsTabs.DisplayTab.BlurBackground:AnimateSequence( "Focused" )
	f5_arg0.CodcasterSideSettingsTabs.LoadoutTab.TabText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	f5_arg0.CodcasterSideSettingsTabs.LoadoutTab.TabText:setText( ToUpperCase( Engine.Localize( "CODCASTER_LOADOUT_SETTINGS" ) ), 0 )
	f5_arg0.CodcasterSideSettingsTabs.RightBump:setText( Engine.Localize( "LUA_MENU_PAD_RIGHT_SHOULDER_BUTTON" ), 0 )
	f5_arg0.CodcasterSideSettingsTabs.LeftBump:setText( Engine.Localize( "LUA_MENU_PAD_LEFT_SHOULDER_BUTTON" ), 0 )
	f5_arg0.CodcasterSideSettingsTabs.DisplayTab.BlurBackground:SetBlurStrength( 0, 0 )
	f5_arg0.CodcasterSideSettingsTabs.LoadoutTab.BlurBackground:SetBlurStrength( 0, 0 )
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	f6_arg0.UpdateFocus = f0_local0
	f6_arg0.ToggleVisibleMenu = f0_local1
	f6_arg0.CreateDisplaySettings = f0_local3
	f6_arg0.CreateLoadoutSettings = f0_local2
	f6_arg0.InitSettingsTabs = f0_local4
	f6_arg0:InitSettingsTabs( f6_arg1 )
	f6_arg0.DisplaySettings = nil
	if f6_arg2.menuToShow == "loadout" then
		f6_arg0._visibleMenu = "none"
	else
		f6_arg0._visibleMenu = "loadout"
	end
	f0_local1( f6_arg0 )
	f6_arg0:addEventHandler( "arrow_button_changed", function ( f7_arg0, f7_arg1 )
		if f7_arg1.desc then
			if f6_arg0._visibleMenu == "loadout" then
				f6_arg0.LoadoutDescription.Description:setText( f7_arg1.desc )
			else
				f6_arg0.DisplayDescription.Description:setText( f7_arg1.desc )
			end
		end
		return true
	end )
	f6_arg0.menuToAnimate = nil
	if f6_arg0._visibleMenu == "loadout" then
		f6_arg0.menuToAnimate = f6_arg0.LoadoutSettings
	elseif f6_arg0._visibleMenu == "display" then
		f6_arg0.menuToAnimate = f6_arg0.DisplaySettings
	end
	f6_arg0.menuToAnimate:RegisterAnimationSequence( "ChildAppear", {
		{
			function ()
				return f6_arg0.menuToAnimate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 2691, _1080p * 216, _1080p * 1177, 0 )
			end,
			function ()
				return f6_arg0.menuToAnimate:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1073, _1080p * 1826, _1080p * 216, _1080p * 1177, 150, LUI.EASING.inOutQuadratic )
			end
		}
	} )
	f6_arg0._sequences.ChildAppear = function ()
		f6_arg0.menuToAnimate:AnimateSequence( "ChildAppear" )
	end
	
	f6_arg0.DisplayDescription.Description:SetDecodeLetterLength( CODCASTER.fastDecodeLetterLength )
	f6_arg0.DisplayDescription.Description:SetDecodeMaxRandChars( CODCASTER.fastDecodeMaxRandChars )
	f6_arg0.DisplayDescription.Description:SetDecodeUpdatesPerLetter( CODCASTER.fastDecodeUpdatesPerLetter )
	f6_arg0.LoadoutDescription.Description:SetDecodeLetterLength( CODCASTER.fastDecodeLetterLength )
	f6_arg0.LoadoutDescription.Description:SetDecodeMaxRandChars( CODCASTER.fastDecodeMaxRandChars )
	f6_arg0.LoadoutDescription.Description:SetDecodeUpdatesPerLetter( CODCASTER.fastDecodeUpdatesPerLetter )
	f6_arg0.MenuTitle.MPBackerImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -19, _1080p * 920, _1080p * -1.5, _1080p * 126.5 )
end

function CodCasterSettingsInGame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodCasterSettingsInGame"
	self._animationSets = {}
	self._sequences = {}
	local f11_local1 = controller and controller.controllerIndex
	if not f11_local1 and not Engine.InFrontend() then
		f11_local1 = self:getRootController()
	end
	assert( f11_local1 )
	local f11_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.75, 0 )
	Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1071, _1080p * 1920, 0, _1080p * 1080 )
	self:addElement( Background )
	self.Background = Background
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f11_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( ToUpperCase( Engine.Localize( "CODCASTER_QUICK_SETTINGS" ) ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1071, _1080p * 975, _1080p * 77, _1080p * 157 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local LoadoutDescription = nil
	
	LoadoutDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f11_local1
	} )
	LoadoutDescription.id = "LoadoutDescription"
	LoadoutDescription.Description:SetRight( _1080p * 415, 0 )
	LoadoutDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1100, _1080p * 1520, _1080p * 536, _1080p * 568 )
	self:addElement( LoadoutDescription )
	self.LoadoutDescription = LoadoutDescription
	
	local DisplayDescription = nil
	
	DisplayDescription = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f11_local1
	} )
	DisplayDescription.id = "DisplayDescription"
	DisplayDescription.Description:SetRight( _1080p * 415, 0 )
	DisplayDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1100, _1080p * 1520, _1080p * 890, _1080p * 926 )
	self:addElement( DisplayDescription )
	self.DisplayDescription = DisplayDescription
	
	local CodcasterSideSettingsTabs = nil
	
	CodcasterSideSettingsTabs = MenuBuilder.BuildRegisteredType( "CodcasterSideSettingsTabs", {
		controllerIndex = f11_local1
	} )
	CodcasterSideSettingsTabs.id = "CodcasterSideSettingsTabs"
	CodcasterSideSettingsTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1295, _1080p * 1795, _1080p * 170, _1080p * 200 )
	self:addElement( CodcasterSideSettingsTabs )
	self.CodcasterSideSettingsTabs = CodcasterSideSettingsTabs
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1074, _1080p * 1920, 0, _1080p * 1080, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 2670, 0, _1080p * 1080, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1100, _1080p * 1000, _1080p * 77, _1080p * 157, 0 )
				end,
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1920, _1080p * 1824, _1080p * 77, _1080p * 157, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		LoadoutDescription:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.LoadoutDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1193, _1080p * 1613, _1080p * 536, _1080p * 568, 0 )
				end,
				function ()
					return self.LoadoutDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1948, _1080p * 2368, _1080p * 536, _1080p * 568, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		DisplayDescription:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.DisplayDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1100, _1080p * 1642, _1080p * 920, _1080p * 956, 0 )
				end,
				function ()
					return self.DisplayDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1944, _1080p * 2364, _1080p * 890, _1080p * 922, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		CodcasterSideSettingsTabs:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.CodcasterSideSettingsTabs:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.CodcasterSideSettingsTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1205, _1080p * 1705, _1080p * 170, _1080p * 200, 0 )
				end,
				function ()
					return self.CodcasterSideSettingsTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2005, _1080p * 2505, _1080p * 170, _1080p * 200, 150, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.Disappear = function ()
			Background:AnimateSequence( "Disappear" )
			MenuTitle:AnimateSequence( "Disappear" )
			LoadoutDescription:AnimateSequence( "Disappear" )
			DisplayDescription:AnimateSequence( "Disappear" )
			CodcasterSideSettingsTabs:AnimateSequence( "Disappear" )
		end
		
		Background:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1920, _1080p * 2670, 0, _1080p * 1080, 0 )
				end,
				function ()
					return self.Background:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1070, _1080p * 1920, 0, _1080p * 1080, 150, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		MenuTitle:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1955, _1080p * 1859, _1080p * 77, _1080p * 157, 0 )
				end,
				function ()
					return self.MenuTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 1100, _1080p * 1005, _1080p * 77, _1080p * 157, 150, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		LoadoutDescription:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.LoadoutDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1944, _1080p * 2362, _1080p * 536, _1080p * 568, 0 )
				end,
				function ()
					return self.LoadoutDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1102, _1080p * 1522, _1080p * 536, _1080p * 568, 150, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		DisplayDescription:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.DisplayDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1944, _1080p * 2364, _1080p * 920, _1080p * 956, 0 )
				end,
				function ()
					return self.DisplayDescription:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1100, _1080p * 1520, _1080p * 925, _1080p * 961, 150, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		CodcasterSideSettingsTabs:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.CodcasterSideSettingsTabs:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CodcasterSideSettingsTabs:SetAlpha( 1, 150, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.CodcasterSideSettingsTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2005, _1080p * 2505, _1080p * 170, _1080p * 200, 0 )
				end,
				function ()
					return self.CodcasterSideSettingsTabs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1205, _1080p * 1705, _1080p * 170, _1080p * 200, 150, LUI.EASING.inOutQuadratic )
				end
			}
		} )
		self._sequences.Appear = function ()
			Background:AnimateSequence( "Appear" )
			MenuTitle:AnimateSequence( "Appear" )
			LoadoutDescription:AnimateSequence( "Appear" )
			DisplayDescription:AnimateSequence( "Appear" )
			CodcasterSideSettingsTabs:AnimateSequence( "Appear" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local5( self, f11_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterSettingsInGame", CodCasterSettingsInGame )
LockTable( _M )
