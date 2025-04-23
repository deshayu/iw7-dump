local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 0
f0_local1 = 1
f0_local2 = 2
local f0_local3 = 3
local f0_local4 = 0
local f0_local5 = 1
local f0_local6 = 2
local f0_local7 = nil
local f0_local8 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = MLG.ShoutcasterProfileVarValue( f1_arg0, "shoutcaster_announcement" )
	if f1_local0 == f0_local0 then
		return true
	elseif f1_local0 == f0_local3 then
		return false
	elseif f1_arg1 == 0 and f1_local0 == f0_local1 then
		return true
	elseif f1_arg1 == 1 and f1_local0 == f0_local2 then
		return true
	else
		return false
	end
end

local f0_local9 = function ( f2_arg0, f2_arg1 )
	if f2_arg0 <= 0 then
		return nil
	elseif f2_arg1 == f0_local5 then
		if f2_arg0 == 1 then
			return "A"
		elseif f2_arg0 == 2 then
			return "B"
		elseif f2_arg0 == 3 then
			return "C"
		elseif f2_arg0 == 4 then
			return "D"
		else
			return nil
		end
	elseif f2_arg1 == f0_local6 then
		return Engine.Localize( Engine.TableLookupByRow( CSV.streaks.file, f2_arg0 + 1, CSV.streaks.cols.name ) )
	else
		return f2_arg0
	end
end

local f0_local10 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = f3_arg2
	local f3_local1 = -1
	if f3_local0 >= 1000000 then
		f3_local1 = math.modf( f3_local0 / 1000000 ) * 1000000
		f3_local0 = f3_arg2 - f3_local1
		f3_local1 = f3_local1 / 1000000 - 1
	end
	local f3_local2 = f3_local0
	local f3_local3 = -1
	if f3_local0 >= 10000 then
		f3_local3 = math.modf( f3_local0 / 10000 ) * 10000
		f3_local0 = f3_local2 - f3_local3
		f3_local3 = f3_local3 / 10000 - 1
	end
	local f3_local4 = f3_arg0.defaultTeamColor
	local f3_local5 = 1
	if f3_local0 >= 2000 then
		f3_local4 = CODCASTER.GetTeam2Color( f3_arg1 )
		f3_local0 = f3_local0 - 2000
		f3_local5 = 2
	elseif f3_local0 >= 1000 then
		f3_local4 = CODCASTER.GetTeam1Color( f3_arg1 )
		f3_local0 = f3_local0 - 1000
		f3_local5 = 1
	end
	return f3_local0, f3_local4, f3_local3, f3_local1, f3_local5
end

local f0_local11 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = MLG.ShoutcasterProfileVarBool( f4_arg1, "shoutcaster_qs_scorepanel" ) and 1 or 0
	local f4_local1 = f4_arg0
	local f4_local2 = f4_arg0.SetAlpha
	local f4_local3
	if f4_local0 == 1 then
		f4_local3 = 1
		if not f4_local3 then
		
		else
			f4_local2( f4_local1, f4_local3 )
			f4_local2 = LUI.CodcasterLayer.GetInstance()
			if f4_local2.isScoreboardOpen or f4_local2.isMinimapVisible then
				f4_arg0:SetAlpha( 0 )
			end
		end
	end
	f4_local3 = 0
end

