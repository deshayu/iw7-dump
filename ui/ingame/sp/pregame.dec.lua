local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	LUI.FlowManager.RequestCloseAllMenus()
	LUI.FlowManager.RequestLeaveMenu( f1_arg0, nil, true )
	if Engine.GetDvarBool( "com_loadingSavegame" ) then
		if not Engine.PlaySavedVideo() then
			Engine.StopMenuVideo()
		end
	else
		Engine.StopMenuVideo()
	end
	Engine.Unpause()
	Engine.SetDvarString( "preGameErrorMessage", "" )
	Engine.SetDvarBool( "cl_pregame", false )
	if Engine.IsSingleplayer() then
		f1_arg0:dispatchEventToRoot( {
			name = "pre_game_end"
		} )
	end
	PreGame.EndDuckAudio()
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MENU_ERROR" ),
		message = Engine.GetDvarString( "preGameErrorMessage" )
	} )
	f2_local0.id = "LoadErrorPopup"
	return f2_local0
end

MenuBuilder.registerType( "pre_game", function ( f3_arg0, f3_arg1 )
	local f3_local0 = Engine.GetDvarString( "preGameErrorMessage" )
	if f3_local0 and #f3_local0 > 0 then
		LUI.FlowManager.RequestPopupMenu( loadError, "LoadErrorPopup" )
	end
	local self = LUI.UIElement.new()
	self.id = "loadError"
	local f3_local2 = LUI.UIImage.new()
	f3_local2:setImage( RegisterMaterial( "cinematic" ) )
	f3_local2.id = "cinematic"
	self:addElement( f3_local2 )
	Engine.ResumeVideo()
	local f3_local3 = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		topAnchor = true,
		bottomAnchor = false,
		left = 40,
		top = 40,
		width = 560,
		height = 400
	} )
	f3_local3.id = "profileOwnerdraw"
	f3_local3:setupOwnerdraw( CoD.Ownerdraw.UILoadProfiling, 1, CoD.TextStyle.Shadowed )
	self:addElement( f3_local3 )
	local f3_local4 = LUI.UITimer.new( nil, {
		interval = 1,
		event = "pregame_poll"
	} )
	f3_local4.id = "timer"
	self:addElement( f3_local4 )
	self:registerEventHandler( "skip_bink_input", function ( element, event )
		element.userWantsToSkipBink = true
	end )
	self.startedTransitionSettle = false
	self.askedToPlayTransitionVideo = false
	self.isPlayingTransitionVideo = false
	self:registerEventHandler( "pregame_poll", function ( element, event )
		local f5_local0 = Game.GetOmnvar( "ui_client_settle_time" )
		local f5_local1 = not Engine.GetDvarBool( "com_loadingSavegame" )
		local f5_local2
		if f5_local0 <= 0 then
			f5_local2 = not f5_local1
		else
			f5_local2 = true
		end
		local f5_local3
		if f5_local2 then
			f5_local3 = element.startedTransitionSettle
			if f5_local3 then
				f5_local3 = not Engine.IsRunningTransitionSettleFrames()
			end
		else
			f5_local3 = true
		end
		local f5_local4 = not Engine.IsDoingSPHotLoad()
		local f5_local5 = element.userWantsToSkipBink or not Engine.IsPlayingStoryBink()
		local f5_local6 = not LUI.FlowManager.IsInStack( "LoadErrorPopup" )
		local f5_local7 = Engine.GetDvarBool( "unattended" )
		local f5_local8 = CONDITIONS.IsInCredits()
		local f5_local9 = f5_local5 and (f5_local7 or f5_local3 and f5_local6)
		local f5_local10 = Engine.GetDvarString( "start" )
		local f5_local11
		if f5_local10 and string.sub( f5_local10, 1, 1 ) ~= " " then
			f5_local11 = false
		else
			f5_local11 = true
		end
		if f5_local2 and f5_local0 == 0 then
			f5_local0 = 150
		end
		if f5_local4 then
			if Engine.IsInSPHotLoadBinkTransition() then
				if f5_local2 and not element.startedTransitionSettle then
					Engine.StartTransitionSettleFrames( f5_local0 )
					element.startedTransitionSettle = true
				elseif f5_local9 then
					f0_local0( element )
				end
			else
				local f5_local12 = Game.GetOmnvar( "ui_transition_movie" )
				local f5_local13 = f5_local12 ~= "none"
				local f5_local14 = f5_local7
				local f5_local15
				if f5_local11 and f5_local1 then
					f5_local15 = f5_local8
				else
					f5_local15 = f5_local14 or true
				end
				if not element.askedToPlayTransitionVideo and f5_local13 and not f5_local15 then
					PreGame.BeginDuckAudio()
					Engine.PlayMenuVideo( f5_local12, VideoPlaybackFlags.SYNCHRONOUS_TRANSITION, nil, true )
					element.askedToPlayTransitionVideo = true
				elseif f5_local2 and not element.startedTransitionSettle then
					Engine.StartTransitionSettleFrames( f5_local0 )
					element.startedTransitionSettle = true
				else
					local f5_local16 = Game.GetMapName() == "europa"
					local f5_local17
					if not f5_local13 then
						f5_local17 = not f5_local15
					else
						f5_local17 = false
					end
					local f5_local18 = f5_local17 or element.askedToPlayTransitionVideo
					local f5_local19 = Engine.GetMenuVideoName() == ""
					if element.askedToPlayTransitionVideo and not element.isPlayingTransitionVideo and f5_local12 == Engine.GetCurrentBink() then
						element.isPlayingTransitionVideo = true
					end
					if (element.isPlayingTransitionVideo or f5_local17) and Engine.IsCurrentBinkLoadFiller() then
						f5_local19 = true
					end
					if (f5_local7 or f5_local6) and (not f5_local18 or element.userWantsToSkipBink or f5_local19) and f5_local3 then
						f0_local0( element )
					end
				end
			end
			local f5_local12
			if not f5_local5 then
				f5_local12 = f5_local3
			else
				f5_local12 = false
			end
			if f5_local12 and not element.binkSkipPrompt then
				element.binkSkipPrompt = MenuBuilder.BuildRegisteredType( "BinkSkipPrompt", {
					onSkipInput = function ()
						element.userWantsToSkipBink = true
					end
				} )
				element.binkSkipPrompt.owner = element
				element:addElement( element.binkSkipPrompt )
			end
		end
	end )
	return self
end )
MenuBuilder.registerType( "LoadErrorPopup", f0_local1 )
LUI.FlowManager.AlwaysVisibleForMenu( "pre_game" )
LockTable( _M )
