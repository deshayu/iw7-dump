local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.DisableLetterboxForMenu( "MostWantedCardsBoard" )
LUI.FlowManager.DisableMousePointerForMenu( "MostWantedCardsBoard" )
LUI.FlowManager.AlwaysVisibleForMenu( "MostWantedCardsBoard" )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	assert( f1_arg1 )
	if f1_arg4 then
		f1_arg1.navigation = f1_arg4
	end
	f1_arg1:addEventHandler( "button_over", function ( f2_arg0, f2_arg1 )
		local f2_local0 = DataSources.inGame.SP.shipCrib.mostWantedList:GetDataSourceAtIndex( f1_arg2, f1_arg3 )
		assert( f2_local0 )
		f1_arg0.CurrentCardDataSource = f2_local0
		f1_arg0.CardDetails:SetDataSource( f2_local0, f1_arg3 )
		f1_arg0.HoverInfo:SetDataSource( f2_local0, f1_arg3 )
	end )
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0.detailsMode then
		ACTIONS.AnimateSequence( f3_arg0, "fadeOutPopup" )
		ACTIONS.ScriptNotify( "deactivate", 1 )
		f3_arg0.detailsMode = false
		Engine.PlaySound( CoD.SFX.SelectBack )
	else
		ACTIONS.AnimateSequence( f3_arg0, "fadeInPopup" )
		ACTIONS.AnimateSequenceByElement( f3_arg0, {
			elementName = "CardDetails",
			sequenceName = "RefreshData",
			elementPath = "CardDetails"
		} )
		ACTIONS.ScriptNotify( "activate", 1 )
		f3_arg0.detailsMode = true
		if f3_arg0.CurrentCardDataSource ~= nil then
			local f3_local0 = f3_arg0.CurrentCardDataSource.state:GetValue( f3_arg2 )
			if f3_local0 == ShipCribUtils.MostWantedStates.OBTAINED then
				f3_arg0.CurrentCardDataSource.state:SetValue( f3_arg2, ShipCribUtils.MostWantedStates.VIEWED )
			elseif string.find( f3_local0, "intelObtained" ) then
				f3_arg0.CurrentCardDataSource.state:SetValue( f3_arg2, "intelViewed_" .. string.sub( f3_local0, 15 ) )
			end
		end
	end
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	if f4_arg0.detailsMode then
		ACTIONS.AnimateSequence( f4_arg0, "fadeOutPopup" )
		ACTIONS.ScriptNotify( "deactivate", 1 )
		f4_arg0.detailsMode = false
		Engine.PlaySound( CoD.SFX.SelectBack )
	else
		ACTIONS.LeaveMenuByName( "MostWantedCardsBoard" )
		ACTIONS.ScriptNotify( "most_wanted_board_exit", 1 )
		Engine.SetDvarString( "ui_most_wanted_selection", "salenkoch" )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1, f5_arg2 )
	assert( f5_arg0.CardDetails )
	assert( f5_arg0.HoverInfo )
	f5_arg0:SetHandleMouseButton( false )
	f5_arg0.processEvent = function ( f6_arg0, f6_arg1 )
		if f6_arg1.name == "mouseup" then
			if f6_arg1.button == "left" then
				LUI.UIElement.processEvent( f6_arg0, {
					name = "gamepad_button",
					button = "primary",
					qualifier = "keyboard",
					down = true,
					controller = f6_arg1.controller
				} )
			elseif f6_arg1.button == "right" then
				f6_arg0:processEvent( {
					name = "button_secondary",
					controller = f5_arg1
				} )
			end
			return true
		elseif f6_arg1.name ~= "mousemove" and f6_arg1.name ~= "mousedown" then
			return LUI.UIElement.processEvent( f6_arg0, f6_arg1 )
		else
			
		end
	end
	
	f5_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		if event.qualifier == "mousewheel" then
			return true
		elseif Engine.IsPC() then
			if event.button == "w" then
				event.button = "up"
			elseif event.button == "s" then
				event.button = "down"
			elseif event.button == "shoulderl" then
				event.button = "left"
			elseif event.button == "shoulderr" then
				event.button = "right"
			end
		end
		return false
	end )
	f0_local0( f5_arg0, f5_arg0.acepilot0, 0, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot1, 1, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot2, 2, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot3, 3, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot4, 4, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot5, 5, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot6, 6, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot7, 7, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot8, 8, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot9, 9, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot10, 10, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot11, 11, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot12, 12, f5_arg1, {
		left = f5_arg0.captain9,
		up = f5_arg0.acepilot8,
		right = f5_arg0.acepilot13,
		down = f5_arg0.acepilot16
	} )
	f0_local0( f5_arg0, f5_arg0.acepilot13, 13, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot14, 14, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot15, 15, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot16, 16, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot17, 17, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot18, 18, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.acepilot19, 19, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain0, 20, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain1, 21, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain2, 22, f5_arg1, {
		up = f5_arg0.captain0,
		right = f5_arg0.captain3,
		down = f5_arg0.captain6
	} )
	f0_local0( f5_arg0, f5_arg0.captain3, 23, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain4, 24, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain5, 25, f5_arg1, {
		left = f5_arg0.captain4,
		up = f5_arg0.captain1,
		right = f5_arg0.acepilot8,
		down = f5_arg0.captain9
	} )
	f0_local0( f5_arg0, f5_arg0.captain6, 26, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain7, 27, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain8, 28, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.captain9, 29, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.salenKoch, 30, f5_arg1 )
	f0_local0( f5_arg0, f5_arg0.riah, 31, f5_arg1 )
	f5_arg0.bindButton:addEventHandler( "button_primary", function ( f8_arg0, f8_arg1 )
		f0_local1( f5_arg0, f8_arg0, f5_arg1 )
	end )
	f5_arg0.bindButton:addEventHandler( "button_secondary", function ( f9_arg0, f9_arg1 )
		f0_local2( f5_arg0, f9_arg0, f5_arg1 )
	end )
	f5_arg0.bindButton:addEventHandler( "button_start", function ( f10_arg0, f10_arg1 )
		ACTIONS.PauseGame( f10_arg0, true )
	end )
	local f5_local0 = {
		[#f5_local0 + 1] = "salenKoch",
		[#f5_local0 + 1] = "riah",
		[#f5_local0 + 1] = "captain0",
		[#f5_local0 + 1] = "captain1",
		[#f5_local0 + 1] = "captain2",
		[#f5_local0 + 1] = "captain3",
		[#f5_local0 + 1] = "captain4",
		[#f5_local0 + 1] = "captain5",
		[#f5_local0 + 1] = "captain6",
		[#f5_local0 + 1] = "captain7",
		[#f5_local0 + 1] = "captain8",
		[#f5_local0 + 1] = "captain9",
		[#f5_local0 + 1] = "acepilot0",
		[#f5_local0 + 1] = "acepilot1",
		[#f5_local0 + 1] = "acepilot2",
		[#f5_local0 + 1] = "acepilot3",
		[#f5_local0 + 1] = "acepilot4",
		[#f5_local0 + 1] = "acepilot5",
		[#f5_local0 + 1] = "acepilot6",
		[#f5_local0 + 1] = "acepilot7",
		[#f5_local0 + 1] = "acepilot8",
		[#f5_local0 + 1] = "acepilot9",
		[#f5_local0 + 1] = "acepilot10",
		[#f5_local0 + 1] = "acepilot11",
		[#f5_local0 + 1] = "acepilot12",
		[#f5_local0 + 1] = "acepilot13",
		[#f5_local0 + 1] = "acepilot14",
		[#f5_local0 + 1] = "acepilot15",
		[#f5_local0 + 1] = "acepilot16",
		[#f5_local0 + 1] = "acepilot17",
		[#f5_local0 + 1] = "acepilot18",
		[#f5_local0 + 1] = "acepilot19"
	}
	for f5_local1 = 1, #f5_local0, 1 do
		local f5_local4 = f5_local0[f5_local1]
		assert( f5_arg0[f5_local4] )
		f5_arg0[f5_local4]:addEventHandler( "button_over", function ( f11_arg0, f11_arg1 )
			if f5_local4 == "salenKoch" then
				f5_local4 = "salenkoch"
			end
			Engine.SetDvarString( "ui_most_wanted_selection", f5_local4 )
		end )
	end
end

function MostWantedCardsBoard( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MostWantedCardsBoard"
	self._animationSets = {}
	self._sequences = {}
	local f12_local1 = controller and controller.controllerIndex
	if not f12_local1 and not Engine.InFrontend() then
		f12_local1 = self:getRootController()
	end
	assert( f12_local1 )
	self:playSound( "menu_open" )
	local f12_local2 = self
	local salenKoch = nil
	
	salenKoch = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	salenKoch.id = "salenKoch"
	salenKoch:SetAlpha( 0, 0 )
	salenKoch.Text:setText( "koch", 0 )
	salenKoch:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349, _1080p * 529, _1080p * 89.5, _1080p * 174.5 )
	self:addElement( salenKoch )
	self.salenKoch = salenKoch
	
	local riah = nil
	
	riah = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	riah.id = "riah"
	riah:SetAlpha( 0, 0 )
	riah.Text:setText( "riah", 0 )
	riah:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 737, _1080p * 89.5, _1080p * 174.5 )
	self:addElement( riah )
	self.riah = riah
	
	local captain0 = nil
	
	captain0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain0.id = "captain0"
	captain0:SetAlpha( 0, 0 )
	captain0.Text:setText( "c0", 0 )
	captain0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349, _1080p * 529, _1080p * 213.5, _1080p * 298.5 )
	self:addElement( captain0 )
	self.captain0 = captain0
	
	local captain1 = nil
	
	captain1 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain1.id = "captain1"
	captain1:SetAlpha( 0, 0 )
	captain1.Text:setText( "c1", 0 )
	captain1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 737, _1080p * 213.5, _1080p * 298.5 )
	self:addElement( captain1 )
	self.captain1 = captain1
	
	local captain2 = nil
	
	captain2 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain2.id = "captain2"
	captain2:SetAlpha( 0, 0 )
	captain2.Text:setText( "c2", 0 )
	captain2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133, _1080p * 313, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( captain2 )
	self.captain2 = captain2
	
	local captain3 = nil
	
	captain3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain3.id = "captain3"
	captain3:SetAlpha( 0, 0 )
	captain3.Text:setText( "c3", 0 )
	captain3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349, _1080p * 529, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( captain3 )
	self.captain3 = captain3
	
	local captain4 = nil
	
	captain4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain4.id = "captain4"
	captain4:SetAlpha( 0, 0 )
	captain4.Text:setText( "c4", 0 )
	captain4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 737, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( captain4 )
	self.captain4 = captain4
	
	local captain5 = nil
	
	captain5 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain5.id = "captain5"
	captain5:SetAlpha( 0, 0 )
	captain5.Text:setText( "c5", 0 )
	captain5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 763, _1080p * 943, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( captain5 )
	self.captain5 = captain5
	
	local captain6 = nil
	
	captain6 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain6.id = "captain6"
	captain6:SetAlpha( 0, 0 )
	captain6.Text:setText( "c6", 0 )
	captain6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 133, _1080p * 313, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( captain6 )
	self.captain6 = captain6
	
	local captain7 = nil
	
	captain7 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain7.id = "captain7"
	captain7:SetAlpha( 0, 0 )
	captain7.Text:setText( "c7", 0 )
	captain7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 349, _1080p * 529, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( captain7 )
	self.captain7 = captain7
	
	local captain8 = nil
	
	captain8 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain8.id = "captain8"
	captain8:SetAlpha( 0, 0 )
	captain8.Text:setText( "c8", 0 )
	captain8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 557, _1080p * 737, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( captain8 )
	self.captain8 = captain8
	
	local captain9 = nil
	
	captain9 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	captain9.id = "captain9"
	captain9:SetAlpha( 0, 0 )
	captain9.Text:setText( "c9", 0 )
	captain9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 763, _1080p * 943, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( captain9 )
	self.captain9 = captain9
	
	local acepilot0 = nil
	
	acepilot0 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot0.id = "acepilot0"
	acepilot0:SetAlpha( 0, 0 )
	acepilot0.Text:setText( "a0", 0 )
	acepilot0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 974, _1080p * 1154, _1080p * 89.5, _1080p * 174.5 )
	self:addElement( acepilot0 )
	self.acepilot0 = acepilot0
	
	local acepilot1 = nil
	
	acepilot1 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot1.id = "acepilot1"
	acepilot1:SetAlpha( 0, 0 )
	acepilot1.Text:setText( "a1", 0 )
	acepilot1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1188, _1080p * 1368, _1080p * 89.5, _1080p * 174.5 )
	self:addElement( acepilot1 )
	self.acepilot1 = acepilot1
	
	local acepilot2 = nil
	
	acepilot2 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot2.id = "acepilot2"
	acepilot2:SetAlpha( 0, 0 )
	acepilot2.Text:setText( "a2", 0 )
	acepilot2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1400, _1080p * 1580, _1080p * 89.5, _1080p * 174.5 )
	self:addElement( acepilot2 )
	self.acepilot2 = acepilot2
	
	local acepilot3 = nil
	
	acepilot3 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot3.id = "acepilot3"
	acepilot3:SetAlpha( 0, 0 )
	acepilot3.Text:setText( "a3", 0 )
	acepilot3:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1612, _1080p * 1792, _1080p * 89.5, _1080p * 174.5 )
	self:addElement( acepilot3 )
	self.acepilot3 = acepilot3
	
	local acepilot4 = nil
	
	acepilot4 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot4.id = "acepilot4"
	acepilot4:SetAlpha( 0, 0 )
	acepilot4.Text:setText( "a4", 0 )
	acepilot4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 974, _1080p * 1154, _1080p * 213.5, _1080p * 298.5 )
	self:addElement( acepilot4 )
	self.acepilot4 = acepilot4
	
	local acepilot5 = nil
	
	acepilot5 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot5.id = "acepilot5"
	acepilot5:SetAlpha( 0, 0 )
	acepilot5.Text:setText( "a5", 0 )
	acepilot5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1188, _1080p * 1368, _1080p * 213.5, _1080p * 298.5 )
	self:addElement( acepilot5 )
	self.acepilot5 = acepilot5
	
	local acepilot6 = nil
	
	acepilot6 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot6.id = "acepilot6"
	acepilot6:SetAlpha( 0, 0 )
	acepilot6.Text:setText( "a6", 0 )
	acepilot6:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1400, _1080p * 1580, _1080p * 213.5, _1080p * 298.5 )
	self:addElement( acepilot6 )
	self.acepilot6 = acepilot6
	
	local acepilot7 = nil
	
	acepilot7 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot7.id = "acepilot7"
	acepilot7:SetAlpha( 0, 0 )
	acepilot7.Text:setText( "a7", 0 )
	acepilot7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1612, _1080p * 1792, _1080p * 213.5, _1080p * 298.5 )
	self:addElement( acepilot7 )
	self.acepilot7 = acepilot7
	
	local acepilot8 = nil
	
	acepilot8 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot8.id = "acepilot8"
	acepilot8:SetAlpha( 0, 0 )
	acepilot8.Text:setText( "a8", 0 )
	acepilot8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 974, _1080p * 1154, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( acepilot8 )
	self.acepilot8 = acepilot8
	
	local acepilot9 = nil
	
	acepilot9 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot9.id = "acepilot9"
	acepilot9:SetAlpha( 0, 0 )
	acepilot9.Text:setText( "a9", 0 )
	acepilot9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1188, _1080p * 1368, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( acepilot9 )
	self.acepilot9 = acepilot9
	
	local acepilot10 = nil
	
	acepilot10 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot10.id = "acepilot10"
	acepilot10:SetAlpha( 0, 0 )
	acepilot10.Text:setText( "a10", 0 )
	acepilot10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1400, _1080p * 1580, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( acepilot10 )
	self.acepilot10 = acepilot10
	
	local acepilot11 = nil
	
	acepilot11 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot11.id = "acepilot11"
	acepilot11:SetAlpha( 0, 0 )
	acepilot11.Text:setText( "a11", 0 )
	acepilot11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1612, _1080p * 1792, _1080p * 327.5, _1080p * 412.5 )
	self:addElement( acepilot11 )
	self.acepilot11 = acepilot11
	
	local acepilot12 = nil
	
	acepilot12 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot12.id = "acepilot12"
	acepilot12:SetAlpha( 0, 0 )
	acepilot12.Text:setText( "a12", 0 )
	acepilot12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 974, _1080p * 1154, _1080p * 441.5, _1080p * 526.5 )
	self:addElement( acepilot12 )
	self.acepilot12 = acepilot12
	
	local acepilot13 = nil
	
	acepilot13 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot13.id = "acepilot13"
	acepilot13:SetAlpha( 0, 0 )
	acepilot13.Text:setText( "a13", 0 )
	acepilot13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1188, _1080p * 1368, _1080p * 441.5, _1080p * 526.5 )
	self:addElement( acepilot13 )
	self.acepilot13 = acepilot13
	
	local acepilot14 = nil
	
	acepilot14 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot14.id = "acepilot14"
	acepilot14:SetAlpha( 0, 0 )
	acepilot14.Text:setText( "a14", 0 )
	acepilot14:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1400, _1080p * 1580, _1080p * 441.5, _1080p * 526.5 )
	self:addElement( acepilot14 )
	self.acepilot14 = acepilot14
	
	local acepilot15 = nil
	
	acepilot15 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot15.id = "acepilot15"
	acepilot15:SetAlpha( 0, 0 )
	acepilot15.Text:setText( "a15", 0 )
	acepilot15:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1612, _1080p * 1792, _1080p * 441.5, _1080p * 526.5 )
	self:addElement( acepilot15 )
	self.acepilot15 = acepilot15
	
	local acepilot16 = nil
	
	acepilot16 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot16.id = "acepilot16"
	acepilot16:SetAlpha( 0, 0 )
	acepilot16.Text:setText( "a16", 0 )
	acepilot16:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 974, _1080p * 1154, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( acepilot16 )
	self.acepilot16 = acepilot16
	
	local acepilot17 = nil
	
	acepilot17 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot17.id = "acepilot17"
	acepilot17:SetAlpha( 0, 0 )
	acepilot17.Text:setText( "a17", 0 )
	acepilot17:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1188, _1080p * 1368, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( acepilot17 )
	self.acepilot17 = acepilot17
	
	local acepilot18 = nil
	
	acepilot18 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot18.id = "acepilot18"
	acepilot18:SetAlpha( 0, 0 )
	acepilot18.Text:setText( "a18", 0 )
	acepilot18:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1400, _1080p * 1580, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( acepilot18 )
	self.acepilot18 = acepilot18
	
	local acepilot19 = nil
	
	acepilot19 = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f12_local1
	} )
	acepilot19.id = "acepilot19"
	acepilot19:SetAlpha( 0, 0 )
	acepilot19.Text:setText( "a19", 0 )
	acepilot19:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1612, _1080p * 1792, _1080p * 557.5, _1080p * 642.5 )
	self:addElement( acepilot19 )
	self.acepilot19 = acepilot19
	
	local CardDetails = nil
	
	CardDetails = MenuBuilder.BuildRegisteredType( "mostWantedCardsBoardWidget", {
		controllerIndex = f12_local1
	} )
	CardDetails.id = "CardDetails"
	CardDetails:SetAlpha( 0, 0 )
	CardDetails:SetYRotation( -12, 0 )
	CardDetails:SetDotPitchEnabled( true )
	CardDetails:SetDotPitchX( 0, 0 )
	CardDetails:SetDotPitchY( 0, 0 )
	CardDetails:SetDotPitchContrast( 0, 0 )
	CardDetails:SetDotPitchMode( 0 )
	CardDetails:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -1196, _1080p * -196, _1080p * 150, _1080p * 930 )
	self:addElement( CardDetails )
	self.CardDetails = CardDetails
	
	local HoverInfo = nil
	
	HoverInfo = MenuBuilder.BuildRegisteredType( "MostWantedHoverInfo", {
		controllerIndex = f12_local1
	} )
	HoverInfo.id = "HoverInfo"
	HoverInfo:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 464, _1080p * 864, _1080p * 286, _1080p * 456 )
	self:addElement( HoverInfo )
	self.HoverInfo = HoverInfo
	
	local MostWantedTutorial = nil
	
	MostWantedTutorial = MenuBuilder.BuildRegisteredType( "TutorialMessage", {
		controllerIndex = f12_local1
	} )
	MostWantedTutorial.id = "MostWantedTutorial"
	MostWantedTutorial:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 343, _1080p * 1543, _1080p * 192.75, _1080p * 223.25 )
	self:addElement( MostWantedTutorial )
	self.MostWantedTutorial = MostWantedTutorial
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CardDetails:RegisterAnimationSequence( "fadeInPopup", {
			{
				function ()
					return self.CardDetails:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 1, 60 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 0, 70 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 1, 60 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 0, 30 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 1, 30 )
				end
			},
			{
				function ()
					return self.CardDetails:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.CardDetails:SetDotPitchX( 52, 190 )
				end,
				function ()
					return self.CardDetails:SetDotPitchX( 0, 60 )
				end
			},
			{
				function ()
					return self.CardDetails:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.CardDetails:SetDotPitchY( 43, 190 )
				end,
				function ()
					return self.CardDetails:SetDotPitchY( 0, 60 )
				end
			},
			{
				function ()
					return self.CardDetails:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.CardDetails:SetDotPitchContrast( 0.8, 190 )
				end,
				function ()
					return self.CardDetails:SetDotPitchContrast( 0, 60 )
				end
			}
		} )
		HoverInfo:RegisterAnimationSequence( "fadeInPopup", {
			{
				function ()
					return self.HoverInfo:SetAlpha( 1, 0 )
				end,
				function ()
					return self.HoverInfo:SetAlpha( 0, 250 )
				end
			}
		} )
		MostWantedTutorial:RegisterAnimationSequence( "fadeInPopup", {
			{
				function ()
					return self.MostWantedTutorial:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MostWantedTutorial:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.fadeInPopup = function ()
			CardDetails:AnimateSequence( "fadeInPopup" )
			HoverInfo:AnimateSequence( "fadeInPopup" )
			MostWantedTutorial:AnimateSequence( "fadeInPopup" )
		end
		
		CardDetails:RegisterAnimationSequence( "fadeOutPopup", {
			{
				function ()
					return self.CardDetails:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 0, 60 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 1, 70 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 0, 60 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 1, 30 )
				end,
				function ()
					return self.CardDetails:SetAlpha( 0, 30 )
				end
			},
			{
				function ()
					return self.CardDetails:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.CardDetails:SetDotPitchX( 52, 190 )
				end,
				function ()
					return self.CardDetails:SetDotPitchX( 0, 60 )
				end
			},
			{
				function ()
					return self.CardDetails:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.CardDetails:SetDotPitchY( 43, 190 )
				end,
				function ()
					return self.CardDetails:SetDotPitchY( 0, 60 )
				end
			},
			{
				function ()
					return self.CardDetails:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.CardDetails:SetDotPitchContrast( 0.8, 190 )
				end
			}
		} )
		HoverInfo:RegisterAnimationSequence( "fadeOutPopup", {
			{
				function ()
					return self.HoverInfo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HoverInfo:SetAlpha( 1, 250 )
				end
			}
		} )
		MostWantedTutorial:RegisterAnimationSequence( "fadeOutPopup", {
			{
				function ()
					return self.MostWantedTutorial:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MostWantedTutorial:SetAlpha( 1, 250 )
				end
			}
		} )
		self._sequences.fadeOutPopup = function ()
			CardDetails:AnimateSequence( "fadeOutPopup" )
			HoverInfo:AnimateSequence( "fadeOutPopup" )
			MostWantedTutorial:AnimateSequence( "fadeOutPopup" )
		end
		
		HoverInfo:RegisterAnimationSequence( "fadeInHoverWidget", {
			{
				function ()
					return self.HoverInfo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.HoverInfo:SetAlpha( 0, 350 )
				end,
				function ()
					return self.HoverInfo:SetAlpha( 1, 450 )
				end
			}
		} )
		MostWantedTutorial:RegisterAnimationSequence( "fadeInHoverWidget", {
			{
				function ()
					return self.MostWantedTutorial:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MostWantedTutorial:SetAlpha( 0, 350 )
				end,
				function ()
					return self.MostWantedTutorial:SetAlpha( 1, 450 )
				end
			}
		} )
		self._sequences.fadeInHoverWidget = function ()
			HoverInfo:AnimateSequence( "fadeInHoverWidget" )
			MostWantedTutorial:AnimateSequence( "fadeInHoverWidget" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	salenKoch.navigation = {
		right = riah,
		down = captain0
	}
	riah.navigation = {
		left = salenKoch,
		right = acepilot0,
		down = captain1
	}
	captain0.navigation = {
		up = salenKoch,
		right = captain1,
		down = captain3
	}
	captain1.navigation = {
		left = captain0,
		up = riah,
		right = acepilot4,
		down = captain4
	}
	captain2.navigation = {
		right = captain3,
		down = captain6
	}
	captain3.navigation = {
		left = captain2,
		up = captain0,
		right = captain4,
		down = captain7
	}
	captain4.navigation = {
		left = captain3,
		up = captain1,
		right = captain5,
		down = captain8
	}
	captain5.navigation = {
		left = captain4,
		right = acepilot8,
		down = captain9
	}
	captain6.navigation = {
		up = captain2,
		right = captain7
	}
	captain7.navigation = {
		left = captain6,
		up = captain3,
		right = captain8
	}
	captain8.navigation = {
		left = captain7,
		up = captain4,
		right = captain9
	}
	captain9.navigation = {
		left = captain8,
		up = captain5,
		right = acepilot16
	}
	acepilot0.navigation = {
		left = riah,
		right = acepilot1,
		down = acepilot4
	}
	acepilot1.navigation = {
		left = acepilot0,
		right = acepilot2,
		down = acepilot5
	}
	acepilot2.navigation = {
		left = acepilot1,
		right = acepilot3,
		down = acepilot6
	}
	acepilot3.navigation = {
		left = acepilot2,
		down = acepilot7
	}
	acepilot4.navigation = {
		left = captain1,
		up = acepilot0,
		right = acepilot5,
		down = acepilot8
	}
	acepilot5.navigation = {
		left = acepilot4,
		up = acepilot1,
		right = acepilot6,
		down = acepilot9
	}
	acepilot6.navigation = {
		left = acepilot5,
		up = acepilot2,
		right = acepilot7,
		down = acepilot10
	}
	acepilot7.navigation = {
		left = acepilot6,
		up = acepilot3,
		down = acepilot11
	}
	acepilot8.navigation = {
		left = captain5,
		up = acepilot4,
		right = acepilot9,
		down = acepilot12
	}
	acepilot9.navigation = {
		left = acepilot8,
		up = acepilot5,
		right = acepilot10,
		down = acepilot13
	}
	acepilot10.navigation = {
		left = acepilot9,
		up = acepilot6,
		right = acepilot11,
		down = acepilot14
	}
	acepilot11.navigation = {
		left = acepilot10,
		up = acepilot7,
		down = acepilot15
	}
	acepilot12.navigation = {
		up = acepilot8,
		right = acepilot13,
		down = acepilot16
	}
	acepilot13.navigation = {
		left = acepilot12,
		up = acepilot9,
		right = acepilot14,
		down = acepilot17
	}
	acepilot14.navigation = {
		left = acepilot13,
		up = acepilot10,
		right = acepilot15,
		down = acepilot18
	}
	acepilot15.navigation = {
		left = acepilot14,
		up = acepilot11,
		down = acepilot19
	}
	acepilot16.navigation = {
		left = captain9,
		up = acepilot12,
		right = acepilot17
	}
	acepilot17.navigation = {
		left = acepilot16,
		up = acepilot13,
		right = acepilot18
	}
	acepilot18.navigation = {
		left = acepilot17,
		up = acepilot14,
		right = acepilot19
	}
	acepilot19.navigation = {
		left = acepilot18,
		up = acepilot15
	}
	self.addButtonHelperFunction = function ( f61_arg0, f61_arg1 )
		f61_arg0:AddButtonHelperText( {
			helper_text = "close most wanted menu",
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
	
	f0_local3( self, f12_local1, controller )
	ACTIONS.PlaySoundSetSound( self, "action", false )
	ACTIONS.AnimateSequence( self, "fadeInHoverWidget" )
	return self
end

MenuBuilder.registerType( "MostWantedCardsBoard", MostWantedCardsBoard )
LockTable( _M )
