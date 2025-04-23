local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.DisableLetterboxForMenu( "liferaycounterContainer" )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetupInWorldElement( {} )
	f1_arg0:SetInWorldScale( 0.08 )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		f2_arg0:SetEntityNum( Game.GetOmnvar( "zm_ui_dialpad_ent" ) )
		f2_arg0:SetEntityTag( "tag_origin" )
		f2_arg0:SetFollowTagAngles( true )
		f2_arg0:SetTagSpacePosition( 0, 0, 0 )
		f2_arg0:SetTagSpaceYaw( 0 )
		f2_arg0:SetTagSpaceRoll( 0 )
		f2_arg0:SetTagSpacePitch( 0 )
	end
	
	local f1_local1 = function ( f3_arg0, f3_arg1 )
		if Game.GetOmnvar( "zm_ui_dialpad_2" ) == 0 then
			LUI.FlowManager.RequestLeaveMenu( f3_arg0, true, true )
		end
	end
	
	f1_arg0:registerOmnvarHandler( "zm_ui_dialpad_ent", f1_local0 )
	f1_arg0:registerOmnvarHandler( "zm_ui_dialpad_2", f1_local1 )
	f1_local0( f1_arg0, {} )
	local f1_local2 = function ()
		local f4_local0 = Game.GetOmnvar( "zm_ui_dialpad_0" ) - 1
		DebugPrint( "Dialed " .. f4_local0 )
		ACTIONS.AnimateSequence( f1_arg0.liferayCounter, "digit" .. f4_local0 .. "selected" )
		Engine.NotifyServer( "bomb_counter_digit", f4_local0 )
	end
	
	local self = LUI.UIBindButton.new()
	self:addEventHandler( "button_alt1", function ()
		f1_local2()
	end )
	if Engine.IsPC() then
		f1_arg0:registerEventHandler( "mousedown", function ( element, event )
			if event.button and event.button == "left" then
				f1_local2()
			end
			return true
		end )
	end
	self:addEventHandler( "button_secondary", function ( f7_arg0 )
		LUI.FlowManager.RequestLeaveMenu( f7_arg0, true, true )
		Engine.NotifyServer( "exit_bomb_counter", 1 )
	end )
	f1_arg0:addElement( self )
end

function liferaycounterContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "liferaycounterContainer"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local liferayCounter = nil
	
	liferayCounter = MenuBuilder.BuildRegisteredType( "liferayCounter", {
		controllerIndex = f8_local1
	} )
	liferayCounter.id = "liferayCounter"
	liferayCounter:SetAlpha( 1, 0 )
	liferayCounter:SetScale( -0.61, 0 )
	liferayCounter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 713.5, _1080p * 1206.5, _1080p * 443, _1080p * 637 )
	self:addElement( liferayCounter )
	self.liferayCounter = liferayCounter
	
	PostLoadFunc( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "liferaycounterContainer", liferaycounterContainer )
LockTable( _M )
