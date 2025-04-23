local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SetBlendMode( BLEND_MODE.addWithAlpha )
	f1_arg0.MessageText:SetShadowUOffset( -0 )
	f1_arg0.MessageText:SetShadowVOffset( -0 )
	f1_arg0:registerEventHandler( "level_load", function ()
		ACTIONS.AnimateSequence( f1_arg0, "Default" )
	end )
	local f1_local0 = function ( f3_arg0, f3_arg1, f3_arg2 )
		f1_arg0.Icon:setImage( RegisterMaterial( f3_arg0 ), 0 )
		f1_arg0.Icon:SetRGBFromInt( f3_arg1 )
		f1_arg0.MessageText:setText( ToUpperCase( f3_arg2 ), 0 )
		ACTIONS.AnimateSequence( f1_arg0, "AnimateOn" )
	end
	
	local f1_local1 = function ( f4_arg0 )
		if f4_arg0.messageType == LUI.UIMessageQueue.MessageType.JackalAutopilot then
			f1_local0( "hud_icon_jackal_alert", GetIntForColor( SWATCHES.HUD.active ), Engine.Localize( "JACKAL_AUTOPILOT_ENGAGED" ) )
		elseif f4_arg0.messageType == LUI.UIMessageQueue.MessageType.JackalBoosterState then
			local f4_local0 = UpdateBoosterState( f1_arg1 )
			if f4_local0 == JackalBoosterStates.Ready then
				f1_local0( "hud_icon_jackal_alert", GetIntForColor( SWATCHES.HUD.active ), Engine.Localize( "JACKAL_BOOSTERS_READY" ) )
			elseif f4_local0 == JackalBoosterStates.Primed then
				f1_local0( "hud_icon_jackal_alert", GetIntForColor( SWATCHES.HUD.active ), Engine.Localize( "JACKAL_BOOSTERS_PRIMED" ) )
			elseif f4_local0 == JackalBoosterStates.Priming then
				f1_local0( "hud_icon_jackal_alert", GetIntForColor( SWATCHES.HUD.active ), Engine.Localize( "JACKAL_BOOSTERS_PRIMING" ) )
			elseif f4_local0 == JackalBoosterStates.Engaged then
				f1_local0( "hud_icon_jackal_alert", GetIntForColor( SWATCHES.HUD.active ), Engine.Localize( "JACKAL_BOOSTERS_ENGAGED" ) )
			elseif f4_local0 == JackalBoosterStates.Damaged then
				f1_local0( "hud_icon_warning", GetIntForColor( SWATCHES.HUD.warning ), Engine.Localize( "JACKAL_LEFT_BOOSTER_DAMAGED" ) )
			end
		elseif f4_arg0.messageType == LUI.UIMessageQueue.MessageType.JackalMissileWarning then
			f1_local0( "hud_icon_warning", GetIntForColor( SWATCHES.HUD.warning ), Engine.Localize( "JACKAL_INCOMING_MISSILES" ) )
		elseif f4_arg0.messageType == LUI.UIMessageQueue.MessageType.JackalLeavingWarning then
			f1_local0( "hud_icon_warning", GetIntForColor( SWATCHES.HUD.warning ), Engine.Localize( "JACKAL_LEAVING_BATTLE" ) )
		elseif f4_arg0.messageType == LUI.UIMessageQueue.MessageType.JackalOverheatWarning then
			f1_local0( "hud_icon_warning", GetIntForColor( SWATCHES.HUD.warning ), Engine.Localize( "JACKAL_WEAPON_OVERHEAT" ) )
		elseif f4_arg0.messageType == LUI.UIMessageQueue.MessageType.JackalFlaresWarning then
			f1_local0( "hud_icon_warning", GetIntForColor( SWATCHES.HUD.warning ), Engine.Localize( "JACKAL_NO_FLARES" ) )
		else
			DebugPrint( "[JackalWarningWithIcon] unknown messageType" )
		end
	end
	
	f1_arg0:addEventHandler( "message_queue_show", function ( f5_arg0, f5_arg1 )
		if f5_arg1 then
			f1_local1( f5_arg1 )
		else
			DebugPrint( "[JackalWarningWithIcon] event is nil" )
		end
	end )
end

function JackalWarningWithIcon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 400 * _1080p, 0, 80 * _1080p )
	self.id = "JackalWarningWithIcon"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -32, _1080p * 32, _1080p * -59, _1080p * 5 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local MessageText = nil
	
	MessageText = LUI.UIStyledText.new()
	MessageText.id = "MessageText"
	MessageText:setText( ToUpperCase( "" ), 0 )
	MessageText:SetFontSize( 32 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetShadowMinDistance( -0.2, 0 )
	MessageText:SetShadowMaxDistance( 0.2, 0 )
	MessageText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 32 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Icon:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0.5, 150 )
				end,
				function ()
					return self.Icon:SetAlpha( 1, 150 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "AnimateOn", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0.5, 150 )
				end,
				function ()
					return self.MessageText:SetAlpha( 1, 150 )
				end
			}
		} )
		self._sequences.AnimateOn = function ()
			Icon:AnimateLoop( "AnimateOn" )
			MessageText:AnimateLoop( "AnimateOn" )
		end
		
		Icon:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Icon:SetAlpha( 0, 300 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "AnimateOff", {
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MessageText:SetAlpha( 0, 300 )
				end
			}
		} )
		self._sequences.AnimateOff = function ()
			Icon:AnimateSequence( "AnimateOff" )
			MessageText:AnimateSequence( "AnimateOff" )
		end
		
		Icon:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		MessageText:RegisterAnimationSequence( "Default", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Default = function ()
			Icon:AnimateSequence( "Default" )
			MessageText:AnimateSequence( "Default" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "message_queue_hide", function ( f24_arg0, f24_arg1 )
		local f24_local0 = f24_arg1.controller or f6_local1
		ACTIONS.AnimateSequence( self, "AnimateOff" )
	end )
	PostLoadFunc( self, f6_local1, controller )
	ACTIONS.AnimateSequence( self, "Default" )
	return self
end

MenuBuilder.registerType( "JackalWarningWithIcon", JackalWarningWithIcon )
LockTable( _M )