local f0_local12 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4, f5_arg5, f5_arg6, f5_arg7 )
	local f5_local0 = Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f5_arg2, CSV.mlgAnnouncementTable.cols.stringRef )
	local f5_local1 = "Appear"
	if f5_arg7 then
		f5_local0 = DataSources.inGame.MP.hardpointCalloutAreaString:GetValue( f5_arg1 )
		f5_local1 = f5_local1 .. "WithoutSound"
	end
	local f5_local2 = math.floor( tonumber( Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f5_arg2, CSV.mlgAnnouncementTable.cols.displayTime ) ) * 1000 ) + 400
	f5_arg0.CodCasterAnnouncement:SetAlpha( 0 )
	f5_arg0.CodCasterAnnouncementSmall:SetAlpha( 0 )
	local f5_local3 = tonumber( Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f5_arg2, CSV.mlgAnnouncementTable.cols.type ) )
	local f5_local4 = f5_arg0.CodCasterAnnouncement
	if f5_local3 == 1 then
		f5_local4 = f5_arg0.CodCasterAnnouncementSmall
		f5_local1 = f5_local1 .. "Small"
	end
	local f5_local5 = f0_local9( f5_arg5, tonumber( Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f5_arg2, CSV.mlgAnnouncementTable.cols.parametertype ) ) )
	if f5_local5 then
		f5_local4.AnnouncementText:setText( Engine.Localize( f5_local0, f5_local5 ) )
	else
		f5_local4.AnnouncementText:setText( Engine.Localize( f5_local0 ) )
	end
	f5_local4.TeamColorImage:SetRGBFromInt( f5_arg3 )
	if f5_local4.PlayerText then
		if f5_arg4 >= 0 then
			local f5_local6 = Game.GetPlayerScoreInfo( f5_arg4 )
			f5_local4.PlayerText:setText( f5_local6.name )
		else
			f5_local4.PlayerText:setText( "" )
		end
	end
	f5_local4:SetAlpha( 1 )
	f5_local4.HighLightR:SetRGBFromInt( f5_arg3 )
	f5_local4.HighLightL:SetRGBFromInt( f5_arg3 )
	f5_arg0:SetAlpha( 1 )
	ACTIONS.AnimateSequence( f5_arg0, f5_local1 )
	local f5_local6 = nil
	if f5_local3 == 1 then
		if f5_local4.PlayerText:getText() == "" then
			f5_local6 = "Appear"
		else
			f5_local6 = "AppearWithPlayer"
		end
	elseif f5_arg6 == 1 then
		f5_local6 = "Team1Appear"
	else
		f5_local6 = "Team2Appear"
	end
	ACTIONS.AnimateSequence( f5_local4, f5_local6 )
	f5_arg0.announcementWaitTween = f5_arg0:Wait( f5_local2 )
	f5_arg0.announcementWaitTween.onComplete = f0_local7( f5_arg0, f5_arg1, f5_local3 )
	f0_local11( f5_arg0, f5_arg1 )
	f5_arg0:dispatchEventToRoot( {
		name = "codcaster_show_announcement",
		immediate = true,
		eventType = f5_local3
	} )
end

local f0_local13 = function ( f6_arg0, f6_arg1 )
	return function ()
		if f6_arg0.queueStart == nil then
			return 
		end
		local f7_local0, f7_local1, f7_local2, f7_local3, f7_local4 = f0_local10( f6_arg0, f6_arg1, f6_arg0.queueStart.event.value )
		f0_local12( f6_arg0, f6_arg1, f7_local0, f7_local1, f7_local2, f7_local3, f7_local4 )
		f6_arg0.queueStart = f6_arg0.queueStart.nextQueue
		if f6_arg0.queueStart == nil then
			f6_arg0.queue = nil
		end
	end
	
end

f0_local7 = function ( f8_arg0, f8_arg1, f8_arg2 )
	return function ()
		local f9_local0 = "Disappear"
		if f8_arg2 == 1 then
			f9_local0 = f9_local0 .. "Small"
		end
		ACTIONS.AnimateSequence( f8_arg0, f9_local0 )
		f8_arg0.announcementWaitTween = nil
		f8_arg0.lastPriority = -1
		local f9_local1 = f8_arg0:Wait( 200 )
		f9_local1.onComplete = f0_local13( f8_arg0, f8_arg1 )
		f8_arg0:dispatchEventToRoot( {
			name = "codcaster_hide_announcement",
			immediate = true,
			eventType = f8_arg2
		} )
	end
	
end

