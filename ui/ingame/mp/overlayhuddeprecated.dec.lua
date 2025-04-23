local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ()
	if Game.InKillCam() then
		if Game.IsCinematicCameraActive() then
			return false
		elseif Game.IsKillCamEntityActive() then
			return false
		end
	elseif Game.IsSpectatorCameraActive() then
		return false
	end
	return true
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	if not f0_local0() then
		f2_arg0:dispatchEventToChildren( {
			name = "odinOverlayDef_ended"
		} )
	end
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.killstreak
	if f3_arg0.openOverlays[f3_local0] then
		return 
	elseif not f0_local0() then
		return 
	else
		local f3_local1 = MenuBuilder.buildItems( {
			type = f3_local0
		}, f3_arg0.properties, f3_arg0 )
		f3_local1:registerEventHandler( f3_local0 .. "_ended", function ( element, event )
			element:close()
			f3_arg0.openOverlays[f3_local0] = false
		end )
		f3_arg0.openOverlays[f3_local0] = true
		f3_arg0:addElement( f3_local1 )
		f3_local1:processEvent( {
			name = "init_overlay",
			omnvar = f3_arg1.omnvar,
			value = f3_arg1.value
		} )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	if f5_arg1.value == 1 or f5_arg1.value == 2 or f5_arg1.value == 3 or f5_arg1.value == 4 or f5_arg1.value == 5 then
		f5_arg0:dispatchEventToRoot( {
			name = "add_overlay",
			target = f5_arg0,
			killstreak = "odinOverlayDef",
			omnvar = f5_arg1.omnvar,
			value = f5_arg1.value
		} )
	elseif f5_arg1.value == -1 then
		f5_arg0:dispatchEventToChildren( {
			name = "odinOverlayDef_ended"
		} )
	end
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	f0_local3( f6_arg0, {
		name = "ui_odin",
		value = Game.GetOmnvar( "ui_odin" )
	} )
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0:getFirstChild()
	while f7_local0 do
		f7_local0:processEvent( f7_arg1 )
		f7_local0 = f7_local0:getNextSibling()
	end
end

MenuBuilder.registerType( "overlayHudDef", function ()
	local self = LUI.UIElement.new( {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 0,
		left = 0,
		bottom = 0,
		right = 0
	} )
	self.id = "overlayId"
	self.openOverlays = {}
	self:registerOmnvarHandler( "ui_odin", f0_local3 )
	self:registerEventHandler( "add_overlay", f0_local2 )
	self:registerEventHandler( "playerstate_client_changed", f0_local4 )
	self:registerEventHandler( "refresh_controls", f0_local5 )
	self:registerEventHandler( "camera_client_changed", f0_local1 )
	return self
end )
LockTable( _M )
