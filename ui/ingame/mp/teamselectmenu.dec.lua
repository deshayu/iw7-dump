local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f1_arg0:addElement( self )
	if GameX.IsSplitscreen() then
		f1_arg0.GameDetails:SetLeft( _1080p * -1346, 0 )
	end
end

function TeamSelectMenu( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self.id = "TeamSelectMenu"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local f2_local3 = nil
	if not Engine.InFrontend() then
		f2_local3 = LUI.UIImage.new()
		f2_local3.id = "Background"
		f2_local3:SetRGBFromInt( 0, 0 )
		f2_local3:SetAlpha( 0.5, 0 )
		self:addElement( f2_local3 )
		self.Background = f2_local3
	end
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MenuTitle = nil
	
	MenuTitle = MenuBuilder.BuildRegisteredType( "MenuTitle", {
		controllerIndex = f2_local1
	} )
	MenuTitle.id = "MenuTitle"
	MenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_CHANGE_TEAM_CAPS" ), 0 )
	MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	MenuTitle.Icon:SetTop( _1080p * -28.5, 0 )
	MenuTitle.Icon:SetBottom( _1080p * 61.5, 0 )
	MenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( MenuTitle )
	self.MenuTitle = MenuTitle
	
	local f2_local6 = nil
	if CONDITIONS.IsFriendsButtonAccessible( self, f2_local1 ) then
		f2_local6 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f2_local1
		} )
		f2_local6.id = "FriendsElement"
		f2_local6:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f2_local6:SetAlignment( LUI.Alignment.Left )
		f2_local6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1420, _1080p * 1920, _1080p * 1035, _1080p * 1080 )
		self:addElement( f2_local6 )
		self.FriendsElement = f2_local6
	end
	local GameDetails = nil
	
	GameDetails = MenuBuilder.BuildRegisteredType( "GameDetails", {
		controllerIndex = f2_local1
	} )
	GameDetails.id = "GameDetails"
	GameDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1024, 0, _1080p * 216, _1080p * 891 )
	self:addElement( GameDetails )
	self.GameDetails = GameDetails
	
	local TeamSelectButtons = nil
	
	TeamSelectButtons = MenuBuilder.BuildRegisteredType( "TeamSelectMenuButtons", {
		controllerIndex = f2_local1
	} )
	TeamSelectButtons.id = "TeamSelectButtons"
	TeamSelectButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 848, _1080p * 216, _1080p * 949 )
	self:addElement( TeamSelectButtons )
	self.TeamSelectButtons = TeamSelectButtons
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		GameDetails:RegisterAnimationSequence( "Splitscreen", {
			{
				function ()
					return self.GameDetails:SetScale( -0.25, 0 )
				end
			},
			{
				function ()
					return self.GameDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1019, _1080p * 31.6, _1080p * -20, _1080p * 635, 0 )
				end
			}
		} )
		self._sequences.Splitscreen = function ()
			GameDetails:AnimateSequence( "Splitscreen" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f8_arg0, f8_arg1 )
		f8_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f8_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		local f9_local0 = f9_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.bindButton:addEventHandler( "button_start", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f2_local1, controller )
	if CONDITIONS.IsSplitscreen( self ) then
		ACTIONS.AnimateSequence( self, "Splitscreen" )
	end
	return self
end

MenuBuilder.registerType( "TeamSelectMenu", TeamSelectMenu )
LockTable( _M )