local f0_local14 = function ( f10_arg0 )
	return function ( f11_arg0, f11_arg1 )
		if f11_arg1.value == -1 then
			return 
		end
		local f11_local0, f11_local1, f11_local2, f11_local3, f11_local4 = f0_local10( f11_arg0, f10_arg0, f11_arg1.value )
		local f11_local5 = tonumber( Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f11_local0, CSV.mlgAnnouncementTable.cols.priority ) )
		if f11_local5 == nil then
			error( "LUI Error: invalid codcaster announcement ID " .. f11_local0 .. " event.value " .. f11_arg1.value )
			return 
		elseif not f0_local8( f10_arg0, tonumber( Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f11_local0, CSV.mlgAnnouncementTable.cols.type ) ) ) then
			return 
		elseif f11_local5 < f11_arg0.lastPriority or f11_local5 < 0 then
			return 
		elseif f11_arg0.lastPriority < f11_local5 then
			if f11_arg0.announcementWaitTween then
				f11_arg0.announcementWaitTween.onComplete = function ()
					
				end
				
			end
			f11_arg0.queue = nil
			f11_arg0.queueStart = nil
			f0_local12( f11_arg0, f10_arg0, f11_local0, f11_local1, f11_local2, f11_local3, f11_local4 )
			if Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f11_local0, CSV.mlgAnnouncementTable.cols.stringRef ) == "CODCASTER_AN_HARDPOINT_NEW" then
				local f11_local6 = f11_arg0:Wait( math.floor( tonumber( Engine.TableLookupByRow( CSV.mlgAnnouncementTable.file, f11_local0, CSV.mlgAnnouncementTable.cols.displayTime ) ) * 1000 ) + 400 )
				f11_local6.onComplete = function ()
					f0_local12( f11_arg0, f10_arg0, f11_local0, f11_local1, f11_local2, f11_local3, f11_local4, true )
				end
				
			end
			f11_arg0.lastPriority = f11_local5
		else
			local f11_local7 = {
				event = f11_arg1,
				nextQueue = nil
			}
			if f11_arg0.queue then
				f11_arg0.queue.nextQueue = f11_local7
			else
				f11_arg0.queueStart = f11_local7
			end
			f11_arg0.queue = f11_local7
		end
	end
	
end

local f0_local15 = function ( f14_arg0, f14_arg1, f14_arg2 )
	f14_arg0.queueStart = nil
	f14_arg0.lastPriority = -1
	local f14_local0, f14_local1, f14_local2, f14_local3 = f14_arg0.CodCasterAnnouncement.TeamColorImage:getCurrentRGBA()
	f14_arg0.defaultTeamColor = GetIntForColor( {
		r = f14_local0,
		g = f14_local1,
		b = f14_local2
	} )
	f14_arg0:registerOmnvarHandler( "ui_mlg_announcement", f0_local14( f14_arg1 ) )
end

