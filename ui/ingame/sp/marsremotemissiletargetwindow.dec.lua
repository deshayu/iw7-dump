local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.MarsRemoteMissleHintText )
	f1_arg0:registerEventHandler( "empty_menu_stack", function ( element, event )
		element.MarsRemoteMissleHintText.hint:setText( Engine.Localize( "MARSBASE_KILLSTREAK_HINT_TARGET1" ), 0 )
	end )
end

function MarsRemoteMissileTargetWindow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "MarsRemoteMissileTargetWindow"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local MarsRemoteMissileTargetInfo0 = nil
	
	MarsRemoteMissileTargetInfo0 = MenuBuilder.BuildRegisteredType( "MarsRemoteMissileTargetInfo", {
		controllerIndex = f3_local1
	} )
	MarsRemoteMissileTargetInfo0.id = "MarsRemoteMissileTargetInfo0"
	MarsRemoteMissileTargetInfo0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * 360, _1080p * 333, _1080p * 383 )
	self:addElement( MarsRemoteMissileTargetInfo0 )
	self.MarsRemoteMissileTargetInfo0 = MarsRemoteMissileTargetInfo0
	
	local BarTop = nil
	
	BarTop = LUI.UIImage.new()
	BarTop.id = "BarTop"
	BarTop:SetRGBFromInt( 0, 0 )
	BarTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -56, _1080p * 56, _1080p * -128, _1080p * 66 )
	self:addElement( BarTop )
	self.BarTop = BarTop
	
	local BarBottom = nil
	
	BarBottom = LUI.UIImage.new()
	BarBottom.id = "BarBottom"
	BarBottom:SetRGBFromInt( 0, 0 )
	BarBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -56, _1080p * 56, _1080p * -66, _1080p * 128 )
	self:addElement( BarBottom )
	self.BarBottom = BarBottom
	
	local AccentLogo = nil
	
	AccentLogo = LUI.UIImage.new()
	AccentLogo.id = "AccentLogo"
	AccentLogo:SetAlpha( 0.3, 0 )
	AccentLogo:setImage( RegisterMaterial( "icon_edi" ), 0 )
	AccentLogo:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -242, _1080p * -70, _1080p * -168, _1080p * -82 )
	self:addElement( AccentLogo )
	self.AccentLogo = AccentLogo
	
	local MarsRemoteMissileCenterAccent0 = nil
	
	MarsRemoteMissileCenterAccent0 = MenuBuilder.BuildRegisteredType( "MarsRemoteMissileCenterAccent", {
		controllerIndex = f3_local1
	} )
	MarsRemoteMissileCenterAccent0.id = "MarsRemoteMissileCenterAccent0"
	MarsRemoteMissileCenterAccent0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -360, _1080p * 360, _1080p * -360, _1080p * 360 )
	self:addElement( MarsRemoteMissileCenterAccent0 )
	self.MarsRemoteMissileCenterAccent0 = MarsRemoteMissileCenterAccent0
	
	local MarsRemoteMissileConnectionStatus = nil
	
	MarsRemoteMissileConnectionStatus = MenuBuilder.BuildRegisteredType( "MarsRemoteMissileConnectionStatus", {
		controllerIndex = f3_local1
	} )
	MarsRemoteMissileConnectionStatus.id = "MarsRemoteMissileConnectionStatus"
	MarsRemoteMissileConnectionStatus:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 621, _1080p * 84, _1080p * 112 )
	self:addElement( MarsRemoteMissileConnectionStatus )
	self.MarsRemoteMissileConnectionStatus = MarsRemoteMissileConnectionStatus
	
	local MarsRemoteMissleHintText = nil
	
	MarsRemoteMissleHintText = MenuBuilder.BuildRegisteredType( "MarsRemoteMissleHintText", {
		controllerIndex = f3_local1
	} )
	MarsRemoteMissleHintText.id = "MarsRemoteMissleHintText"
	MarsRemoteMissleHintText.hint:setText( Engine.Localize( "MARSBASE_KILLSTREAK_HINT_TARGET1" ), 0 )
	MarsRemoteMissleHintText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 660, _1080p * 1260, _1080p * 289.88, _1080p * 327.88 )
	self:addElement( MarsRemoteMissleHintText )
	self.MarsRemoteMissleHintText = MarsRemoteMissleHintText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MarsRemoteMissileTargetInfo0:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 0, 1560 )
				end,
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 1, 70 )
				end,
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 0.2, 70 )
				end,
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 1, 70 )
				end,
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 0.2, 70 )
				end,
				function ()
					return self.MarsRemoteMissileTargetInfo0:SetAlpha( 1, 60 )
				end
			}
		} )
		AccentLogo:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.AccentLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 50 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0, 50 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 50 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0, 40 )
				end,
				function ()
					return self.AccentLogo:SetAlpha( 0.3, 40 )
				end
			}
		} )
		MarsRemoteMissileCenterAccent0:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetScale( -0.5, 0 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetScale( -0.5, 1000 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetScale( 0.5, 200 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 1, 50 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 1, 230 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0.2, 70 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 1, 70 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0.2, 70 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 1, 70 )
				end
			}
		} )
		MarsRemoteMissleHintText:RegisterAnimationSequence( "bootup", {
			{
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 0, 1900 )
				end,
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 1, 40 )
				end,
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 0.2, 40 )
				end,
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 1, 40 )
				end,
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 0.2, 40 )
				end,
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 1, 40 )
				end
			},
			{
				function ()
					return self.MarsRemoteMissleHintText.hint:setText( Engine.Localize( "MARSBASE_KILLSTREAK_HINT_TARGET1" ), 0 )
				end
			}
		} )
		self._sequences.bootup = function ()
			MarsRemoteMissileTargetInfo0:AnimateSequence( "bootup" )
			AccentLogo:AnimateSequence( "bootup" )
			MarsRemoteMissileCenterAccent0:AnimateSequence( "bootup" )
			MarsRemoteMissleHintText:AnimateSequence( "bootup" )
		end
		
		MarsRemoteMissleHintText:RegisterAnimationSequence( "target2", {
			{
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MarsRemoteMissleHintText.hint:setText( Engine.Localize( "MARSBASE_KILLSTREAK_HINT_TARGET2" ), 0 )
				end
			}
		} )
		self._sequences.target2 = function ()
			MarsRemoteMissleHintText:AnimateSequence( "target2" )
		end
		
		MarsRemoteMissileCenterAccent0:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 1, 0 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0.2, 90 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0.8, 70 )
				end,
				function ()
					return self.MarsRemoteMissileCenterAccent0:SetAlpha( 0, 80 )
				end
			}
		} )
		MarsRemoteMissleHintText:RegisterAnimationSequence( "shutdown", {
			{
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.shutdown = function ()
			MarsRemoteMissileCenterAccent0:AnimateSequence( "shutdown" )
			MarsRemoteMissleHintText:AnimateSequence( "shutdown" )
		end
		
		MarsRemoteMissleHintText:RegisterAnimationSequence( "canceltarget1", {
			{
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.MarsRemoteMissleHintText.hint:setText( Engine.Localize( "MARSBASE_KILLSTREAK_HINT_TARGET1" ), 0 )
				end
			}
		} )
		self._sequences.canceltarget1 = function ()
			MarsRemoteMissleHintText:AnimateSequence( "canceltarget1" )
		end
		
		MarsRemoteMissleHintText:RegisterAnimationSequence( "off", {
			{
				function ()
					return self.MarsRemoteMissleHintText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.off = function ()
			MarsRemoteMissleHintText:AnimateSequence( "off" )
		end
		
		self._sequences.hint_blink = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.SP.mars.marsRemoteMissileState:GetModel( f3_local1 ), function ()
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) == 1 then
			ACTIONS.AnimateSequence( self, "bootup" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) == 2 then
			ACTIONS.AnimateSequence( self, "target2" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) == 3 then
			ACTIONS.AnimateSequence( self, "shutdown" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) == 4 then
			ACTIONS.AnimateSequence( self, "canceltarget1" )
		end
		if DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) ~= nil and DataSources.inGame.SP.mars.marsRemoteMissileState:GetValue( f3_local1 ) == 5 then
			ACTIONS.AnimateSequence( self, "off" )
		end
	end )
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "MarsRemoteMissileTargetWindow", MarsRemoteMissileTargetWindow )
LockTable( _M )
