local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Players )
	SCOREBOARD.SetupScoreboard( f1_arg0, {
		numPlayersFunction = function ( f2_arg0 )
			return Game.GetCPNumScoreboardPlayers()
		end
	} )
	f1_arg0:SetTeam( Teams.allies )
	local self = LUI.UITimer.new( nil, {
		interval = 1000,
		event = "refreshScores"
	} )
	self.id = "ScoreboardTimer"
	f1_arg0:addElement( self )
	f1_arg0:registerEventHandler( "refreshScores", function ( element, event )
		element:RefreshRows()
		element.ButtonHelperBar:SetTop( _1080p * (element:GetNumPlayers() * 68 + 24), 0 )
	end )
	f1_arg0:addEventHandler( "open_scoreboard", function ( f4_arg0, f4_arg1 )
		if not f4_arg0.buttonHelpersAdded then
			local f4_local0 = "button_primary"
			if Engine.IsPC() then
				f4_local0 = "button_alt1"
			end
			f4_arg0:AddButtonHelperTextToElement( f4_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "SPEECH_MUTE_UNMUTE" ),
				button_ref = f4_local0,
				side = "right",
				priority = 0,
				clickable = false
			} )
			if Engine.IsConsoleGame() and not CONDITIONS.IsSystemLink( f1_arg0 ) then
				f4_arg0:AddButtonHelperTextToElement( f4_arg0.ButtonHelperBar, {
					helper_text = Engine.Localize( "XBOXLIVE_VIEW_PROFILE" ),
					button_ref = "button_start",
					side = "right",
					priority = 10,
					clickable = false
				} )
			end
			f4_arg0.buttonHelpersAdded = true
		elseif Engine.IsPC() then
			f1_arg0:RemoveButtonHelperTextFromElement( f1_arg0.ButtonHelperBar, "button_alt1", "right" )
			f1_arg0:AddButtonHelperTextToElement( f1_arg0.ButtonHelperBar, {
				helper_text = Engine.Localize( "SPEECH_MUTE_UNMUTE" ),
				button_ref = "button_alt1",
				side = "right",
				priority = 0,
				clickable = false
			} )
		end
		ACTIONS.GainFocus( f1_arg0, "Players", f1_arg1 )
		f1_arg0:processEvent( {
			name = "refreshScores"
		} )
	end )
	f1_arg0:addEventHandler( "close_scoreboard", function ( f5_arg0, f5_arg1 )
		ACTIONS.LoseFocus( f1_arg0, "Players", f1_arg1 )
	end )
	f1_arg0:SetDefaultFocusFunction( function ()
		local f6_local0 = f1_arg0:GetMyRowIndex()
		if f6_local0 then
			return {
				x = 0,
				y = f6_local0
			}
		else
			
		end
	end )
	f1_arg0:addEventHandler( "gamepad_button", function ( f7_arg0, f7_arg1 )
		return f1_arg0.Players:ProcessEventToChildInFocus( f7_arg1 )
	end )
end

function ZomScoreboard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1067 * _1080p, 0, 392 * _1080p )
	self.id = "ZomScoreboard"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local pinkGradiant = nil
	
	pinkGradiant = LUI.UIImage.new()
	pinkGradiant.id = "pinkGradiant"
	pinkGradiant:setImage( RegisterMaterial( "cp_zmb_inventory_pink_gradient_bg" ), 0 )
	pinkGradiant:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1067, 0, _1080p * 23.56 )
	self:addElement( pinkGradiant )
	self.pinkGradiant = pinkGradiant
	
	local headhsotIcon = nil
	
	headhsotIcon = LUI.UIImage.new()
	headhsotIcon.id = "headhsotIcon"
	headhsotIcon:setImage( RegisterMaterial( "category_icon_headshots" ), 0 )
	headhsotIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 784, _1080p * 863, _1080p * -39.5, _1080p * 39.5 )
	self:addElement( headhsotIcon )
	self.headhsotIcon = headhsotIcon
	
	local reviveIcon = nil
	
	reviveIcon = LUI.UIImage.new()
	reviveIcon.id = "reviveIcon"
	reviveIcon:setImage( RegisterMaterial( "category_icon_revives" ), 0 )
	reviveIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 891, _1080p * 970, _1080p * -39.5, _1080p * 39.5 )
	self:addElement( reviveIcon )
	self.reviveIcon = reviveIcon
	
	local downsIcon = nil
	
	downsIcon = LUI.UIImage.new()
	downsIcon.id = "downsIcon"
	downsIcon:setImage( RegisterMaterial( "category_icon_downs" ), 0 )
	downsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 978, _1080p * 1057, _1080p * -39.5, _1080p * 39.5 )
	self:addElement( downsIcon )
	self.downsIcon = downsIcon
	
	local killsIcon = nil
	
	killsIcon = LUI.UIImage.new()
	killsIcon.id = "killsIcon"
	killsIcon:setImage( RegisterMaterial( "category_icon_kills" ), 0 )
	killsIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 652, _1080p * 731, _1080p * -39.5, _1080p * 39.5 )
	self:addElement( killsIcon )
	self.killsIcon = killsIcon
	
	local scoreIcon = nil
	
	scoreIcon = LUI.UIImage.new()
	scoreIcon.id = "scoreIcon"
	scoreIcon:setImage( RegisterMaterial( "category_icon_survivors" ), 0 )
	scoreIcon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 524, _1080p * 603, _1080p * -39.5, _1080p * 39.5 )
	self:addElement( scoreIcon )
	self.scoreIcon = scoreIcon
	
	local Players = nil
	
	Players = LUI.UIGrid.new( nil, {
		maxVisibleColumns = 1,
		maxVisibleRows = 4,
		controllerIndex = f8_local1,
		buildChild = function ()
			return MenuBuilder.BuildRegisteredType( "ZMPlayersScoreboard", {
				controllerIndex = f8_local1
			} )
		end,
		refreshChild = function ( f10_arg0, f10_arg1, f10_arg2 )
			
		end,
		numRows = 4,
		numColumns = 1,
		wrapX = false,
		wrapY = true,
		spacingX = _1080p * 8,
		spacingY = _1080p * 8,
		columnWidth = _1080p * 1746,
		rowHeight = _1080p * 103,
		scrollingThresholdX = 1,
		scrollingThresholdY = 1,
		horizontalAlignment = LUI.Alignment.Left,
		verticalAlignment = LUI.Alignment.Top,
		springCoefficient = 400,
		maxVelocity = 5000
	} )
	Players.id = "Players"
	Players:SetScale( -0.39, 0 )
	Players:setUseStencil( false )
	Players:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -340.47, _1080p * 1405.53, _1080p * -51.52, _1080p * 384.48 )
	self:addElement( Players )
	self.Players = Players
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f8_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1067, _1080p * 307.48, _1080p * 377.48 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	f0_local0( self, f8_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ButtonHelperBar",
		sequenceName = "HideNotButtons",
		elementPath = "ButtonHelperBar"
	} )
	return self
end

MenuBuilder.registerType( "ZomScoreboard", ZomScoreboard )
LockTable( _M )
