local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	CODCASTER.InitToolbarButton( f1_arg0.QuickSettings, Engine.Localize( ButtonMap.button_left_trigger.string ), Engine.Localize( "CODCASTER_QUICK_SETTINGS" ), true )
	CODCASTER.InitToolbarButton( f1_arg0.Settings, Engine.Localize( ButtonMap.button_right_trigger.string ), Engine.Localize( "CODCASTER_SETTINGS" ), true )
	if Engine.IsGamepadEnabled() == 1 then
		CODCASTER.InitToolbarButton( f1_arg0.DisplayToolbar, Engine.Localize( ButtonMap.button_secondary.string ), Engine.Localize( "CODCASTER_DS_TOOLBAR" ), false )
		CODCASTER.InitToolbarButton( f1_arg0.Map, Engine.Localize( ButtonMap.button_alt1.string ), Engine.Localize( "MENU_MAP" ), false )
		CODCASTER.InitToolbarButton( f1_arg0.Loadout, Engine.Localize( ButtonMap.button_alt2.string ), Engine.Localize( "CODCASTER_LOADOUT" ), false )
	else
		CODCASTER.InitToolbarButton( f1_arg0.DisplayToolbar, Engine.Localize( "R" ), Engine.Localize( "CODCASTER_DS_TOOLBAR" ), false )
		CODCASTER.InitToolbarButton( f1_arg0.Map, Engine.Localize( "M" ), Engine.Localize( "MENU_MAP" ), false )
		CODCASTER.InitToolbarButton( f1_arg0.Loadout, Engine.Localize( "L" ), Engine.Localize( "CODCASTER_LOADOUT" ), false )
	end
	if f1_arg0.currentGameType == "gun" then
		f1_arg0.Loadout:SetAlpha( 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.currentGameType = Engine.GetDvarString( "ui_gametype" )
	f0_local0( f2_arg0, f2_arg1 )
	if Engine.IsPC() then
		f2_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
			f0_local0( element, f2_arg1 )
		end )
	end
	f2_arg0._subscriptionToScoreboard = f2_arg0:SubscribeToModel( DataSources.inGame.HUD.isScoreboardOpen:GetModel( f2_arg1 ), function ( f4_arg0 )
		local f4_local0 = DataModel.GetModelValue( f4_arg0 )
		local f4_local1 = f2_arg0.QuickSettings
		local f4_local2 = f4_local1
		f4_local1 = f4_local1.SetAlpha
		local f4_local3
		if f4_local0 then
			f4_local3 = 0.5
			if not f4_local3 then
			
			else
				f4_local1( f4_local2, f4_local3 )
				f4_local1 = f2_arg0.Settings
				f4_local2 = f4_local1
				f4_local1 = f4_local1.SetAlpha
				if f4_local0 then
					f4_local3 = 0.5
					if not f4_local3 then
					
					else
						f4_local1( f4_local2, f4_local3 )
						f4_local1 = f2_arg0.Map
						f4_local2 = f4_local1
						f4_local1 = f4_local1.SetAlpha
						if f4_local0 then
							f4_local3 = 0.5
							if not f4_local3 then
							
							else
								f4_local1( f4_local2, f4_local3 )
								if f2_arg0.currentGameType ~= "gun" then
									f4_local1 = f2_arg0.Loadout
									f4_local2 = f4_local1
									f4_local1 = f4_local1.SetAlpha
									if f4_local0 then
										f4_local3 = 0.5
										if not f4_local3 then
										
										else
											f4_local1( f4_local2, f4_local3 )
										end
									end
									f4_local3 = 1
								end
							end
						end
						f4_local3 = 1
					end
				end
				f4_local3 = 1
			end
		end
		f4_local3 = 1
	end )
end

function CodcasterToolbarMiddleButtons( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1320 * _1080p, 0, 115 * _1080p )
	self.id = "CodcasterToolbarMiddleButtons"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	self:SetSpacing( 5 )
	local QuickSettings = nil
	
	QuickSettings = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f5_local1
	} )
	QuickSettings.id = "QuickSettings"
	QuickSettings.ButtonIcon:SetLeft( _1080p * 0, 0 )
	QuickSettings.ButtonIcon:SetRight( _1080p * 52, 0 )
	QuickSettings.ButtonText:SetLeft( _1080p * 55, 0 )
	QuickSettings.ButtonText:SetRight( _1080p * 212, 0 )
	QuickSettings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 429.5, _1080p * 629.5, _1080p * 43, _1080p * 72 )
	self:addElement( QuickSettings )
	self.QuickSettings = QuickSettings
	
	local Settings = nil
	
	Settings = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f5_local1
	} )
	Settings.id = "Settings"
	Settings.ButtonIcon:SetLeft( _1080p * 0, 0 )
	Settings.ButtonIcon:SetRight( _1080p * 52, 0 )
	Settings.ButtonText:SetLeft( _1080p * 55, 0 )
	Settings.ButtonText:SetRight( _1080p * 212, 0 )
	Settings:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 434.5, _1080p * 634.5, _1080p * 43, _1080p * 72 )
	self:addElement( Settings )
	self.Settings = Settings
	
	local DisplayToolbar = nil
	
	DisplayToolbar = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f5_local1
	} )
	DisplayToolbar.id = "DisplayToolbar"
	DisplayToolbar.ButtonIcon:SetLeft( _1080p * 0, 0 )
	DisplayToolbar.ButtonIcon:SetRight( _1080p * 32, 0 )
	DisplayToolbar.ButtonText:SetLeft( _1080p * 35, 0 )
	DisplayToolbar.ButtonText:SetRight( _1080p * 192, 0 )
	DisplayToolbar:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 434.5, _1080p * 634.5, _1080p * 43, _1080p * 72 )
	self:addElement( DisplayToolbar )
	self.DisplayToolbar = DisplayToolbar
	
	local Map = nil
	
	Map = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f5_local1
	} )
	Map.id = "Map"
	Map.ButtonIcon:SetLeft( _1080p * 0, 0 )
	Map.ButtonIcon:SetRight( _1080p * 32, 0 )
	Map.ButtonText:SetLeft( _1080p * 35, 0 )
	Map.ButtonText:SetRight( _1080p * 192, 0 )
	Map:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 434.5, _1080p * 634.5, _1080p * 43, _1080p * 72 )
	self:addElement( Map )
	self.Map = Map
	
	local Loadout = nil
	
	Loadout = MenuBuilder.BuildRegisteredType( "CodcasterToolbarButton", {
		controllerIndex = f5_local1
	} )
	Loadout.id = "Loadout"
	Loadout.ButtonIcon:SetLeft( _1080p * 0, 0 )
	Loadout.ButtonIcon:SetRight( _1080p * 32, 0 )
	Loadout.ButtonText:SetLeft( _1080p * 35, 0 )
	Loadout.ButtonText:SetRight( _1080p * 192, 0 )
	Loadout:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 434.5, _1080p * 634.5, _1080p * 43, _1080p * 72 )
	self:addElement( Loadout )
	self.Loadout = Loadout
	
	f0_local1( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "CodcasterToolbarMiddleButtons", CodcasterToolbarMiddleButtons )
LockTable( _M )
