local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Game.GetTime()
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.SPFluffMessage:GetModel( f1_arg1 ), function ()
		if Game.GetTime() - f1_local0 > 1000 then
			if DataSources.inGame.SP.SPFluffMessageContext:GetValue( f1_arg1 ) then
				ACTIONS.PlaySoundSetSound( f1_arg0, "incoming", false )
			else
				ACTIONS.PlaySoundSetSound( f1_arg0, "negativeIn", false )
			end
		end
	end, true )
	f1_arg0:SubscribeToModel( DataSources.inGame.SP.showIntelMessage:GetModel( f1_arg1 ), function ()
		local f3_local0 = DataSources.inGame.SP.showIntelMessage:GetValue( f1_arg1 )
		local f3_local1 = Game.GetOmnvar( "ui_sp_intel_messaging_is_captain" )
		local f3_local2 = nil
		if f3_local0 then
			if f3_local1 then
				local f3_local3 = "intelIn"
			end
			f3_local2 = f3_local3 or "fluffIn"
		else
			if f3_local1 then
				local f3_local4 = "intelOut"
			end
			f3_local2 = f3_local4 or "fluffOut"
		end
		if f3_local2 then
			ACTIONS.PlaySoundSetSound( f1_arg0, f3_local2, false )
		end
	end, true )
end

function FluffMessages( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 25 * _1080p )
	self.id = "FluffMessages"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self.soundSet = "messages"
	local f4_local2 = self
	local MiscMessageBG = nil
	
	MiscMessageBG = MenuBuilder.BuildRegisteredType( "MiscMessage", {
		controllerIndex = f4_local1
	} )
	MiscMessageBG.id = "MiscMessageBG"
	MiscMessageBG:SetAlpha( 0.1, 0 )
	MiscMessageBG:SetDepth( 20, 0 )
	MiscMessageBG:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -10, _1080p * 290, 0, _1080p * 25 )
	self:addElement( MiscMessageBG )
	self.MiscMessageBG = MiscMessageBG
	
	local MiscMessage = nil
	
	MiscMessage = MenuBuilder.BuildRegisteredType( "MiscMessage", {
		controllerIndex = f4_local1
	} )
	MiscMessage.id = "MiscMessage"
	MiscMessage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 300, 0, _1080p * 25 )
	self:addElement( MiscMessage )
	self.MiscMessage = MiscMessage
	
	local IntelMessage = nil
	
	IntelMessage = MenuBuilder.BuildRegisteredType( "IntelMessage", {
		controllerIndex = f4_local1
	} )
	IntelMessage.id = "IntelMessage"
	IntelMessage:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 275, _1080p * 50, _1080p * 325 )
	self:addElement( IntelMessage )
	self.IntelMessage = IntelMessage
	
	local IntelAARMessage = nil
	
	IntelAARMessage = MenuBuilder.BuildRegisteredType( "IntelAARMessage", {
		controllerIndex = f4_local1
	} )
	IntelAARMessage.id = "IntelAARMessage"
	IntelAARMessage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.5, _1080p * 275.5, _1080p * 50, _1080p * 425 )
	self:addElement( IntelAARMessage )
	self.IntelAARMessage = IntelAARMessage
	
	f0_local0( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "FluffMessages", FluffMessages )
LockTable( _M )
