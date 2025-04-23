local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = 320 * _1080p
f0_local1 = 240 * _1080p
f0_local2 = 640 * _1080p
local f0_local3 = 480 * _1080p
function AnimateWindow( f1_arg0, f1_arg1 )
	assert( f1_arg0.window )
	assert( f1_arg0.fadeOut )
	if f1_arg0._lastState == f1_arg1 then
		return 
	end
	f1_arg0._lastState = f1_arg1
	if f1_arg1 == KillstreakConnectionState.INACTIVE then
		f1_arg0.window:processEvent( {
			name = "killstreak_connection_inactive"
		} )
		f1_arg0.fadeOut:SetAlpha( 0 )
		f1_arg0.window:SetAlpha( 0 )
	elseif f1_arg1 == KillstreakConnectionState.READY then
		f1_arg0.window:processEvent( {
			name = "killstreak_connection_ready"
		} )
		f1_arg0.fadeOut:SetAlpha( 0 )
		f1_arg0.window:SetAlpha( 1 )
		f1_arg0.window:SetAnchorsAndPosition( 0, 1, 0, 1, 0, f0_local0, 0, f0_local1, 0 )
	elseif f1_arg1 == KillstreakConnectionState.CONNECTING then
		local f1_local0 = 150
		local f1_local1 = 100
		local f1_local2 = 150
		local f1_local3 = 150
		f1_arg0.window:processEvent( {
			name = "killstreak_connection_connecting"
		} )
		f1_arg0.fadeOut:SetAlpha( 0 )
		f1_arg0.window:SetAlpha( 1 )
		f1_arg0.window:SetAnchorsAndPosition( 0, 1, 0, 1, 0, f0_local0, 0, f0_local1, 0 )
		local f1_local4 = f1_arg0.window:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -f0_local2 / 2, f0_local2 / 2, -f0_local3 / 2, f0_local3 / 2, f1_local0 )
		f1_local4.onComplete = function ()
			local f2_local0 = f1_arg0.window:Wait( f1_local1 )
			f2_local0.onComplete = function ()
				f1_arg0.window:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -640, 640, -360, 360, f1_local2 )
				f1_arg0.fadeOut:SetAlpha( 1, f1_local3 )
			end
			
		end
		
	elseif f1_arg1 == KillstreakConnectionState.CONNECTED then
		local f1_local0 = 100
		f1_arg0.window:processEvent( {
			name = "killstreak_connection_connected"
		} )
		f1_arg0.fadeOut:SetAlpha( 0, f1_local0 )
		f1_arg0.window:SetAlpha( 0 )
		f1_arg0.window:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -640, 640, -360, 360, 0 )
	elseif f1_arg1 == KillstreakConnectionState.DISCONNECTING then
		f1_arg0.window:processEvent( {
			name = "killstreak_connection_disconnecting"
		} )
		f1_arg0.fadeOut:SetAlpha( 0 )
		f1_arg0.window:SetAlpha( 1 )
		local f1_local0 = f1_arg0.window:Wait( 100 )
		f1_local0.onComplete = function ()
			local f4_local0 = f1_arg0.window:SetAnchorsAndPosition( 0, 1, 0, 1, 0, f0_local0, 0, f0_local1, 150 )
			f4_local0.onComplete = function ()
				f1_arg0.window:SetAlpha( 0, 150 )
			end
			
		end
		
	end
end

function KillstreakConnection( menu, controller )
	local self = LUI.UIElement.new( {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	self.id = "KillstreakConnection"
	self.window = MenuBuilder.BuildRegisteredType( "KillstreakConnectionWindow" )
	self:addElement( self.window )
	self.fadeOut = LUI.UIImage.new( {
		material = RegisterMaterial( "white" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = -360,
		bottom = 360,
		left = -640,
		right = 640,
		red = 0,
		green = 0,
		blue = 0
	} )
	self.fadeOut.id = "fadeOut"
	self:addElement( self.fadeOut )
	assert( controller.controllerIndex )
	local f6_local1 = DataSources.inGame.MP.scorestreakHuds.connectionState:GetModel( controller.controllerIndex )
	self:SubscribeToModel( f6_local1, function ( f7_arg0 )
		AnimateWindow( self, DataModel.GetModelValue( f6_local1 ) )
	end )
	return self
end

MenuBuilder.registerType( "KillstreakConnection", KillstreakConnection )
LockTable( _M )
