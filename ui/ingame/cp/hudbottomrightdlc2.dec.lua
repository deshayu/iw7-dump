local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.ZomWeaponInfo )
	if CONDITIONS.IsSplitscreen( f1_arg0 ) then
		f1_arg0.ZomWeaponInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1300, _1080p * 1593, _1080p * 921, _1080p * 1026 )
	end
end

function HudBottomRightDLC2( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 1080 * _1080p )
	self.id = "HudBottomRightDLC2"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local WonderCardFillWidget = nil
	
	WonderCardFillWidget = MenuBuilder.BuildRegisteredType( "WonderCardFillWidget", {
		controllerIndex = f2_local1
	} )
	WonderCardFillWidget.id = "WonderCardFillWidget"
	WonderCardFillWidget:SetYRotation( -16, 0 )
	WonderCardFillWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1706, _1080p * 1822, _1080p * 25, _1080p * 697 )
	self:addElement( WonderCardFillWidget )
	self.WonderCardFillWidget = WonderCardFillWidget
	
	local ZomWeaponInfo = nil
	
	ZomWeaponInfo = MenuBuilder.BuildRegisteredType( "ZomWeaponInfo", {
		controllerIndex = f2_local1
	} )
	ZomWeaponInfo.id = "ZomWeaponInfo"
	ZomWeaponInfo:SetYRotation( -16, 0 )
	ZomWeaponInfo:SetZRotation( -3, 0 )
	ZomWeaponInfo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1337.08, _1080p * 1630.08, _1080p * 921, _1080p * 1026 )
	self:addElement( ZomWeaponInfo )
	self.ZomWeaponInfo = ZomWeaponInfo
	
	local FateCardWidget = nil
	
	FateCardWidget = MenuBuilder.BuildRegisteredType( "FateCardWidget", {
		controllerIndex = f2_local1
	} )
	FateCardWidget.id = "FateCardWidget"
	FateCardWidget:SetYRotation( -16, 0 )
	FateCardWidget:SetZRotation( -3, 0 )
	FateCardWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1635.08, _1080p * 1888.08, _1080p * 660, _1080p * 1049 )
	self:addElement( FateCardWidget )
	self.FateCardWidget = FateCardWidget
	
	local ChiMeter = nil
	
	ChiMeter = MenuBuilder.BuildRegisteredType( "ChiMeter", {
		controllerIndex = f2_local1
	} )
	ChiMeter.id = "ChiMeter"
	ChiMeter:SetAlpha( 0.89, 0 )
	ChiMeter:SetYRotation( -16, 0 )
	ChiMeter:SetZRotation( -3, 0 )
	ChiMeter:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1617.08, _1080p * 1886.08, _1080p * 794.91, _1080p * 1027.91 )
	self:addElement( ChiMeter )
	self.ChiMeter = ChiMeter
	
	local pressExit = nil
	
	pressExit = LUI.UIText.new()
	pressExit.id = "pressExit"
	pressExit:SetYRotation( -16, 0 )
	pressExit:SetZRotation( -3, 0 )
	pressExit:setText( Engine.Localize( "CP_DISCO_EXIT_KUNG_FU" ), 0 )
	pressExit:SetFontSize( 18 * _1080p )
	pressExit:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	pressExit:SetAlignment( LUI.Alignment.Center )
	pressExit:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1675.5, _1080p * 1850.5, _1080p * 765.04, _1080p * 784 )
	self:addElement( pressExit )
	self.pressExit = pressExit
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ZomWeaponInfo:RegisterAnimationSequence( "chiMeterOn", {
			{
				function ()
					return self.ZomWeaponInfo:SetAlpha( 0, 0, LUI.EASING.outQuadratic )
				end
			}
		} )
		FateCardWidget:RegisterAnimationSequence( "chiMeterOn", {
			{
				function ()
					return self.FateCardWidget:SetAlpha( 1, 0 )
				end,
				function ()
					return self.FateCardWidget:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		ChiMeter:RegisterAnimationSequence( "chiMeterOn", {
			{
				function ()
					return self.ChiMeter:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ChiMeter:SetAlpha( 1, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		pressExit:RegisterAnimationSequence( "chiMeterOn", {
			{
				function ()
					return self.pressExit:SetAlpha( 0, 0 )
				end,
				function ()
					return self.pressExit:SetAlpha( 0, 300 )
				end,
				function ()
					return self.pressExit:SetAlpha( 1, 440 )
				end,
				function ()
					return self.pressExit:SetAlpha( 1, 14260 )
				end,
				function ()
					return self.pressExit:SetAlpha( 0, 420 )
				end
			}
		} )
		self._sequences.chiMeterOn = function ()
			ZomWeaponInfo:AnimateSequence( "chiMeterOn" )
			FateCardWidget:AnimateSequence( "chiMeterOn" )
			ChiMeter:AnimateSequence( "chiMeterOn" )
			pressExit:AnimateSequence( "chiMeterOn" )
		end
		
		ZomWeaponInfo:RegisterAnimationSequence( "chiMeterOff", {
			{
				function ()
					return self.ZomWeaponInfo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ZomWeaponInfo:SetAlpha( 1, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		FateCardWidget:RegisterAnimationSequence( "chiMeterOff", {
			{
				function ()
					return self.FateCardWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.FateCardWidget:SetAlpha( 1, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		ChiMeter:RegisterAnimationSequence( "chiMeterOff", {
			{
				function ()
					return self.ChiMeter:SetAlpha( 1, 0 )
				end,
				function ()
					return self.ChiMeter:SetAlpha( 0, 300, LUI.EASING.outQuadratic )
				end
			}
		} )
		pressExit:RegisterAnimationSequence( "chiMeterOff", {
			{
				function ()
					return self.pressExit:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.chiMeterOff = function ()
			ZomWeaponInfo:AnimateSequence( "chiMeterOff" )
			FateCardWidget:AnimateSequence( "chiMeterOff" )
			ChiMeter:AnimateSequence( "chiMeterOff" )
			pressExit:AnimateSequence( "chiMeterOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.CP.zombies.dlc1.raveMode:GetModel( f2_local1 ), function ()
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f2_local1 ) >= 1 then
			ACTIONS.AnimateSequence( self, "chiMeterOn" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "ChiMeter",
				sequenceName = "intro",
				elementPath = "ChiMeter"
			} )
		end
		if DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f2_local1 ) ~= nil and DataSources.inGame.CP.zombies.dlc1.raveMode:GetValue( f2_local1 ) < 1 then
			ACTIONS.AnimateSequence( self, "chiMeterOff" )
		end
	end )
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HudBottomRightDLC2", HudBottomRightDLC2 )
LockTable( _M )