function CodCasterAnnouncementFeed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "CodCasterAnnouncementFeed"
	self._animationSets = {}
	self._sequences = {}
	local f15_local1 = controller and controller.controllerIndex
	if not f15_local1 and not Engine.InFrontend() then
		f15_local1 = self:getRootController()
	end
	assert( f15_local1 )
	self.soundSet = "CodCaster"
	local f15_local2 = self
	local CodCasterAnnouncement = nil
	
	CodCasterAnnouncement = MenuBuilder.BuildRegisteredType( "CodCasterAnnouncement", {
		controllerIndex = f15_local1
	} )
	CodCasterAnnouncement.id = "CodCasterAnnouncement"
	CodCasterAnnouncement:SetScale( -0.14, 0 )
	CodCasterAnnouncement.AnnouncementTextCopy:setText( Engine.Localize( "MP_DOM_NEUTRAL_FLAG_CAPTURED" ), 0 )
	CodCasterAnnouncement.AnnouncementText:setText( Engine.Localize( "MP_DOM_NEUTRAL_FLAG_CAPTURED" ), 0 )
	CodCasterAnnouncement.PlayerText:setText( "(WWWW)WWWWWWWWWWWWWW", 0 )
	CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -308, _1080p * 302, _1080p * 139.96, _1080p * 347.96 )
	self:addElement( CodCasterAnnouncement )
	self.CodCasterAnnouncement = CodCasterAnnouncement
	
	local CodCasterAnnouncementSmall = nil
	
	CodCasterAnnouncementSmall = MenuBuilder.BuildRegisteredType( "CodCasterAnnouncementSmall", {
		controllerIndex = f15_local1
	} )
	CodCasterAnnouncementSmall.id = "CodCasterAnnouncementSmall"
	CodCasterAnnouncementSmall:SetScale( -0.14, 0 )
	CodCasterAnnouncementSmall.AnnouncementText:setText( Engine.Localize( "MP_DOM_NEUTRAL_FLAG_CAPTURED" ), 0 )
	CodCasterAnnouncementSmall.PlayerText:setText( "(WWWW)WWWWWWWWWWWWWW", 0 )
	CodCasterAnnouncementSmall:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -308, _1080p * 302, _1080p * 150, _1080p * 210.95 )
	self:addElement( CodCasterAnnouncementSmall )
	self.CodCasterAnnouncementSmall = CodCasterAnnouncementSmall
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CodCasterAnnouncement:RegisterAnimationSequence( "Appear", {
			{
				function ()
					return self.CodCasterAnnouncement:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CodCasterAnnouncement:SetAlpha( 1, 120 )
				end
			},
			{
				function ()
					return self.CodCasterAnnouncement:playSound( "announcement", false, 0 )
				end
			},
			{
				function ()
					return self.CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 139.96, _1080p * 347.96, 0 )
				end,
				function ()
					return self.CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 159, _1080p * 367, 119 )
				end
			}
		} )
		self._sequences.Appear = function ()
			CodCasterAnnouncement:AnimateSequence( "Appear" )
		end
		
		CodCasterAnnouncement:RegisterAnimationSequence( "Disappear", {
			{
				function ()
					return self.CodCasterAnnouncement:SetAlpha( 1, 0 )
				end,
				function ()
					return self.CodCasterAnnouncement:SetAlpha( 0, 200 )
				end
			},
			{
				function ()
					return self.CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 159, _1080p * 367, 0 )
				end,
				function ()
					return self.CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 139.96, _1080p * 347.96, 200 )
				end
			}
		} )
		self._sequences.Disappear = function ()
			CodCasterAnnouncement:AnimateSequence( "Disappear" )
		end
		
		CodCasterAnnouncementSmall:RegisterAnimationSequence( "AppearSmall", {
			{
				function ()
					return self.CodCasterAnnouncementSmall:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CodCasterAnnouncementSmall:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.CodCasterAnnouncementSmall:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 149.95, _1080p * 209.95, 0 )
				end,
				function ()
					return self.CodCasterAnnouncementSmall:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 169, _1080p * 229, 119 )
				end
			}
		} )
		self._sequences.AppearSmall = function ()
			CodCasterAnnouncementSmall:AnimateSequence( "AppearSmall" )
		end
		
		CodCasterAnnouncementSmall:RegisterAnimationSequence( "DisappearSmall", {
			{
				function ()
					return self.CodCasterAnnouncementSmall:SetAlpha( 1, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CodCasterAnnouncementSmall:SetAlpha( 0, 80 )
				end
			},
			{
				function ()
					return self.CodCasterAnnouncementSmall:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 169, _1080p * 229, 0, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.CodCasterAnnouncementSmall:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 149.95, _1080p * 209.95, 119 )
				end
			}
		} )
		self._sequences.DisappearSmall = function ()
			CodCasterAnnouncementSmall:AnimateSequence( "DisappearSmall" )
		end
		
		CodCasterAnnouncement:RegisterAnimationSequence( "AppearWithoutSound", {
			{
				function ()
					return self.CodCasterAnnouncement:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CodCasterAnnouncement:SetAlpha( 1, 120 )
				end
			},
			{
				function ()
					return self.CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 139.96, _1080p * 347.96, 0 )
				end,
				function ()
					return self.CodCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -300, _1080p * 300, _1080p * 159, _1080p * 367, 119 )
				end
			}
		} )
		self._sequences.AppearWithoutSound = function ()
			CodCasterAnnouncement:AnimateSequence( "AppearWithoutSound" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local15( self, f15_local1, controller )
	return self
end

MenuBuilder.registerType( "CodCasterAnnouncementFeed", CodCasterAnnouncementFeed )
LockTable( _M )
